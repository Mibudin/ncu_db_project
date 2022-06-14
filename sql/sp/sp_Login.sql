
CREATE PROCEDURE `db_108502523`.`sp_Login` (
    IN in_email VARCHAR(64),
    IN in_hashed_pwd VARCHAR(200),
    OUT out_status_code INT
)
SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _login_member_id INT DEFAULT NULL;
    DECLARE _is_pwd_check_success TINYINT(1) DEFAULT 0;

    /*
      Step 1: check the given email and the corresponding user
      - Failed if no corresponding member record found.
     */

    /* Check whether the member exists */
    SELECT tm.member_id
      INTO _login_member_id
      FROM tbl_member AS tm
     WHERE tm.email = in_email;

    IF _login_member_id IS NULL THEN
        /* No member who registered with this email found */
        SET out_status_code = 3;
        SELECT out_status_code AS status_code;
        LEAVE proc;
    END IF;


    /*
      Step 2: check the given hashed password
      - Failed if:
        1. no corresponding member credential record found
            (belonging to the "wrong password" exception here), and
        2. wrong hashed password (literally).
     */

    /* Check if the member credential record exists
       and if the hashed password is correct */
    SELECT EXISTS(
           SELECT tmc.hashed_user_id
             FROM tbl_member_credential AS tmc
            WHERE tmc.hashed_user_id = _login_member_id
                  AND tmc.hashed_pwd_string = in_hashed_pwd)
      INTO _is_pwd_check_success;

    IF NOT _is_pwd_check_success THEN
        /* Step 2 failed */
        SET out_status_code = 2;
        SELECT out_status_code AS status_code;
        LEAVE proc;
    END IF;


    /*
      Step 3: post-process for login success
     */

    /* Record this login */
    INSERT INTO tbl_login_record (member_id)
    VALUES (_login_member_id);

    SET out_status_code = 1;
    SELECT out_status_code AS status_code;  /* Satisfying the result table on the SP specification. */
END
