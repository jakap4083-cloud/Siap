<?php
require __DIR__ . '/../../includes/session.php';
require __DIR__ . '/../../includes/helpers.php';
require __DIR__ . '/../../includes/csrf.php';
require __DIR__ . '/../../includes/flash.php';
require __DIR__ . '/../../includes/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !csrf_verify($_POST['csrf'] ?? null)) {
    flash_set('error', 'Permintaan tidak valid.');
    redirect('../../index.php?page=login');
}

$identity = trim($_POST['identity'] ?? '');
$password = (string)($_POST['password'] ?? '');
$pdo = db();
$stmt = $pdo->prepare('SELECT id,username,password_hash FROM users WHERE username=:v OR email=:v OR phone=:v LIMIT 1');
$stmt->execute(['v'=>$identity]);
$user = $stmt->fetch();
if (!$user || !password_verify($password, $user['password_hash'])) {
    flash_set('error', 'Login gagal.');
    redirect('../../index.php?page=login');
}

session_regenerate_id(true);
$_SESSION['user_id'] = (int)$user['id'];
$_SESSION['username'] = $user['username'];
redirect('../../index.php?page=loading');
