
CREATE PROCEDURE `db_108502523`.`sp_DeleteMember` (
    IN in_member_id INT,
    OUT out_affected_row_num INT
)
SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_member_exist TINYINT(1) DEFAULT 0;
    DECLARE _is_member_proposer TINYINT(1) DEFAULT 0;

    SET out_affected_row_num = 0;

    /*
      Step 1: check whether this member is deletable
      - Failed if this member is not deletable for some reasons.
     */

    /* Check whether this member exists */
    SELECT EXISTS(
           SELECT tm.member_id
             from tbl_member AS tm
            WHERE tm.member_id = in_member_id)
      INTO _is_member_exist;

    IF NOT _is_member_exist THEN
        /* This member is not exist */
        LEAVE proc;
    END IF;

    /* Check whether this member is a proposer */
    SELECT EXISTS(
           SELECT tpm.member_id
             FROM tbl_proposal_member AS tpm
            WHERE tpm.member_id = in_member_id)
      INTO _is_member_proposer;

    IF _is_member_proposer THEN
        /* A current proposer cannot be deleted, take the responsibilities as a proposer */
        LEAVE proc;
    END IF;


    /*
      Step 2: delete this member and delete or modify associate records
     */

    /* While deleting this member, in other tables, some fields taking `member_id` as
       a foreign key would be deleted (ON DELETE CASCADE) or set to NULL (ON DELETE SET NULL),
       unfortunately, which would not be detected by `ROW_COUNT()`. */
    DELETE FROM tbl_member
     WHERE tbl_member.member_id = in_member_id;
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();
END
