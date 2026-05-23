<?php
if (!empty($_SESSION['user_id'])) redirect('index.php?page=home');
$error = flash_get('error');
$success = flash_get('success');
?>
<!doctype html><html><head><meta name="viewport" content="width=device-width,initial-scale=1"><link rel="stylesheet" href="assets/css/app.css"></head><body><main class="app"><h1>NOXARA</h1><?php if($error):?><p class="danger"><?=e($error)?></p><?php endif;?><?php if($success):?><p class="success"><?=e($success)?></p><?php endif;?><form method="post" action="actions/auth/login.php"><input type="hidden" name="csrf" value="<?=e(csrf_token())?>"><input name="identity" placeholder="Email / HP / Username" required><input type="password" name="password" placeholder="Password" required><label><input type="checkbox" name="agree" value="1" required> Saya setuju</label><button>Login</button></form><a href="index.php?page=register">Belum punya akun? Daftar</a></main></body></html>
