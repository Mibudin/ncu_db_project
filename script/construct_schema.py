import mysql.connector
from mysql.connector.cursor import MySQLCursor
import utils


def main():
    drop_schema_sql = utils.read_text('../sql/model/drop_schema.sql')
    create_tables_sql = utils.read_text('../sql/model/create_tables.sql')

    with mysql.connector.connect(**utils.load_db_config()) as cnx:
        cur: MySQLCursor = cnx.cursor()
        with cur:
            for result in cur.execute(drop_schema_sql, multi=True):
                pass
            for result in cur.execute(create_tables_sql, multi=True):
                pass
        cnx.commit()


if __name__ == '__main__':
    main()
