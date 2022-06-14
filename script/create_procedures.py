import mysql.connector
from mysql.connector.cursor import MySQLCursor
import utils


def main():
    sps = [
        'sp_GetFollowedProposalsByMember',
        'sp_RegisterMember',
        'sp_UpdatePwd',
        'sp_Login',
        'sp_GetProposalsByKeyword',
        'sp_UpdateProposalStatus',
        'sp_GetHistorySponsorByMember',
        'sp_GetUnrepliedComments',
        'sp_GetProposalByCompletionRate',
        'sp_CreateProposal',
        'sp_GetRecommendedProposals',
        'sp_DeleteMember'
    ]
    sp_sqls: dict[str, str] = {sp: utils.read_text(f'../sql/sp/{sp}.sql') for sp in sps}

    # mysql-connector-python does NOT support DELIMITER command.
    with mysql.connector.connect(**utils.load_db_config()) as cnx:
        cur: MySQLCursor = cnx.cursor()
        with cur:
            cur.execute('USE `db_108502523`;')
            for sp in sps:
                print(sp)
                cur.execute(f'DROP PROCEDURE IF EXISTS {sp};')
                cur.execute(sp_sqls[sp])
        cnx.commit()


if __name__ == '__main__':
    main()
