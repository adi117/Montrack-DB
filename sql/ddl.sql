
CREATE TABLE "transaction_types" (
  "id" integer PRIMARY KEY,
  "label" varchar(10)
);

CREATE TABLE "notification_messages" (
  "id" integer PRIMARY KEY,
  "title" varchar(255),
  "description" varchar(255)
);

CREATE TABLE "metadata" (
  "id" integer PRIMARY KEY,
  "date_created" timestamp,
  "date_updated" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "metadata_id" integer references metadata(id),
  "email" varchar(50),
  "password" varchar(100),
  "is_new" bool,
  "pin" varchar(4),
  "quotes" varchar(255),
  "email_validation" bool,
  "language" varchar(20),
  "profile_photo" varchar(255)
);

CREATE TABLE "wallets" (
  "id" integer PRIMARY KEY,
  "account_number" varchar(20),
  "users_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "name" varchar(100),
  "amount" integer,
  "is_used" bool
);

CREATE TABLE "pocket" (
  "id" integer PRIMARY KEY,
  "user_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "name" varchar(100),
  "amount" integer,
  "description" varchar(255)
);

CREATE TABLE "goals" (
  "id" integer PRIMARY KEY,
  "user_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "name" varchar(100),
  "amount" integer,
  "document" varchar(255)
);

CREATE TABLE "goals_record" (
  "id" integer PRIMARY KEY,
  "goals_id" integer references goals(id),
  "name" varchar(50),
  "metadata_id" integer references metadata(id),
  "amount" integer
);

CREATE TABLE "transaction" (
  "id" integer PRIMARY KEY,
  "user_id" integer references users(id),
  "pocket_id" integer references pocket(id),
  "metadata_id" integer references metadata(id),
  "transaction_types_id" integer references transaction_types(id),
  "name" varchar(100),
  "amount" integer,
  "document" varchar(255)
);

CREATE TABLE "notifications" (
  "id" integer PRIMARY KEY,
  "user_id" integer references users(id),
  "notification_message_id" integer references notification_messages(id),
  "metadata_id" integer references metadata(id),
  "is_read" bool
);