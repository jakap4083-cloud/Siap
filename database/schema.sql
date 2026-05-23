SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `admins`;
DROP TABLE IF EXISTS `user_profiles`;
DROP TABLE IF EXISTS `user_bank_accounts`;
DROP TABLE IF EXISTS `user_pins`;
DROP TABLE IF EXISTS `pin_reset_requests`;
DROP TABLE IF EXISTS `balance_accounts`;
DROP TABLE IF EXISTS `ledger_transactions`;
DROP TABLE IF EXISTS `site_settings`;
DROP TABLE IF EXISTS `promo_counters`;
DROP TABLE IF EXISTS `welcome_popup_settings`;
DROP TABLE IF EXISTS `banners`;
DROP TABLE IF EXISTS `notifications`;
DROP TABLE IF EXISTS `information_pages`;
DROP TABLE IF EXISTS `app_download_settings`;
DROP TABLE IF EXISTS `promos`;
DROP TABLE IF EXISTS `chat_threads`;
DROP TABLE IF EXISTS `chat_messages`;
DROP TABLE IF EXISTS `vip_levels`;
DROP TABLE IF EXISTS `user_vip_status`;
DROP TABLE IF EXISTS `vouchers`;
DROP TABLE IF EXISTS `voucher_usages`;
DROP TABLE IF EXISTS `vip_games`;
DROP TABLE IF EXISTS `vip_game_rewards`;
DROP TABLE IF EXISTS `vip_game_sessions`;
DROP TABLE IF EXISTS `vip_game_plays`;
DROP TABLE IF EXISTS `daily_bonus_settings`;
DROP TABLE IF EXISTS `daily_bonus_rewards`;
DROP TABLE IF EXISTS `daily_bonus_claims`;
DROP TABLE IF EXISTS `product_categories`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `user_products`;
DROP TABLE IF EXISTS `product_purchases`;
DROP TABLE IF EXISTS `mining_settings`;
DROP TABLE IF EXISTS `mining_sessions`;
DROP TABLE IF EXISTS `mining_profit_logs`;
DROP TABLE IF EXISTS `referral_settings`;
DROP TABLE IF EXISTS `referral_commission_rates`;
DROP TABLE IF EXISTS `user_referrals`;
DROP TABLE IF EXISTS `referral_tree`;
DROP TABLE IF EXISTS `referral_commissions`;
DROP TABLE IF EXISTS `withdrawals`;
DROP TABLE IF EXISTS `cashify_settings`;
DROP TABLE IF EXISTS `topups`;
DROP TABLE IF EXISTS `deposit_display_methods`;
DROP TABLE IF EXISTS `deposit_quick_amounts`;
DROP TABLE IF EXISTS `feature_settings`;
DROP TABLE IF EXISTS `menu_settings`;
DROP TABLE IF EXISTS `maintenance_settings`;
DROP TABLE IF EXISTS `user_freezes`;
DROP TABLE IF EXISTS `user_status_logs`;
DROP TABLE IF EXISTS `audit_logs`;
DROP TABLE IF EXISTS `login_attempts`;
DROP TABLE IF EXISTS `password_resets`;
DROP TABLE IF EXISTS `cron_logs`;
CREATE TABLE `users` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `email` VARCHAR(120) NOT NULL UNIQUE,
  `phone` VARCHAR(30) NOT NULL UNIQUE,
  `password_hash` VARCHAR(255) NOT NULL,
  `referral_code` VARCHAR(30) NOT NULL UNIQUE,
  `status` VARCHAR(20) DEFAULT 'active',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_profiles` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_user_profiles_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_bank_accounts` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_user_bank_accounts_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_pins` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_user_pins_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `pin_reset_requests` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_pin_reset_requests_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `site_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_site_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `promo_counters` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_promo_counters_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `welcome_popup_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_welcome_popup_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `banners` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_banners_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `notifications` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_notifications_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `information_pages` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_information_pages_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `app_download_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_app_download_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `promos` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_promos_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `chat_threads` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_chat_threads_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `chat_messages` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_chat_messages_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `vouchers` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_vouchers_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `voucher_usages` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_voucher_usages_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `vip_games` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_vip_games_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `vip_game_rewards` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_vip_game_rewards_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `vip_game_sessions` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_vip_game_sessions_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `vip_game_plays` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_vip_game_plays_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `daily_bonus_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_daily_bonus_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `daily_bonus_rewards` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_daily_bonus_rewards_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `daily_bonus_claims` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_daily_bonus_claims_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `mining_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_mining_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `mining_sessions` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_mining_sessions_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `mining_profit_logs` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_mining_profit_logs_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `referral_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_referral_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `referral_commission_rates` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_referral_commission_rates_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_referrals` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_user_referrals_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `referral_tree` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_referral_tree_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `cashify_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_cashify_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `deposit_display_methods` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_deposit_display_methods_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `deposit_quick_amounts` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_deposit_quick_amounts_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `feature_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_feature_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `menu_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_menu_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `maintenance_settings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_maintenance_settings_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_freezes` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_user_freezes_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_status_logs` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_user_status_logs_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `audit_logs` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_audit_logs_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `login_attempts` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_login_attempts_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `password_resets` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `user_id` BIGINT UNSIGNED NULL, `data` JSON NULL, `created_at` DATETIME NULL, `updated_at` DATETIME NULL, KEY `idx_password_resets_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `admins` (
`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`username` VARCHAR(50) UNIQUE,
`password_hash` VARCHAR(255) NOT NULL,
`role` VARCHAR(30) DEFAULT 'superadmin',
`created_at` DATETIME NOT NULL,
`updated_at` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `balance_accounts` (
`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` BIGINT UNSIGNED NOT NULL,
`main_balance` DECIMAL(18,2) DEFAULT 0,
`bonus_balance` DECIMAL(18,2) DEFAULT 0,
`profit_balance` DECIMAL(18,2) DEFAULT 0,
`commission_balance` DECIMAL(18,2) DEFAULT 0,
`locked_balance` DECIMAL(18,2) DEFAULT 0,
`total_profit` DECIMAL(18,2) DEFAULT 0,
`created_at` DATETIME NOT NULL,
`updated_at` DATETIME NOT NULL,
UNIQUE KEY `uniq_balance_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `ledger_transactions` (
`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` BIGINT UNSIGNED NOT NULL,
`type` VARCHAR(60) NOT NULL,
`amount` DECIMAL(18,2) NOT NULL,
`direction` ENUM('debit','credit') NOT NULL,
`reference_type` VARCHAR(50) NULL,
`reference_id` VARCHAR(64) NULL,
`idempotency_key` VARCHAR(120) NULL UNIQUE,
`meta` JSON NULL,
`created_at` DATETIME NOT NULL,
KEY `idx_ledger_user` (`user_id`),
KEY `idx_ledger_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `product_categories` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`name` VARCHAR(50),`created_at` DATETIME,`updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `products` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`category_id` BIGINT UNSIGNED,`name` VARCHAR(120),`price` DECIMAL(18,2),`stock` INT DEFAULT 0,`daily_profit` DECIMAL(18,2),`duration_days` INT DEFAULT 30,`total_income` DECIMAL(18,2),`roi_percent` DECIMAL(10,2),`is_active` TINYINT(1) DEFAULT 1,`created_at` DATETIME,`updated_at` DATETIME, KEY `idx_products_category` (`category_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `product_purchases` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`user_id` BIGINT UNSIGNED,`product_id` BIGINT UNSIGNED,`amount` DECIMAL(18,2),`created_at` DATETIME,KEY `idx_purchase_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_products` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`user_id` BIGINT UNSIGNED,`product_id` BIGINT UNSIGNED,`active_until` DATETIME,`status` VARCHAR(20) DEFAULT 'active',`created_at` DATETIME,`updated_at` DATETIME,KEY `idx_user_products_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `topups` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`user_id` BIGINT UNSIGNED,`provider` VARCHAR(50),`provider_transaction_id` VARCHAR(80),`original_amount` DECIMAL(18,2),`total_amount` DECIMAL(18,2),`status` VARCHAR(20) DEFAULT 'pending',`idempotency_key` VARCHAR(120) NULL UNIQUE,`meta` JSON NULL,`created_at` DATETIME,`updated_at` DATETIME,KEY `idx_topups_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `withdrawals` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`user_id` BIGINT UNSIGNED,`amount` DECIMAL(18,2),`admin_fee` DECIMAL(18,2),`net_amount` DECIMAL(18,2),`status` VARCHAR(20) DEFAULT 'pending',`created_at` DATETIME,`updated_at` DATETIME,KEY `idx_withdraw_user` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `vip_levels` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`name` VARCHAR(40),`min_topup` DECIMAL(18,2),`min_withdraw` DECIMAL(18,2),`admin_fee_percent` DECIMAL(5,2),`created_at` DATETIME,`updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `user_vip_status` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`user_id` BIGINT UNSIGNED UNIQUE,`vip_level_id` BIGINT UNSIGNED,`created_at` DATETIME,`updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `referral_commissions` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`earner_user_id` BIGINT UNSIGNED,`source_user_id` BIGINT UNSIGNED,`level` TINYINT,`type` VARCHAR(30),`amount` DECIMAL(18,2),`idempotency_key` VARCHAR(120) UNIQUE,`created_at` DATETIME,KEY `idx_ref_earner` (`earner_user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `cron_logs` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`cron_name` VARCHAR(80),`message` TEXT,`created_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
SET FOREIGN_KEY_CHECKS=1;