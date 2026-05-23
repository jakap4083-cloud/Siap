<?php
require __DIR__ . '/../includes/db.php';
@file_put_contents(__DIR__ . '/../storage/logs/vip-sync-cron.log', '['.date('c')."] vip-sync-cron executed\n", FILE_APPEND);
try {
    db()->prepare("INSERT INTO cron_logs (cron_name,message,created_at) VALUES (:c,:m,NOW())")
      ->execute(['c'=>'vip-sync-cron','m'=>'executed']);
} catch (Throwable ) {
    @file_put_contents(__DIR__ . '/../storage/logs/vip-sync-cron.log', ->getMessage()."\n", FILE_APPEND);
}
