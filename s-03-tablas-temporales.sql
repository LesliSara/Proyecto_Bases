--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación tabla temporal

Prompt Uso de tabla temporar en vuelo_tripulacion
create private temporary table ora$ptt_vuelo_tripulacion_temporal(
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
) on commit preserve definition;

insert into ora$ptt_vuelo_tripulacion_temporal(
  vuelo_tripulacion_id,desempenio,vuelo_id,empleado_id,rol_id)
values(1000, 50, 1, 1, 1)

commit;

select * from ora$ptt_vuelo_tripulacion_temporal;

insert into vuelo_tripulacion
select * from ora$ptt_vuelo_tripulacion_temporal;

select * from vuelo_tripulacion
where vuelo_tripulacion_id=1000;

commit;

Prompt Listo!
