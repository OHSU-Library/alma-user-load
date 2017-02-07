CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `libadm`@`10.%` 
    SQL SECURITY DEFINER
VIEW `ohsu_users_combined` AS
    SELECT 
        MAX(`u`.`UpdatedDate`) AS `UpdatedDate`,
        MAX(`u`.`employee_id`) AS `employee_id`,
        MAX(`u`.`student_id`) AS `student_id`,
        MAX(IF((RIGHT(`u`.`primary_id`, 9) = '@ohsu.edu'),
            `u`.`primary_id`,
            IF((`u`.`employee_id` <> ''),
                `u`.`employee_id`,
                `u`.`student_id`))) AS `primary_id`,
        MAX(`u`.`first_name`) AS `first_name`,
        MAX(`u`.`middle_name`) AS `middle_name`,
        MAX(`u`.`last_name`) AS `last_name`,
        MAX(`u`.`school_line1`) AS `school_line1`,
        MAX(`u`.`school_line2`) AS `school_line2`,
        MAX(`u`.`school_state`) AS `school_state`,
        MAX(`u`.`school_city`) AS `school_city`,
        MAX(`u`.`school_zip`) AS `school_zip`,
        MAX(`u`.`school_email`) AS `school_email`,
        MAX(`u`.`school_phone`) AS `school_phone`,
        MAX(`u`.`school_description`) AS `school_description`,
        MAX(`u`.`work_line1`) AS `work_line1`,
        MAX(`u`.`work_line2`) AS `work_line2`,
        MAX(`u`.`work_city`) AS `work_city`,
        MAX(`u`.`work_state`) AS `work_state`,
        MAX(`u`.`work_zip`) AS `work_zip`,
        MAX(`u`.`work_email`) AS `work_email`,
        MAX(`u`.`work_phone`) AS `work_phone`,
        MAX(`u`.`work_description`) AS `work_description`,
        MAX(`u`.`work_department`) AS `work_department`
    FROM
        `ohsu_users` `u`
    GROUP BY `u`.`primary_id`
    ORDER BY `u`.`last_name`