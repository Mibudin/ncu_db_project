import mysql.connector
from mysql.connector.cursor import MySQLCursor
import csv
import utils


def get_csv_data(csv_name: str) -> list[list[str]]:
    with utils.read_file(f'../mock/revised/{csv_name}.csv') as f:
        data = list(csv.reader(f))
    for row in data:
        # Should use `None` values in Python to express `NULL` values in MySQL
        row[:] = [None if field == '' else field for field in row]
    return data


def main():
    tbls = [
        'tbl_gender',
        'tbl_member',
        'tbl_member_credential',
        'tbl_login_record',
        'tbl_category',
        'tbl_proposal',
        'tbl_proposal_option',
        'tbl_comment',
        'tbl_faq',
        'tbl_sponsor_record',
        'tbl_following_record',
        'tbl_following_proposer',
        'tbl_proposal_member'
    ]
    tbl_csvs: dict[str, list[list[str]]] = {tbl: get_csv_data(tbl) for tbl in tbls}

    with mysql.connector.connect(**utils.load_db_config()) as cnx:
        cur: MySQLCursor = cnx.cursor()
        with cur:
            print('tbl_gender')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_gender`'
                'VALUES (%s, %s);',
                tbl_csvs['tbl_gender'][1:])
            print('tbl_member')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_member`'
                'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);',
                tbl_csvs['tbl_member'][1:])
            print('tbl_member_credential')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_member_credential`'
                'VALUES (%s, %s);',
                tbl_csvs['tbl_member_credential'][1:])
            print('tbl_login_record')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_login_record`'
                'VALUES (%s, %s, %s);',
                tbl_csvs['tbl_login_record'][1:])
            print('tbl_category')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_category`'
                'VALUES (%s, %s);',
                tbl_csvs['tbl_category'][1:])
            print('tbl_proposal')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_proposal`'
                'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                tbl_csvs['tbl_proposal'][1:])
            print('tbl_proposal_option')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_proposal_option`'
                'VALUES (%s, %s, %s, %s, %s);',
                tbl_csvs['tbl_proposal_option'][1:])
            print('tbl_comment')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_comment`'
                'VALUES (%s, %s, %s, %s, %s, %s, %s);',
                tbl_csvs['tbl_comment'][1:])
            print('tbl_faq')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_faq`'
                'VALUES (%s, %s, %s, %s, %s, %s);',
                tbl_csvs['tbl_faq'][1:])
            print('tbl_sponsor_record')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_sponsor_record`'
                'VALUES (%s, %s, %s, %s, %s);',
                tbl_csvs['tbl_sponsor_record'][1:])
            print('tbl_following_record')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_following_record`'
                'VALUES (%s, %s);',
                tbl_csvs['tbl_following_record'][1:])
            print('tbl_following_proposer')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_following_proposer`'
                'VALUES (%s, %s);',
                tbl_csvs['tbl_following_proposer'][1:])
            print('tbl_proposal_member')
            cur.executemany(
                'INSERT INTO `db_108502523`.`tbl_proposal_member`'
                'VALUES (%s, %s);',
                tbl_csvs['tbl_proposal_member'][1:])
        cnx.commit()


if __name__ == '__main__':
    main()
