<?php
require __DIR__ . '/../../includes/session.php';
require __DIR__ . '/../../includes/helpers.php';
require __DIR__ . '/../../includes/csrf.php';
require __DIR__ . '/../../includes/flash.php';
require __DIR__ . '/../../includes/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !csrf_verify($_POST['csrf'] ?? null)) {
    flash_set('error', 'Permintaan tidak valid.');
    redirect('../../index.php?page=register');
}

$username = trim($_POST['username'] ?? '');
$email = trim($_POST['email'] ?? '');
$phone = trim($_POST['phone'] ?? '');
$password = (string)($_POST['password'] ?? '');
$confirm = (string)($_POST['password_confirm'] ?? '');

if (strlen($password) < 8 || $password !== $confirm) {
    flash_set('error', 'Password tidak valid.');
    redirect('../../index.php?page=register');
}

$pdo = db();
$check = $pdo->prepare('SELECT id FROM users WHERE username=:u OR email=:e OR phone=:p LIMIT 1');
$check->execute(['u'=>$username,'e'=>$email,'p'=>$phone]);
if ($check->fetch()) {
    flash_set('error', 'Username/email/HP sudah terdaftar.');
    redirect('../../index.php?page=register');
}

$hash = password_hash($password, PASSWORD_DEFAULT);
$refCode = strtoupper(substr(bin2hex(random_bytes(4)), 0, 8));
$ins = $pdo->prepare('INSERT INTO users (username,email,phone,password_hash,referral_code,created_at,updated_at) VALUES (:u,:e,:p,:h,:r,NOW(),NOW())');
$ins->execute(['u'=>$username,'e'=>$email,'p'=>$phone,'h'=>$hash,'r'=>$refCode]);

flash_set('success', 'Registrasi berhasil, silakan login.');
redirect('../../index.php?page=login');
