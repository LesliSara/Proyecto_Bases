--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación tabla temporal

Prompt Conectando con cf_proy_admin
connect cf_proy_admin/admin

Prompt Uso de tabla temporal en vuelo_tripulacion
create private temporary table ora$ptt_vuelo_tripulacion_temporal(
  vuelo_tripulacion_id number(10, 0),
  desempenio number(3, 0),
  vuelo_id number(5, 0),
  empleado_id number(10, 0),
  rol_id number(10, 0)
) on commit preserve definition;

insert into ora$ptt_vuelo_tripulacion_temporal(
  vuelo_tripulacion_id,desempenio,vuelo_id,empleado_id,rol_id)
values(1000, 50, 1, 1, 1);

commit;

select * from ora$ptt_vuelo_tripulacion_temporal;

Prompt Listo!
