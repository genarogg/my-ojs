CREATE DATABASE IF NOT EXISTS saber_unerg;
DROP USER IF EXISTS 'dir_informatica'@'%';
CREATE USER 'dir_informatica'@'%' IDENTIFIED BY 'dir_informatica';
GRANT ALL PRIVILEGES ON *.* TO 'dir_informatica'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;