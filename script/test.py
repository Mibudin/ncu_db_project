import mysql.connector
import utils


def main():
    with mysql.connector.connect(**utils.load_db_config()) as cnx:
        with cnx.cursor() as cur:
            cur.execute('SELECT VERSION();')
            result = cur.fetchall()
        cnx.commit()
        for x in result:
            print(x)


if __name__ == '__main__':
    main()
