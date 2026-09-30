DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords;

USE passwords;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE password_entries (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    website_name VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    encrypted_password VARBINARY(255) NOT NULL,
    comment VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (first_name, last_name, email)
VALUES
('John', 'Smith', 'john.smith@example.com'),
('Jane', 'Doe', 'jane.doe@example.com'),
('Michael', 'Brown', 'michael.brown@example.com'),
('Sarah', 'Wilson', 'sarah.wilson@example.com'),
('David', 'Miller', 'david.miller@example.com'),
('Emily', 'Davis', 'emily.davis@example.com'),
('Chris', 'Taylor', 'chris.taylor@example.com'),
('Alex', 'Anderson', 'alex.anderson@example.com'),
('Kevin', 'Thomas', 'kevin.thomas@example.com'),
('Jessica', 'Moore', 'jessica.moore@example.com');

INSERT INTO password_entries
    (user_id, website_name, url, username, encrypted_password, comment)
VALUES
(1, 'MySQL', 'https://mysql.com', 'johnmysql',
 AES_ENCRYPT('FakeMySQL123!', 'ClassKey2026'),
 'Fake MySQL account'),

(2, 'GitHub', 'https://github.com', 'janedoe',
 AES_ENCRYPT('FakeGitHub456!', 'ClassKey2026'),
 'Fake GitHub account'),

(3, 'Reddit', 'https://reddit.com', 'michaelbrown',
 AES_ENCRYPT('FakeReddit789!', 'ClassKey2026'),
 'Fake Reddit account'),

(4, 'LinkedIn', 'https://linkedin.com', 'sarahwilson',
 AES_ENCRYPT('FakeLinkedIn321!', 'ClassKey2026'),
 'Fake LinkedIn account'),

(5, 'Youtube', 'http://youtube.com', 'davidmiller',
 AES_ENCRYPT('FakeExample654!', 'ClassKey2026'),
 'Fake Youtube account'),

(6, 'Stack Overflow', 'https://stackoverflow.com', 'emilydavis',
 AES_ENCRYPT('FakeStack987!', 'ClassKey2026'),
 'Fake Stack Overflow account'),

(7, 'Wikipedia', 'https://wikipedia.org', 'christaylor',
 AES_ENCRYPT('FakeWiki246!', 'ClassKey2026'),
 'Fake Wikipedia account'),

(8, 'OpenAI', 'https://openai.com', 'alexanderson',
 AES_ENCRYPT('FakeOpenAI135!', 'ClassKey2026'),
 'Fake OpenAI account'),

(9, 'University Portal', 'https://hartford.edu', 'kevinthomas',
 AES_ENCRYPT('FakeSchool864!', 'ClassKey2026'),
 'Fake university account'),

(10, 'Twitter', 'http://x.com', 'jessicamoore',
 AES_ENCRYPT('FakeTest753!', 'ClassKey2026'),
 'Fake twitter account');
