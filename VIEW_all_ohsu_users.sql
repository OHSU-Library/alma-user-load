CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `libadm`@`10.%` 
    SQL SECURITY DEFINER
VIEW `all_ohsu_users` AS
    SELECT 
        `e`.`UpdatedDate` AS `UpdatedDate`,
        `e`.`ID` AS `employee_id`,
        '' AS `student_id`,
        (CASE
            WHEN (`e`.`NetworkAccountName` <> '') THEN CONCAT(`e`.`NetworkAccountName`, '@ohsu.edu')
            ELSE UUID_SHORT()
        END) AS `primary_id`,
        `e`.`FirstName` AS `first_name`,
        `e`.`MiddleName` AS `middle_name`,
        `e`.`LastName` AS `last_name`,
        '' AS `school_line1`,
        '' AS `school_line2`,
        '' AS `school_state`,
        '' AS `school_city`,
        '' AS `school_zip`,
        '' AS `school_email`,
        '' AS `school_phone`,
        '' AS `school_description`,
        `e`.`Address1` AS `work_line1`,
        `e`.`Address2` AS `work_line2`,
        `e`.`City` AS `work_city`,
        `e`.`State` AS `work_state`,
        `e`.`Zip` AS `work_zip`,
        `e`.`Email` AS `work_email`,
        `e`.`Phone` AS `work_phone`,
        `e`.`PersonType` AS `person_type`,
        IF((`e`.`RefGroup` = ''),
            `e`.`PersonType`,
            IF((`e`.`RefGroup` = 'Student'),
                'Student Employee',
                `e`.`RefGroup`)) AS `work_description`,
        `e`.`Department` AS `work_department`
    FROM
        `libempdata` `e`
    WHERE
        (`e`.`PersonType` <> 'STUDENT') 
    UNION ALL SELECT 
        `s`.`UpdatedDate` AS `UpdatedDate`,
        '' AS `employee_id`,
        `s`.`ID` AS `student_id`,
        (CASE
            WHEN (`s`.`NetworkAccountName` <> '') THEN CONCAT(`s`.`NetworkAccountName`, '@ohsu.edu')
            ELSE UUID_SHORT()
        END) AS `primary_id`,
        `s`.`FirstName` AS `first_name`,
        `s`.`MiddleName` AS `middle_name`,
        `s`.`LastName` AS `last_name`,
        `s`.`Address1` AS `school_line1`,
        `s`.`Address2` AS `school_line2`,
        `s`.`City` AS `school_city`,
        `s`.`State` AS `school_state`,
        `s`.`Zip` AS `school_zip`,
        `s`.`Email` AS `school_email`,
        `s`.`Phone` AS `school_phone`,
        `s`.`PersonType` AS `person_type`,
        `c`.`STVCOLL_DESC` AS `school_description`,
        '' AS `work_line1`,
        '' AS `work_line2`,
        '' AS `work_city`,
        '' AS `work_state`,
        '' AS `work_zip`,
        '' AS `work_email`,
        '' AS `work_phone`,
        '' AS `work_description`,
        '' AS `work_department`
    FROM
        (`libempdata` `s`
        LEFT JOIN `STVCOLL` `c` ON ((`s`.`StudentCollegeCode` = `c`.`STVCOLL_CODE`)))
    WHERE
        (`s`.`PersonType` = 'STUDENT')