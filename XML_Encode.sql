CREATE DEFINER=`libadm`@`10.%` FUNCTION `XML_Encode`(x VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
BEGIN 

DECLARE TextString VARCHAR(255) ; 
SET TextString = x ; 

#quotation mark 
IF INSTR( x , '"' ) 
THEN SET TextString = REPLACE(TextString, '"','&quot;') ; 
END IF ; 

#apostrophe  
IF INSTR( x , '''' ) 
THEN SET TextString = REPLACE(TextString, '''','&apos;') ; 
END IF ; 

#ampersand 
IF INSTR( x , '&' ) 
THEN SET TextString = REPLACE(TextString, '&','&amp;') ; 
END IF ; 

#less-than 
IF INSTR( x , '<' ) 
THEN SET TextString = REPLACE(TextString, '<','&lt;') ; 
END IF ; 

#greater-than 
IF INSTR( x , '>' ) 
THEN SET TextString = REPLACE(TextString, '>','&gt;') ; 
END IF ; 

RETURN TextString ; 

END