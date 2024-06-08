--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación indices

Prompt Creación de índices
--Indices UNIQUE
create unique index aeronave_matricula_iuk on aeronave(matricula);

--Indices NON UNIQUE
create index pasajero_email_ix on pasajero(email);
create index vuelo_sala_abordar_ix on vuelo(sala_abordar);

--Indices POR FUNCION
create index vuelo_fecha_llegada_ifx
  on vuelo(to_char(fecha_llegada,'mm/yyyy'));
create index vuelo_fecha_salida_ifx
  on vuelo(to_char(fecha_salida,'mm/yyyy'));

--Indices COMPUESTOS

create unique index direccion_internet_empleado_iuk
  on direccion_internet(url,empleado_id);
create unique index vuelo_aeronave_salida_iuk
  on vuelo(aeronave_id,fecha_salida);
create unique index vuelo_aeronave_llegada_iuk
  on vuelo(aeronave_id,fecha_llegada);
create unique index historial_status_vuelo_iuk
  on historial_status_vuelo(status_vuelo_id,vuelo_id);
create unique index vuelo_tripulacion_empleado_iuk
  on vuelo_tripulacion(vuelo_id,empleado_id);
create unique index vuelo_pasajero_asiento_iuk
  on vuelo_pasajero(num_asiento,vuelo_id);
create unique index vuelo_pasajero_iuk
  on vuelo_pasajero(pasajero_id,vuelo_id);

Prompt Listo!