create database catffe;
use catffe;

CREATE TABLE cliente (
		identificacion_cliente BIGINT PRIMARY KEY NOT NULL,
        nombre_cliente VARCHAR(30) NOT NULL,
        apellido_cliente VARCHAR(30) NOT NULL,
        email_cliente VARCHAR(80) NOT NULL UNIQUE,
        telefono_cliente VARCHAR(12) NOT NULL,
        fecha_nacimiento_cliente DATE
);

CREATE TABLE rol (
        id_rol INT PRIMARY KEY AUTO_INCREMENT,
        nombre_rol VARCHAR(30) NOT NULL
);

INSERT INTO rol (id_rol, nombre_rol)
VALUES 
(1, 'Administrador'),
(2, 'Trabajador');


CREATE TABLE usuario (
		identificacion_usuario BIGINT PRIMARY KEY NOT NULL,
        nombre_rol INT NOT NULL,
        nombre_usuario VARCHAR(30) NOT NULL,
        apellido_usuario VARCHAR(30) NOT NULL,
        contrasena VARCHAR(100) NOT NULL,
        FOREIGN KEY (nombre_rol) REFERENCES rol(id_rol)
);

INSERT INTO usuario (identificacion_usuario, nombre_rol, nombre_usuario, apellido_usuario, contrasena)
VALUES 
(123456, 1, 'Juan', 'Perez', 'mi_contraseña_segura1'), 
(789123, 2, 'Maria', 'Gonzalez', 'mi_contraseña_segura2');


CREATE TABLE mascota (
		id_mascota INT AUTO_INCREMENT,
		nombre_mascota VARCHAR(30) NOT NULL,
		color_mascota VARCHAR(30) NOT NULL,
		fecha_nacimiento_mascota DATE,
		id_cliente BIGINT NOT NULL,
		PRIMARY KEY (id_mascota),
		FOREIGN KEY (id_cliente) REFERENCES cliente(identificacion_cliente)
);

CREATE TABLE productos (
    		id_producto INT PRIMARY KEY,
    		nombre_producto VARCHAR(50) NOT NULL,
    		precio_producto INT(6) NOT NULL,
			descripcion_producto VARCHAR(100) NOT NULL,
    		tipo ENUM ("cafe", "bebida", "libro", "topping") NOT NULL,
    		disponibilidad INT NULL,
    		tipo_leche ENUM ("leche descremada", "leche entera", "leche deslactosada") NULL,
    		denominacion_origen VARCHAR(50) NULL,
			peso INT NULL,
    		genero VARCHAR(20) NULL,
    		autor VARCHAR(30) NULL
);

CREATE TABLE combo (
		id_combo INT,
		nombre_combo VARCHAR(40) NOT NULL,
		descripcion_combo VARCHAR(100) NOT NULL,
		precio_combo INT(6) NOT NULL,
		PRIMARY KEY (id_combo)
);

CREATE TABLE combinacion (
		id_combinacion INT AUTO_INCREMENT,
		id_combo INT NOT NULL,
		id_producto INT NOT NULL,
		PRIMARY KEY (id_combinacion),
		FOREIGN KEY (id_combo) REFERENCES combo(id_combo),
		FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE venta (
		id_venta INT AUTO_INCREMENT PRIMARY KEY,
		fecha_hora DATETIME,
		id_cliente BIGINT NOT NULL,
		id_usuario BIGINT NOT NULL,
        total BIGINT,
		FOREIGN KEY (id_cliente) REFERENCES cliente(identificacion_cliente),
		FOREIGN KEY (id_usuario) REFERENCES usuario(identificacion_usuario)
);


CREATE TABLE detalle_de_venta (
		id_deta_venta INT AUTO_INCREMENT PRIMARY KEY,
		cantidad INT NOT NULL,
		id_producto INT NULL,
		id_combo INT NULL,
		id_venta INT NOT NULL,
    precio_unitario INT(6) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_combo) REFERENCES combo(id_combo),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta)
);

insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3536984968181695', 'Ferdinand', 'Eastwell', 'feastwell0@topsy.com', '206-533-4789', '1997-02-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4936997361452893680', 'Andrei', 'Woolner', 'awoolner1@deliciousdays.com', '880-778-4141', '2001-09-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('675970024238076785', 'Olivia', 'Bonde', 'obonde2@go.com', '558-323-3364', '2000-04-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('58933141311382867', 'Duane', 'Vacher', 'dvacher3@umich.edu', '316-879-9318', '2000-02-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3564637988888773', 'Cicely', 'Maes', 'cmaes4@amazon.co.uk', '294-979-7610', '2001-09-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3586014121273517', 'Locke', 'Clampe', 'lclampe5@tumblr.com', '960-437-0394', '2002-05-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3574021641687070', 'Clea', 'Quodling', 'cquodling6@printfriendly.com', '761-376-7410', '2002-04-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3570563786956020', 'Wallace', 'Sayburn', 'wsayburn7@home.pl', '365-760-1378', '2003-01-17');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374283028348621', 'Iormina', 'Danilchenko', 'idanilchenko8@pinterest.com', '949-246-1264', '2004-08-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3576246833278861', 'Joanie', 'Lee', 'jlee9@ovh.net', '649-843-5241', '2004-12-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5254377093589392', 'Brina', 'Muschette', 'bmuschettea@google.fr', '507-798-8400', '2004-09-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3588341970145589', 'Jodie', 'Greiswood', 'jgreiswoodb@cnbc.com', '947-424-9291', '1997-02-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3572326567702791', 'Boote', 'Weeke', 'bweekec@virginia.edu', '987-134-4855', '1996-08-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('56105391339395492', 'Pepe', 'Doogue', 'pdoogued@mozilla.org', '408-775-3866', '1996-08-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3554990269533093', 'Cordy', 'Hoogendorp', 'choogendorpe@go.com', '906-719-5723', '1995-04-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3554947020009177', 'Denys', 'Kinnaird', 'dkinnairdf@cisco.com', '147-829-7191', '1994-10-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374288858662298', 'Sydel', 'Beevor', 'sbeevorg@pen.io', '503-936-9352', '1990-06-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3581758245581966', 'Ives', 'Prozescky', 'iprozesckyh@hc360.com', '243-227-6044', '2001-12-03');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3565923503157541', 'Hillary', 'Dudman', 'hdudmani@wikimedia.org', '127-124-8670', '2003-05-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6706346043345058', 'Angy', 'Wontner', 'awontnerj@usatoday.com', '246-547-8067', '1999-06-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602213727048100', 'Gauthier', 'Brimblecombe', 'gbrimblecombek@xinhuanet.com', '428-926-9473', '1993-07-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602228435004708', 'Robina', 'Mariolle', 'rmariollel@abc.net.au', '470-421-1133', '1996-12-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6706260495033729156', 'Melody', 'McKeowon', 'mmckeowonm@yandex.ru', '996-602-0602', '1992-08-02');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5010126035443241', 'Georgianna', 'Waltering', 'gwalteringn@bluehost.com', '331-497-8880', '1996-06-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3586732015214434', 'Tuck', 'Cottee', 'tcotteeo@geocities.jp', '446-390-2519', '2023-07-25 01:09:35');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3544589956564123', 'Aeriell', 'Symons', 'asymonsp@instagram.com', '273-438-1862', '2002-04-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30566006362382', 'Eula', 'Rehme', 'erehmeq@nps.gov', '674-853-5959', '2001-07-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('58931983098575664', 'Alwin', 'Ruscoe', 'aruscoer@youtu.be', '868-934-9090', '2001-06-04');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4175007446311561', 'Elene', 'Pascow', 'epascows@npr.org', '463-121-7832', '2000-02-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3548316902795551', 'Emmye', 'Lecordier', 'elecordiert@seesaa.net', '969-385-7096', '2001-10-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3529976842116235', 'Stanton', 'Highnam', 'shighnamu@hubpages.com', '174-219-8766', '2002-11-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3562305550767054', 'Wilburt', 'Wheelwright', 'wwheelwrightv@unesco.org', '275-491-3077', '2000-10-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4026041198975266', 'Krishnah', 'Hedden', 'kheddenw@usgs.gov', '403-718-0761', '2000-10-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5226832373044570', 'Augustus', 'Gahan', 'agahanx@hc360.com', '474-333-2096', '2000-06-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5018476675512017', 'Jere', 'Tinmouth', 'jtinmouthy@cornell.edu', '501-617-4713', '2003-01-03');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('560222091342584814', 'Yovonnda', 'Oganesian', 'yoganesianz@hostgator.com', '688-213-1637', '2002-05-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602255103140639', 'Freida', 'Bradnocke', 'fbradnocke10@ibm.com', '118-122-5127', '1999-12-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3553819199442763', 'Ahmad', 'Prigmore', 'aprigmore11@yelp.com', '279-264-2624', '1995-06-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3552342300254283', 'Eldin', 'Ogborne', 'eogborne12@flavors.me', '706-421-8817', '1993-07-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602218487273295803', 'Anny', 'Dreini', 'adreini13@deviantart.com', '591-843-0641', '1996-08-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3537130875089352', 'Rainer', 'Muckle', 'rmuckle14@hc360.com', '844-315-2825', '1994-01-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('56022486176438577', 'Klara', 'Egdal', 'kegdal15@aol.com', '337-406-9894', '1992-04-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3546435803928582', 'Wash', 'Gueny', 'wgueny16@posterous.com', '347-626-6758', '1995-12-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30557935816168', 'Antons', 'Whymark', 'awhymark17@sun.com', '376-296-3759', '1998-02-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5537771951985669', 'Marquita', 'Penchen', 'mpenchen18@oaic.gov.au', '459-760-0698', '1998-10-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3530096608538220', 'Sandy', 'Coiley', 'scoiley19@go.com', '320-691-8022', '1992-04-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4175003240732334', 'Maureen', 'Geipel', 'mgeipel1a@cargocollective.com', '912-600-7000', '1991-12-11');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30394282116541', 'Shel', 'Longhorn', 'slonghorn1b@economist.com', '101-241-2162', '1998-05-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5100137008004580', 'Ardith', 'Khomich', 'akhomich1c@archive.org', '898-499-4690', '1993-03-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3531545429680453', 'Towny', 'Playfair', 'tplayfair1d@multiply.com', '450-569-4376', '2002-01-04');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3566801485928023', 'Jorrie', 'Baythrop', 'jbaythrop1e@mapy.cz', '801-700-2786', '2002-10-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3586986021216508', 'Yehudit', 'Bethune', 'ybethune1f@washington.edu', '627-148-3829', '2003-10-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('58937060803236561', 'Pet', 'Domniney', 'pdomniney1g@vistaprint.com', '224-429-1154', '2002-05-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6388525803156004', 'Jacintha', 'Feechum', 'jfeechum1h@unesco.org', '124-934-1219', '1997-05-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5641825709579159', 'Tann', 'Trowill', 'ttrowill1i@devhub.com', '345-227-8658', '1995-02-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4917693132638244', 'Isidoro', 'Stroud', 'istroud1j@deliciousdays.com', '512-512-3142', '1997-09-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('67628006376077382', 'Natty', 'Clardge', 'nclardge1k@tamu.edu', '821-189-8757', '1999-01-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3571111143313813', 'Briny', 'Clethro', 'bclethro1l@multiply.com', '609-578-1301', '1999-10-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3543072799208142', 'Laina', 'Greville', 'lgreville1m@slashdot.org', '744-733-4929', '1988-11-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3543016477054245', 'Dirk', 'Brolan', 'dbrolan1n@unc.edu', '938-431-2109', '1995-09-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3573131611044052', 'Chrissie', 'Baniard', 'cbaniard1o@surveymonkey.com', '568-827-8781', '1996-12-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3552697339393786', 'Moria', 'Gatrill', 'mgatrill1p@cocolog-nifty.com', '663-880-6329', '1997-10-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5007661756948502', 'Vinny', 'Mugglestone', 'vmugglestone1q@soup.io', '889-518-7467', '2004-06-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5048377405761540', 'Karoline', 'Bollis', 'kbollis1r@nbcnews.com', '435-274-9364', '2001-03-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6767706680338362662', 'Martha', 'Gonnet', 'mgonnet1s@i2i.jp', '939-616-4013', '2004-03-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4844781231065597', 'Dina', 'Criple', 'dcriple1t@imgur.com', '247-459-7035', '2001-03-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('493633233159721769', 'Vance', 'Horry', 'vhorry1u@patch.com', '966-850-4538', '2002-02-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('378884766489315', 'Millie', 'Morrell', 'mmorrell1v@icq.com', '796-814-7771', '1996-11-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3576700570908312', 'Tressa', 'Wrightam', 'twrightam1w@tripod.com', '790-895-7382', '1997-03-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5010121886135491', 'Evyn', 'Juniper', 'ejuniper1x@tinypic.com', '180-297-2951', '1988-02-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3574820269940137', 'Noelyn', 'Grimmolby', 'ngrimmolby1y@t.co', '571-750-8305', '1998-05-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3545914059039634', 'Isacco', 'Nudde', 'inudde1z@army.mil', '950-981-8857', '1993-10-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5108758898391217', 'Angelique', 'Kubyszek', 'akubyszek20@zimbio.com', '786-755-5314', '2004-12-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3553446002647840', 'Flin', 'Prin', 'fprin21@wikispaces.com', '377-719-0286', '2002-01-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3533208541501366', 'Dewie', 'Eyton', 'deyton22@un.org', '215-325-9933', '1997-09-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3535781057075684', 'Kristen', 'Spellissy', 'kspellissy23@adobe.com', '628-593-7283', '1992-07-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5048375156072836', 'Lyndsie', 'Johnys', 'ljohnys24@nyu.edu', '241-421-9304', '1995-07-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4936832008153824', 'Sigfrid', 'Rowet', 'srowet25@t-online.de', '383-586-7048', '2001-06-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3528093430408379', 'Vyky', 'Bellocht', 'vbellocht26@skype.com', '751-582-5364', '2001-04-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5554134877373304', 'Bibbye', 'Lewknor', 'blewknor27@java.com', '411-526-4910', '2002-11-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('346677384935050', 'Aviva', 'Richings', 'arichings28@cornell.edu', '726-942-5624', '1993-11-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201546858959355', 'Jared', 'Moynham', 'jmoynham29@dot.gov', '147-512-1036', '1992-08-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6304135992638439303', 'Waylen', 'Joris', 'wjoris2a@comsenz.com', '128-257-2146', '1992-06-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5100131478121354', 'Alvis', 'Clynmans', 'aclynmans2b@unc.edu', '273-878-6100', '1998-01-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3572914413443452', 'Oona', 'Averay', 'oaveray2c@vinaora.com', '952-485-5328', '1999-03-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6304857409711271806', 'Concettina', 'Van den Velden', 'cvandenvelden2d@chicagotribune.com', '659-862-6463', '1996-08-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3585808527673514', 'Dannie', 'Packman', 'dpackman2e@fema.gov', '137-189-4760', '2003-09-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6389411058043511', 'Karel', 'McGorman', 'kmcgorman2f@uiuc.edu', '459-108-6661', '2002-07-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3540163393790305', 'Zorana', 'Wackley', 'zwackley2g@economist.com', '760-350-8181', '2003-01-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5038065944261056838', 'Shandie', 'Vyvyan', 'svyvyan2h@va.gov', '948-913-2072', '1996-04-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('560224434456895329', 'Sherye', 'Dore', 'sdore2i@istockphoto.com', '782-708-3887', '1995-08-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6394891797074591', 'Pooh', 'Horburgh', 'phorburgh2j@smugmug.com', '285-561-4533', '1995-11-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3554694768042289', 'Pearle', 'Sighart', 'psighart2k@blinklist.com', '537-718-4763', '2002-12-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3557487402983803', 'Emanuele', 'Cowell', 'ecowell2l@addtoany.com', '305-245-9869', '2000-03-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3544791397285512', 'Archibald', 'Whitwham', 'awhitwham2m@tinypic.com', '597-344-9217', '1999-01-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6761938979399448', 'Ardis', 'Fessions', 'afessions2n@hibu.com', '386-747-8972', '1998-08-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3542095818182957', 'Florida', 'Ovitts', 'fovitts2o@sina.com.cn', '644-311-3852', '1997-11-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3530517893111852', 'Diahann', 'Fitchell', 'dfitchell2p@opensource.org', '723-267-3733', '1994-08-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201907929745225', 'Matty', 'Yallowley', 'myallowley2q@cbc.ca', '105-399-5123', '1989-06-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6334115155713761', 'Trstram', 'Grouse', 'tgrouse2r@yellowbook.com', '716-305-0840', '2001-03-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5100140452254362', 'Rowan', 'McCallister', 'rmccallister2s@lycos.com', '844-330-3409', '2000-07-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3582633047752892', 'Inge', 'McGahern', 'imcgahern2t@eventbrite.com', '777-837-5106', '1994-05-15');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201856962564516', 'Monah', 'Umbert', 'mumbert2u@ftc.gov', '818-201-9871', '2002-09-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('670678921666158496', 'Josi', 'McWard', 'jmcward2v@usatoday.com', '620-843-1430', '2003-05-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('630489795960352317', 'Kalli', 'Gosson', 'kgosson2w@ibm.com', '379-399-9949', '2004-09-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3580602476015685', 'Henri', 'Gleadhall', 'hgleadhall2x@domainmarket.com', '827-180-8327', '2004-12-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('337941800716432', 'Camella', 'Gauvain', 'cgauvain2y@google.nl', '131-714-2201', '1994-07-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5100130367211250', 'Daniella', 'Pitcock', 'dpitcock2z@is.gd', '889-848-0040', '2000-04-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3574834454611643', 'Pavel', 'Kidds', 'pkidds30@nhs.uk', '333-878-5846', '2001-10-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4911670182514067', 'Ole', 'Ranklin', 'oranklin31@acquirethisname.com', '277-673-9368', '2003-05-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3544985917701442', 'Courtney', 'Koppke', 'ckoppke32@indiegogo.com', '387-501-1973', '2002-11-17');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3546148398866253', 'Armando', 'Hume', 'ahume33@springer.com', '945-264-5122', '1990-04-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('376920740326470', 'Emmett', 'Riggey', 'eriggey34@jalbum.net', '300-827-1248', '1996-12-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5048378063619046', 'Clem', 'Josowitz', 'cjosowitz35@shop-pro.jp', '593-249-4454', '1996-08-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3557195342643441', 'Karia', 'Hughes', 'khughes36@msn.com', '970-184-3356', '1994-02-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6759468734680948456', 'Fonsie', 'Champness', 'fchampness37@mozilla.org', '318-421-7135', '1998-03-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602246321891301', 'Silas', 'Dehmel', 'sdehmel38@usatoday.com', '538-750-8170', '2000-03-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5610044523944188', 'Ursola', 'Cottel', 'ucottel39@jigsy.com', '250-789-2090', '2003-08-15');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3581011690828775', 'Kassie', 'Lunge', 'klunge3a@issuu.com', '319-907-5915', '2001-10-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3550533051734091', 'Bob', 'D''Ambrosi', 'bdambrosi3b@cbc.ca', '925-892-1774', '2002-04-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201962631837893', 'Brook', 'Clerc', 'bclerc3c@telegraph.co.uk', '528-894-5598', '2004-10-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3530679338630290', 'Kally', 'Phillippo', 'kphillippo3d@cbc.ca', '709-202-9944', '2002-01-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3583801174968537', 'Jemimah', 'Coombs', 'jcoombs3e@symantec.com', '839-241-6262', '1987-07-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374288914711378', 'Robinet', 'Jacobssen', 'rjacobssen3f@timesonline.co.uk', '576-464-0053', '1993-11-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5020589328288408641', 'Jerrome', 'Widdowfield', 'jwiddowfield3g@umn.edu', '807-147-4522', '1998-07-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3539807521581548', 'Roley', 'Grievson', 'rgrievson3h@ox.ac.uk', '175-797-2563', '1992-04-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602234715901236462', 'Clotilda', 'McVey', 'cmcvey3i@engadget.com', '536-462-2638', '1995-08-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3571081360998606', 'Claudius', 'Killner', 'ckillner3j@usatoday.com', '330-315-7378', '2002-09-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5010126187173877', 'Harp', 'Smalman', 'hsmalman3k@issuu.com', '559-767-1467', '2003-10-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3575129723580318', 'Kathy', 'Daunay', 'kdaunay3l@europa.eu', '655-586-5152', '1993-12-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30085711023619', 'Erv', 'Hefford', 'ehefford3m@va.gov', '817-141-7604', '1995-07-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201471800000309', 'Selle', 'Clapison', 'sclapison3n@businesswire.com', '499-232-9362', '1990-10-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4639023877229', 'Ulric', 'Slimm', 'uslimm3o@icq.com', '344-718-0813', '1996-11-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201853187945026', 'Sal', 'Tows', 'stows3p@go.com', '953-546-6415', '2001-02-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5108753245842467', 'Ami', 'Munkley', 'amunkley3q@webs.com', '945-539-2828', '2002-07-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4508112931333001', 'Randi', 'McElmurray', 'rmcelmurray3r@phpbb.com', '653-162-7217', '2000-09-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('493691557537017303', 'Laurena', 'Bilfoot', 'lbilfoot3s@skype.com', '649-428-6856', '2004-11-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602223846653639935', 'Kipper', 'Rintoul', 'krintoul3t@archive.org', '198-726-6531', '1988-10-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3580682386207838', 'Lenka', 'Huccaby', 'lhuccaby3u@last.fm', '718-340-9423', '1984-12-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602226348906567176', 'Iolanthe', 'Wallbutton', 'iwallbutton3v@list-manage.com', '759-581-5516', '1985-01-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3559245141504175', 'Claudelle', 'Winborn', 'cwinborn3w@ibm.com', '399-518-5628', '1996-09-17');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6771565260767803981', 'Joletta', 'Giorgietto', 'jgiorgietto3x@angelfire.com', '575-298-1212', '1998-06-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6761998954902420804', 'Iolanthe', 'Weerdenburg', 'iweerdenburg3y@arizona.edu', '572-157-2077', '1992-02-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3556038854217603', 'Hashim', 'Parsall', 'hparsall3z@domainmarket.com', '120-400-1942', '2000-08-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201487321622801', 'Melvyn', 'Kliemchen', 'mkliemchen40@walmart.com', '651-762-6205', '2001-08-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3537472133854775', 'Camilla', 'Loache', 'cloache41@engadget.com', '668-965-2265', '2000-02-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602248099616779', 'Karyn', 'Strowlger', 'kstrowlger42@abc.net.au', '183-477-3455', '2004-12-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5167450856985150', 'Jamie', 'Graith', 'jgraith43@t-online.de', '432-505-9594', '2002-03-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6706187845829893', 'Emelina', 'Hogsden', 'ehogsden44@gravatar.com', '685-846-0323', '2004-06-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3561111432268217', 'Freedman', 'Swetmore', 'fswetmore45@cmu.edu', '584-697-8078', '1993-01-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3575971116366254', 'Idell', 'Jolly', 'ijolly46@bluehost.com', '281-201-2173', '1995-07-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3568741115274927', 'Kirstyn', 'Tyndall', 'ktyndall47@edublogs.org', '409-700-2015', '2004-03-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6387918564842675', 'Chev', 'Hewes', 'chewes48@about.me', '553-113-7451', '1991-04-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('564182178707420526', 'Xena', 'Scutter', 'xscutter49@sohu.com', '490-624-2348', '1999-03-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5010124599866741', 'Marcia', 'Longmire', 'mlongmire4a@guardian.co.uk', '752-915-6287', '1996-05-11');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5229409244637879', 'Cullin', 'Treweke', 'ctreweke4b@blog.com', '952-132-1074', '2000-09-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201603853907705', 'Aindrea', 'Harpham', 'aharpham4c@forbes.com', '438-793-6700', '2001-01-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3544743377903846', 'Steven', 'Carnilian', 'scarnilian4d@discovery.com', '400-155-9682', '1994-10-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('340925802616364', 'Deana', 'Whitehair', 'dwhitehair4e@mayoclinic.com', '140-657-0588', '1996-11-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5610982105008221', 'Pepito', 'Pittle', 'ppittle4f@comcast.net', '484-722-0457', '1995-09-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('675957694296701248', 'Piotr', 'Ginger', 'pginger4g@godaddy.com', '777-610-3291', '2002-08-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3550032232121070', 'Stormie', 'Champken', 'schampken4h@4shared.com', '627-106-6579', '2004-11-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3562662490828838', 'Cassandry', 'Siddens', 'csiddens4i@rediff.com', '264-321-1599', '1982-12-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('560223423490563473', 'Dorri', 'McDougall', 'dmcdougall4j@nsw.gov.au', '565-386-6775', '1989-01-03');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3552480744146499', 'Leila', 'Gladtbach', 'lgladtbach4k@ycombinator.com', '226-215-3479', '1987-08-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374283647523729', 'Cornall', 'Britland', 'cbritland4l@pagesperso-orange.fr', '831-286-7404', '2002-10-11');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3557111626942599', 'Dawn', 'Covil', 'dcovil4m@bravesites.com', '316-597-7118', '1980-03-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3573844133801359', 'Osmund', 'Brittoner', 'obrittoner4n@independent.co.uk', '863-517-4316', '1960-07-02');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6396320956454624', 'Natalie', 'Titt', 'ntitt4o@hhs.gov', '131-189-0900', '1968-05-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4911448006260948', 'Violette', 'Haldene', 'vhaldene4p@dell.com', '908-824-1152', '1966-11-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201844614749115', 'Velma', 'Andrusyak', 'vandrusyak4q@mashable.com', '213-564-2727', '1964-12-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('630481441421262120', 'Cornie', 'Caught', 'ccaught4r@friendfeed.com', '945-146-6899', '1979-04-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3543483529004224', 'Kilian', 'Dudman', 'kdudman4s@google.ca', '871-738-3591', '1990-11-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3581934141320813', 'Ellene', 'Airy', 'eairy4t@house.gov', '719-572-7666', '1993-08-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602248079578744736', 'Madlen', 'Martensen', 'mmartensen4u@cbc.ca', '758-128-7554', '2004-11-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6304231097023726', 'Drucie', 'Blades', 'dblades4v@soup.io', '611-253-7571', '2003-08-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('337941940022923', 'Doralia', 'Babbidge', 'dbabbidge4w@statcounter.com', '175-686-6625', '2001-12-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3555403160951033', 'Saba', 'Dollman', 'sdollman4x@tinypic.com', '826-282-3349', '2002-07-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4017957539620', 'Kathe', 'Melmore', 'kmelmore4y@printfriendly.com', '217-522-2827', '1992-04-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3574101645834207', 'Lock', 'Dowbekin', 'ldowbekin4z@cyberchimps.com', '536-497-3539', '1999-01-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374288682178834', 'Rustie', 'Radin', 'rradin50@mtv.com', '256-690-9169', '1999-03-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3562493726435135', 'Suzy', 'Honack', 'shonack51@ihg.com', '180-480-7895', '1995-03-02');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4508930943073343', 'Shayne', 'Clacey', 'sclacey52@apache.org', '531-169-6036', '1977-09-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3563316859407770', 'Rowena', 'Giottini', 'rgiottini53@cmu.edu', '822-116-5450', '1975-02-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6762603842984730', 'Russell', 'Nicklen', 'rnicklen54@ucsd.edu', '141-354-9251', '2000-12-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4026789663962181', 'Issie', 'Alkin', 'ialkin55@hao123.com', '515-810-3163', '2003-08-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3549296140519345', 'Alayne', 'O''Haire', 'aohaire56@altervista.org', '872-802-3013', '2004-04-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('50184783242190746', 'Marisa', 'Lindwall', 'mlindwall57@opensource.org', '706-505-4988', '2002-11-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3556048426497088', 'Stefania', 'Bodimeade', 'sbodimeade58@uol.com.br', '957-810-5467', '2000-01-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6395805620761231', 'Annabel', 'Blofeld', 'ablofeld59@paginegialle.it', '445-348-7338', '1996-01-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('36794517325706', 'Yale', 'Kiraly', 'ykiraly5a@sbwire.com', '615-955-5462', '2000-02-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3583098936826455', 'Lyn', 'Helks', 'lhelks5b@webmd.com', '579-240-1996', '2002-11-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5254172532109161', 'Layney', 'Harroll', 'lharroll5c@aboutads.info', '193-825-5631', '1992-09-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3541094714385575', 'Audrey', 'Phant', 'aphant5d@constantcontact.com', '726-268-4296', '2004-11-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('0604333289479458', 'Pet', 'Boshard', 'pboshard5e@amazonaws.com', '618-709-1991', '2002-06-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3563980375615875', 'Kile', 'Caplin', 'kcaplin5f@sitemeter.com', '113-456-3578', '1996-02-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5002355800300779', 'Lucretia', 'Bartzen', 'lbartzen5g@comcast.net', '106-687-4420', '1983-11-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4017951223866', 'Christina', 'Jenkin', 'cjenkin5h@opensource.org', '771-269-3013', '1979-02-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3555366595889385', 'Gearard', 'Clendinning', 'gclendinning5i@networksolutions.com', '905-228-6280', '1971-05-22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3572803205224941', 'Drucy', 'Bessell', 'dbessell5j@lycos.com', '901-987-3048', '1977-10-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30230470836369', 'Demetria', 'Scotsbrook', 'dscotsbrook5k@cnbc.com', '752-791-4735', '1997-01-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('50203024159930940', 'Bondy', 'Jackling', 'bjackling5l@webmd.com', '303-109-0720', '2001-07-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3584413873342003', 'Base', 'Matteo', 'bmatteo5m@theglobeandmail.com', '599-159-2282', '2000-12-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3545877195171852', 'Leigh', 'Ailmer', 'lailmer5n@home.pl', '978-944-8210', '1990-10-04');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3552886795236205', 'Parker', 'Hallard', 'phallard5o@xrea.com', '555-136-0734', '1998-03-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3566979766969617', 'Quinn', 'Triswell', 'qtriswell5p@google.pl', '938-972-6424', '1995-12-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3555777043992227', 'Dionis', 'Peckitt', 'dpeckitt5q@dyndns.org', '602-838-3010', '1997-03-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6762917821179348', 'Hyacinth', 'McPeck', 'hmcpeck5r@eventbrite.com', '922-835-0124', '2004-04-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('344833645497404', 'Molly', 'Mugg', 'mmugg5s@slashdot.org', '695-135-0567', '2001-05-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5553104644917171', 'Dorrie', 'Maureen', 'dmaureen5t@chicagotribune.com', '975-537-1289', '2003-12-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3571272321556308', 'Anallise', 'Partleton', 'apartleton5u@ebay.com', '812-333-2037', '1999-10-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3588512762741112', 'Fairlie', 'Vashchenko', 'fvashchenko5v@elegantthemes.com', '455-697-1350', '1986-03-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30166850940183', 'Van', 'Lightbourne', 'vlightbourne5w@csmonitor.com', '649-393-2937', '1983-02-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602219868560092', 'Jackie', 'See', 'jsee5x@1und1.de', '457-882-4584', '1995-10-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5038400646901443706', 'Nina', 'Silversmidt', 'nsilversmidt5y@163.com', '448-572-2610', '1995-06-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6331107422967232', 'Bili', 'Partleton', 'bpartleton5z@sphinn.com', '989-882-0940', '2002-04-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30380380275651', 'Guglielma', 'Philot', 'gphilot60@imgur.com', '246-896-4121', '2000-02-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4905583026268113', 'Art', 'Vida', 'avida61@wikipedia.org', '721-781-2006', '1994-10-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3547986284343112', 'Rice', 'Frean', 'rfrean62@berkeley.edu', '531-669-7904', '1995-06-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3530857860604541', 'Lanita', 'Bhatia', 'lbhatia63@webeden.co.uk', '935-338-2004', '1996-03-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3556469807635478', 'Lina', 'Revell', 'lrevell64@nba.com', '205-373-0043', '2004-05-31 08:34:22');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('560223766521062539', 'Matilde', 'Igonet', 'migonet65@businesswire.com', '210-989-5664', '2001-04-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3575859765668866', 'Charlene', 'Gambrell', 'cgambrell66@fotki.com', '866-191-5212', '2003-08-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3589857879234355', 'Morgan', 'Tolwood', 'mtolwood67@craigslist.org', '736-498-7761', '2000-01-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3581419623585679', 'Dov', 'Ordemann', 'dordemann68@theguardian.com', '241-810-8698', '1990-07-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5100142752165694', 'Jessalin', 'Aireton', 'jaireton69@omniture.com', '864-752-8092', '1996-10-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5100142505288264', 'Kathrine', 'Yellop', 'kyellop6a@pagesperso-orange.fr', '700-623-4640', '1995-08-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5018715805127414', 'Shaun', 'Bassam', 'sbassam6b@nhs.uk', '967-247-7702', '1993-01-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('373069723104703', 'Indira', 'Lyvon', 'ilyvon6c@com.com', '541-123-1398', '2002-02-05');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('56107819667027152', 'Gan', 'Lanphier', 'glanphier6d@bbc.co.uk', '635-736-2040', '2000-02-10');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201587722081356', 'Luelle', 'Loutheane', 'lloutheane6e@seattletimes.com', '404-190-6401', '2004-10-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30392924350023', 'Von', 'Salzburg', 'vsalzburg6f@foxnews.com', '227-113-6057', '2000-11-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201632232558285', 'Nico', 'Attac', 'nattac6g@opera.com', '355-817-9948', '1997-03-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3562945957399850', 'Aggie', 'Cassel', 'acassel6h@npr.org', '851-572-1434', '1982-05-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4844863327301498', 'Gottfried', 'Bazely', 'gbazely6i@wix.com', '222-710-2677', '1998-02-02');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3565691492900839', 'Fernando', 'Glynn', 'fglynn6j@addthis.com', '840-105-7987', '1994-07-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3553747559460226', 'Jecho', 'Haney`', 'jhaney6k@ucoz.com', '144-808-8259', '1969-06-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201605568640307', 'Chrystal', 'Minet', 'cminet6l@umn.edu', '792-392-0449', '1999-11-03');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6396910285773478', 'Willow', 'Davie', 'wdavie6m@vimeo.com', '838-983-3926', '1998-04-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6387171688641223', 'Selestina', 'Wiltshear', 'swiltshear6n@patch.com', '499-686-6738', '1995-04-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5281698319053021', 'Malva', 'Markey', 'mmarkey6o@cbc.ca', '652-346-8365', '2004-10-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('630434547784475014', 'Hollis', 'Sphinxe', 'hsphinxe6p@mapy.cz', '436-774-8892', '2003-03-04');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201770629508065', 'Wandie', 'Minci', 'wminci6q@shareasale.com', '974-962-4604', '1999-11-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('337941914397467', 'Debbi', 'Dawtrey', 'ddawtrey6r@jalbum.net', '826-815-9240', '1979-02-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3584788430821775', 'Debby', 'de Guerre', 'ddeguerre6s@hp.com', '783-410-5405', '1987-10-11');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3561413428298004', 'Arty', 'Postgate', 'apostgate6t@jigsy.com', '699-313-1356', '1993-08-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6706370759275804', 'Nanni', 'Euston', 'neuston6u@paypal.com', '696-324-7030', '2000-04-30');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3567064230785458', 'Balduin', 'Ottewell', 'bottewell6v@arizona.edu', '557-851-3243', '2003-03-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30176659375648', 'Rock', 'Walthall', 'rwalthall6w@wordpress.com', '558-746-6082', '1990-12-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3577867690612147', 'Ethelind', 'Arch', 'earch6x@microsoft.com', '250-452-4170', '1976-10-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3573819204661494', 'Abbe', 'Gillions', 'agillions6y@ibm.com', '269-128-0650', '1995-01-17');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('675969179339531956', 'Cleve', 'Gubbin', 'cgubbin6z@weather.com', '849-579-9103', '2003-12-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3538267237520598', 'Karlis', 'Pattison', 'kpattison70@wix.com', '827-667-1630', '2001-06-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374288308982114', 'Santiago', 'Valencia', 'roughlove147@gmail.com', '186-864-5656', '1997-11-07');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('630434468041360545', 'Myer', 'Keeton', 'mkeeton72@wired.com', '122-531-7208', '1993-10-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3578357532520749', 'Audrye', 'Bruun', 'abruun73@mozilla.com', '544-297-2099', '1994-01-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6759048009952978', 'Phineas', 'Lucus', 'plucus74@google.co.uk', '636-945-3099', '2003-08-01');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30347239676322', 'Josselyn', 'Hedin', 'jhedin75@biblegateway.com', '357-596-7694', '2002-05-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5610484522233987', 'Dredi', 'Orford', 'dorford76@a8.net', '663-846-3908', '2000-09-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6763826306135064', 'Marijn', 'Harbidge', 'mharbidge77@seattletimes.com', '457-976-5295', '1994-03-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4041375052806816', 'Bambie', 'Bertome', 'bbertome78@geocities.com', '197-190-8042', '1988-01-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3582089537183025', 'Norina', 'Trazzi', 'ntrazzi79@bloomberg.com', '435-413-4176', '1990-12-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5186742902903170', 'Briggs', 'Acedo', 'bacedo7a@wordpress.org', '119-915-3917', '1999-11-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('56022375182265316', 'Truda', 'Iorizzo', 'tiorizzo7b@google.es', '390-761-3077', '1995-04-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602233619099169', 'Teddi', 'Estevez', 'testevez7c@whitehouse.gov', '181-704-6563', '1992-05-14');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6393578062677734', 'Calhoun', 'Bachanski', 'cbachanski7d@ibm.com', '639-479-6380', '1998-07-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6762341237006694546', 'Dietrich', 'Ellick', 'dellick7e@psu.edu', '201-407-1668', '1996-10-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3589427756714539', 'Lynea', 'Brennans', 'lbrennans7f@msn.com', '904-401-8726', '1985-04-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5108750034777870', 'Sonny', 'Keese', 'skeese7g@wikimedia.org', '862-112-6607', '1978-10-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3561700016906315', 'Amata', 'Janus', 'ajanus7h@accuweather.com', '634-886-2954', '2000-10-13');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('677133637665917815', 'Yule', 'Chalmers', 'ychalmers7i@netscape.com', '486-242-1329', '2002-01-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3545329384165808', 'Jaymie', 'Serman', 'jserman7j@rakuten.co.jp', '900-294-1996', '2001-06-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3539016553337858', 'Tracey', 'Witard', 'twitard7k@xing.com', '365-326-2346', '2003-01-24');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('490387402163281862', 'Trenna', 'Gaukroger', 'tgaukroger7l@europa.eu', '655-453-2276', '1980-04-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5020284309895799497', 'Agretha', 'Creane', 'acreane7m@biglobe.ne.jp', '278-241-9720', '1978-05-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3540915776097362', 'Jackqueline', 'Paxton', 'jpaxton7n@instagram.com', '235-184-7712', '1977-01-29');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6385203397159197', 'Frederick', 'Elcox', 'felcox7o@slate.com', '131-486-0523', '2000-05-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3552368557713242', 'Muhammad', 'Stormont', 'mstormont7p@europa.eu', '817-415-6204', '2002-08-31');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4508522666215209', 'Elle', 'Coleborn', 'ecoleborn7q@marriott.com', '556-183-2658', '2004-10-25');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('201880954768596', 'Lacie', 'Janous', 'ljanous7r@4shared.com', '841-906-8884', '2001-01-02');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3553672684448260', 'Crosby', 'Bilbrooke', 'cbilbrooke7s@1und1.de', '996-758-0656', '2004-01-20');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('675901119711761061', 'Aristotle', 'Demangeon', 'ademangeon7t@google.com.au', '595-762-8994', '2002-09-16');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30290101264779', 'Bobbe', 'Crosen', 'bcrosen7u@ustream.tv', '367-643-0111', '2000-06-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('502093039090847469', 'Jemima', 'Chetwynd', 'jchetwynd7v@shareasale.com', '476-751-2467', '1999-03-09');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4118292782518876', 'Claudelle', 'Georgius', 'cgeorgius7w@indiegogo.com', '630-478-9825', '1996-08-06');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('374622496648204', 'Chrisse', 'Karpov', 'ckarpov7x@japanpost.jp', '991-774-8095', '1987-04-12');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('36777438035397', 'Oswell', 'Stockings', 'ostockings7y@cbslocal.com', '938-710-0027', '1997-10-11');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('63048819426917097', 'Ulric', 'Gairdner', 'ugairdner7z@zdnet.com', '803-952-6776', '1991-01-04');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('6706792228338774', 'Ragnar', 'Mauger', 'rmauger80@earthlink.net', '865-595-0355', '1998-01-26');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5010121480831552', 'Mel', 'Kirsop', 'mkirsop81@desdev.cn', '697-626-7936', '1993-08-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30119981723739', 'Aloisia', 'Leveret', 'aleveret82@google.cn', '588-819-9677', '1993-02-21');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3585092265676795', 'Marcellina', 'Mullin', 'mmullin83@toplist.cz', '244-272-8368', '2003-11-02');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3533586731387534', 'Terrence', 'Cordelet', 'tcordelet84@free.fr', '258-617-9445', '2004-08-27');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3534602286167228', 'Currie', 'Hunnam', 'chunnam85@illinois.edu', '535-808-2921', '2001-03-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3555877289251344', 'Munmro', 'Gresly', 'mgresly86@mysql.com', '751-959-0814', '2000-05-08');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5602236798514205', 'Davy', 'Westrope', 'dwestrope87@globo.com', '921-772-9054', '1987-09-18');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('30333018829001', 'Ellene', 'Bulfit', 'ebulfit88@amazon.de', '723-656-3964', '1990-09-19');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('5038283497014552', 'Kaitlin', 'Bage', 'kbage89@over-blog.com', '254-853-5013', '1995-04-23');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('3574930814170385', 'Ross', 'Fyndon', 'rfyndon8a@soup.io', '889-830-5537', '1996-11-28');
insert into cliente (identificacion_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, fecha_nacimiento_cliente) values ('4017956897888', 'Anet', 'Praundl', 'apraundl8b@nsw.gov.au', '508-995-7222', '1992-05-17');

-- Datos para la tabla "usuario"
INSERT INTO usuario (identificacion_usuario, nombre_rol, nombre_usuario, apellido_usuario, contrasena) VALUES
(987654321, 2, 'Juanquin', 'Pérez', 'treslo'),
(654321987, 2, 'María', 'Gómez', 'huevito23'),
(456789123, 2, 'Carlos', 'López', 'santaparra'),
(789123456, 2, 'Laura', 'Rodríguez', 'josemivida'),
(321987654, 2, 'Pedro', 'Martínez', 'ojoporojodientepordiente'),
(918273645, 2, 'Ana', 'Sánchez', 'mamirika3000');

-- EN LA TABLA MASCOTAS
INSERT INTO mascota (nombre_mascota, color_mascota, fecha_nacimiento_mascota, id_cliente)
VALUES
    ('Coco', 'Gris', '2020-04-18', '3561111432268217'),
    ('Bella', 'Negro', '2019-07-01', 3575971116366254),
    ('Charlie', 'Blanco', '2018-11-30', 3568741115274927),
    ('Lucy', 'Marrón', '2020-02-22', 6387918564842675),
    ('Bailey', 'Dorado', '2019-06-14', 564182178707420526),
    ('Max', 'Gris', '2017-12-03', 5229409244637879),
    ('Oliver', 'Naranja', '2020-09-05', 201603853907705),
    ('Leo', 'Negro', '2018-03-29', 3544743377903846),
    ('lolas', 'Blanco', '2019-01-08', 5610982105008221),
    ('Sophie', 'Marrón', '2020-07-17', 675957694296701248),
    ('Lily', 'Gris', '2018-10-09', 3550032232121070),
    ('Mia', 'Naranja', '2020-03-12', 3562662490828838),
    ('Jack', 'Negro', '2019-05-24', 3540163393790305),
    ('Estrella', 'Blanco', '2020-01-30', 5038065944261056838),
    ('Toby', 'Marrón', '2018-08-09', 560224434456895329),
    ('Daisy', 'Gris', '2019-09-28', 6394891797074591),
    ('Molly', 'Negro', '2020-01-14', 3554694768042289),
    ('Lulo', 'Blanco', '2019-04-05', 3557487402983803),
    ('Lor', 'Marrón', '2018-07-26', 3565923503157541),
    ('Coquito', 'Gris', '2020-06-18', 6706346043345058),
    ('Rubys', 'Negro', '2019-03-09', 5602213727048100),
    ('Sadie', 'Blanco', '2018-12-02', 5602228435004708),
    ('Bentley', 'Marrón', '2020-10-21', 201907929745225),
    ('Zeus', 'Negro', '2019-04-30', 6334115155713761),
    ('Rosie', 'Blanco', '2018-09-15', 3586732015214434),
    ('Nutella', 'Marrón', '2020-05-19', 3582633047752892),
    ('Rocky', 'Gris', '2019-08-14', 30566006362382),
    ('Sophie', 'Blanco', '2020-01-27', 4911670182514067),
    ('Chloe', 'Negro', '2018-06-02', 58931983098575664),
    ('Duke', 'Marrón', '2019-10-08', 4175007446311561),
    ('Zoe', 'Gris', '2020-07-16', 376920740326470),
    ('Luney', 'Blanco', '2019-03-21', 3548316902795551),
    ('Harley', 'Marrón', '2018-11-09', 3529976842116235),
    ('Maggie', 'Negro', '2020-02-13', 3562305550767054),
	('Lucy', 'Negro y Blanco', '2021-12-29', 502093039090847469),
	('Mimi', 'Marrón', '2020-07-11', 4118292782518876),
	('Daisy', 'Blanco', '2019-10-02', 374622496648204),
	('Molly', 'Atigrado', '2022-01-20', 36777438035397),
	('Zeu', 'Gris', '2019-04-28', 63048819426917097),
	('Bailey', 'Café', '2018-05-15', 5010121480831552),
	('Sadie', 'Negro', '2021-11-07', 30119981723739),
	('Oliver', 'Blanco', '2020-06-13', 3585092265676795),
	('Lily', 'Naranja', '2019-02-14', 3533586731387534),
	('Duke', 'Atigrado', '2022-03-29', 3534602286167228),
	('Ruby', 'Marrón', '2021-04-03', 3555877289251344),
	('Cooper', 'Gris', '2020-08-09', 5602236798514205),
	('Luna', 'Negro', '2019-01-05', 30333018829001),
	('Zeus', 'Blanco', '2018-07-22', 5038283497014552),
	('Mateus', 'Café', '2022-02-17', 3574930814170385),
	('Leo', 'Naranja', '2020-11-26', 4017956897888);

-- PRODUCTOS

-- Insertar bebidas
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descripcion_producto, tipo, tipo_leche)
VALUES
    (101, 'Expreso', 10500, 'Café expreso simple y delicioso.', 'bebida', NULL),
    (102, 'Macchiato', 13900, 'Café expreso con una pizca de leche.', 'bebida', 'leche entera'),
    (103, 'Capuchino', 15450, 'Café con leche y chocolate.', 'bebida', 'leche descremada'),
    (104, 'Frappé', 17800, 'Café frío con hielo y crema de leche.', 'bebida', 'leche deslactosada'),
	(105, 'Latte', 15900, 'Café expreso con leche caliente y espumosa.', 'bebida', 'leche entera'),
    (106, 'Mocha', 16900, 'Café expreso con leche y chocolate.', 'bebida', 'leche descremada'),
    (107, 'Café Americano', 9900, 'Café expreso diluido en agua caliente.', 'bebida', NULL),
    (108, 'Café Cortado', 12900, 'Café expreso con una pequeña cantidad de leche.', 'bebida', 'leche deslactosada'),
    (109, 'Café Vienés', 18600, 'Café expreso con crema batida y chocolate rallado.', 'bebida', 'leche entera');
		

-- Insertar cafés en bolsa
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descripcion_producto, tipo, disponibilidad, denominacion_origen, peso)
VALUES
    (2101, 'Café Colombiano 250g', 9900, 'Café en bolsa de 250g para preparar en casa.', 'cafe', 200, 'Colombia', 250),
    (2301, 'Café brasileño 500g', 15999, 'Café en bolsa de 500g para los amantes del café.', 'cafe', 150, 'Brasil', 500),
    (2201, 'Café etiopia 1000g', 18550, 'Café en bolsa de 1000g para compartir.', 'cafe', 100, 'Etiopía', 1000);

-- Insertar toppings
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descripcion_producto, tipo, disponibilidad)
VALUES
    (301, 'Crema Batida', 3000, 'Clásica crema batida para tu café.', 'topping', 50),
    (302, 'Caramelo', 2500, 'Jarabe o trozos de caramelo para endulzar tu café.', 'topping', 20),
    (303, 'Chocolate', 5000, 'Ralladura de chocolate oscuro o en polvo.', 'topping', 75),
    (304, 'Vainilla', 1990, 'Esencia de vainilla o sirope de vainilla.', 'topping', 15),
    (305, 'Canela', 2100, 'Una pizca de canela molida para realzar el sabor del café.', 'topping', 30),
    (306, 'Almendra', 4250, 'Jarabe de almendra o extracto de almendra.', 'topping', 45),
    (307, 'Malvavisco', 5500, 'Malvaviscos o crema de malvavisco.', 'topping', 100),
    (308, 'Miel', 2900, 'Endulza tu café con un toque natural de miel.', 'topping', 10),
    (309, 'Jengibre', 1700, 'Jarabe de jengibre para un toque picante y estimulante.', 'topping', 10),
    (310, 'Licor', 6500, 'Opciones de licor para añadir sofisticación a tu café.', 'topping', 55);

-- Insertar libros
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descripcion_producto, tipo, disponibilidad, genero, autor)
VALUES
    (401, 'El Resplandor', 45000, 'Una novela de terror psicológico de Stephen King.', 'libro', 10, 'terror', 'Stephen King'),
    (402, 'El Exorcista', 52000, 'Un clásico del terror sobre posesión demoníaca.', 'libro', 7, 'terror', 'William Peter Blatty'),
    (403, 'El Código Da Vinci', 60000, 'Un thriller de misterio de Dan Brown.', 'libro', 12, 'misterio', 'Dan Brown'),
    (404, 'Sherlock Holmes: Aventuras', 48500, 'Historias de misterio con el famoso detective Sherlock Holmes.', 'libro', 15, 'misterio', 'Arthur Conan Doyle'),
    (405, 'Orgullo y Prejuicio', 55000, 'Una clásica historia de amor de Jane Austen.', 'libro', 5, 'romance', 'Jane Austen'),
    (406, 'Bajo el Sol de la Toscana', 30900, 'Una historia de amor y renovación en Italia.', 'libro', 23,'romance', 'Frances Mayes'),
    (407, '1984', 50495, 'Una distopía futurista de George Orwell.', 'libro', 17, 'ficcion', 'George Orwell'),
    (408, 'Cien Años de Soledad', 78900, 'Una obra maestra del realismo mágico de Gabriel García Márquez.', 'libro', 14, 'ficcion', 'Gabriel García Márquez'),
    (409, 'Elogio del gato', 43900, 'La asimilación del escritor con el gato es un clásico en literatura.', 'libro', 5, 'Narrativa', 'Stephanie Hochet'),
    (410, 'Crononautas', 59500, 'Una emocionante novela de viajes en el tiempo y aventuras en mundos alternativos.', 'libro', 3, 'Ciencia ficcion', 'Sergio Gomez'),
	(411, '¡ESTO ESTÁ MUY ÑAM!', 79000, 'Sencillas pero deliciosas recetas de proteínas, acompañamientos y vegetales.', 'libro', 5, 'Cocina', 'Erwin García & Cristhian Caína');


-- COMBOS
INSERT INTO combo (id_combo, nombre_combo, descripcion_combo, precio_combo) VALUES
(501, 'Combo amore', 'Frappe de cafe + Crema Batida + Orgullo y Prejuicio', 89600),
(502, 'Combo boo','Café Colombiano 250g + Malvavisco + El Resplandor', 93250),
(503, 'Combo delicius', 'Café etiopia 1000g + Chocolate + Elogio del gato', 68500),
(504, 'Combo primavera', 'Café cappuccino + Licor + Cien Años de Soledad', 100000);



-- COMBINACIÓN
INSERT INTO combinacion (id_combo, id_producto) VALUES
(501, 104),
(501, 301),
(501, 405),
(502, 2101),
(502, 307),
(502, 401),
(503, 2201),
(503, 303),
(503, 409),
(504, 103),
(504, 310),
(504, 408);

-- insertar datos en venta
INSERT INTO venta (fecha_hora, id_cliente, id_usuario, id_venta)
VALUES
('2023-01-03 10:15:00', 3536984968181695, 987654321, 1),
('2023-02-28 12:30:00', 4936997361452893680, 654321987, 2),
('2023-03-25 14:45:00', 675970024238076785, 987654321, 3),
('2023-04-12 16:00:00', 58933141311382867, 654321987, 4),
('2023-05-30 09:30:00', 3564637988888773, 987654321, 5),
('2023-06-28 11:45:00', 3586014121273517, 654321987, 6),
('2023-07-15 13:15:00', 3574021641687070, 987654321, 7),
('2023-08-20 15:30:00', 3570563786956020, 654321987, 8),
('2023-09-11 17:45:00', 374283028348621, 987654321, 9),
('2023-01-01 10:00:00', 3576246833278861, 654321987, 10),
('2023-02-15 12:15:00', 5254377093589392, 987654321, 11),
('2023-03-20 14:30:00', 3588341970145589, 654321987, 12),
('2023-04-22 16:45:00', 3572326567702791, 987654321, 13),
('2023-05-05 09:00:00', 56105391339395492, 654321987, 14),
('2023-06-07 11:30:00', 3554990269533093, 987654321, 15),
('2023-07-09 13:45:00', 3554947020009177, 654321987, 16),
('2023-08-01 15:00:00', 374288858662298, 654321987, 17),
('2023-09-03 08:30:00', 564182178707420526, 456789123, 18),
('2023-01-15 10:45:00', 50184783242190746, 789123456, 19),
('2023-02-14 12:00:00', 5229409244637879, 456789123, 20),
('2023-03-02 14:15:00', 201603853907705, 789123456, 21),
('2023-04-29 16:30:00', 3544743377903846, 456789123, 22),
('2023-05-14 18:45:00', 675957694296701248, 456789123, 23),
('2023-06-09 09:15:00', 3550032232121070, 789123456, 24),
('2023-07-17 11:45:00', 3562662490828838, 789123456, 25),
('2023-08-05 13:30:00', 560224434456895329, 456789123,26),
('2023-09-25 15:45:00', 4175007446311561, 456789123, 27),
('2023-01-28 08:45:00', 3548316902795551, 456789123, 28),
('2023-02-18 10:30:00', 502093039090847469, 789123456, 29),
('2023-03-22 12:45:00', 4118292782518876, 789123456, 30),
('2023-04-19 14:00:00', 30119981723739, 789123456, 31),
('2023-05-16 16:15:00', 3574930814170385, 789123456, 32),
('2023-06-13 18:30:00', 3555877289251344, 789123456, 33),
('2023-07-11 09:45:00', 4017956897888, 456789123, 34);

-- EN LA TABLA DETALLE DE VENTA
INSERT INTO detalle_de_venta (cantidad, id_producto, id_combo, id_venta, precio_unitario)
VALUES
    (2, 101, NULL, 1, 21000),    -- 2 Espresso coffees
    (1, 102, NULL, 2, 13900),    -- 1 Macchiato coffee
    (3, NULL, 501, 3, 89600),    -- Combo amore: Frappe de cafe + Crema Batida + Orgullo y Prejuicio
    (2, 103, NULL, 4, 30900),    -- 2 Capuchino coffees
    (1, 401, NULL, 5, 45000),    -- 1 El Resplandor book
    (1, 2101, NULL, 6, 9900),    -- 1 Café Colombiano 250g
    (1, 307, NULL, 7, 5500),     -- 1 Malvavisco topping
    (1, NULL, 502, 8, 93250),    -- Combo boo: Café Colombiano 250g + Malvavisco + El Resplandor
    (4, 304, NULL, 9, 7960),     -- 4 Vainilla toppings
    (2, 308, NULL, 10, 5800),    -- 2 Miel toppings
    (2, NULL, 503, 11, 137000),  -- Combo delicius: Café etiopia 1000g + Chocolate + Elogio del gato
    (1, 106, NULL, 12, 16900),   -- 1 Mocha coffee
    (1, 403, NULL, 13, 60000),   -- 1 El Código Da Vinci book
    (3, 305, NULL, 14, 6300),    -- 3 Canela toppings
    (2, NULL, 504, 15, 169000),  -- Combo primavera: Café cappuccino + Licor + Cien Años de Soledad
    (2, 108, NULL, 16, 25800),   -- 2 Café Cortado coffees
    (1, 405, NULL, 17, 55000),   -- 1 Orgullo y Prejuicio book
    (1, 403, NULL, 18, 60000),   -- 1 El Código Da Vinci book
    (1, 306, NULL, 19, 4250),    -- 1 Almendra topping
    (1, NULL, 501, 20, 89600),   -- Combo amore: Frappe de cafe + Crema Batida + Orgullo y Prejuicio
    (2, 303, NULL, 21, 10000),   -- 2 Chocolate toppings
    (1, 107, NULL, 22, 9900),    -- 1 Café Americano coffee
    (1, NULL, 504, 23, 100000),  -- Combo primavera: Café cappuccino + Licor + Cien Años de Soledad
    (3, 309, NULL, 24, 5100),    -- 3 Jengibre toppings
    (1, 406, NULL, 25, 4250),    -- 1 Almendra topping
    (2, 305, NULL, 26, 4200),    -- 2 Canela toppings
    (1, 403, NULL, 27, 60000),   -- 1 El Código Da Vinci book
    (1, 310, NULL, 28, 6500),    -- 1 Licor topping
    (2, NULL, 503, 29, 137000),  -- Combo delicius: Café etiopia 1000g + Chocolate + Elogio del gato
    (1, 304, NULL, 30, 1990),    -- 1 Vainilla topping
    (1, 406, NULL, 31, 4250),    -- 1 Almendra topping
    (2, 301, NULL, 32, 6000),    -- 2 Crema Batida toppings
    (1, 404, NULL, 33, 48500),   -- 1 Sherlock Holmes: Aventuras book
    (1, 305, NULL, 34, 2100);    -- 1 Canela topping
    
select * from cliente;
select * from mascota;
select * from productos;
select * from venta;
select * from detalle_de_venta;

-- Dias de la semana con mayor registro de ventas.
SELECT DAYNAME(fecha_hora) AS dia_semana, COUNT(*) AS cantidad
FROM venta
GROUP BY dia_semana
ORDER BY cantidad DESC;

-- Toppings mas vendidos.
SELECT
    p.nombre_producto AS topping,
    SUM(dv.cantidad) AS cantidad_vendida
FROM
    detalle_de_venta dv
INNER JOIN
    productos p ON dv.id_producto = p.id_producto
WHERE
    p.tipo = 'topping'
GROUP BY
    p.nombre_producto
ORDER BY
    cantidad_vendida DESC;

-- Combo mas vendido.
SELECT c.nombre_combo, COUNT(dv.id_combo) AS cantidad_vendida
FROM detalle_de_venta dv
JOIN combo c ON dv.id_combo = c.id_combo
GROUP BY c.id_combo
ORDER BY cantidad_vendida DESC
LIMIT 1;

-- Prodcutos mas vendidos
SELECT p.nombre_producto, COUNT(dv.id_producto) AS cantidad_vendida
FROM detalle_de_venta dv
JOIN venta v ON dv.id_venta = v.id_venta
JOIN cliente c ON v.id_cliente = c.identificacion_cliente
JOIN productos p ON dv.id_producto = p.id_producto
WHERE DATE_ADD(c.fecha_nacimiento_cliente, INTERVAL 30 YEAR) >= CURDATE() -- Ejemplo: Menores de 30 años
GROUP BY p.id_producto
ORDER BY cantidad_vendida DESC;


-- Prodcutos por rango de edad
SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento_cliente, CURDATE()) BETWEEN 18 AND 30 THEN '18-30 años'
        WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento_cliente, CURDATE()) BETWEEN 31 AND 43 THEN '31-43 años'
				WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento_cliente, CURDATE()) BETWEEN 44 AND 56 THEN '44-56'
        ELSE 'Más de 56'
    END AS rango_edad,
    productos.nombre_producto,
    SUM(detalle_de_venta.cantidad) AS cantidad_vendida
FROM
    cliente
JOIN
    venta ON cliente.identificacion_cliente = venta.id_cliente
JOIN
    detalle_de_venta ON venta.id_venta = detalle_de_venta.id_venta
JOIN
    productos ON detalle_de_venta.id_producto = productos.id_producto
GROUP BY
    rango_edad, productos.nombre_producto
ORDER BY
    rango_edad, cantidad_vendida DESC;
    
-- patrones de compra segmentados por edades y preferencias
SELECT YEAR(CURDATE()) - YEAR(cliente.fecha_nacimiento_cliente) AS edad, productos.tipo, COUNT(detalle_de_venta.id_producto) AS cantidad
FROM detalle_de_venta
JOIN venta ON detalle_de_venta.id_venta = venta.id_venta
JOIN cliente ON venta.id_cliente = cliente.identificacion_cliente
JOIN productos ON detalle_de_venta.id_producto = productos.id_producto
GROUP BY edad, productos.tipo
ORDER BY edad, cantidad DESC
LIMIT 0, 1000;
