<?php
require __DIR__ . '/../includes/db.php';
@file_put_contents(__DIR__ . '/../storage/logs/backup-cron.log', '['.date('c')."] backup-cron executed\n", FILE_APPEND);
try {
    db()->prepare("INSERT INTO cron_logs (cron_name,message,created_at) VALUES (:c,:m,NOW())")
      ->execute(['c'=>'backup-cron','m'=>'executed']);
} catch (Throwable $e) {
    @file_put_contents(__DIR__ . '/../storage/logs/backup-cron.log', $e->getMessage()."\n", FILE_APPEND);
}
