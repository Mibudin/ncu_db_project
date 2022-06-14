
CREATE PROCEDURE `db_108502523`.`sp_UpdateProposalStatus` (
    IN in_proposal_id INT,
    IN in_status INT,
    OUT out_affected_row_num INT
)
SQL SECURITY INVOKER
proc: BEGIN
    DECLARE _original_status INT DEFAULT NULL;
    DECLARE _due_date DATE DEFAULT NULL;

    SET out_affected_row_num = 0;


    /*
      Step 1: check whether the proposal exists
      - Failed if this proposal does not exist.
     */

    SELECT tp.status,
           tp.due_date
      FROM tbl_proposal AS tp
     WHERE tp.id = in_proposal_id
      INTO _original_status,
           _due_date;

    IF _original_status IS NULL THEN
        /* This proposal does not exist */
        LEAVE proc;
    END IF;


    /*
      Step 2: check whether this status updating is valid
      - Failed if the given status is invalid.
      - No handling for extended due date here
     */

    /* Prefer separate if statements here for easier to handle different exceptions
       and print different exception messages. */

    IF in_status NOT BETWEEN 1 AND 3 THEN
        /* Impossible target status */
        LEAVE proc;
    END IF;

    IF in_status - _original_status != 1 THEN
        /* Invalid status transition */
        LEAVE proc;
    END IF;

    IF in_status = 3 AND _due_date >= CURRENT_DATE() THEN
        /* Have not expired */
        LEAVE proc;
    END IF;


    /*
      Step 3: update the status and do some other associated processes
     */

    CASE in_status
         /* WHEN 1 THEN */  /* UNDER-REVIEWING */
            /* Impossible here */

         WHEN 2 THEN  /* ONGOING */
            /* Calculate pass_date and due_date */
            UPDATE tbl_proposal AS tp
               SET tp.status = 2,
                   tp.pass_date = CURRENT_DATE(),
                   tp.due_date = DATE_ADD(CURRENT_DATE(), INTERVAL 90 DAY)
             WHERE tp.id = in_proposal_id;

         WHEN 3 THEN  /* EXPIRED */
            /* Deactivate this proposal */
            UPDATE tbl_proposal AS tp
               SET tp.status = 3,
                   tp.is_deactivated = 1
             WHERE tp.id = in_proposal_id;

         /* ELSE */
            /* Impossible here */
    END CASE;
    SET out_affected_row_num = out_affected_row_num + ROW_COUNT();


    /*
      Step 4: select the updated proposal data
     */

    SELECT tp.id AS proposal_id,
           tp.status AS status
      FROM tbl_proposal AS tp
     WHERE tp.id = in_proposal_id;
END
