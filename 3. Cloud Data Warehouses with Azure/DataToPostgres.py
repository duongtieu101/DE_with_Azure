import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

########################################
# Update connection string information #
########################################
host = "<yourhost>"
user = "<userid>"
password = "<yourpasss>"

# Create a new DB
sslmode = "require"
dbname = "postgres"
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT);
print("Connection established")

cursor = conn.cursor()
cursor.execute('DROP DATABASE IF EXISTS udacityproject')
cursor.execute("CREATE DATABASE udacityproject")
# Clean up initial connection
conn.commit()
cursor.close()
conn.close()

# Reconnect to the new DB
dbname = "udacityproject"
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")
cursor = conn.cursor()

# Helper functions
def drop_recreate(c, tablename, create):
    c.execute("DROP TABLE IF EXISTS {0};".format(tablename))
    c.execute(create)
    print("Finished creating table {0}".format(tablename))

def populate_table(c, filename, tablename):
    f = open(filename, 'r')
    try:
        cursor.copy_from(f, tablename, sep=",", null = "")
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        conn.rollback()
        cursor.close()
    print("Finished populating {0}".format(tablename))

# Create Riders table
table = "riders"
filename = './data/riders.csv'
create = "CREATE TABLE riders (rider_id INTEGER PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), address VARCHAR(100), birthday DATE, account_start_date DATE, account_end_date DATE, is_member BOOLEAN);"

drop_recreate(cursor, table, create)
populate_table(cursor, filename, table)

# Create Payments table
table = "payments"
filename = './data/payments.csv'
create = "CREATE TABLE payments (payment_id INTEGER PRIMARY KEY, date DATE, amount MONEY, rider_id INTEGER);"

drop_recreate(cursor, table, create)
populate_table(cursor, filename, table)

# Create Stations table
table = "stations"
filename = './data/stations.csv'
create = "CREATE TABLE stations (station_id VARCHAR(50) PRIMARY KEY, name VARCHAR(75), latitude FLOAT, longitude FLOAT);"

drop_recreate(cursor, table, create)
populate_table(cursor, filename, table)

# Create Trips table
table = "trips"
filename = './data/trips.csv'
create = "CREATE TABLE trips (trip_id VARCHAR(50) PRIMARY KEY, rideable_type VARCHAR(75), start_at TIMESTAMP, ended_at TIMESTAMP, start_station_id VARCHAR(50), end_station_id VARCHAR(50), rider_id INTEGER);"

drop_recreate(cursor, table, create)
populate_table(cursor, filename, table)

# Clean up
conn.commit()
cursor.close()
conn.close()

print("All done!")