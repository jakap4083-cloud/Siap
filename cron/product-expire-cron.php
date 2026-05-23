<?php
require __DIR__ . '/../includes/db.php';
@file_put_contents(__DIR__ . '/../storage/logs/product-expire-cron.log', '['.date('c')."] product-expire-cron executed\n", FILE_APPEND);
try {
    db()->prepare("INSERT INTO cron_logs (cron_name,message,created_at) VALUES (:c,:m,NOW())")
      ->execute(['c'=>'product-expire-cron','m'=>'executed']);
} catch (Throwable ) {
    @file_put_contents(__DIR__ . '/../storage/logs/product-expire-cron.log', ->getMessage()."\n", FILE_APPEND);
}
