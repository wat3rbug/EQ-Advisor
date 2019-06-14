create database everquest;
use everquest;

create table if not exists equser (
firstName varchar(14) NOT NULL,
lastName varchar(14) NOT NULL,
id int not null auto_increment,
email varchar(50) NOT NULL,
login varchar(16) NOT NULL,
primary key (id)
);

create table if not exists race (
id int not null auto_increment,
racename varchar(14) not null,
race_abbr varchar(3) not null,
primary key(id)
);

create table if not exists class (
id int not null auto_increment,
classname varchar(14) not null,
class_abbr varchar(3) not null,
primary key(id)
);

create table if not exists location (
id int not null,
locationname varchar(14) not null,
primary key(id)
);

create table if not exists item(
	id int not null,
itemname varchar(40) not null,
primary key (id),
price int,
AC int,
weight float not null,
strength int,
agility int,
stamina int,
wisdom int,
intelligence int,
dexterity int,
charisma int,
saveVsPoison int,
saveVsDisease int,
saveVsMagic int,
saveVsFire int,
saveVsCold int,
special varchar(40),
location int not null,
class int not null,
foreign key (location) references location(id),
foreign key (class) references class(id)
);

create table if not exists picture(
	id int not null,
	primary key(id),
	picname varchar(14) not null,
	picLocation varchar(255) not null
);

create table if not exists characters(
	userID int not null,
	foreign key (userID) references equser(id),
	avatarname varchar(20) not null,
	primary key(avatarname),
	raceid int not null,
	foreign key(raceid) references race(id),
	classid int not null,
	foreign key(classid) references class(id),
	pictureid int not null,
	foreign key(pictureid) references picture(id),
	level int not null,
	baseInt int not null,
	baseWis int not null,
	baseChar int not null,
	baseStr int not null,
	baseDex int not null,
	baseAgi int not null,
	baseSta int not null,
	baseSavePoison int not null,
	baseSaveDisease int not null,
	baseSaveMagic int not null,
	baseSaveFire int not null,
	baseSaveCold int not null,
	head int not null,
	foreign key (head) references item(id),
	face int not null,
	foreign key(face) references item(id),
	neck int not null,
	foreign key(neck) references item(id),
	ear1 int not null,
	ear2 int not null,
	foreign key(ear1) references item(id),
	foreign key(ear2) references item(id),
	chest int not null,
	back int not null,
	shoulders int not null,
	arms int not null,
	wrist1 int not null,
	wrist2 int not null,
	hands int not null,
	finger1 int not null,
	finger2 int not null,
	waist int not null,
	legs int not null,
	feet int not null,
	rangeslot int not null,
	ammoslot int  not null,
	foreign key(chest) references item(id),
	foreign key(back) references item(id),
	foreign key(shoulders) references item(id),
	foreign key(arms) references item(id),
	foreign key(wrist1) references item(id),
	foreign key(wrist2) references item(id),
	foreign key(hands) references item(id),
	foreign key(finger1) references item(id),
	foreign key(finger2) references item(id),
	foreign key(waist) references item(id),
	foreign key(legs) references item(id),
	foreign key(feet) references item(id),
	foreign key(rangeslot) references item(id),
	foreign key(ammoslot) references item(id)
);

create table if not exists itemclassraceslot(
	itemid int not null,
	foreign key(itemid) references item(id),
	classid int not null,
	foreign key(classid) references class(id),
	raceid int not null,
	foreign key(raceid) references race(id),
	slotid int not null,
	foreign key(slotid) references location(id),
	primary key (itemid, classid, raceid, slotid)
);

create table if not exists storyelement(
	id int not null,
	primary key(id),
	avatarname varchar(20) not null,
	foreign key (avatarname) references characters(avatarname),
	picid int,
	foreign key (picid) references picture(id),
	description varchar(1000) not null
);

insert into race (racename, race_abbr) values ('high elf', 'hie');
insert into race (racename, race_abbr) values ('wood elf', 'elf');
insert into race (racename, race_abbr) values ('dwarf', 'dwf');
insert into race (racename, race_abbr) values ('gnome', 'gnm');
insert into race (racename, race_abbr) values ('human', 'hum');
insert into race (racename, race_abbr) values ('dark elf', 'def');
insert into race (racename, race_abbr) values ('troll', 'trl');
insert into race (racename, race_abbr) values ('ogre', 'ogr');
insert into race (racename, race_abbr) values ('halfling', 'hfl');
insert into race (racename, race_abbr) values ('half elf', 'hef');
insert into race (racename, race_abbr) values ('barbarian', 'bar');
insert into race (racename, race_abbr) values ('erudite', 'eru');
insert into race (racename, race_abbr) values ('iksar', 'iks');

insert into class (classname, class_abbr) values('cleric', 'clr');
insert into class (classname, class_abbr) values('enchanter', 'enc');
insert into class (classname, class_abbr) values('magician', 'mag');
insert into class (classname, class_abbr) values('wizard', 'wiz');
insert into class (classname, class_abbr) values('paladin', 'pal');
insert into class (classname, class_abbr) values('druid', 'dru');
insert into class (classname, class_abbr) values('ranger', 'rng');
insert into class (classname, class_abbr) values('bard', 'brd');
insert into class (classname, class_abbr) values('warrior', 'war');
insert into class (classname, class_abbr) values('monk', 'mnk');
insert into class (classname, class_abbr) values('necromancer', 'nec');
insert into class (classname, class_abbr) values('shaman', 'shm');
insert into class (classname, class_abbr) values('rogue', 'rog');
insert into class (classname, class_abbr) values('shadow knight', 'shd');
	
create table if not exists classdefaults (
	id int not null auto_increment,
	 class int  not null,
	 race int not null,
	 strength int not null,
	 dexterity int not null,
	 stamina int not null,
	 agility int not null,
	 intelligence int not null,
	 wisdom int not null,
	 charisma int not null,
	 constraint pk primary key(id),
	 constraint class_fk foreign key(class) references class(id),
	 constraint race_fk foreign key(race) references race(id)
);

create table if not exists zone (
	id int not null auto_increment,
	name varchar(255) not null,
	description varchar(1000) not null,
	constraint pk primary key(id)
);

create table nextzone (
	id int not null auto_increment,
	zoneid int not null,
	nextzoneid int not null,
	constraint pk primary key(id),
	constraint zone_fk foreign key(zoneid) references zone(id),
	constraint nextzone_fk foreign key(nextzoneid) references zone(id)
);