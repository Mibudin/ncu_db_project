
CREATE PROCEDURE `db_108502523`.`sp_GetRecommendedProposals` (
    IN in_member_id INT,
    OUT out_result_row_num INT
)
SQL SECURITY INVOKER
proc: BEGIN

    /*
      Step 1: select the recommended proposals if exist
     */

    /*
      Notes of table joins:
      -      `tsr` : the members sponsored which proposal option
      - JOIN `tpo` : the above proposal options belong to which proposal
      - JOIN `tpo2`: the above proposals include which proposal option
      - JOIN `tsr2`: the above proposal options were sponsored by which members
      - JOIN `tsr3`: the above members sponsored which proposal option
      - JOIN `tpo3`: the above proposal options belong to which proposal
      - JOIN `tp`  : the above proposals' information
      - JOIN `tpm` : the above proposals' proposers
     */
    CREATE TEMPORARY TABLE tbl_tmp_recommended_proposal
    SELECT DISTINCT
           tp.id         AS proposal_id,
           tp.title      AS proposal_title,
           tp.status     AS status,
           tp.viewed_num AS viewed_num
      FROM tbl_sponsor_record AS tsr
           INNER JOIN tbl_proposal_option AS tpo
           ON tsr.proposal_option_id = tpo.id
           INNER JOIN tbl_proposal_option AS tpo2
           ON tpo.proposal_id = tpo2.proposal_id
           INNER JOIN tbl_sponsor_record AS tsr2
           ON tsr2.proposal_option_id = tpo2.id
           INNER JOIN tbl_sponsor_record AS tsr3
           ON tsr3.member_id = tsr2.member_id
           INNER JOIN tbl_proposal_option AS tpo3
           ON tsr3.proposal_option_id = tpo3.id
           INNER JOIN tbl_proposal AS tp
           ON tpo3.proposal_id = tp.id
           INNER JOIN tbl_proposal_member AS tpm
           ON tp.id = tpm.proposal_id
     WHERE tsr.member_id = in_member_id             /* Requirement a. */
           AND tsr.member_id != tsr2.member_id      /* Requirement a. */
           AND tpo.proposal_id != tpo3.proposal_id  /* Requirement b. */
           AND tp.status = 2                        /* Requirement c. */
           AND tpm.member_id != tsr.member_id       /* Requirement d. */
     ORDER BY tp.viewed_num DESC;

    SELECT FOUND_ROWS() INTO out_result_row_num;


    /*
      Step 2: check whether the recommended proposals exist
      - Failed if no recommended proposal found.
     */

    IF out_result_row_num = 0 THEN
        /* No recommended proposal found */
        SELECT tp.id         AS proposal_id,
               tp.title      AS proposal_title,
               tp.status     AS status,
               tp.viewed_num AS viewed_num
          FROM tbl_proposal AS tp
         ORDER BY tp.viewed_num DESC
         LIMIT 5;
    ELSE
        SELECT *
          FROM tbl_tmp_recommended_proposal;
    END IF;

    SELECT FOUND_ROWS() INTO out_result_row_num;

    DROP TABLE tbl_tmp_recommended_proposal;
END
