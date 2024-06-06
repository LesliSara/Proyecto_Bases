--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación de tablas

-- table: aeronave 
create table aeronave(
  aeronave_id number(10, 0) not null,
  matricula varchar2(10) not null,
  modelo varchar2(50) not null,
  pdf blob,
  es_de_carga number(1, 0) not null,
  es_comercial number(1, 0) not null,
  constraint aeronave_pk primary key (aeronave_id)
);

-- table: aeronave_carga 
create table aeronave_carga(
  aeronave_id number(10, 0) not null,
  num_bodegas number(3, 0) not null,
  bodega_alto number(5, 2) not null,
  bodega_ancho number(5, 2) not null,
  bodega_longitud number(5, 2) not null,
  cap_carga number(3, 0) not null,
  aeropuerto_resguardo_id number(10, 0) not null,
  constraint aeronave_carga_pk primary key (aeronave_id),
  constraint aeronave_carga_aereonave_id_fk foreign key (aeronave_id) 
    references aeronave(aeronave_id)
);

-- table: aeronave_comercial 
create table aeronave_comercial(
  aeronave_id number(10, 0) not null,
  cap_ordinarios number(3, 0) not null,
  cap_discapacitados number(3, 0) not null,
  cap_vip number(3, 0) not null,
  constraint aeronave_comercial_pk primary key (aeronave_id),
  constraint aeronave_comercial_aereonave_id_fk foreign key (aeronave_id) 
    references aeronave(aeronave_id)
);

-- table: aeropuerto 
create table aeropuerto(
  aeropuerto_id number(10, 0) not null,
  clave varchar2(13) not null,
  nombre varchar2(40) not null,
  latitud varchar2(13) not null,
  longitud varchar2(13) not null,
  activo number(1, 0) not null,
  constraint aeropuerto_pk primary key (aeropuerto_id),
  constraint aeropuerto_clave_chk check (length(clave) = 13)
);

-- table: status_vuelo 
create table status_vuelo(
  status_vuelo_id number(40, 0) not null,
  clave varchar2(10) not null,
  descripcion varchar2(40) not null,
  constraint status_vuelo_pk primary key (status_vuelo_id)
);

-- table: vuelo
create table vuelo(
  vuelo_id number(5, 0) not null,
  fecha_status date default on null sysdate,
  fecha_llegada date not null,
  fecha_salida date not null,
  sala_abordar number(3, 0),
  aeropuerto_origen_id number(10, 0) not null,
  aeropuerto_destino_id number(10, 0) not null,
  status_vuelo_id number(40, 0) not null,
  aeronave_id number(10, 0) not null,
  constraint vuelo_pk primary key (vuelo_id),
  constraint vuelo_aeropuerto_origen_id_fk foreign key (aeropuerto_origen_id) 
    references aeropuerto(aeropuerto_id),
  constraint vuelo_aeropuerto_destino_id_fk foreign key (aeropuerto_destino_id) 
    references aeropuerto(aeropuerto_id),
  constraint vuelo_status_vuelo_id_fk foreign key (status_vuelo_id) 
    references status_vuelo(status_vuelo_id),
  constraint vuelo_aeronave_id_fk foreign key (aeronave_id) 
    references aeronave(aeronave_id)
);

-- table: historial_status_vuelo
create table historial_status_vuelo(
  historial_status_vuelo_id number(40, 0) not null,
  fecha_status date default on null sysdate,
  status_vuelo_id number(40, 0) not null,
  vuelo_id number(5, 0) not null,
  constraint historial_status_vuelo_pk primary key (historial_status_vuelo_id),
  constraint historial_status_vuelo_status_vuelo_id_fk foreign key (status_vuelo_id) 
    references status_vuelo(status_vuelo_id),
  constraint historial_status_vuelo_vuelo_id_fk foreign key (vuelo_id) 
    references vuelo(vuelo_id)
);

-- table: monitoreo_vuelo 
create table monitoreo_vuelo(
  num_monitoreo number(4, 0) not null,
  vuelo_id number(5, 0) not null,
  fecha date default on null sysdate,
  latitud varchar2(13) not null,
  longitud varchar2(13) not null,
  constraint monitoreo_vuelo_pk primary key (num_monitoreo, vuelo_id),
  constraint monitoreo_vuelo_vuelo_id_fk foreign key (vuelo_id) 
    references vuelo(vuelo_id)
);

--table: puesto 
create table puesto(
  puesto_id number(10, 0) not null,
  nombre varchar2(40) not null,
  clave generated always as ('P' 
  || to_char(puesto_id, 'fm00')
  || substr(nombre,1,3)
  ) virtual ,
  descripcion varchar2(250) not null,
  sueldo number(8, 2) not null,
  constraint puesto_pk primary key (puesto_id)
);

-- table: rol 
create table rol(
  rol_id number(2, 0) not null,
  nombre varchar2(40) not null,
  descripcion varchar2(250) not null,
  clave generated always as ( 'ROL-'
    ||to_char(rol_id, 'fm00')
    ||substr(nombre,1,3)
  ) virtual,
  constraint rol_pk primary key (rol_id)
);

-- table: empleado 
create table empleado(
  empleado_id number(10, 0) not null,
  nombre varchar2(40) not null,
  apellido_paterno varchar2(40) not null,
  apellido_materno varchar2(40) not null,
  rfc varchar2(13) not null,
  curp varchar2(18) not null,
  foto blob,
  jefe_empleado_id number(10, 0),
  puesto_id number(10, 0) not null,
  constraint empleado_pk primary key (empleado_id),
  constraint empleado_jefe_empleado_id_fk foreign key (jefe_empleado_id) 
    references empleado(empleado_id),
  constraint empleado_curp_uk unique (curp),
  constraint empleado_curp_chk check(length(curp)=18),
  constraint empleado_rfc_chk check(length(rfc)=13)
);

-- table: direcciones_internet 
create table direccion_internet(
  direccion_internet_id number(10, 0) not null,
  url varchar2(100) not null,
  empleado_id number(10, 0) not null,
  constraint direccion_internet_pk primary key (direccion_internet_id),
  constraint direccion_internet_empleado_id_fk foreign key (empleado_id)
    references empleado(empleado_id),
  constraint direccion_internet_url_uk unique(url)
);

-- table: vuelo_tripulacion 
create table vuelo_tripulacion(
  vuelo_tripulacion_id number(10, 0) not null,
  desempenio number(3, 0) not null,
  vuelo_id number(5, 0) not null,
  empleado_id number(10, 0) not null,
  rol_id number(10, 0) not null,
  constraint vuelo_tripulacion_pk primary key (vuelo_tripulacion_id),
  constraint vuelo_tripulacion_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id),
  constraint vuelo_tripulacion_empleado_id_fk foreign key (empleado_id)
    references empleado(empleado_id),
  constraint vuelo_tripulacion_rol_id(fk) foreign key (rol_id)
    references rol(rol_id),
  constraint vuelo_tripulacion_desempenio_chk check(desempenio>=0 and desempenio<=100)
);

-- table: pasajero 
create table pasajero(
  pasajero_id number(10, 0) not null,
  nombre varchar2(40) not null,
  email varchar2(40),
  fecha_nacimiento date not null,
  curp varchar2(18) not null,
  apellido_paterno varchar2(40) not null,
  apellido_materno varchar2(40),
  constraint pasajero_pk primary key (pasajero_id),
  constraint pasajero_curp_chk check(length(curp)=18)
);

-- table: vuelo_pasajero 
create table vuelo_pasajero(
  vuelo_pasajero_id number(10, 0) not null,
  num_asiento number(3, 0) not null,
  presento number(1, 0) not null,
  atencion_especial varchar2(2000),
  pasajero_id number(10, 0) not null,
  vuelo_id number(5, 0) not null,
  constraint vuelo_pasajero_pk primary key (vuelo_pasajero_id),
  constraint vuelo_pasajero_pasajero_id_fk foreign key (pasajero_id)
    references pasajero(pasajero_id),
  constraint vuelo_pasajero_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id)
);

-- table: pase_abordo 
create table pase_abordo (
  pase_abordo_id number(10, 0) not null,
  fecha_impresion date default on null sysdate,
  folio_abordo varchar2(8) not null,
  vuelo_pasajero_id number(10, 0) not null,
  constraint pase_abordo_pk primary key (pase_abordo_id),
  constraint pase_abordo_vuelo_pasajero_id_fk foreign key (vuelo_pasajero_id)
    references vuelo_pasajero(vuelo_pasajero_id),
  constraint pase_abordo_folio_abordo_chk check(length(folio_abordo)=8)
);

-- table: equipaje 
create table equipaje(
  num_maleta number(3, 0) not null,
  pase_abordo_id number(10, 0) not null,
  peso number(5, 2) not null,
  constraint equipaje_pk primary key (num_maleta, pase_abordo_id),
  constraint equipaje_pase_abordo_id_fk foreign key (pase_abordo_id)
    references pase_abordo(pase_abordo_id)
);

-- table: tipo_paquete 
create table tipo_paquete(
  tipo_paquete_id number(10, 0) not null,
  descripcion varchar2(40) not null,
  clave generated always as(
    lpad(substr(to_char(tipo_paquete_id), 1, 4), 4, '0')
    || lpad(substr(descripcion, 1, 4), 4, 'x')
  ) virtual,
  indicaciones varchar2(200) not null,
  constraint tipo_paquete_pk primary key (tipo_paquete_id)
);

-- table: paquete 
create table paquete(
  paquete_id number(10, 0) not null,
  folio varchar2(18) not null,
  peso number(8, 2) not null,
  tipo_paquete_id number(10, 0) not null,
  vuelo_id number(5, 0) not null,
  constraint paquete_pk primary key (paquete_id),
  constraint paquete_tipo_paquete_id_fk foreign key (tipo_paquete_id)
    references tipo_paquete(tipo_paquete_id),
  constraint paquete_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id),
  constraint paquete_folio_chk check(length(folio)=18)
);
