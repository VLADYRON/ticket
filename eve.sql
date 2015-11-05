CREATE TABLE adjunto  ( 
	id         	bigint(15) AUTO_INCREMENT NULL,
	descripcion	text NULL,
	instancia  	bigint(15) NULL,
	contenido  	text NULL,
	tamano     	varchar(200) NULL,
	tipo       	varchar(20) NULL,
	nombre     	text NULL,
	PRIMARY KEY(id)
);
CREATE TABLE area  ( 
	id         	bigint(15) AUTO_INCREMENT NOT NULL,
	descripcion	text NULL,
	estado     	varchar(25) NULL,
	id_area    	bigint(15) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE area_usuario  ( 
	id        	bigint(15) AUTO_INCREMENT NOT NULL,
	id_area   	bigint(15) NULL,
	id_usuario	bigint(15) NULL,
	estado    	int(15) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE categoria  ( 
	id    	bigint(15) AUTO_INCREMENT NOT NULL,
	nombre	text NULL,
	PRIMARY KEY(id)
);
CREATE TABLE consulta  ( 
	id          	bigint(15) AUTO_INCREMENT NOT NULL,
	descripcion 	text NULL,
	estado      	int(15) NULL,
	id_area     	bigint(15) NULL,
	resumen     	text NULL,
	id_categoria	bigint(15) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE general  ( 
	id       	bigint(15) AUTO_INCREMENT NOT NULL,
	file_root	varchar(250) NULL,
	base_url 	varchar(250) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE log_ticket  ( 
	id        	bigint(15) AUTO_INCREMENT NOT NULL,
	id_ticket 	bigint(15) NULL,
	creado    	datetime NULL,
	verificado	datetime NULL,
	accion    	text NULL,
	id_usuario	bigint(15) NULL,
	codigo    	varchar(200) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE medio_comunicacion  ( 
	id        	bigint(15) AUTO_INCREMENT NOT NULL,
	id_persona	bigint(15) NULL,
	principal 	int(15) NULL,
	valor     	text NULL,
	tipo      	varchar(25) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE mensaje  ( 
	id         	bigint(15) AUTO_INCREMENT NULL,
	id_ticket  	bigint(15) NULL,
	descripcion	text NULL,
	creado     	datetime NULL,
	id_staff   	bigint(15) NULL,
	tipo       	int(15) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE perfil  ( 
	id         	bigint(15) AUTO_INCREMENT NOT NULL,
	descripcion	text NULL,
	codigo     	varchar(200) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE perfil_usuario  ( 
	id        	bigint(15) AUTO_INCREMENT NOT NULL,
	id_perfil 	bigint(15) NULL,
	id_usuario	bigint(15) NULL,
	estado    	int(15) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE persona  ( 
	id            	bigint(15) AUTO_INCREMENT NOT NULL,
	paterno       	text NULL,
	materno       	text NULL,
	nombres       	text NULL,
	sexo          	int(15) NULL,
	tipo_documento	bigint(15) NULL,
	nro_documento 	bigint(15) NULL,
	PRIMARY KEY(id)
);
CREATE TABLE ticket  ( 
	id              	bigint(15) AUTO_INCREMENT NOT NULL,
	id_area         	bigint(15) NULL,
	id_stakeholder  	bigint(15) NULL,
	codigo          	varchar(25) NULL,
	estado          	int(15) NULL,
	prioridad       	int(15) NULL,
	id_staff        	bigint(15) NULL,
	creado          	datetime NULL,
	actualizado     	datetime NULL,
	id_consulta     	bigint(15) NULL,
	conformidad     	int(15) NULL,
	tiempo_respuesta	float(10,0) NULL,
	notificacion    	int(15) NULL,
	resuelto        	datetime NULL,
	PRIMARY KEY(id)
);
CREATE TABLE tipo_documento  ( 
	id    	bigint(15) AUTO_INCREMENT NOT NULL,
	codigo	varchar(25) NULL,
	nombre	text NULL,
	PRIMARY KEY(id)
);
CREATE TABLE usuario  ( 
	id            	bigint(15) AUTO_INCREMENT NOT NULL,
	codigo        	varchar(200) NULL,
	id_persona    	bigint(15) NULL,
	email         	varchar(200) NULL,
	password      	varchar(200) NULL,
	fecha_creacion	datetime NULL,
	PRIMARY KEY(id)
);


ALTER TABLE area_usuario
	ADD CONSTRAINT REL_6
	FOREIGN KEY(id_area)
	REFERENCES area(id);
ALTER TABLE ticket
	ADD CONSTRAINT REL_10
	FOREIGN KEY(id_area)
	REFERENCES area(id);
ALTER TABLE consulta
	ADD CONSTRAINT REL_13
	FOREIGN KEY(id_area)
	REFERENCES area(id);
ALTER TABLE consulta
	ADD CONSTRAINT REL_12
	FOREIGN KEY(id_categoria)
	REFERENCES categoria(id);
ALTER TABLE ticket
	ADD CONSTRAINT REL_11
	FOREIGN KEY(id_consulta)
	REFERENCES consulta(id);
ALTER TABLE perfil_usuario
	ADD CONSTRAINT REL_3
	FOREIGN KEY(id_perfil)
	REFERENCES perfil(id);
ALTER TABLE usuario
	ADD CONSTRAINT REL_2
	FOREIGN KEY(id_persona)
	REFERENCES persona(id);
ALTER TABLE medio_comunicacion
	ADD CONSTRAINT REL_7
	FOREIGN KEY(id_persona)
	REFERENCES persona(id);
ALTER TABLE mensaje
	ADD CONSTRAINT REL_14
	FOREIGN KEY(id_ticket)
	REFERENCES ticket(id);
ALTER TABLE persona
	ADD CONSTRAINT REL_1
	FOREIGN KEY(tipo_documento)
	REFERENCES tipo_documento(id);
ALTER TABLE perfil_usuario
	ADD CONSTRAINT REL_4
	FOREIGN KEY(id_usuario)
	REFERENCES usuario(id);
ALTER TABLE area_usuario
	ADD CONSTRAINT REL_5
	FOREIGN KEY(id_usuario)
	REFERENCES usuario(id);
ALTER TABLE ticket
	ADD CONSTRAINT REL_8
	FOREIGN KEY(id_staff)
	REFERENCES usuario(id);
ALTER TABLE ticket
	ADD CONSTRAINT REL_9
	FOREIGN KEY(id_stakeholder)
	REFERENCES usuario(id);
ALTER TABLE mensaje
	ADD CONSTRAINT REL_15
	FOREIGN KEY(id_staff)
	REFERENCES usuario(id);

