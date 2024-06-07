--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación vistas

Prompt Conectando con cf_proy_admin
connect cf_proy_admin/admin

Prompt Creando vistas
--Vista info vuelo
create or replace view v_vuelo_aeronave(
  vuelo_id, fecha_llegada, fecha_salida, sala_abordar, aeronave_matricula
) as 
select v.vuelo_id,v.fecha_llegada,v.fecha_salida,v.sala_abordar,a.matricula
from vuelo v, aeronave a
where v.aeronave_id=a.aeronave_id;


--vista info monitoreo
create or replace view v_monitoreo_vuelo(
  num_monitoreo, vuelo_id, aeronave_matricula, aeropuerto_origen, 
  aeropuerto_llegada
) as
select m.num_monitoreo, m.vuelo_id, a.matricula, ao.nombre, al.nombre
from monitoreo_vuelo m, vuelo v, aeronave a, aeropuerto ao, aeropuerto al
where m.vuelo_id=v.vuelo_id
  and v.aeronave_id=a.aeronave_id
  and v.aeropuerto_origen_id=ao.aeropuerto_id
  and v.aeropuerto_destino_id=al.aeropuerto_id;


--vista info paquete
create or replace view v_info_paquete(
  paquete_id, peso, descripcion, aeropuerto_origen, aeropuerto_llegada
) as
select p.paquete_id, p.peso, tp.descripcion, ao.nombre, al.nombre
from paquete p, tipo_paquete tp, vuelo v, aeropuerto ao, aeropuerto al
where p.tipo_paquete_id=tipo_paquete_id
  and p.vuelo_id=v.vuelo_id
  and v.aeropuerto_origen_id=ao.aeropuerto_id
  and v.aeropuerto_destino_id=al.aeropuerto_id;

Prompt Otorgando persimos para invitado de la vista de monitoreo

grant select on v_monitoreo_vuelo to cf_proy_invitado;
