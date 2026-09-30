USE passwords;


INSERT INTO users (first_name, last_name, email)
VALUES ('Robert', 'Johnson', 'robert.johnson@example.com');

INSERT INTO password_entries
    (user_id, website_name, url, username, encrypted_password, comment)
VALUES
(
    LAST_INSERT_ID(),
    'New Site',
    'https://newsite.example.com',
    'robertjohnson',
    AES_ENCRYPT('FakeNewPass123!', 'ClassKey2026'),
    'New fake account'
);


SELECT
    CONVERT(AES_DECRYPT(encrypted_password, 'ClassKey2026') USING utf8mb4)
        AS password
FROM password_entries
WHERE url = 'https://mysql.com';


SELECT
    u.first_name,
    u.last_name,
    u.email,
    p.website_name,
    p.url,
    p.username,
    CONVERT(AES_DECRYPT(p.encrypted_password, 'ClassKey2026') USING utf8mb4)
        AS password,
    p.comment,
    p.created_at
FROM users u
JOIN password_entries p
    ON u.user_id = p.user_id
WHERE p.url IN ('https://github.com', 'https://openai.com');


UPDATE password_entries
SET url = 'https://youtube.com'
WHERE url = 'http://youtube.com';


UPDATE password_entries
SET encrypted_password = AES_ENCRYPT('NewFakePass456!', 'ClassKey2026')
WHERE url = 'https://mysql.com';


DELETE FROM password_entries
WHERE url = 'http://x.com';


DELETE FROM password_entries
WHERE encrypted_password = AES_ENCRYPT('FakeReddit789!', 'ClassKey2026');
