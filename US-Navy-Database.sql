drop database if exists navalfleet;
create database navalfleet;
use navalfleet;
show tables;

drop table if exists aircraftcarrier;
create table aircraftcarrier(
carrierID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
captain varchar(30) NOT NULL DEFAULT '',
coordinate point NOT NULL,
elevation double NOT NULL DEFAULT '0.0',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
PRIMARY KEY (carrierID)
);
show tables;
describe aircraftcarrier;

insert into aircraftcarrier(name, captain, coordinate, elevation, service, active) values
('USS Nimitz', 'Philip', Point(32.9411, -127.6073), 0, 8, 'TRUE'),
('USS Dwight D. Eisenhower', 'Fred', Point(8.9864, 63.5553), 0, 23, 'TRUE'),
('USS Carl Vinson', 'Popeye', Point(41.5086, -31.9285), 0, 35, 'TRUE'),
('USS Theodore Roosevelt', 'Frank', Point(11.6379, -226.6965), 0, 42, 'TRUE'),
('USS Abraham Lincoln', 'Grant', Point(-47.0402, -331.7556), 0, 15, 'TRUE'),
('USS Independece', 'George', Point(26.2212, -817.8981), 48, 60, 'FALSE')
;

select carrierID, name, captain, astext(coordinate) as 'coordinate', elevation as 'elevation (m)', service as 'service (yrs)', active from aircraftcarrier;

drop table if exists cruiser;
create table cruiser(
cruiserID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
captain varchar(30) NOT NULL DEFAULT '',
coordinate point NOT NULL,
elevation double NOT NULL DEFAULT '0.0',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
carrierID int UNSIGNED NOT NULL,
PRIMARY KEY (cruiserID),
FOREIGN KEY (carrierID) REFERENCES aircraftcarrier (carrierID)
);
show tables;
describe cruiser;

insert into cruiser(name, captain, coordinate, elevation, service, active, carrierID) values
('USS Bunker Hill', 'Zane', Point(32.9411, -127.6073), 0, 2, 'TRUE', 1),
('USS Mobile Bay', 'Luca', Point(8.9864, 63.5553), 0, 27, 'TRUE', 2),
('USS Cape St. George', 'Caden', Point(41.5086, -31.9285), 0, 32, 'TRUE', 3),
('USS Vella Gulf', 'Rudy', Point(11.6379, -226.6965), 0, 10, 'TRUE', 4),
('USS Port Royal', 'Frank', Point(-47.0402, -331.7556), 0, 15, 'TRUE', 5)
;

select cruiserID, name, captain, astext(coordinate) as 'coordinate', elevation as 'elevation (m)', service as 'service (yrs)', active, carrierID from cruiser;

drop table if exists destroyer;
create table destroyer(
destroyerID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
captain varchar(30) NOT NULL DEFAULT '',
coordinate point NOT NULL,
elevation double NOT NULL DEFAULT '0.0',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
carrierID int UNSIGNED NOT NULL,
PRIMARY KEY (destroyerID),
FOREIGN KEY (carrierID) REFERENCES aircraftcarrier (carrierID)
);
show tables;
describe destroyer;

insert into destroyer(name, captain, coordinate, elevation, service, active, carrierID) values
('USS Arleigh Burke', 'Joshua', Point(32.9411, -127.6073), 0, 38, 'TRUE', 1),
('USS Barry', 'James', Point(8.9864, 63.5553), 0, 12, 'TRUE', 2),
('USS John Paul Jones', 'Samuel', Point(41.5086, -31.9285), 0, 23, 'TRUE', 3),
('USS Mahan', 'John', Point(11.6379, -226.6965), 0, 33, 'TRUE', 4),
('USS Decatur', 'Thomas', Point(-47.0402, -331.7556), 0, 28, 'TRUE', 5)
;

select destroyerID, name, captain, astext(coordinate) as 'coordinate', elevation as 'elevation (m)', service as 'service (yrs)', active, carrierID from destroyer;

drop table if exists submarine;
create table submarine(
submarineID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
captain varchar(30) NOT NULL DEFAULT '',
coordinate point NOT NULL,
elevation double NOT NULL DEFAULT '0.0',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
carrierID int UNSIGNED NOT NULL,
PRIMARY KEY (submarineID),
FOREIGN KEY (carrierID) REFERENCES aircraftcarrier (carrierID)
);
show tables;
describe submarine;

insert into submarine(name, captain, coordinate, elevation, service, active, carrierID) values
('USS Seawolf', 'Stephen', Point(32.9411, -127.6073), -100, 5, 'TRUE', 1),
('USS Connecticut', 'Francis', Point(8.9864, 63.5553), -50, 32, 'TRUE', 2),
('USS Jimmy Carter', 'Robert', Point(41.5086, -31.9285), -223, 15, 'TRUE', 3),
('USS Virginia', 'Charles', Point(11.6379, -226.6965), -320, 22, 'TRUE', 4),
('USS Texas', 'David', Point(-47.0402, -331.7556), -800, 10, 'TRUE', 5)
;

select submarineID, name, captain, astext(coordinate) as 'coordinate', elevation as 'elevation (m)', service as 'service (yrs)', active, carrierID from submarine;

drop table if exists frigate;
create table frigate(
frigateID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
captain varchar(30) NOT NULL DEFAULT '',
coordinate point NOT NULL,
elevation double NOT NULL DEFAULT '0.0',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
carrierID int UNSIGNED NOT NULL,
PRIMARY KEY (frigateID),
FOREIGN KEY (carrierID) REFERENCES aircraftcarrier (carrierID)
);
show tables;
describe frigate;

insert into frigate(name, captain, coordinate, elevation, service, active, carrierID) values
('USS Taylor', 'Edgar', Point(32.9411, -127.6073), 0, 22, 'TRUE', 1),
('USS Gary', 'Jon', Point(8.9864, 63.5553), 0, 7, 'TRUE', 2),
('USS Simpson', 'Daniel', Point(41.5086, -31.9285), 0, 36, 'TRUE', 3),
('USS Samuel B. Roberts', 'Brian' , Point(11.6379, -226.6965), 0, 14, 'TRUE', 4),
('USS Kauffman', 'Derick', Point(-47.0402, -331.7556), 0, 26, 'TRUE', 5)
;

select frigateID, name, captain, astext(coordinate) as 'coordinate', elevation as 'elevation (m)', service as 'service (yrs)', active, carrierID from frigate;

drop table if exists acpersonnel;
create table acpersonnel(
personnelID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
position varchar(30) NOT NULL DEFAULT '',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
PRIMARY KEY (personnelID)
);
show tables;
describe acpersonnel;

insert into acpersonnel(name, position, service, active) values
('Brice', 'Handler', 2, 'TRUE'),
('Alonso', 'Hook Runner', 1, 'TRUE'),
('Clifton', 'Pilot', 10, 'TRUE'),
('Boswell', 'Maintenance', 7, 'TRUE'),
('Garnet', 'Mechanic',30, 'FALSE'),
('Arsenio', 'Maintenance', 14, 'TRUE'),
('Bobbie', 'Pilot', 17, 'TRUE'),
('Pearl', 'Pilot', 12, 'TRUE'),
('Garsone', 'Hook Runner', 5, 'TRUE'), 
('Ozzy', 'Mechanic', 20, 'TRUE')
;

select * from acpersonnel;

drop table if exists subpersonnel;
create table subpersonnel(
personnelID int UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL DEFAULT '',
position varchar(30) NOT NULL DEFAULT '',
service double NOT NULL DEFAULT '0.0',
active varchar(5) NOT NULL DEFAULT 'FALSE',
PRIMARY KEY (personnelID)
);
show tables;
describe subpersonnel;

insert into subpersonnel(name, position, service, active) values
('Beck', 'Electricians Mate EM', 1, 'TRUE'),
('Armando', 'Cook', 10, 'TRUE'),
('Analu', 'Fireman', 5, 'TRUE'),
('Ramon', 'MACH', 12, 'FALSE'),
('Jermain', 'Radarman', 3, 'TRUE'),
('Oswal', 'Seaman', 2, 'TRUE'),
('Amaris', 'Signalman', 3, 'TRUE'),
('Mica', 'Storekeeper', 4, 'TRUE'),
('Thadeus', 'Torpedoman', 7, 'TRUE'),
('Brock', 'Yeoman', 25, 'FALSE')
;

select * from subpersonnel;

drop table if exists accrew;
create table accrew(
personnelID INT UNSIGNED NOT NULL,
carrierID INT UNSIGNED NOT NULL,
PRIMARY KEY (carrierID, personnelID),
FOREIGN KEY (carrierID) REFERENCES aircraftcarrier (carrierID),
FOREIGN KEY (personnelID) REFERENCES acpersonnel (personnelID)
);

insert into accrew values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2),
(6,3),
(7,4),
(8,4),
(9,5),
(10,5)
;

drop table if exists subcrew;
create table subcrew(
personnelID INT UNSIGNED NOT NULL,
submarineID INT UNSIGNED NOT NULL,
PRIMARY KEY (submarineID, personnelID),
FOREIGN KEY (submarineID) REFERENCES submarine (submarineID),
FOREIGN KEY (personnelID) REFERENCES subpersonnel (personnelID)
);

insert into subcrew values
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5)
;

alter table subpersonnel add column subID int;
alter table subpersonnel drop column subID;
update subpersonnel set position = 'Cook' where personnelID = 10;
select name, position from subpersonnel where position like 'c%';
select name, service from submarine where service between 8 and 18 order by service asc;
select position from subpersonnel group by position;

select aircraftcarrier.name as 'Aircraft Carrier', cruiser.name as 'Cruiser' from aircraftcarrier join cruiser on aircraftcarrier.carrierID = cruiser.cruiserID;
select aircraftcarrier.name as 'Aircraft Carrier', destroyer.name as 'Destroyer' from aircraftcarrier join destroyer on aircraftcarrier.carrierID = destroyer.destroyerID;
select aircraftcarrier.name as 'Aircraft Carrier', submarine.name as 'Submarine' from aircraftcarrier join submarine on aircraftcarrier.carrierID = submarine.submarineID;
select aircraftcarrier.name as 'Aircraft Carrier', frigate.name as 'Frigate' from aircraftcarrier join frigate on aircraftcarrier.carrierID = frigate.frigateID;

/* navy fleet */
select aircraftcarrier.name as 'Aircraft Carrier', cruiser.name as 'Cruiser', destroyer.name as 'Destroyer', frigate.name as 'Frigate',submarine.name as 'Submarine' from aircraftcarrier 
join cruiser on aircraftcarrier.carrierID = cruiser.cruiserID 
join destroyer on aircraftcarrier.carrierID = destroyer.destroyerID 
join submarine on aircraftcarrier.carrierID = submarine.submarineID
join frigate on aircraftcarrier.carrierID = frigate.frigateID;

/* list of crew of an Aircraft Carrier in the Arabian Sea */
select aircraftcarrier.name as 'Aircraft Carrrier', astext(aircraftcarrier.coordinate) as 'Coordinate', acpersonnel.name as 'Personnel', acpersonnel.position as 'Position', acpersonnel.service as 'Service' from accrew 
join aircraftcarrier on accrew.carrierID = aircraftcarrier.carrierID
join acpersonnel on accrew.personnelID = acpersonnel.personnelID where acpersonnel.active = 'TRUE' and accrew.carrierID = 2;

/* list of crew who are pilots of an Aircraft Carrier in the Arabian Sea */
select aircraftcarrier.name as 'Aircraft Carrrier', astext(aircraftcarrier.coordinate) as 'Coordinate', acpersonnel.name as 'Personnel', acpersonnel.position as 'Position', acpersonnel.service as 'Service' from accrew 
join aircraftcarrier on accrew.carrierID = aircraftcarrier.carrierID
join acpersonnel on accrew.personnelID = acpersonnel.personnelID where acpersonnel.active = 'TRUE' and accrew.carrierID = 2 and acpersonnel.position = 'Pilot';

/* list of crew of a Submarine in the Arabian Sea */
select submarine.name as 'Submarine', astext(submarine.coordinate) as 'Coordinate', subpersonnel.name as 'Personnel', subpersonnel.position as 'Position', subpersonnel.service as 'Service' from subcrew 
join submarine on subcrew.submarineID = submarine.submarineID
join subpersonnel on subcrew.personnelID = subpersonnel.personnelID where subpersonnel.active = 'TRUE' and subcrew.submarineID = 2;

/* US Fighter Jet in Kuwait */
select aircraftcarrier.name as 'Aircraft Carrier', X(coordinate) as 'lat', Y(coordinate) as 'lng', ( (ACOS(SIN(X(Point(29.3117, 47.4818)) * PI() / 180) * SIN(X(aircraftcarrier.coordinate) * PI() / 180) + 
	COS(X(Point(29.3117, 47.4818)) * PI() / 180) * COS(X(aircraftcarrier.coordinate) * PI() / 180) * 
	COS( ( Y(Point(29.3117, 47.4818)) - Y(aircraftcarrier.coordinate)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515
	) * 1.609344 as distance, ((( (ACOS(SIN(X(Point(29.3117, 47.4818)) * PI() / 180) * SIN(X(aircraftcarrier.coordinate) * PI() / 180) + 
	COS(X(Point(29.3117, 47.4818)) * PI() / 180) * COS(X(aircraftcarrier.coordinate) * PI() / 180) * 
	COS( ( Y(Point(29.3117, 47.4818)) - Y(aircraftcarrier.coordinate)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515
	) * 1.609344)/574.12) as time 
	from aircraftcarrier order by distance ASC;

/* Enemy Submarine in Sea of Okhotsk */
select submarine.name as 'Submarine', X(coordinate) as 'lat', Y(coordinate) as 'lng', submarine.elevation, ( (ACOS(SIN(X(Point(56.17, 146.48)) * PI() / 180) * SIN(X(submarine.coordinate) * PI() / 180) + 
	COS(X(Point(56.17, 146.48)) * PI() / 180) * COS(X(submarine.coordinate) * PI() / 180) * 
	COS( ( Y(Point(56.17, 146.48)) - Y(submarine.coordinate)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515
	) * 1.609344 as distance
	from submarine order by distance ASC;

/* Naval base in Corpus Christi */
select aircraftcarrier.name as 'Aircraft Carrier', X(coordinate) as 'lat', Y(coordinate) as 'lng', ( (ACOS(SIN(X(Point(27.705878, -817.258757)) * PI() / 180) * SIN(X(aircraftcarrier.coordinate) * PI() / 180) + 
	COS(X(Point(27.705878, -817.258757)) * PI() / 180) * COS(X(aircraftcarrier.coordinate) * PI() / 180) * 
	COS( ( Y(Point(27.705878, -817.258757)) - Y(aircraftcarrier.coordinate)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) 
	* 1.609344 as distance, ((( (ACOS(SIN(X(Point(27.705878, -817.258757)) * PI() / 180) * SIN(X(aircraftcarrier.coordinate) * PI() / 180) + 
	COS(X(Point(27.705878, -817.258757)) * PI() / 180) * COS(X(aircraftcarrier.coordinate) * PI() / 180) * 
	COS( ( Y(Point(27.705878, -817.258757)) - Y(aircraftcarrier.coordinate)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515
	) * 1.609344)/574.12) as time 
	from aircraftcarrier where active = 'TRUE' having distance < 8000 order by distance ASC;

/* Enemy Submarine near Alaska */
select name, elevation, ( (ACOS(SIN(X(Point(68.337080,-172.355796)) * PI() / 180) * SIN(X(submarine.coordinate) * PI() / 180) + 
	COS(X(Point(68.337080,-172.355796)) * PI() / 180) * COS(X(submarine.coordinate) * PI() / 180) * 
	COS( ( Y(Point(68.337080,-172.355796)) - Y(submarine.coordinate)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515
	) * 1.609344 as distance
	from submarine group by name, elevation, distance with rollup;

DELIMITER //
CREATE FUNCTION calcdistance (origin Point, destination Point) returns Decimal(20,2)
BEGIN
	select ( (ACOS(SIN(X(origin) * PI() / 180) * SIN(X(destination) * PI() / 180) + 
	COS(X(origin) * PI() / 180) * COS(X(destination) * PI() / 180) * 
	COS( (Y(origin) - Y(destination)) * PI() / 180)) * 180 / PI()) * 60 * 1.1515
	) * 1.609344 INTO @distance;
	
	return @distance;
END//
DELIMITER;
