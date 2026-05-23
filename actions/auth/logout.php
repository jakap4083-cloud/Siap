<?php
require __DIR__ . '/../../includes/session.php';
require __DIR__ . '/../../includes/helpers.php';
require __DIR__ . '/../../includes/flash.php';
$_SESSION = [];
session_destroy();
session_start();
flash_set('success', 'Berhasil logout.');
redirect('../../index.php?page=login');
