CREATE TABLE IF NOT EXISTS `USERS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(60) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `ROLE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN` (`LOGIN`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=MYISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `USER` (`USERID`, `NAME`, `SURNAME`, `EMAIL`, `USER_NAME`, `PASSWORD`, `ROLE`) VALUES
(1, 'Oleksandr', 'Gergardt', 'gerhardt2007@gmail.com', 'gerh', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'ROLE_USER')

select userid, 
max((CASE WHEN weekday=1 and hourbegin=8 and available=1 THEN  hourbegin END)) Su_8, 
max((CASE WHEN weekday=1 and hourbegin=11 and available=1 THEN  hourbegin END)) Su_11, 
max((CASE WHEN weekday=1 and hourbegin=14 and available=1 THEN  hourbegin END)) Su_14, 
max((CASE WHEN weekday=1 and hourbegin=17 and available=1 THEN  hourbegin END)) Su_17,
max((CASE WHEN weekday=2 and hourbegin=8 and available=1 THEN  hourbegin END)) Mo_8, 
max((CASE WHEN weekday=2 and hourbegin=11 and available=1 THEN  hourbegin END)) Mo_11, 
max((CASE WHEN weekday=2 and hourbegin=14 and available=1 THEN  hourbegin END)) Mo_14, 
max((CASE WHEN weekday=2 and hourbegin=17 and available=1 THEN  hourbegin END)) Mo_17,
max((CASE WHEN weekday=3 and hourbegin=8 and available=1 THEN  hourbegin END)) Tu_8, 
max((CASE WHEN weekday=3 and hourbegin=11 and available=1 THEN  hourbegin END)) Tu_11, 
max((CASE WHEN weekday=3 and hourbegin=14 and available=1 THEN  hourbegin END)) Tu_14, 
max((CASE WHEN weekday=3 and hourbegin=17 and available=1 THEN  hourbegin END)) Tu_17,
max((CASE WHEN weekday=4 and hourbegin=8 and available=1 THEN  hourbegin END)) We_8, 
max((CASE WHEN weekday=4 and hourbegin=11 and available=1 THEN  hourbegin END)) We_11, 
max((CASE WHEN weekday=4 and hourbegin=14 and available=1 THEN  hourbegin END)) We_14, 
max((CASE WHEN weekday=4 and hourbegin=17 and available=1 THEN  hourbegin END)) We_17,
max((CASE WHEN weekday=5 and hourbegin=8 and available=1 THEN  hourbegin END)) Th_8, 
max((CASE WHEN weekday=5 and hourbegin=11 and available=1 THEN  hourbegin END)) Th_11, 
max((CASE WHEN weekday=5 and hourbegin=14 and available=1 THEN  hourbegin END)) Th_14, 
max((CASE WHEN weekday=5 and hourbegin=17 and available=1 THEN  hourbegin END)) Th_17,
max((CASE WHEN weekday=6 and hourbegin=8 and available=1 THEN  hourbegin END)) Fr_8, 
max((CASE WHEN weekday=6 and hourbegin=11 and available=1 THEN  hourbegin END)) Fr_11, 
max((CASE WHEN weekday=6 and hourbegin=14 and available=1 THEN  hourbegin END)) Fr_14, 
max((CASE WHEN weekday=6 and hourbegin=17 and available=1 THEN  hourbegin END)) Fr_17,
max((CASE WHEN weekday=7 and hourbegin=8 and available=1 THEN  hourbegin END)) Sa_8, 
max((CASE WHEN weekday=7 and hourbegin=11 and available=1 THEN  hourbegin END)) Sa_11, 
max((CASE WHEN weekday=7 and hourbegin=14 and available=1 THEN  hourbegin END)) Sa_14, 
max((CASE WHEN weekday=7 and hourbegin=17 and available=1 THEN  hourbegin END)) Sa_17    
from useravailable 
group by userid


DELIMITER //  
  
CREATE PROCEDURE `availability` ()  
LANGUAGE SQL  
DETERMINISTIC  
SQL SECURITY DEFINER  
COMMENT 'A procedure availability'  
BEGIN  
 select userid, 
max((CASE WHEN weekday=1 and hourbegin=8 and available=1 THEN  hourbegin END)) Su_8, 
max((CASE WHEN weekday=1 and hourbegin=11 and available=1 THEN  hourbegin END)) Su_11, 
max((CASE WHEN weekday=1 and hourbegin=14 and available=1 THEN  hourbegin END)) Su_14, 
max((CASE WHEN weekday=1 and hourbegin=17 and available=1 THEN  hourbegin END)) Su_17,
max((CASE WHEN weekday=2 and hourbegin=8 and available=1 THEN  hourbegin END)) Mo_8, 
max((CASE WHEN weekday=2 and hourbegin=11 and available=1 THEN  hourbegin END)) Mo_11, 
max((CASE WHEN weekday=2 and hourbegin=14 and available=1 THEN  hourbegin END)) Mo_14, 
max((CASE WHEN weekday=2 and hourbegin=17 and available=1 THEN  hourbegin END)) Mo_17,
max((CASE WHEN weekday=3 and hourbegin=8 and available=1 THEN  hourbegin END)) Tu_8, 
max((CASE WHEN weekday=3 and hourbegin=11 and available=1 THEN  hourbegin END)) Tu_11, 
max((CASE WHEN weekday=3 and hourbegin=14 and available=1 THEN  hourbegin END)) Tu_14, 
max((CASE WHEN weekday=3 and hourbegin=17 and available=1 THEN  hourbegin END)) Tu_17,
max((CASE WHEN weekday=4 and hourbegin=8 and available=1 THEN  hourbegin END)) We_8, 
max((CASE WHEN weekday=4 and hourbegin=11 and available=1 THEN  hourbegin END)) We_11, 
max((CASE WHEN weekday=4 and hourbegin=14 and available=1 THEN  hourbegin END)) We_14, 
max((CASE WHEN weekday=4 and hourbegin=17 and available=1 THEN  hourbegin END)) We_17,
max((CASE WHEN weekday=5 and hourbegin=8 and available=1 THEN  hourbegin END)) Th_8, 
max((CASE WHEN weekday=5 and hourbegin=11 and available=1 THEN  hourbegin END)) Th_11, 
max((CASE WHEN weekday=5 and hourbegin=14 and available=1 THEN  hourbegin END)) Th_14, 
max((CASE WHEN weekday=5 and hourbegin=17 and available=1 THEN  hourbegin END)) Th_17,
max((CASE WHEN weekday=6 and hourbegin=8 and available=1 THEN  hourbegin END)) Fr_8, 
max((CASE WHEN weekday=6 and hourbegin=11 and available=1 THEN  hourbegin END)) Fr_11, 
max((CASE WHEN weekday=6 and hourbegin=14 and available=1 THEN  hourbegin END)) Fr_14, 
max((CASE WHEN weekday=6 and hourbegin=17 and available=1 THEN  hourbegin END)) Fr_17,
max((CASE WHEN weekday=7 and hourbegin=8 and available=1 THEN  hourbegin END)) Sa_8, 
max((CASE WHEN weekday=7 and hourbegin=11 and available=1 THEN  hourbegin END)) Sa_11, 
max((CASE WHEN weekday=7 and hourbegin=14 and available=1 THEN  hourbegin END)) Sa_14, 
max((CASE WHEN weekday=7 and hourbegin=17 and available=1 THEN  hourbegin END)) Sa_17    
from useravailable 
group by userid; 
END//  