CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `libadm`@`10.%` 
    SQL SECURITY DEFINER
VIEW `ohsu_user_departments` AS
    SELECT 
        `libempdata`.`FirstName` AS `FirstName`,
        `libempdata`.`MiddleName` AS `MiddleName`,
        `libempdata`.`LastName` AS `LastName`,
        `libempdata`.`RefGroup` AS `RefGroup`,
        `libempdata`.`Department` AS `Department`
    FROM
        `libempdata`
    WHERE
        (`libempdata`.`PersonType` = 'EMPLOYEE')
    ORDER BY `libempdata`.`ID`