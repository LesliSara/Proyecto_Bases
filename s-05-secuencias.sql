--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación secuencias

-- secuencia para la tabla: aeronave
create sequence aeronave_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: aeropuerto
create sequence aeropuerto_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: status_vuelo
create sequence status_vuelo_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: vuelo
create sequence vuelo_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: historial_status_vuelo
create sequence historial_status_vuelo_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: puesto
create sequence puesto_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: rol
create sequence rol_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: empleado
create sequence empleado_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: direccion_internet
create sequence direccion_internet_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: vuelo_tripulacion
create sequence vuelo_tripulacion_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: pasajero
create sequence pasajero_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: vuelo_pasajero
create sequence vuelo_pasajero_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: pase_abordo
create sequence pase_abordo_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: tipo_paquete
create sequence tipo_paquete_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

-- secuencia para la tabla: paquete
create sequence paquete_seq
  start with 1
  increment by 1
  nominvalue
  nomaxvalue
  cache 20
  order;

Prompt Creación de secuencias listas!
