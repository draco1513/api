CREATE DATABASE maxillaris use */ 


CREATE TABLE region ( idRegion SERIAL PRIMARY KEY, Region TEXT NOT NULL );
CREATE TABLE provincia ( idProvincia SERIAL PRIMARY KEY, Provincia TEXT NOT NULL, idRegion INTEGER NOT NULL, FOREIGN KEY ( idRegion ) REFERENCES region ( idRegion ) );
CREATE TABLE distrito ( idDistrito SERIAL PRIMARY KEY, Distrito TEXT NOT NULL, idProvincia INTEGER NOT NULL, FOREIGN KEY ( idProvincia ) REFERENCES provincia ( idProvincia ) );
CREATE TABLE persona (
	idpersona SERIAL PRIMARY KEY,
	nombres TEXT NOT NULL,
	apepaterno TEXT NOT NULL,
	apematerno TEXT NOT NULL,
	documento TEXT NOT NULL,
	fechanacimiento DATE NOT NULL,
	email TEXT NOT NULL,
	direccion TEXT NOT NULL,
	idregion INTEGER NOT NULL,
	idprovincia INTEGER NOT NULL,
	iddistrito INTEGER NOT NULL,
	FOREIGN KEY ( idregion ) REFERENCES region ( idRegion ),
	FOREIGN KEY ( idprovincia ) REFERENCES provincia ( idProvincia ),
	FOREIGN KEY ( iddistrito ) REFERENCES distrito ( idDistrito ) 
);
CREATE TABLE telefono ( idtelefono SERIAL PRIMARY KEY, idpersona INTEGER NOT NULL, teléfono TEXT NOT NULL, FOREIGN KEY ( idpersona ) REFERENCES persona ( idpersona ) );
CREATE TABLE cliente ( idcliente SERIAL PRIMARY KEY, idpersona INTEGER NOT NULL, FOREIGN KEY ( idpersona ) REFERENCES persona ( idpersona ) );
CREATE TABLE paciente ( idpaciente SERIAL PRIMARY KEY, idpersona INTEGER NOT NULL, FOREIGN KEY ( idpersona ) REFERENCES persona ( idpersona ) );
-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."region";
CREATE TABLE "public"."region" ( "idregion" INT4 NOT NULL DEFAULT nextval( 'region_idregion_seq' :: REGCLASS ), "region" TEXT COLLATE "pg_catalog"."default" NOT NULL );
-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO "public"."region"
VALUES
	( 1, 'Lima' );
-- ----------------------------
-- Primary Key structure for table region
-- ----------------------------
ALTER TABLE "public"."region" ADD CONSTRAINT "region_pkey" PRIMARY KEY ( "idregion" );


*/ -- ----------------------------
-- Table structure for provincia
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."provincia";
CREATE TABLE "public"."provincia" ( "idprovincia" INT4 NOT NULL DEFAULT nextval( 'provincia_idprovincia_seq' :: REGCLASS ), "provincia" TEXT COLLATE "pg_catalog"."default" NOT NULL, "idregion" INT4 NOT NULL );
-- ----------------------------
-- Records of provincia
-- ----------------------------
INSERT INTO "public"."provincia"
VALUES
	( 1, 'lima', 1 );
-- ----------------------------
-- Primary Key structure for table provincia
-- ----------------------------
ALTER TABLE "public"."provincia" ADD CONSTRAINT "provincia_pkey" PRIMARY KEY ( "idprovincia" );
-- ----------------------------
-- Foreign Keys structure for table provincia
-- ----------------------------
ALTER TABLE "public"."provincia" ADD CONSTRAINT "provincia_idregion_fkey" FOREIGN KEY ( "idregion" ) REFERENCES "public"."region" ( "idregion" ) ON DELETE NO ACTION ON UPDATE NO ACTION;

*/ -- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."persona";
CREATE TABLE "public"."persona" (
	"idpersona" INT4 NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 ),
	"nombres" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"apepaterno" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"apematerno" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"documento" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"fechanacimiento" DATE NOT NULL,
	"email" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"direccion" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"idregion" INT4 NOT NULL DEFAULT 1,
	"idprovincia" INT4 NOT NULL DEFAULT 1,
	"iddistrito" INT4 NOT NULL DEFAULT 17 
);


*/ -- ----------------------------
-- Table structure for distrito
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."distrito";
CREATE TABLE "public"."distrito" (
	"iddistrito" INT4 NOT NULL DEFAULT nextval( 'distrito_iddistrito_seq' :: REGCLASS ),
	"distrito" TEXT COLLATE "pg_catalog"."default" NOT NULL,
	"idprovincia" INT4 NOT NULL DEFAULT 1 
);
-- ----------------------------
-- Records of distrito
-- ----------------------------
INSERT INTO "public"."distrito"
VALUES
	( 1, 'Ancón', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 2, 'Ate Vitarte', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 3, 'Barranco', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 4, 'Breña', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 5, 'Carabayllo', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 6, 'Chaclacayo', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 7, 'Chorrillos', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 8, 'Cieneguilla', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 9, 'Comas', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 10, 'El Agustino', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 11, 'Independencia', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 12, 'Jesús María', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 13, 'La Molina', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 14, 'La Victoria ', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 15, 'Lima', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 16, 'Lince ', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 17, 'Los Olivos', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 18, 'Lurigancho', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 19, 'Lurín', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 20, 'Magdalena del Mar', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 21, 'Miraflores', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 22, 'Pachacamac', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 23, 'Pucusana', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 24, 'Pueblo Libre ', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 25, 'Puente Piedra', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 26, 'Punta Hermosa', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 27, 'Punta Negra', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 28, 'Rimac', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 29, 'San Bartolo ', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 30, 'San Borja', 1 );
INSERT INTO "public"."distrito"
VALUES
	( 31, 'San Isidro', 1 );
-- ----------------------------
-- Primary Key structure for table distrito
-- ----------------------------
ALTER TABLE "public"."distrito" ADD CONSTRAINT "distrito_pkey" PRIMARY KEY ( "iddistrito" );
-- ----------------------------
-- Foreign Keys structure for table distrito
-- ----------------------------
ALTER TABLE "public"."distrito" ADD CONSTRAINT "distrito_idprovincia_fkey" FOREIGN KEY ( "idprovincia" ) REFERENCES "public"."provincia" ( "idprovincia" ) ON DELETE NO ACTION ON UPDATE NO ACTION;


*/ -- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 4, 'daniel ', 'sanchez', 'ortiz', '4365887', '2015-07-16', 'q', 'w', 1, 1, 1 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 5, 'charly', 'nose', 'queponer', '3243234', '2004-07-01', 'qw', 'qw', 1, 1, 1 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 6, 'Giavani', 'Lumsden', 'Kitchingman', '820982965', '1993-06-13', 'gkitchingman0@ft.com', '60 Arapahoe Park', 1, 1, 15 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 7, 'Dru', 'Reese', 'Whittaker', '202441023', '2021-03-31', 'dwhittaker1@reverbnation.com', '20473 Crescent Oaks Court', 1, 1, 18 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 8, 'Ann', 'Syred', 'Mavin', '959425594', '2000-06-13', 'amavin2@accuweather.com', '8 Harper Way', 1, 1, 28 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 9, 'Kimbell', 'Vivash', 'Neiland', '505717687', '2004-06-30', 'kneiland3@ca.gov', '828 Jenna Way', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 10, 'Vick', 'Kohnen', 'Gorghetto', '86605357', '2012-07-02', 'vgorghetto4@mozilla.com', '87 Westridge Junction', 1, 1, 21 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 11, 'Linc', 'Wilsone', 'Ziehm', '173355356', '2020-09-13', 'lziehm5@123-reg.co.uk', '188 Oakridge Point', 1, 1, 2 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 12, 'Eleanora', 'Aubry', 'Collens', '679455920', '1988-10-16', 'ecollens6@zdnet.com', '64 Elmside Street', 1, 1, 4 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 13, 'Cherilyn', 'Burkinshaw', 'Thicking', '589856430', '2014-04-12', 'cthicking7@wisc.edu', '2596 Doe Crossing Place', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 14, 'Penelope', 'Klimuk', 'Wickman', '355045764', '1987-04-01', 'pwickman8@com.com', '9 Porter Circle', 1, 1, 12 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 15, 'Jemie', 'Turk', 'Allday', '473582019', '1972-04-03', 'jallday9@bluehost.com', '41 Jay Court', 1, 1, 17 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 16, 'Nanete', 'Pieter', 'Sagg', '720832121', '1984-06-05', 'nsagga@vk.com', '53050 Summerview Terrace', 1, 1, 5 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 17, 'Janette', 'Revan', 'Sommersett', '903923782', '1972-02-01', 'jsommersettb@unblog.fr', '02249 Oxford Hill', 1, 1, 26 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 18, 'Purcell', 'Beake', 'Fedorchenko', '101940425', '1972-05-23', 'pfedorchenkoc@soup.io', '3 Stang Road', 1, 1, 18 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 19, 'Gwenneth', 'Denson', 'Scarman', '766470258', '2021-03-05', 'gscarmand@reference.com', '697 Buell Point', 1, 1, 9 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 20, 'Frieda', 'Bakster', 'Greenig', '57382312', '2003-03-30', 'fgreenige@google.de', '08 Sugar Place', 1, 1, 29 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 21, 'Sammie', 'Cowdery', 'Innot', '202174265', '1989-05-24', 'sinnotf@google.cn', '8 Jana Crossing', 1, 1, 31 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 22, 'Druci', 'Fassbindler', 'Hayselden', '94101385', '2001-09-27', 'dhayseldeng@rakuten.co.jp', '746 Scofield Plaza', 1, 1, 16 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 23, 'Orrin', 'Vooght', 'Ponder', '702547506', '1974-10-24', 'oponderh@domainmarket.com', '820 Mitchell Court', 1, 1, 28 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 24, 'Brnaba', 'Trenbey', 'Parslow', '846318780', '2000-11-21', 'bparslowi@vimeo.com', '36 Jay Alley', 1, 1, 24 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 25, 'Danice', 'Oxlee', 'Azam', '140362849', '2002-09-29', 'dazamj@google.fr', '71 Dapin Lane', 1, 1, 19 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 26, 'Solomon', 'Spincke', 'Deare', '228480876', '2012-06-25', 'sdearek@indiegogo.com', '17 Elgar Avenue', 1, 1, 24 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 27, 'Nesta', 'Spurier', 'Attwoul', '55440291', '1992-05-23', 'nattwoull@angelfire.com', '783 4th Court', 1, 1, 12 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 28, 'Boone', 'Baumford', 'Witty', '202545648', '2014-10-09', 'bwittym@ifeng.com', '09029 Kennedy Court', 1, 1, 29 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 29, 'Roarke', 'Shropshire', 'Iannini', '826112551', '2006-01-15', 'rianninin@networksolutions.com', '6 Russell Way', 1, 1, 24 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 30, 'Prue', 'Le Grove', 'MacMychem', '115993907', '2019-05-30', 'pmacmychemo@skyrock.com', '4680 Mayfield Trail', 1, 1, 19 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 31, 'Osborn', 'Pickhaver', 'McVey', '613639498', '1992-09-01', 'omcveyp@nymag.com', '65 Blue Bill Park Hill', 1, 1, 27 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 32, 'Trip', 'Leese', 'Fraine', '372726037', '1992-08-31', 'tfraineq@yahoo.co.jp', '826 Bashford Parkway', 1, 1, 29 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 33, 'Rodrick', 'Sandry', 'Works', '198739261', '1984-07-25', 'rworksr@mapquest.com', '7052 Marcy Street', 1, 1, 4 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 34, 'Umberto', 'Packington', 'Bonifazio', '104608579', '1988-04-07', 'ubonifazios@nba.com', '382 Debs Trail', 1, 1, 13 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 35, 'Wernher', 'Mobius', 'Lyndon', '974986679', '2014-03-19', 'wlyndont@europa.eu', '198 Burning Wood Circle', 1, 1, 14 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 36, 'Agosto', 'Davidovicz', 'Baumber', '46029905', '1987-03-31', 'abaumberu@ted.com', '3 Hooker Alley', 1, 1, 22 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 37, 'Maximilian', 'Toffano', 'Glanister', '74657992', '2017-02-11', 'mglanisterv@behance.net', '7 Independence Crossing', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 38, 'Rowen', 'O''Dowd', 'Thunnercliffe', '890246105', '1979-06-29', 'rthunnercliffew@twitter.com', '37 Goodland Road', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 39, 'Candida', 'Symones', 'Aulton', '254734465', '1976-06-17', 'caultonx@earthlink.net', '78 Buhler Pass', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 40, 'Phaedra', 'Wynrahame', 'Bollon', '18096734', '1973-09-23', 'pbollony@github.io', '4614 Pearson Trail', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 41, 'Annadiane', 'Togwell', 'Brasseur', '939870234', '2003-06-19', 'abrasseurz@npr.org', '80 Almo Road', 1, 1, 15 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 42, 'Mercedes', 'Ligoe', 'Benardette', '135481674', '1978-03-07', 'mbenardette10@sakura.ne.jp', '17 Old Gate Point', 1, 1, 28 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 43, 'Sibylla', 'Phillip', 'Scading', '472807745', '1985-07-11', 'sscading11@ning.com', '64404 Arapahoe Park', 1, 1, 19 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 44, 'Alfy', 'Maginot', 'Caukill', '924499568', '2014-09-20', 'acaukill12@telegraph.co.uk', '2 Algoma Alley', 1, 1, 16 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 45, 'Erwin', 'Bullivant', 'Cosford', '455755013', '1990-09-19', 'ecosford13@oracle.com', '3 Pankratz Plaza', 1, 1, 27 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 46, 'Marthe', 'McCreadie', 'Bitten', '798824028', '1980-08-03', 'mbitten14@boston.com', '91634 Johnson Drive', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 47, 'Pinchas', 'Leborgne', 'Larter', '953657125', '1998-12-12', 'plarter15@thetimes.co.uk', '9 Moose Plaza', 1, 1, 21 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 48, 'Kerianne', 'Lemerie', 'Lillow', '343062990', '1991-09-16', 'klillow16@vk.com', '49 Birchwood Street', 1, 1, 13 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 49, 'Romeo', 'Pala', 'Redwing', '153639458', '2018-08-02', 'rredwing17@shop-pro.jp', '6 Algoma Terrace', 1, 1, 13 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 50, 'Marijn', 'Snuggs', 'L''Hommeau', '708908323', '1989-12-15', 'mlhommeau18@github.com', '8 Badeau Way', 1, 1, 17 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 51, 'Milt', 'Parken', 'Bainbrigge', '523392886', '1993-09-17', 'mbainbrigge19@si.edu', '8544 Macpherson Park', 1, 1, 17 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 52, 'Maude', 'Jaycocks', 'Westraw', '822682468', '1993-08-13', 'mwestraw1a@yahoo.co.jp', '57515 Donald Junction', 1, 1, 20 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 53, 'Kacy', 'Krysiak', 'Tidmarsh', '243650561', '1977-08-12', 'ktidmarsh1b@alibaba.com', '9 Clove Alley', 1, 1, 27 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 54, 'Adan', 'Louys', 'Andriuzzi', '81166708', '2012-07-05', 'aandriuzzi1c@posterous.com', '1 Kingsford Drive', 1, 1, 3 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 55, 'Jabez', 'Sikorsky', 'Lilley', '557205389', '2015-06-27', 'jlilley1d@unblog.fr', '7 Ridge Oak Terrace', 1, 1, 18 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 56, 'Heall', 'Kyte', 'Vardie', '511818710', '2006-10-26', 'hvardie1e@seesaa.net', '14795 Clove Place', 1, 1, 3 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 57, 'Farlay', 'Hakes', 'Andrin', '176805688', '1974-10-30', 'fandrin1f@yelp.com', '239 Butterfield Terrace', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 58, 'Rebbecca', 'Torrans', 'Tuckie', '32831838', '2021-02-11', 'rtuckie1g@photobucket.com', '616 Schmedeman Court', 1, 1, 13 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 59, 'Avril', 'Spicer', 'Dionis', '615869721', '1988-12-17', 'adionis1h@prweb.com', '662 Carey Drive', 1, 1, 9 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 60, 'Woodrow', 'Flexman', 'Yeomans', '502185863', '2007-01-23', 'wyeomans1i@cnbc.com', '96893 Ronald Regan Circle', 1, 1, 19 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 61, 'Jo-ann', 'Chaplin', 'Barbour', '390935953', '1972-01-05', 'jbarbour1j@java.com', '295 Park Meadow Junction', 1, 1, 5 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 62, 'Phil', 'Giddy', 'O''Hare', '849713794', '1990-02-19', 'pohare1k@lulu.com', '26325 5th Drive', 1, 1, 16 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 63, 'Ebenezer', 'Vanacci', 'Keemar', '105900202', '2004-02-23', 'ekeemar1l@about.com', '421 Loftsgordon Road', 1, 1, 10 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 64, 'Bailey', 'Eagland', 'Shearer', '911729507', '1983-11-11', 'bshearer1m@dion.ne.jp', '96 Pine View Circle', 1, 1, 9 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 65, 'Caresse', 'Sheehy', 'Romer', '372826301', '1983-09-13', 'cromer1n@cnbc.com', '84063 Cordelia Parkway', 1, 1, 15 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 66, 'Tine', 'Topes', 'Britton', '692754658', '2013-09-17', 'tbritton1o@hostgator.com', '902 Waxwing Junction', 1, 1, 18 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 67, 'Hill', 'Bedburrow', 'Placstone', '969011019', '1999-11-07', 'hplacstone1p@ftc.gov', '1244 Walton Way', 1, 1, 31 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 68, 'Ralph', 'Maskew', 'Junkin', '759070605', '1976-12-26', 'rjunkin1q@shutterfly.com', '4 Welch Point', 1, 1, 1 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 69, 'Candide', 'Eusden', 'Conerding', '537477280', '2018-01-24', 'cconerding1r@miibeian.gov.cn', '2 Lukken Parkway', 1, 1, 30 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 70, 'Trace', 'Sponton', 'Elphinstone', '624571560', '1982-03-09', 'telphinstone1s@weather.com', '0 Dawn Lane', 1, 1, 26 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 71, 'Barnabe', 'Bisson', 'Morison', '33107135', '2006-04-11', 'bmorison1t@blogs.com', '681 Melvin Crossing', 1, 1, 14 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 72, 'Valene', 'Capenor', 'Pitrelli', '852092644', '1984-02-06', 'vpitrelli1u@cdc.gov', '2 Bashford Point', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 73, 'Ardelis', 'Whight', 'Mitchel', '772102099', '1994-07-15', 'amitchel1v@pbs.org', '823 Red Cloud Plaza', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 74, 'Marcello', 'Itzkowicz', 'Oggers', '65557200', '2011-02-04', 'moggers1w@dion.ne.jp', '40 Jana Terrace', 1, 1, 4 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 75, 'Bridget', 'Rothert', 'Eck', '660984917', '1992-10-02', 'beck1x@123-reg.co.uk', '133 Thackeray Center', 1, 1, 20 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 76, 'Barclay', 'McConigal', 'Finnan', '134526000', '1994-08-16', 'bfinnan1y@goo.ne.jp', '375 Pennsylvania Park', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 77, 'Muffin', 'Darragon', 'Renwick', '330094931', '2002-06-18', 'mrenwick1z@princeton.edu', '9 Hauk Street', 1, 1, 29 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 78, 'Etan', 'Crisp', 'McCheyne', '503551608', '2002-05-04', 'emccheyne20@columbia.edu', '8913 Aberg Pass', 1, 1, 8 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 79, 'Benedick', 'Mitchelmore', 'Goldstein', '201159491', '1980-07-26', 'bgoldstein21@jiathis.com', '68884 Oak Lane', 1, 1, 9 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 80, 'Kenyon', 'Cossar', 'Gosling', '546122217', '1979-12-16', 'kgosling22@creativecommons.org', '64665 Clemons Circle', 1, 1, 19 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 81, 'Rickie', 'Smethurst', 'Blewis', '192100126', '1973-07-13', 'rblewis23@soup.io', '34 Bayside Way', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 82, 'Franzen', 'Bushell', 'Donnison', '82743597', '2017-09-15', 'fdonnison24@elegantthemes.com', '74372 Clarendon Place', 1, 1, 18 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 83, 'Neila', 'Gout', 'Tolland', '241020044', '2011-12-15', 'ntolland25@sogou.com', '0372 American Ash Junction', 1, 1, 22 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 84, 'Verla', 'Simo', 'Acklands', '795367693', '1970-05-23', 'vacklands26@drupal.org', '27 Union Way', 1, 1, 22 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 85, 'Johnny', 'Kayne', 'Coom', '594700754', '1977-06-08', 'jcoom27@princeton.edu', '2 Laurel Street', 1, 1, 25 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 86, 'Marjy', 'Bonwick', 'Ventura', '580402617', '2014-02-08', 'mventura28@europa.eu', '43 Dryden Plaza', 1, 1, 20 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 87, 'Alaine', 'Files', 'Serotsky', '170182387', '1985-02-02', 'aserotsky29@bloglines.com', '5531 Ridgeview Crossing', 1, 1, 7 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 88, 'Gregg', 'Arnatt', 'Bartke', '688424854', '1975-03-30', 'gbartke2a@oaic.gov.au', '93 Mariners Cove Place', 1, 1, 7 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 89, 'Dolf', 'Yerlett', 'Blum', '907886416', '1984-12-29', 'dblum2b@epa.gov', '4473 Fairview Lane', 1, 1, 28 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 90, 'Obidiah', 'Shuttlewood', 'Sidebotham', '848182272', '1976-07-15', 'osidebotham2c@elegantthemes.com', '3 High Crossing Terrace', 1, 1, 21 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 91, 'Julian', 'Flanders', 'Simenel', '187483950', '2016-11-03', 'jsimenel2d@merriam-webster.com', '557 Helena Place', 1, 1, 6 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 92, 'Theresa', 'Tremmil', 'Bus', '185160060', '1973-07-24', 'tbus2e@apple.com', '59 Ridgeview Alley', 1, 1, 12 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 93, 'Timmy', 'Sweeney', 'Deeth', '236527736', '2016-03-29', 'tdeeth2f@earthlink.net', '00 Roth Lane', 1, 1, 28 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 94, 'Glennie', 'Dabernott', 'Gather', '843550552', '2009-04-03', 'ggather2g@blinklist.com', '1200 Eliot Park', 1, 1, 11 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 95, 'Tremayne', 'Brachell', 'Alesi', '164396129', '2002-12-10', 'talesi2h@statcounter.com', '2 Springview Place', 1, 1, 18 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 96, 'Enid', 'Windaybank', 'Edler', '536417243', '1988-10-02', 'eedler2i@apple.com', '964 Cody Drive', 1, 1, 17 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 97, 'Marcellus', 'Stoak', 'Philippet', '546873311', '1997-06-21', 'mphilippet2j@bravesites.com', '0925 Hauk Place', 1, 1, 27 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 98, 'Rosemarie', 'Bousfield', 'Figgins', '546528108', '2007-12-16', 'rfiggins2k@cargocollective.com', '7566 Dwight Drive', 1, 1, 27 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 99, 'Cello', 'Garnson', 'Medford', '283009544', '1995-02-04', 'cmedford2l@spiegel.de', '6069 Dawn Court', 1, 1, 20 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 103, 'Christabel', 'Soppett', 'Bortolini', '587385065', '1978-04-22', 'cbortolini2p@usda.gov', '3 Lerdahl Road', 1, 1, 27 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 104, 'Babara', 'Pendrigh', 'Coggill', '901146685', '1992-06-19', 'bcoggill2q@europa.eu', '23605 Ridgeview Hill', 1, 1, 15 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 105, 'Ariella', 'Hevner', 'Laneham', '317219420', '1992-12-17', 'alaneham2r@jimdo.com', '78622 Spohn Junction', 1, 1, 23 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 106, 'Jemie', 'Turk', 'Allday', '473582019', '1972-04-03', 'jallday9@bluehost.com', '41 Jay Court', 1, 1, 17 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 107, 'Jemie', 'Turk', 'Allday', '473582019', '1972-04-03', 'jallday9@bluehost.com', '41 Jay Court', 1, 1, 17 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 112, 'David ', 'mendoza', 'palomino', '8763222', '1994-03-14', 'draoc_@hotmail.com', 'san martin ', 1, 1, 1 );
INSERT INTO "public"."persona" OVERRIDING SYSTEM 
VALUE
VALUES
	( 2, 'David ', 'mendoza', 'palomino', '8763222', '1994-03-14', 'draco_120_psiscis@hotmail.com', 'san martin ', 1, 1, 1 );
-- ----------------------------
-- Auto increment value for persona
-- ----------------------------
SELECT
	setval( '"public"."persona_idpersona_seq1"', 112, TRUE );
-- ----------------------------
-- Primary Key structure for table persona
-- ----------------------------
ALTER TABLE "public"."persona" ADD CONSTRAINT "persona_pkey" PRIMARY KEY ( "idpersona" );
-- ----------------------------
-- Foreign Keys structure for table persona
-- ----------------------------
ALTER TABLE "public"."persona" ADD CONSTRAINT "persona_iddistrito_fkey" FOREIGN KEY ( "iddistrito" ) REFERENCES "public"."distrito" ( "iddistrito" ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."persona" ADD CONSTRAINT "persona_idprovincia_fkey" FOREIGN KEY ( "idprovincia" ) REFERENCES "public"."provincia" ( "idprovincia" ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."persona" ADD CONSTRAINT "persona_idregion_fkey" FOREIGN KEY ( "idregion" ) REFERENCES "public"."region" ( "idregion" ) ON DELETE NO ACTION ON UPDATE NO ACTION;



*/ -- ----------------------------
-- Table structure for telefono
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."telefono";
CREATE TABLE "public"."telefono" ( "idtelefono" INT4 NOT NULL DEFAULT nextval( 'telefono_idtelefono_seq' :: REGCLASS ), "idpersona" INT4 NOT NULL, "teléfono" TEXT COLLATE "pg_catalog"."default" NOT NULL );
-- ----------------------------
-- Records of telefono
-- ----------------------------
-- ----------------------------
-- Primary Key structure for table telefono
-- ----------------------------
ALTER TABLE "public"."telefono" ADD CONSTRAINT "telefono_pkey" PRIMARY KEY ( "idtelefono" );
-- ----------------------------
-- Foreign Keys structure for table telefono
-- ----------------------------
ALTER TABLE "public"."telefono" ADD CONSTRAINT "telefono_idpersona_fkey" FOREIGN KEY ( "idpersona" ) REFERENCES "public"."persona" ( "idpersona" ) ON DELETE NO ACTION ON UPDATE NO ACTION;




*/ -- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."cliente";
CREATE TABLE "public"."cliente" ( "idcliente" INT4 NOT NULL DEFAULT nextval( 'cliente_idcliente_seq' :: REGCLASS ), "idpersona" INT4 NOT NULL );
-- ----------------------------
-- Records of cliente
-- ----------------------------
-- ----------------------------
-- Primary Key structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "cliente_pkey" PRIMARY KEY ( "idcliente" );
-- ----------------------------
-- Foreign Keys structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "cliente_idpersona_fkey" FOREIGN KEY ( "idpersona" ) REFERENCES "public"."persona" ( "idpersona" ) ON DELETE NO ACTION ON UPDATE NO ACTION;





*/ -- ----------------------------
-- Table structure for paciente
-- ----------------------------
DROP TABLE
IF
	EXISTS "public"."paciente";
CREATE TABLE "public"."paciente" ( "idpaciente" INT4 NOT NULL DEFAULT nextval( 'paciente_idpaciente_seq' :: REGCLASS ), "idpersona" INT4 NOT NULL );
-- ----------------------------
-- Records of paciente
-- ----------------------------
-- ----------------------------
-- Primary Key structure for table paciente
-- ----------------------------
ALTER TABLE "public"."paciente" ADD CONSTRAINT "paciente_pkey" PRIMARY KEY ( "idpaciente" );
-- ----------------------------
-- Foreign Keys structure for table paciente
-- ----------------------------
ALTER TABLE "public"."paciente" ADD CONSTRAINT "paciente_idpersona_fkey" FOREIGN KEY ( "idpersona" ) REFERENCES "public"."persona" ( "idpersona" ) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE 
	OR REPLACE FUNCTION get_birthdates_before_2020 ( ) RETURNS TABLE ( fechanacimiento DATE ) AS $$ BEGIN
		RETURN QUERY SELECT
		fechanacimiento 
	FROM
		persona 
	WHERE
		EXTRACT ( YEAR FROM fechanacimiento ) < 2020;
	
END;
$$ LANGUAGE plpgsql;
SELECT
	* 
FROM
	get_birthdates_before_2020 ( );
CREATE OR REPLACE FUNCTION before_insert_persona()
RETURNS TRIGGER AS $$
BEGIN
    -- Add custom logic here
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_persona_trigger
BEFORE INSERT ON persona
FOR EACH ROW
EXECUTE FUNCTION before_insert_persona();

CREATE OR REPLACE FUNCTION before_delete_persona()
RETURNS TRIGGER AS $$
BEGIN
    -- Add custom logic here
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_delete_persona_trigger
BEFORE DELETE ON persona
FOR EACH ROW
EXECUTE FUNCTION before_delete_persona();