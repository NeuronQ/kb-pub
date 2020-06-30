# Dump DB
pg_dump dbname > dumpfile

# Close all other connections to DB
select pg_terminate_backend(pid) from pg_stat_activity where datname='my_db_name';

# Restore dump
psql dbname < dumpfile

# Export table
pg_dump --host localhost --port 5432 --username sss \
	--format plain --verbose \
	--file /home/neuronq/work/deepsine/sss/users.sql \
	--table public.shopify_user

# export to natime format (most efficient, compressed)
pg_dump -F c -f backup.tar.gz -U <user> <database>

# Export table to CSV
```
\copy (SELECT foo,bar FROM whatever) TO '/tmp/file.csv' DELIMITER ',' CSV HEADER
```

# Rename db
#######################################
alter database old_name rename to new_name;

# Create clone of db
#######################################
CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER dbuser;


# Users
#######################################
# Create
create user my_user [with password my_password];
# Change password
alter user my_user with password my_new_password;
# Make user SuperUser
alter user myuser with superuser;


# Drop all tables in current schema
#######################################
DO $$ DECLARE
    r RECORD;
BEGIN
    -- if the schema you operate on is not "current", you will want to
    -- replace current_schema() in query with 'schematodeletetablesfrom'
    -- *and* update the generate 'DROP...' accordingly.
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;

# Export 
