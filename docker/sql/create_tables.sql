CREATE TABLE IF NOT EXISTS users
(
    user_id    serial primary key,
    first_name varchar(250)             not null,
    last_name  varchar(250)             not null,
    email      varchar(250)             not null,
    password   varchar(250)             not null,
    created_at timestamp with time zone not null,
    updated_at timestamp with time zone not null
);