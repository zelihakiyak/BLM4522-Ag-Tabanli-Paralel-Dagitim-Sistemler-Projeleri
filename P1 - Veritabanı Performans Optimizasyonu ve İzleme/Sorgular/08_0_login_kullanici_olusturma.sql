USE master;

CREATE LOGIN analyst_user WITH PASSWORD = 'Analyst123!';
CREATE LOGIN app_user WITH PASSWORD = 'AppUser123!';
CREATE LOGIN db_admin WITH PASSWORD = 'DbAdmin123!';

USE AdventureWorks2022;

-- Her login için DB kullanýcýsý oluþtur
CREATE USER analyst_user FOR LOGIN analyst_user;
CREATE USER app_user FOR LOGIN app_user;
CREATE USER db_admin FOR LOGIN db_admin;