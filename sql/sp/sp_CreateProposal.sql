
CREATE PROCEDURE `db_108502523`.`sp_CreateProposal` (
    IN in_member_id INT,
    IN in_title VARCHAR(120),
    IN in_content TEXT,
    IN in_goal INT,
    IN in_category_id INT,
    OUT out_affected_row_num INT
)
SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _is_member_exist TINYINT(1) DEFAULT 0;
    DECLARE _is_category_exist TINYINT(1) DEFAULT 0;
    DECLARE _created_proposal_id INT DEFAULT NULL;

    SET out_affected_row_num = 0;


    /*
      Step 1: check the proposal data
      - Failed if some of the proposal data is invalid.
     */

    /* Check whether the member exists */
    SELECT EXISTS(
           SELECT tm.member_id
             FROM tbl_member AS tm
            WHERE tm.member_id = in_member_id)
      INTO _is_member_exist;

    IF NOT _is_member_exist THEN
        /* The member does not exist */
        LEAVE proc;
    END IF;

    /* Check whether the goal is valid */
    IF in_goal <= 0 THEN
        /* Invalid proposal data */
        LEAVE proc;
    END IF;

    /* Check whether the category exists */
    SELECT EXISTS(
           SELECT tc.id
             FROM tbl_category AS tc
            WHERE tc.id = in_category_id)
      INTO _is_category_exist;

    IF NOT _is_category_exist THEN
        /* The category does not exist */
        LEAVE proc;
    END IF;


    /*
      Step 2: insert the proposal data
     */

    INSERT INTO tbl_proposal (category_id, title, content, goal)
    VALUES (in_category_id, in_title, in_content, in_goal);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();

    /* Get the proposal_id of the last inserted record */
    SELECT LAST_INSERT_ID() INTO _created_proposal_id;

    INSERT INTO tbl_proposal_member (proposal_id, member_id)
    VALUES (_created_proposal_id, in_member_id);
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 3: select the inserted proposal data
     */

    SELECT tp.id            AS proposal_id,
           tp.title         AS proposal_title,
           tp.content       AS proposal_content,
           tp.amount        AS amount,
           tp.goal          AS goal,
           tp.status        AS status,
           tp.viewed_num    AS viewed_num,
           tp.create_date   AS create_date,
           tp.due_date      AS due_date,
           tc.category_name AS category
      FROM tbl_proposal AS tp
           INNER JOIN tbl_category tc
           ON tp.category_id = tc.id
     WHERE tp.id = _created_proposal_id;
END
