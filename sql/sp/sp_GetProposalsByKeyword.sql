
CREATE PROCEDURE `db_108502523`.`sp_GetProposalsByKeyword` (
    IN in_keyword VARCHAR(64),
    OUT out_result_row_num INT
)
SQL SECURITY INVOKER
BEGIN
    SELECT tp.id       AS proposal_id,
           tp.title    AS proposal_title,
           tp.due_date AS due_date,
           tp.amount   AS amount
      FROM tbl_proposal AS tp
     WHERE tp.title LIKE CONCAT('%', in_keyword, '%');  /* Check whether titles contains the keyword */

    SELECT FOUND_ROWS() INTO out_result_row_num;
END
