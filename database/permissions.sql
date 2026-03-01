-- ===================== DCL.sql =====================

-- Switch to the database
USE medi_master;

-- Create a limited-access user for Flask app
CREATE USER IF NOT EXISTS 'muse'@'localhost' IDENTIFIED BY 'med';

-- Grant only necessary privileges to the app user
GRANT ALL PRIVILEGES ON medi_master.* TO 'muse'@'localhost';

-- Apply the privilege changes
FLUSH PRIVILEGES;
