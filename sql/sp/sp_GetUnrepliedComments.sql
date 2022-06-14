
CREATE PROCEDURE `db_108502523`.`sp_GetUnrepliedComments` (
    IN in_member_id INT,
    OUT out_result_row_num INT
)
SQL SECURITY INVOKER
BEGIN
    SELECT tpm.member_id        AS member_id,
           tc.proposal_id       AS proposal_id,
           tp.title             AS proposal_title,
           tc.id                AS comment_id,
           tc.user_comment      AS member_comment,
           tc.comment_time      AS comment_time,
           tc.proposer_response AS proposer_response
      FROM tbl_proposal_member AS tpm
           INNER JOIN tbl_comment AS tc
           ON tpm.proposal_id = tc.proposal_id
           INNER JOIN tbl_proposal AS tp
           ON tc.proposal_id = tp.id
     WHERE tpm.member_id = in_member_id
           AND tc.proposer_response IS NULL; /* "Unreplied" is equivalent to "proposer_response is NULL" */

    SELECT FOUND_ROWS() INTO out_result_row_num;
END
