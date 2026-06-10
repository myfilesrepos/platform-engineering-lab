import psycopg2

###  Connection parameters
database = "dev"
user = " "
password = " "
host = "postgres"
port = "5432"

### connection setting
connection_string = f"dbname='{database}' user='{user}' password='{password}' host='{host}' port='{port}'"


create_table_sql = '''
CREATE TABLE DATA_FLOW (
    DATETIME TIMESTAMP WITHOUT TIME ZONE,
    temperature_huile FLOAT,
    pression_huile FLOAT,
    puissance_moteur FLOAT,
    motor_speed FLOAT

)
'''

try:
    ### Setting up the connection
    with psycopg2.connect(connection_string) as conn:
        with conn.cursor() as cursor:
            cursor.execute("DROP TABLE IF EXISTS DATA_FLOW")
            ### Create a new table
            cursor.execute(create_table_sql)
            print("Table created successfully.")
except Exception as e:
    print(f"An error occurred: {e}")
    