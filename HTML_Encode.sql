CREATE DEFINER=`libadm`@`10.%` FUNCTION `HTML_Encode`(x VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
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

#non-breaking space 
IF INSTR( x , ' ' ) 
THEN SET TextString = REPLACE(TextString, ' ','&nbsp;') ; 
END IF ; 

#inverted exclamation mark 
IF INSTR( x , '¡' ) 
THEN SET TextString = REPLACE(TextString, '¡','&iexcl;') ; 
END IF ; 

#cent 
IF INSTR( x , '¢' ) 
THEN SET TextString = REPLACE(TextString, '¢','&cent;') ; 
END IF ; 

#pound 
IF INSTR( x , '£' ) 
THEN SET TextString = REPLACE(TextString, '£','&pound;') ; 
END IF ; 

#currency 
IF INSTR( x , '¤' ) 
THEN SET TextString = REPLACE(TextString, '¤','&curren;') ; 
END IF ; 

#yen 
IF INSTR( x , '¥' ) 
THEN SET TextString = REPLACE(TextString, '¥','&yen;') ; 
END IF ; 

#broken vertical bar 
IF INSTR( x , '¦' ) 
THEN SET TextString = REPLACE(TextString, '¦','&brvbar;') ; 
END IF ; 

#section 
IF INSTR( x , '§' ) 
THEN SET TextString = REPLACE(TextString, '§','&sect;') ; 
END IF ; 

#spacing diaeresis 
IF INSTR( x , '¨' ) 
THEN SET TextString = REPLACE(TextString, '¨','&uml;') ; 
END IF ; 

#copyright 
IF INSTR( x , '©' ) 
THEN SET TextString = REPLACE(TextString, '©','&copy;') ; 
END IF ; 

#feminine ordinal indicator 
IF INSTR( x , 'ª' ) 
THEN SET TextString = REPLACE(TextString, 'ª','&ordf;') ; 
END IF ; 

#angle quotation mark (left) 
IF INSTR( x , '«' ) 
THEN SET TextString = REPLACE(TextString, '«','&laquo;') ; 
END IF ; 

#negation 
IF INSTR( x , '¬' ) 
THEN SET TextString = REPLACE(TextString, '¬','&not;') ; 
END IF ; 

#soft hyphen 
IF INSTR( x , '­' ) 
THEN SET TextString = REPLACE(TextString, '­','&shy;') ; 
END IF ; 

#registered trademark 
IF INSTR( x , '®' ) 
THEN SET TextString = REPLACE(TextString, '®','&reg;') ; 
END IF ; 

#spacing macron 
IF INSTR( x , '¯' ) 
THEN SET TextString = REPLACE(TextString, '¯','&macr;') ; 
END IF ; 

#degree 
IF INSTR( x , '°' ) 
THEN SET TextString = REPLACE(TextString, '°','&deg;') ; 
END IF ; 

#plus-or-minus  
IF INSTR( x , '±' ) 
THEN SET TextString = REPLACE(TextString, '±','&plusmn;') ; 
END IF ; 

#superscript 2 
IF INSTR( x , '²' ) 
THEN SET TextString = REPLACE(TextString, '²','&sup2;') ; 
END IF ; 

#superscript 3 
IF INSTR( x , '³' ) 
THEN SET TextString = REPLACE(TextString, '³','&sup3;') ; 
END IF ; 

#spacing acute 
IF INSTR( x , '´' ) 
THEN SET TextString = REPLACE(TextString, '´','&acute;') ; 
END IF ; 

#micro 
IF INSTR( x , 'µ' ) 
THEN SET TextString = REPLACE(TextString, 'µ','&micro;') ; 
END IF ; 

#paragraph 
IF INSTR( x , '¶' ) 
THEN SET TextString = REPLACE(TextString, '¶','&para;') ; 
END IF ; 

#middle dot 
IF INSTR( x , '·' ) 
THEN SET TextString = REPLACE(TextString, '·','&middot;') ; 
END IF ; 

#spacing cedilla 
IF INSTR( x , '¸' ) 
THEN SET TextString = REPLACE(TextString, '¸','&cedil;') ; 
END IF ; 

#superscript 1 
IF INSTR( x , '¹' ) 
THEN SET TextString = REPLACE(TextString, '¹','&sup1;') ; 
END IF ; 

#masculine ordinal indicator 
IF INSTR( x , 'º' ) 
THEN SET TextString = REPLACE(TextString, 'º','&ordm;') ; 
END IF ; 

#angle quotation mark (right) 
IF INSTR( x , '»' ) 
THEN SET TextString = REPLACE(TextString, '»','&raquo;') ; 
END IF ; 

#fraction 1/4 
IF INSTR( x , '¼' ) 
THEN SET TextString = REPLACE(TextString, '¼','&frac14;') ; 
END IF ; 

#fraction 1/2 
IF INSTR( x , '½' ) 
THEN SET TextString = REPLACE(TextString, '½','&frac12;') ; 
END IF ; 

#fraction 3/4 
IF INSTR( x , '¾' ) 
THEN SET TextString = REPLACE(TextString, '¾','&frac34;') ; 
END IF ; 

#inverted question mark 
IF INSTR( x , '&iquest;' ) 
THEN SET TextString = REPLACE(TextString, '&iquest;','¿') ; 
END IF ; 

#multiplication 
IF INSTR( x , '×' ) 
THEN SET TextString = REPLACE(TextString, '×','&times;') ; 
END IF ; 

#division 
IF INSTR( x , '÷' ) 
THEN SET TextString = REPLACE(TextString, '÷','&divide;') ; 
END IF ; 

#capital a, grave accent 
IF INSTR( x , 'À' ) 
THEN SET TextString = REPLACE(TextString, 'À','&Agrave;') ; 
END IF ; 

#capital a, acute accent 
IF INSTR( x , 'Á' ) 
THEN SET TextString = REPLACE(TextString, 'Á','&Aacute;') ; 
END IF ; 

#capital a, circumflex accent 
IF INSTR( x , 'Â' ) 
THEN SET TextString = REPLACE(TextString, 'Â','&Acirc;') ; 
END IF ; 

#capital a, tilde 
IF INSTR( x , 'Ã' ) 
THEN SET TextString = REPLACE(TextString, 'Ã','&Atilde;') ; 
END IF ; 

#capital a, umlaut mark 
IF INSTR( x , 'Ä' ) 
THEN SET TextString = REPLACE(TextString, 'Ä','&Auml;') ; 
END IF ; 

#capital a, ring 
IF INSTR( x , 'Å' ) 
THEN SET TextString = REPLACE(TextString, 'Å','&Aring;') ; 
END IF ; 

#capital ae 
IF INSTR( x , 'Æ' ) 
THEN SET TextString = REPLACE(TextString, 'Æ','&AElig;') ; 
END IF ; 

#capital c, cedilla 
IF INSTR( x , 'Ç' ) 
THEN SET TextString = REPLACE(TextString, 'Ç','&Ccedil;') ; 
END IF ; 

#capital e, grave accent 
IF INSTR( x , 'È' ) 
THEN SET TextString = REPLACE(TextString, 'È','&Egrave;') ; 
END IF ; 

#capital e, acute accent 
IF INSTR( x , 'É' ) 
THEN SET TextString = REPLACE(TextString, 'É','&Eacute;') ; 
END IF ; 

#capital e, circumflex accent 
IF INSTR( x , 'Ê' ) 
THEN SET TextString = REPLACE(TextString, 'Ê','&Ecirc;') ; 
END IF ; 

#capital e, umlaut mark 
IF INSTR( x , 'Ë' ) 
THEN SET TextString = REPLACE(TextString, 'Ë','&Euml;') ; 
END IF ; 

#capital i, grave accent 
IF INSTR( x , 'Ì' ) 
THEN SET TextString = REPLACE(TextString, 'Ì','&Igrave;') ; 
END IF ; 

#capital i, acute accent 
IF INSTR( x , 'Í' ) 
THEN SET TextString = REPLACE(TextString, 'Í','&Iacute;') ; 
END IF ; 

#capital i, circumflex accent 
IF INSTR( x , 'Î' ) 
THEN SET TextString = REPLACE(TextString, 'Î','&Icirc;') ; 
END IF ; 

#capital i, umlaut mark 
IF INSTR( x , 'Ï' ) 
THEN SET TextString = REPLACE(TextString, 'Ï','&Iuml;') ; 
END IF ; 

#capital eth, Icelandic 
IF INSTR( x , 'Ð' ) 
THEN SET TextString = REPLACE(TextString, 'Ð','&ETH;') ; 
END IF ; 

#capital n, tilde 
IF INSTR( x , 'Ñ' ) 
THEN SET TextString = REPLACE(TextString, 'Ñ','&Ntilde;') ; 
END IF ; 

#capital o, grave accent 
IF INSTR( x , 'Ò' ) 
THEN SET TextString = REPLACE(TextString, 'Ò','&Ograve;') ; 
END IF ; 

#capital o, acute accent 
IF INSTR( x , 'Ó' ) 
THEN SET TextString = REPLACE(TextString, 'Ó','&Oacute;') ; 
END IF ; 

#capital o, circumflex accent 
IF INSTR( x , 'Ô' ) 
THEN SET TextString = REPLACE(TextString, 'Ô','&Ocirc;') ; 
END IF ; 

#capital o, tilde 
IF INSTR( x , 'Õ' ) 
THEN SET TextString = REPLACE(TextString, 'Õ','&Otilde;') ; 
END IF ; 

#capital o, umlaut mark 
IF INSTR( x , 'Ö' ) 
THEN SET TextString = REPLACE(TextString, 'Ö','&Ouml;') ; 
END IF ; 

#capital o, slash 
IF INSTR( x , 'Ø' ) 
THEN SET TextString = REPLACE(TextString, 'Ø','&Oslash;') ; 
END IF ; 

#capital u, grave accent 
IF INSTR( x , 'Ù' ) 
THEN SET TextString = REPLACE(TextString, 'Ù','&Ugrave;') ; 
END IF ; 

#capital u, acute accent 
IF INSTR( x , 'Ú' ) 
THEN SET TextString = REPLACE(TextString, 'Ú','&Uacute;') ; 
END IF ; 

#capital u, circumflex accent 
IF INSTR( x , 'Û' ) 
THEN SET TextString = REPLACE(TextString, 'Û','&Ucirc;') ; 
END IF ; 

#capital u, umlaut mark 
IF INSTR( x , 'Ü' ) 
THEN SET TextString = REPLACE(TextString, 'Ü','&Uuml;') ; 
END IF ; 

#capital y, acute accent 
IF INSTR( x , 'Ý' ) 
THEN SET TextString = REPLACE(TextString, 'Ý','&Yacute;') ; 
END IF ; 

#capital THORN, Icelandic 
IF INSTR( x , 'Þ' ) 
THEN SET TextString = REPLACE(TextString, 'Þ','&THORN;') ; 
END IF ; 

#small sharp s, German 
IF INSTR( x , 'ß' ) 
THEN SET TextString = REPLACE(TextString, 'ß','&szlig;') ; 
END IF ; 

#small a, grave accent 
IF INSTR( x , 'à' ) 
THEN SET TextString = REPLACE(TextString, 'à','&agrave;') ; 
END IF ; 

#small a, acute accent 
IF INSTR( x , 'á' ) 
THEN SET TextString = REPLACE(TextString, 'á','&aacute;') ; 
END IF ; 

#small a, circumflex accent 
IF INSTR( x , 'â' ) 
THEN SET TextString = REPLACE(TextString, 'â','&acirc;') ; 
END IF ; 

#small a, tilde 
IF INSTR( x , 'ã' ) 
THEN SET TextString = REPLACE(TextString, 'ã','&atilde;') ; 
END IF ; 

#small a, umlaut mark 
IF INSTR( x , 'ä' ) 
THEN SET TextString = REPLACE(TextString, 'ä','&auml;') ; 
END IF ; 

#small a, ring 
IF INSTR( x , 'å' ) 
THEN SET TextString = REPLACE(TextString, 'å','&aring;') ; 
END IF ; 

#small ae 
IF INSTR( x , 'æ' ) 
THEN SET TextString = REPLACE(TextString, 'æ','&aelig;') ; 
END IF ; 

#small c, cedilla 
IF INSTR( x , 'ç' ) 
THEN SET TextString = REPLACE(TextString, 'ç','&ccedil;') ; 
END IF ; 

#small e, grave accent 
IF INSTR( x , 'è' ) 
THEN SET TextString = REPLACE(TextString, 'è','&egrave;') ; 
END IF ; 

#small e, acute accent 
IF INSTR( x , 'é' ) 
THEN SET TextString = REPLACE(TextString, 'é','&eacute;') ; 
END IF ; 

#small e, circumflex accent 
IF INSTR( x , 'ê' ) 
THEN SET TextString = REPLACE(TextString, 'ê','&ecirc;') ; 
END IF ; 

#small e, umlaut mark 
IF INSTR( x , 'ë' ) 
THEN SET TextString = REPLACE(TextString, 'ë','&euml;') ; 
END IF ; 

#small i, grave accent 
IF INSTR( x , 'ì' ) 
THEN SET TextString = REPLACE(TextString, 'ì','&igrave;') ; 
END IF ; 

#small i, acute accent 
IF INSTR( x , 'í' ) 
THEN SET TextString = REPLACE(TextString, 'í','&iacute;') ; 
END IF ; 

#small i, circumflex accent 
IF INSTR( x , 'î' ) 
THEN SET TextString = REPLACE(TextString, 'î','&icirc;') ; 
END IF ; 

#small i, umlaut mark 
IF INSTR( x , 'ï' ) 
THEN SET TextString = REPLACE(TextString, 'ï','&iuml;') ; 
END IF ; 

#small eth, Icelandic 
IF INSTR( x , 'ð' ) 
THEN SET TextString = REPLACE(TextString, 'ð','&eth;') ; 
END IF ; 

#small n, tilde 
IF INSTR( x , 'ñ' ) 
THEN SET TextString = REPLACE(TextString, 'ñ','&ntilde;') ; 
END IF ; 

#small o, grave accent 
IF INSTR( x , 'ò' ) 
THEN SET TextString = REPLACE(TextString, 'ò','&ograve;') ; 
END IF ; 

#small o, acute accent 
IF INSTR( x , 'ó' ) 
THEN SET TextString = REPLACE(TextString, 'ó','&oacute;') ; 
END IF ; 

#small o, circumflex accent 
IF INSTR( x , 'ô' ) 
THEN SET TextString = REPLACE(TextString, 'ô','&ocirc;') ; 
END IF ; 

#small o, tilde 
IF INSTR( x , 'õ' ) 
THEN SET TextString = REPLACE(TextString, 'õ','&otilde;') ; 
END IF ; 

#small o, umlaut mark 
IF INSTR( x , 'ö' ) 
THEN SET TextString = REPLACE(TextString, 'ö','&ouml;') ; 
END IF ; 

#small o, slash 
IF INSTR( x , 'ø' ) 
THEN SET TextString = REPLACE(TextString, 'ø','&oslash;') ; 
END IF ; 

#small u, grave accent 
IF INSTR( x , 'ù' ) 
THEN SET TextString = REPLACE(TextString, 'ù','&ugrave;') ; 
END IF ; 

#small u, acute accent 
IF INSTR( x , 'ú' ) 
THEN SET TextString = REPLACE(TextString, 'ú','&uacute;') ; 
END IF ; 

#small u, circumflex accent 
IF INSTR( x , 'û' ) 
THEN SET TextString = REPLACE(TextString, 'û','&ucirc;') ; 
END IF ; 

#small u, umlaut mark 
IF INSTR( x , 'ü' ) 
THEN SET TextString = REPLACE(TextString, 'ü','&uuml;') ; 
END IF ; 

#small y, acute accent 
IF INSTR( x , 'ý' ) 
THEN SET TextString = REPLACE(TextString, 'ý','&yacute;') ; 
END IF ; 

#small thorn, Icelandic 
IF INSTR( x , 'þ' ) 
THEN SET TextString = REPLACE(TextString, 'þ','&thorn;') ; 
END IF ; 

#small y, umlaut mark 
IF INSTR( x , 'ÿ' ) 
THEN SET TextString = REPLACE(TextString, 'ÿ','&yuml;') ; 
END IF ; 

RETURN TextString ; 

END