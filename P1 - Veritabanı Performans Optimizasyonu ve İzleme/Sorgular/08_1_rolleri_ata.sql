USE AdventureWorks2022;

GRANT SELECT ON SCHEMA::Sales TO analyst_user;
GRANT SELECT ON SCHEMA::Person TO analyst_user;

GRANT SELECT, INSERT, UPDATE ON SCHEMA::Sales TO app_user;

EXEC sp_addrolemember 'db_owner', 'db_admin';