CREATE DEFINER=`libadm`@`10.%` PROCEDURE `SIS_XML_MAINTAIN`(IN user_list TEXT)
BEGIN

SELECT employee_id, student_id, primary_id, 
CONCAT(	'<user>',
		'<record_type>PUBLIC</record_type>',
		'<primary_id>', primary_id, '</primary_id>',
		'<first_name>', XML_Encode(first_name), '</first_name>',
		'<middle_name>', XML_Encode(middle_name), '</middle_name>',
		'<last_name>', XML_Encode(last_name), '</last_name>',
		'<job_description>', IF(work_description = '', 
								XML_Encode(school_description), 
								IF(work_description = 'EX-EMPLOYEE' AND school_description != '', 
									XML_Encode(school_description), 
                                          XML_Encode(work_description))), 
		'</job_description>', 
		'<user_group>', 
		CASE work_description
			WHEN 'Faculty' THEN 'ohsufaculty'
			WHEN 'Fellow' THEN 'ohsuresidentfellow'
			WHEN '' THEN IF(school_description != '', 'ohsustudent', 'ohsustaff')
			ELSE IF(work_description = 'EX-EMPLOYEE' AND school_description != '', 'ohsustudent',
					IF(work_department = 'BI.Library Main Operations', 'librarystaff',
					IF(LEFT(work_department, 2) = 'PC', 'onprcfacultystaff', 'ohsustaff')))
		END,
		'</user_group>',
		'<expiry_date>', IF(school_description = '' AND work_description = 'EX-EMPLOYEE', Date_Format(UpdatedDate, '%Y-%m-%d'), 		/* Ex-Employee */
						 IF(work_description != '' AND work_description != 'EX-EMPLOYEE', '2099-12-31',									/* Employee Expiration */
						 IF(MONTH(CURDATE()) <= '07', CONCAT(YEAR(CURDATE()), '-08-31'), CONCAT(YEAR(CURDATE())+1, '-08-31')))), 		/* Student Expiration */
		'</expiry_date>',
		'<purge_date>', IF(school_description = '' AND work_description = 'EX-EMPLOYEE', Date_Format(UpdatedDate, '%Y-%m-%d'), 			/* Ex-Employee */
						IF(work_description != '' AND work_description != 'EX-EMPLOYEE', '2099-12-31',									/* Employee Expiration */
						IF(MONTH(CURDATE()) <= '07', CONCAT(YEAR(CURDATE()), '-08-31'), CONCAT(YEAR(CURDATE())+1, '-08-31')))), 		/* Student Expiration */
		'</purge_date>',
        '<preferred_language desc="English">en</preferred_language>',
		'<account_type>EXTERNAL</account_type>',
		'<external_id>SIS</external_id>',
		'<status>ACTIVE</status>',
		'<contact_info>', 
		'<addresses>',
		IF ((school_description != '' AND school_line1 != ''), CONCAT(
			'<address segment_type="External">',
			'<line1>', XML_Encode(school_line1), '</line1>',
			'<line2>', XML_Encode(school_line2), '</line2>',
			'<city>', XML_Encode(school_city), '</city>',
			'<state_province>', XML_Encode(school_state), '</state_province>',
			'<postal_code>', XML_Encode(school_zip), '</postal_code>',
			'<address_types>',
			'<address_type>school</address_type>',
			'</address_types>',
			'</address>'),
		''),
		IF ((work_description != '' AND work_line1 != ''), CONCAT(
			'<address segment_type="External">',
			'<line1>', XML_Encode(work_line1), '</line1>',
			'<line2>', XML_Encode(work_line2), '</line2>',
			'<city>', XML_Encode(work_city), '</city>',
			'<state_province>', XML_Encode(work_state), '</state_province>',
			'<postal_code>', XML_Encode(work_zip), '</postal_code>',
			'<address_types>',
			'<address_type>work</address_type>',
			'</address_types>',
			'</address>'),
		''),
		'</addresses>',
		'<emails>',
		IF((school_description != '' AND school_email != ''), CONCAT(
			'<email segment_type="External">',
			'<email_address>', XML_Encode(school_email), '</email_address>',
			'<email_types>', 
			'<email_type>school</email_type>',
			'</email_types>',
			'</email>'),
		''),
		IF((work_description != '' AND work_email != ''), CONCAT(
			'<email segment_type="External">',
			'<email_address>', XML_Encode(work_email), '</email_address>',
			'<email_types>', 
			'<email_type>work</email_type>',
			'</email_types>',
			'</email>'),
		''),
		'</emails>',
		'<phones>',
		IF((school_description != '' AND school_phone != ''), CONCAT(
		  '<phone segment_type="External">',
		  '<phone_number>', XML_Encode(school_phone), '</phone_number>',
		  '<phone_types>',
		  '<phone_type>home</phone_type>',
		  '</phone_types>',
		  '</phone>'),
		''),
		IF((work_description != '' AND work_phone != ''), CONCAT(
		  '<phone segment_type="External">',
		  '<phone_number>', XML_Encode(work_phone), '</phone_number>',
		  '<phone_types>',
		  '<phone_type>office</phone_type>',
		  '</phone_types>',
		  '</phone>'),
		''),
		'</phones>',
		'</contact_info>',
		'<user_identifiers>',
		IF((school_description != '' AND student_id != '' AND primary_id != student_id), CONCAT(
			'<user_identifier segment_type="External">',
			'<id_type>OTHER_ID_2</id_type>', 
			'<value>', XML_Encode(student_id), '</value>',
            '<note>', XML_Encode(school_description), '</note>',
			'</user_identifier>'),
		''),
		IF((work_description != '' AND employee_id != '' AND primary_id != employee_id), CONCAT(
			'<user_identifier segment_type="External">',
			'<id_type>OTHER_ID_1</id_type>', 
			'<value>', XML_Encode(employee_id), '</value>',
            '<note>', XML_Encode(work_description), '</note>',
			'</user_identifier>'),
		''),
		'</user_identifiers>',
		'<user_statistics>',
		IF(work_department != '', CONCAT(
			'<user_statistic segment_type="External">',
			'<statistic_category>Department</statistic_category>', 
			'<statistic_note>', XML_Encode(work_department), '</statistic_note>',
			'</user_statistic>'),
		''),
		'</user_statistics>',
		'</user>') AS 'user_xml'
FROM ohsu_users_combined
WHERE FIND_IN_SET(primary_id, user_list) > 0
	AND primary_id LIKE '%@ohsu.edu'
ORDER BY primary_id;
END