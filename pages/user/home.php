<?php
if (empty($_SESSION['user_id'])) redirect('index.php?page=login');
?>
<!doctype html><html><head><meta name="viewport" content="width=device-width,initial-scale=1"><link rel="stylesheet" href="assets/css/app.css"></head><body><main class="app"><h2>Home</h2><p>Hi, <?=e($_SESSION['username'] ?? 'User')?></p><nav class="bottom"><a>Home</a><a>Tim</a><a>Produk</a><a>Mining</a><a>Transaksi</a><a>Profil</a></nav><a href="index.php?page=logout">Logout</a></main></body></html>
