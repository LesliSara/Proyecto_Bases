--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Carga de datos inicial

Prompt Conectando con cf_proy_admin
connect cf_proy_admin/admin

Prompt Insertando valores iniciales

-- Inserciones en la tabla: aeronave
--es comercial
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_carga, es_comercial)
  values (aeronave_seq.nextval, 'X12345', 'Boeing 737', null, 0, 1);
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_carga, es_comercial)
  values (aeronave_seq.nextval, 'X98765', 'Boeing 747', null, 0, 1);
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_carga, es_comercial)
  values (aeronave_seq.nextval, 'Y45678', 'Airbus A380', null, 0, 1);
--es carga
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_carga, es_comercial)
  values (aeronave_seq.nextval, 'X67890', 'Airbus A320', null, 1, 0);
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_carga, es_comercial)
  values (aeronave_seq.nextval, 'X54321', 'Airbus a330', null, 1, 0);
insert into aeronave (aeronave_id, matricula, modelo, pdf, es_carga, es_comercial)
  values (aeronave_seq.nextval, 'W78901', 'Airbus A330 Cargo', null, 1, 0);

-- Inserciones en aeronave_comercial para las aeronaves comerciales
insert into aeronave_comercial (aeronave_id, cap_ordinarios, cap_discapacitados, cap_vip)
values (1, 140, 6, 4);
insert into aeronave_comercial (aeronave_id, cap_ordinarios, cap_discapacitados, cap_vip)
values (2, 350, 10, 6);
insert into aeronave_comercial (aeronave_id, cap_ordinarios, cap_discapacitados, cap_vip)
values (3, 500, 30, 25);

-- Inserciones en aeronave_carga para las aeronaves de carga
insert into aeronave_carga (aeronave_id, num_bodegas, bodega_alto, bodega_ancho, 
  bodega_longitud, cap_carga, aeropuerto_resguardo_id)
values (4, 3, 2.5, 3.0, 4.0, 200, 1);
insert into aeronave_carga (aeronave_id, num_bodegas, bodega_alto, bodega_ancho, 
  bodega_longitud, cap_carga, aeropuerto_resguardo_id)
values (5, 4, 3.0, 3.5, 5.0, 300, 2);
insert into aeronave_carga (aeronave_id, num_bodegas, bodega_alto, bodega_ancho, 
  bodega_longitud, cap_carga, aeropuerto_resguardo_id)
values (6, 5, 3.5, 4.0, 6.0, 400, 3);

-- Inserciones en la tabla: aeropuerto
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
  values (aeropuerto_seq.nextval, 'AEROPUER001', 'Aeropuerto Internacional CDMX', '19.436', '-99.072', 1);
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
  values (aeropuerto_seq.nextval, 'AEROPUER002', 'Aeropuerto Internacional GDL', '20.524', '-103.310', 1);
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
  values (aeropuerto_seq.nextval, 'AEROPUER003', 'Aeropuerto Internacional MTY', '25.778', '-100.107', 1);
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
  values (aeropuerto_seq.nextval, 'AEROPUER004', 'Aeropuerto Internacional CUN', '21.036', '-86.877', 1);
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
  values (aeropuerto_seq.nextval, 'AEROPUER005', 'Aeropuerto Internacional LAX', '33.941', '-118.408', 1);
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, activo)
  values (aeropuerto_seq.nextval, 'AEROPUER006', 'Aeropuerto Internacional JFK', '40.641', '-73.778', 1);

-- Inserciones en la tabla: status_vuelo
insert into status_vuelo (status_vuelo_id, clave, descripcion)
  values (status_vuelo_seq.nextval, 'PROGRAMADO', 'Vuelo programado');
insert into status_vuelo (status_vuelo_id, clave, descripcion)
  values (status_vuelo_seq.nextval, 'ABORDANDO', 'Vuelo en proceso de abordaje');
insert into status_vuelo (status_vuelo_id, clave, descripcion)
  values (status_vuelo_seq.nextval, 'A TIEMPO', 'Vuelo a tiempo');
insert into status_vuelo (status_vuelo_id, clave, descripcion)
  values (status_vuelo_seq.nextval, 'DEMORADO', 'Vuelo demorado');
insert into status_vuelo (status_vuelo_id, clave, descripcion)
  values (status_vuelo_seq.nextval, 'CANCELADO', 'Vuelo cancelado');

-- Inserciones en la tabla: vuelo
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar, 
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('10/06/2024 06:00', 'dd/mm/yyyy hh24:mi'), 
  to_date('10/06/2024 12:00', 'dd/mm/yyyy hh24:mi'), to_date('10/06/2024 06:00', 'dd/mm/yyyy hh24:mi'), 
  5, 1, 2, 3, 1);-- A TIEMPO
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar, 
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('11/06/2024 07:30', 'dd/mm/yyyy hh24:mi'), 
  to_date('11/06/2024 14:00', 'dd/mm/yyyy hh24:mi'), to_date('11/06/2024 08:00', 'dd/mm/yyyy hh24:mi'), 
  6, 2, 1, 4, 2);--DEMORADO
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar,
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('01/07/2024 08:00', 'dd/mm/yyyy hh24:mi'),
  to_date('01/07/2024 12:00', 'dd/mm/yyyy hh24:mi'), to_date('01/07/2024 06:00', 'dd/mm/yyyy hh24:mi'),
  7, 3, 4, 5, 1); -- CANCELADO
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar,
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('02/07/2024 07:30', 'dd/mm/yyyy hh24:mi'),
  to_date('02/07/2024 14:00', 'dd/mm/yyyy hh24:mi'), to_date('02/07/2024 08:00', 'dd/mm/yyyy hh24:mi'),
  8, 4, 3, 2, 4); --ABORDANDO
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar,
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('03/07/2024 04:00', 'dd/mm/yyyy hh24:mi'),
  to_date('03/07/2024 12:00', 'dd/mm/yyyy hh24:mi'), to_date('03/07/2024 06:00', 'dd/mm/yyyy hh24:mi'),
  null, 5, 6, 1, 4); --PROGRAMADO
insert into vuelo (vuelo_id, fecha_status, fecha_llegada, fecha_salida, sala_abordar,
  aeropuerto_origen_id, aeropuerto_destino_id, status_vuelo_id, aeronave_id)
values (vuelo_seq.nextval, to_date('04/07/2024 08:00', 'dd/mm/yyyy hh24:mi'),
  to_date('04/07/2024 14:00', 'dd/mm/yyyy hh24:mi'), to_date('04/07/2024 08:00', 'dd/mm/yyyy hh24:mi'),
  10, 6, 5, 2, 6); --ABORDANDO

-- Historial de estatus para el vuelo 1
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('01/06/2024 08:00', 'dd/mm/yyyy hh24:mi'), 1, 1); -- PROGRAMADO
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('10/06/2024 05:30', 'dd/mm/yyyy hh24:mi'), 2, 1); -- ABORDANDO
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('10/06/2024 06:00', 'dd/mm/yyyy hh24:mi'), 3, 1); -- A TIEMPO

-- Historial de estatus para el vuelo 2
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('02/06/2024 10:00', 'dd/mm/yyyy hh24:mi'), 1, 2); -- PROGRAMADO
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('11/06/2024 07:30', 'dd/mm/yyyy hh24:mi'), 4, 2); -- DEMORADO

-- Historial de estatus para el vuelo 3
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('01/07/2024 07:00', 'dd/mm/yyyy hh24:mi'), 1, 3); -- PROGRAMADO
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('01/07/2024 08:00', 'dd/mm/yyyy hh24:mi'), 5, 3); -- CANCELADO

-- Historial de estatus para el vuelo 4
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('02/07/2024 04:30', 'dd/mm/yyyy hh24:mi'), 1, 4); -- PROGRAMADO
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('02/07/2024 07:30', 'dd/mm/yyyy hh24:mi'), 2, 4); -- ABORDANDO

-- Historial de estatus para el vuelo 5
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('03/07/2024 04:00', 'dd/mm/yyyy hh24:mi'), 1, 5); -- PROGRAMADO

-- Historial de estatus para el vuelo 6
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('04/07/2024 06:00', 'dd/mm/yyyy hh24:mi'), 1, 6); -- PROGRAMADO
insert into historial_status_vuelo (historial_status_vuelo_id, fecha_status, status_vuelo_id, vuelo_id)
values (historial_status_vuelo_seq.nextval, to_date('04/07/2024 08:00', 'dd/mm/yyyy hh24:mi'), 2, 6); -- ABORDANDO


-- Inserciones en la tabla: puesto
insert into puesto (puesto_id, nombre, descripcion, sueldo)
  values (puesto_seq.nextval, 'PILOTO', 'Piloto de avión', 50000);
insert into puesto (puesto_id, nombre, descripcion, sueldo)
  values (puesto_seq.nextval, 'COPILOTO', 'Copiloto de avión', 40000);
insert into puesto (puesto_id, nombre, descripcion, sueldo)
  values (puesto_seq.nextval, 'JEFE DE SOBRECARGO', 'Jefe de sobrecargo de vuelo', 35000);
insert into puesto (puesto_id, nombre, descripcion, sueldo)
  values (puesto_seq.nextval, 'SOBRECARGO', 'Sobrecargo de vuelo', 25000);
insert into puesto (puesto_id, nombre, descripcion, sueldo)
  values (puesto_seq.nextval, 'TECNICO', 'Asegura la integridad de carga', 20000);

-- Inserciones en la tabla: rol
insert into rol (rol_id, nombre, descripcion)
  values (puesto_seq.nextval, 'PILOTO', 'Piloto de avión');
insert into rol (rol_id, nombre, descripcion)
  values (puesto_seq.nextval, 'COPILOTO', 'Copiloto de avión');
insert into rol (rol_id, nombre, descripcion)
  values (puesto_seq.nextval, 'JEFE DE SOBRECARGO', 'Jefe de sobrecargo de vuelo');
insert into rol (rol_id, nombre, descripcion)
  values (puesto_seq.nextval, 'SOBRECARGO', 'Sobrecargo de vuelo');
insert into rol (rol_id, nombre, descripcion)
  values (puesto_seq.nextval, 'TECNICO', 'Asegura la integridad de carga');

-- Inserciones en la tabla: empleado
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Juan', 'Pérez', 'González', 'JPGG890101T78', 
  'JPGG890101HDFRZN01', null, null, 1);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'María Jazmín', 'Jimenez', 'Aguirre', 'MLHH890101T89', 
  'MLHH890101MDFRZN02', null, 1, 2);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno,
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Carlos', 'Ramírez', 'Sánchez', 'CRS800101T00',
  'CRS800101HDFRZN05', null, null, 3);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno,
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Ivan Antonio', 'Fernández', 'Cano', 'LGP900101T90',
  'LGP900101MDFRZN06', null, 3, 4);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Marcela', 'Guzmán', 'Martínez', 'MAGM890101T87', 
  'MAGM890101HDFRZN09', null, 1, 2);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Damián Ricardo', 'Sánchez', 'García', 'RSGR890101T78', 
  'RSGR890101HDFRZN10', null, 1, 3);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Brenda Lucrecia', 'Flores', 'Rivera', 'FGVV890101T89', 
  'FGVV890101HDFRZN11', null, 2, 4);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Jorge', 'Pacheco', 'López', 'JPLL890101T00', 
  'JPLL890101HDFRZN12', null, 2, 3);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Lesliee Sarahí', 'Cruz', 'Buenavista', 'EMHH890101T12', 
  'EMHH890101HDFRZN13', null, 3, 1);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Pedro', 'Mendoza', 'Díaz', 'PMDD890101T78', 
  'PMDD890101HDFRZN14', null, 4, 4);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Ana', 'Gutiérrez', 'Ruíz', 'AGRR890101T89', 
  'AGRR890101MDFRZN15', null, 4, 2);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno,
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Héctor Daniel', 'Bueno', 'Hernández', 'HVGJ800101T00',
  'HVGJ800101HDFRZN16', null, 5, 3);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno,
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Saida Mayela', 'Sánchez', 'Calvillo', 'MRMM900101T90',
  'MRMM900101MDFRZN17', null, 5, 1);
insert into empleado (empleado_id, nombre, apellido_paterno, apellido_materno, 
  rfc, curp, foto, jefe_empleado_id, puesto_id)
values (empleado_seq.nextval, 'Gabriel', 'Suárez', 'Castro', 'GSCT890101T87', 
  'GSCT890101HDFRZN18', null, 6, 2);

--Insereción en tabla: vuelo_tripulacion

-- Vuelo 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 90, 1, 1, 1); -- PILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 85, 1, 2, 2); -- COPILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 95, 1, 3, 3); -- JEFE DE SOBRECARGO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 80, 1, 4, 4); -- SOBRECARGO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 82, 1, 5, 4); -- SOBRECARGO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 78, 1, 6, 4); -- SOBRECARGO 3

-- Vuelo 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 92, 2, 7, 1); -- PILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 87, 2, 8, 2); -- COPILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 96, 2, 9, 3); -- JEFE DE SOBRECARGO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 83, 2, 10, 4); -- SOBRECARGO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 84, 2, 11, 4); -- SOBRECARGO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 79, 2, 12, 4); -- SOBRECARGO 3

-- Vuelo 3
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 91, 3, 2, 1); -- PILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 86, 3, 4, 2); -- COPILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 94, 3, 6, 3); -- JEFE DE SOBRECARGO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 81, 3, 7, 4); -- SOBRECARGO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 83, 3, 9, 4); -- SOBRECARGO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 77, 3, 12, 4); -- SOBRECARGO 3

-- Vuelo 4
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 90, 4, 1, 1); -- PILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 85, 4, 2, 2); -- COPILOTO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 86, 4, 7, 2); -- COPILOTO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 88, 4, 3, 5); -- TECNICO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 87, 4, 4, 5); -- TECNICO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 88, 4, 5, 5); -- TECNICO 3
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 89, 4, 6, 5); -- TECNICO 4
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 90, 4, 8, 5); -- TECNICO 5
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 85, 4, 9, 5); -- TECNICO 6
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 83, 4, 10, 5); -- TECNICO 7
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 83, 4, 11, 5); -- TECNICO 8
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 77, 4, 12, 5); -- TECNICO 9
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 91, 4, 14, 5); -- TECNICO 10

-- Vuelo 5
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 92, 5, 11, 1); -- PILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 87, 5, 12, 2); -- COPILOTO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 86, 5, 14, 2); -- COPILOTO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 88, 5, 1, 5); -- TECNICO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 87, 5, 2, 5); -- TECNICO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 86, 5, 3, 5); -- TECNICO 3
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 85, 5, 4, 5); -- TECNICO 4
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 89, 5, 5, 5); -- TECNICO 5
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 88, 5, 6, 5); -- TECNICO 6
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 87, 5, 8, 5); -- TECNICO 7
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 88, 5, 9, 5); -- TECNICO 8
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 89, 5, 10, 5); -- TECNICO 9
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 90, 5, 7, 5); -- TECNICO 10


-- Vuelo 6
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 91, 6, 1, 1); -- PILOTO
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 84, 6, 2, 2); -- COPILOTO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 83, 6, 3, 2); -- COPILOTO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 85, 6, 4, 5); -- TECNICO 1
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 84, 6, 5, 5); -- TECNICO 2
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 83, 6, 6, 5); -- TECNICO 3
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 82, 6, 7, 5); -- TECNICO 4
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 81, 6, 8, 5); -- TECNICO 5
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 80, 6, 9, 5); -- TECNICO 6
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 79, 6, 10, 5); -- TECNICO 7
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 95, 6, 11, 5); -- TECNICO 8
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 88, 6, 12, 5); -- TECNICO 9
insert into vuelo_tripulacion (vuelo_tripulacion_id, desempenio, vuelo_id, empleado_id, rol_id)
values (vuelo_tripulacion_seq.nextval, 75, 6, 13, 5); -- TECNICO 10



-- Inserciones en la tabla: pasajero
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'José', 'jose@gmail.com', to_date('01/01/1980','dd/mm/yyyy'), 
  'JOSE800101MDFRZN03', 'García', 'López');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Ana', 'ana@hotmail.com', to_date('15/05/1990','dd/mm/yyyy'), 
'ANAM900515MDFRZN04', 'Martínez', 'González');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp,
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Pedro', 'pedro@hotmail.com', to_date('01/02/1985','dd/mm/yyyy'),
  'PEDR850201MDFRZN07', 'Hernández', 'Ruiz');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp,
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Laura', 'laura@outlook.com', to_date('15/09/1995','dd/mm/yyyy'),
  'LAUR950915MDFRZN08', 'Ortega', 'Martínez');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Sofía', 'sofia@gmail.com', to_date('10/02/1975','dd/mm/yyyy'), 
  'SOFI750210MDFRZN14', 'Díaz', 'Ruiz');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Alejandro', 'alejandro@hotmail.com', to_date('25/11/1983','dd/mm/yyyy'), 
  'ALEJ831125MDFRZN15', 'Torres', 'Gómez');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Verónica', 'veronica@outlook.com', to_date('03/04/1987','dd/mm/yyyy'),
  'VERO870403MDFRZN16', 'Mendoza', 'Sánchez');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Roberto', 'roberto@gmail.com', to_date('12/09/1978','dd/mm/yyyy'),
  'ROBE780912MDFRZN17', 'Chávez', 'Hernández');
insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp, 
  apellido_paterno, apellido_materno)
values (pasajero_seq.nextval, 'Diana', 'diana@gmail.com', to_date('21/07/1990','dd/mm/yyyy'),
  'DIAN900721MDFRZN18', 'Ramírez', 'Martínez');


-- Inserciones en la tabla: vuelo_pasajero
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 12, 1, null, 1, 1);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 15, 0, 'Silla de ruedas', 2, 1);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 25, 1, null, 5, 1);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 30, 1, null, 6, 1);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 18, 1, null, 3, 2);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 22, 0, 'Silla de ruedas', 4, 2);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 25, 1, null, 5, 3);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 30, 1, null, 6, 3);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 28, 0, 'Silla de ruedas', 7, 2);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 35, 1, null, 8, 2);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 31, 0, 'Silla de ruedas', 9, 2);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 25, 0, null, 5, 2);
insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial, pasajero_id, vuelo_id)
values (vuelo_pasajero_seq.nextval, 30, 1, null, 6, 2);


-- Inserciones de pases de abordo para los pasajeros
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('01/06/2024 07:30', 'dd/mm/yyyy hh24:mi'), 'FOLIO123', 1);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('02/06/2024 09:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO456', 2);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, sysdate, 'FOLIO789', 3);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('04/06/2024 12:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO101', 4);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('05/06/2024 14:30', 'dd/mm/yyyy hh24:mi'), 'FOLIO102', 5);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('06/06/2024 16:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO103', 6);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, sysdate, 'FOLIO104', 7);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('08/06/2024 19:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO105', 8);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('09/06/2024 20:30', 'dd/mm/yyyy hh24:mi'), 'FOLIO106', 9);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('10/06/2024 22:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO107', 10);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('11/06/2024 23:30', 'dd/mm/yyyy hh24:mi'), 'FOLIO108', 11);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('12/06/2024 01:00', 'dd/mm/yyyy hh24:mi'), 'FOLIO109', 12);
insert into pase_abordo (pase_abordo_id, fecha_impresion, folio_abordo, vuelo_pasajero_id)
values (pase_abordo_seq.nextval, to_date('13/06/2024 02:30', 'dd/mm/yyyy hh24:mi'), 'FOLIO110', 13);

-- Inserciones en la tabla: equipaje
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 1, 23.5);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (2, 1, 19.8);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 3, 24.0);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 4, 18.5);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 7, 20.2);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 8, 22.6);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (2, 8, 18.9);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 9, 21.8);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (2, 9, 17.3);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 10, 19.5);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (2, 10, 16.7);
insert into equipaje (num_maleta, pase_abordo_id, peso) values (1, 11, 23.0);

-- Inserciones en la tabla: tipo_paquete
insert into tipo_paquete (tipo_paquete_id, descripcion, indicaciones)
values (tipo_paquete_seq.nextval, 'Documentos', 'Manejar con cuidado');
insert into tipo_paquete (tipo_paquete_id, descripcion, indicaciones)
values (tipo_paquete_seq.nextval, 'Electrónicos', 'Fragil');
insert into tipo_paquete (tipo_paquete_id, descripcion, indicaciones)
values (tipo_paquete_seq.nextval, 'Ropa', 'Manejar con cuidado');
insert into tipo_paquete (tipo_paquete_id, descripcion, indicaciones)
values (tipo_paquete_seq.nextval, 'Vidrio', 'Frágil');

-- Inserciones en la tabla: paquete
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG001234567890', 5.5, 1, 5);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG009876543210', 2.3, 2, 4);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG003456789012', 6.0, 3, 4);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG004321098765', 4.5, 4, 6);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG005678901234', 3.8, 1, 6);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG006789012345', 7.2, 2, 6);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG007890123456', 5.1, 3, 5);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
values (paquete_seq.nextval, 'PKG008901234567', 6.9, 4, 6);

commit;

Prompt Listo!
