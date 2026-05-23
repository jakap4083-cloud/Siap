INSERT INTO admins (username,password_hash,created_at,updated_at) VALUES ('admin', '$2y$10$6n7cKX2XfzS4Jb6IF2Yhweof0gYvf1R.9sX6r0xWmI9qgT9AqkceK', NOW(), NOW());
INSERT INTO vip_levels (name,min_topup,min_withdraw,admin_fee_percent,created_at,updated_at) VALUES
('VIP0',0,100000,10,NOW(),NOW()),('VIP1',50000,50000,5,NOW(),NOW()),('VIP2',100000,30000,3,NOW(),NOW()),('VIP3',1000000,0,0,NOW(),NOW());
INSERT INTO product_categories (name,created_at,updated_at) VALUES ('Biasa',NOW(),NOW()),('Medium',NOW(),NOW()),('High',NOW(),NOW());
