
CREATE PROCEDURE `db_108502523`.`sp_GetHistorySponsorByMember` (
    IN in_member_id INT,
    OUT out_result_row_num INT
)
SQL SECURITY INVOKER
BEGIN
    SELECT tsr.member_id AS member_id,
           tp.id         AS proposal_id,
           tp.title      AS proposal_title,
           tpo.title     AS proposal_option_title,
           tsr.amount    AS amount,
           tp.status     AS status
      FROM tbl_sponsor_record AS tsr
           INNER JOIN tbl_proposal_option AS tpo
           ON tsr.proposal_option_id = tpo.id
           INNER JOIN tbl_proposal AS tp
           ON tpo.proposal_id = tp.id
     WHERE tsr.member_id = in_member_id;

    SELECT FOUND_ROWS() INTO out_result_row_num;
END
