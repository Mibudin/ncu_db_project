
CREATE PROCEDURE `db_108502523`.`sp_RegisterMember` (
    IN in_email VARCHAR(64),
    IN in_hashed_pwd VARCHAR(255),
    IN in_salt CHAR(64),
    IN in_name VARCHAR(64),
    IN in_address VARCHAR(255),
    IN in_phone VARCHAR(64),
    OUT out_affected_row_num INT
)
SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_email_duplicated TINYINT(1) DEFAULT 1;
    DECLARE _register_member_id INT DEFAULT NULL;

    SET out_affected_row_num = 0;


    /*
      Step 1: check whether the given email is duplicated
      - Failed if the given email is duplicated.
     */

    SELECT EXISTS(
           SELECT tm.member_id
             FROM tbl_member AS tm
            WHERE tm.email = in_email)
      INTO _is_email_duplicated;

    IF _is_email_duplicated THEN
        /* The given email is duplicated */
        LEAVE proc;
    END IF;


    /*
      Step 2: insert data into the member table
     */

    INSERT INTO tbl_member (name, phone, email, salt, address)
    VALUES (in_name, in_phone, in_email, in_salt, in_address);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();

    /* Get the member_id of the last inserted record */
    SELECT LAST_INSERT_ID() INTO _register_member_id;


    /*
      Step 3: insert data into the member credential table
      - GENERAL ASSUMPTION:
            Each member record in `tbl_member` must have one and only one
            corresponding member credential record in `tbl_member_credential`,
            and vice versa.
     */

    INSERT INTO tbl_member_credential (hashed_user_id, hashed_pwd_string)
    VALUES (_register_member_id, in_hashed_pwd);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 4: select the inserted member data
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
     WHERE tm.member_id = _register_member_id;
END
