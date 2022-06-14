
CREATE PROCEDURE `db_108502523`.`sp_GetFollowedProposalsByMember` (
    IN in_member_id INT,
    OUT out_result_row_num INT
)
SQL SECURITY INVOKER
BEGIN
    SELECT tfr.member_id   AS member_id,
           tfr.proposal_id AS proposal_id,  /* Satisfying "Problem: sp.[1].1" */
           tp.title        AS proposal_title,
           tp.amount       AS proposal_amount,
           tp.goal         AS proposal_goal
      FROM tbl_following_record AS tfr
           INNER JOIN tbl_proposal AS tp
           ON tfr.proposal_id = tp.id
     WHERE tfr.member_id = in_member_id;

    SELECT FOUND_ROWS() INTO out_result_row_num;
END
