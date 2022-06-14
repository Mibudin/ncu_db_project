
CREATE PROCEDURE `db_108502523`.`sp_UpdatePwd` (
    IN in_member_id INT,
    IN in_hashed_pwd VARCHAR(200),
    IN in_salt CHAR(64),
    OUT out_affected_row_num INT
)
SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_member_exist TINYINT(1) DEFAULT 0;

    SET out_affected_row_num = 0;


    /*
      Step 1: check whether this member exists
      - Failed if this member does not exist.
     */

    SELECT EXISTS(
           SELECT tm.member_id
             FROM tbl_member AS tm
                  INNER JOIN tbl_member_credential tmc
                  ON tm.member_id = tmc.hashed_user_id
            WHERE tm.member_id = in_member_id)
      INTO _is_member_exist;

    IF NOT _is_member_exist THEN
        /* This member does not exist */
        LEAVE proc;
    END IF;


    /*
      Step 2: update the member data
     */

    UPDATE tbl_member AS tm,
           tbl_member_credential AS tmc
       SET tm.salt = in_salt,
           tmc.hashed_pwd_string = in_hashed_pwd
     WHERE tm.member_id = tmc.hashed_user_id
           AND tm.member_id = in_member_id;
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 3: select the updated member data
     */

    SELECT tm.member_id          AS member_id,
           tm.name               AS name,
           tm.email              AS email,
           tmc.hashed_pwd_string AS password,
           tm.salt               AS salt,
           tm.phone              AS phone,
           tm.address            AS address
      FROM tbl_member AS tm
           INNER JOIN tbl_member_credential AS tmc
           ON tm.member_id = tmc.hashed_user_id
     WHERE tm.member_id = in_member_id;
END
