INSERT INTO metadata (id, date_created, date_updated) VALUES
(1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO users (id, metadata_id, email, password, is_new, pin, quotes, email_validation, language, profile_photo) VALUES
(1, 1, 'adi@email.com', 'password1', true, '1234', 'Rose is red', true, 'en', 'adi.jpg'),
(2, 2, 'budi@email.com', 'password2', false, '5678', 'Violet is purple', true, 'en', 'budi.jpg');

INSERT INTO wallets (id, account_number, users_id, metadata_id, name, amount, is_used) VALUES
(1, 'ACC123456', 1, 1, 'Main Wallet', 1500, true),
(2, 'ACC789101', 2, 2, 'Savings Wallet', 3000, true);

INSERT INTO pocket (id, user_id, metadata_id, name, amount, description) VALUES
(1, 1, 1, 'Groceries', 200, 'Monthly grocery budget'),
(2, 2, 2, 'Travel', 500, 'Travel to Bali');

INSERT INTO goals (id, user_id, metadata_id, name, amount, document) VALUES
(1, 1, 1, 'New Laptop', 1000, 'laptop.pdf'),
(2, 2, 2, 'Vacation Fund', 1500, 'vacation.pdf');

INSERT INTO transaction_types (id, label) VALUES
(1, 'income'),
(2, 'expense');

INSERT INTO transaction (id, user_id, pocket_id, metadata_id, transaction_types_id, name, amount, document, goals_id, menu_type) VALUES
-- Transactions from pockets
(1, 1, 1, 1, 1, 'Bought groceries', 50, 'receipt1.pdf', NULL, 'pocket'),
(2, 2, 2, 2, 2, 'Flight booking', 300, 'receipt2.pdf', NULL, 'pocket'),

-- Transaction from goals
(4, 1, NULL, 1, 1, 'Saved for laptop', 300, 'goal_receipt.pdf', 1, 'goal'),
(5, 2, NULL, 2, 1, 'Vacation top-up', 200, NULL, 2, 'goal');


INSERT INTO notification_messages (id, title, description) VALUES
(1, 'Transaction Alert', 'You spent 50 on groceries.'),
(2, 'Goal Progress', 'You have saved 50% toward your laptop goal.');

INSERT INTO notifications (id, user_id, notification_message_id, metadata_id, is_read) VALUES
(1, 1, 1, 1, false),
(2, 1, 2, 1, true),
(3, 2, 1, 2, false);
