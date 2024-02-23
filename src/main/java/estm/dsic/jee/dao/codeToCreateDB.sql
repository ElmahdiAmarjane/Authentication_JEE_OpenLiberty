-- Create the database
CREATE DATABASE IF NOT EXISTS db_auth;

-- Switch to the 'db_auth' database
USE db_auth;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL
);


