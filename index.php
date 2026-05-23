<?php
$app = require __DIR__ . '/config/app.php';
date_default_timezone_set($app['TIMEZONE']);
require __DIR__ . '/includes/session.php';
require __DIR__ . '/includes/helpers.php';
require __DIR__ . '/includes/csrf.php';
require __DIR__ . '/includes/flash.php';

$page = $_GET['page'] ?? 'login';
$allowed = [
    'login' => __DIR__ . '/pages/auth/login.php',
    'register' => __DIR__ . '/pages/auth/register.php',
    'home' => __DIR__ . '/pages/user/home.php',
    'loading' => __DIR__ . '/pages/user/loading.php',
    'logout' => __DIR__ . '/actions/auth/logout.php',
];

if (!isset($allowed[$page])) {
    http_response_code(404);
    echo '404';
    exit;
}

require $allowed[$page];
