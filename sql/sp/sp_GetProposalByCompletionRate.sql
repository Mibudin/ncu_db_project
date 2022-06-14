
CREATE PROCEDURE `db_108502523`.`sp_GetProposalByCompletionRate` (
    IN in_ratio FLOAT,
    OUT out_result_row_num INT
)
SQL SECURITY INVOKER
BEGIN
    SELECT tp.id               AS proposal_id,
           tp.title            AS proposal_title,
           tp.amount           AS amount,
           tp.goal             AS goal,
           tp.amount / tp.goal AS ratio
      FROM tbl_proposal AS tp
     WHERE tp.amount / tp.goal >= in_ratio
     ORDER BY ratio DESC;

    SELECT FOUND_ROWS() INTO out_result_row_num;
END
