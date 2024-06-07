--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Carga de datos inicial

Prompt Conectando con cf_proy_admin
connect cf_proy_admin/admin

Prompt Insertando valores iniciales

-- Inserciones en la tabla: aeronave
--es comercial
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_de_carga, es_comercial)
values (aeronave_seq.nextval, 'X12345', 'Boeing 737', null, 0, 1);
--es carga
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_de_carga, es_comercial)
values (aeronave_seq.nextval, 'X67890', 'Airbus A320', null, 1, 0);

-- Inserciones en la tabla: aeropuerto
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
values (aeropuerto_seq.nextval, 'AEROPUER001', 'Aeropuerto Internacional CDMX', '19.436', '-99.072', 1);

insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
values (aeropuerto_seq.nextval, 'AEROPUER002', 'Aeropuerto Internacional GDL', '20.524', '-103.310', 1);

-- Inserciones en la tabla: status_vuelo
insert into status_vuelo (status_vuelo_id, clave, descripcion)
values (status_vuelo_seq.nextval, 'PROGRAMADO', 'Vuelo programado');

insert into status_vuelo (status_vuelo_id, clave, descripcion)
values (status_vuelo_seq.nextval, 'ABORDANDO', 'Vuelo en proceso de abordaje');

insert into status_vuelo (status_vuelo_id, clave, descripcion)
values (status_vuelo_seq.nextval, 'A_TIEMPO', 'Vuelo a tiempo');

insert into status_vuelo (status_vuelo_id, clave, descripcion)
values (status_vuelo_seq.nextval, 'DEMORADO', 'Vuelo demorado');

insert into status_vuelo (status_vuelo_id, clave, descripcion)
values (status_vuelo_seq.nextval, 'CANCELADO', 'Vuelo cancelado');

-- Inserciones en la tabla: vuelo
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar, 
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('01/06/2024 08:00', 'dd/mm/yyyy hh24:mi'), 
  to_date('10/06/2024 12:00', 'dd/mm/yyyy hh24:mi'), to_date('10/06/2024 06:00', 'dd/mm/yyyy hh24:mi'), 
  5, 1, 2, 3, 1);

insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar, 
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('02/06/2024 10:00', 'dd/mm/yyyy hh24:mi'), 
  to_date('11/06/2024 14:00', 'dd/mm/yyyy hh24:mi'), to_date('11/06/2024 08:00', 'dd/mm/yyyy hh24:mi'), 
  6, 2, 1, 4, 2);

-- Inserciones en la tabla: puesto
insert into puesto (puesto_id, nombre, descripcion, sueldo)
values (puesto_seq.nextval, 'Piloto', 'Piloto de avión', 50000);

insert into puesto (puesto_id, nombre, descripcion, sueldo)
values (puesto_seq.nextval, 'Copiloto', 'Copiloto de avión', 40000);

-- Inserciones en la tabla: rol
insert into rol (rol_id, nombre, descripcion)
values (rol_seq.nextval, 'Capitán', 'Rol de capitán de vuelo');

insert into rol (rol_id, nombre, descripcion)
values (rol_seq.nextval, 'Asistente de Vuelo', 'Rol de asistente de vuelo');

-- Inserciones en la tabla: empleado
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Juan', 'Pérez', 'González', 'JPGG890101T78', 
  'JPGG890101HDFRZN01', null, null, 1);

insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'María', 'López', 'Hernández', 'MLHH890101T89', 
  'MLHH890101MDFRZN02', null, 1, 2);

-- Inserciones en la tabla: pasajero
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'José', 'jose@example.com', to_date('01/01/1980','dd/mm/yyyy'), 
  'JOSE800101MDFRZN03', 'García', 'López');

insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Ana', 'ana@example.com', to_date('15/05/1990','dd/mm/yyyy'), 
  'ANAM900515MDFRZN04', 'Martínez', 'González');

-- Inserciones en la tabla: vuelo_pasajero
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 12, 1, null, 1, 1);

insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 15, 0, 'Silla de ruedas', 2, 1);

-- Inserciones en la tabla: pase_abordo
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('01/06/2024 07:30', 'dd/mm/yyyy hh24:mi'), 'FOLIO123', 1);

insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('02/06/2024 09:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO456', 2);

-- Inserciones en la tabla: equipaje
insert into equipaje (num_maleta, pase_abordo_id, peso)
values (1, 1, 23.5);

insert into equipaje (num_maleta, pase_abordo_id, peso)
values (2, 1, 19.8);

-- Inserciones en la tabla: tipo_paquete
insert into tipo_paquete (tipo_paquete_id, descripcion, indicaciones)
values (tipo_paquete_seq.nextval, 'Documentos', 'Manejar con cuidado');

insert into tipo_paquete (tipo_paquete_id, descripcion, indicaciones)
values (tipo_paquete_seq.nextval, 'Electrónicos', 'Fragil');

-- Inserciones en la tabla: paquete
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG001234567890', 5.5, 1, 2);

insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG009876543210', 2.3, 2, 2);

commit;

Prompt Listo!
