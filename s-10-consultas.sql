--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación de consultas

@s-03-tablas-temporales.sql

Prompt Consulta 1
-- Se desea ver el promedio de desempeño de todo los empleados
-- en los vuelos que ha participado, además de mostrar su
-- nombre, rol, calificacion del vuelo, el id del vuelo y el 
-- promedio que tiene. Deben estar ordenados por mejor promedio
-- y después por mejor calificación por vuelo. Solo se mostrarán
-- aquellos que tengan promedio mayor a 88

select e.empleado_id, e.nombre as nombre_empleado, vt.vuelo_id,
  r.nombre as rol, vt.desempenio as calificacion, q.promedio_desempenio
from vuelo_tripulacion vt, rol r, empleado e, (
    select empleado_id, avg(desempenio) as promedio_desempenio
    from vuelo_tripulacion 
    group by empleado_id
    having avg(desempenio)>88) q
where vt.rol_id = r.rol_id
  and vt.empleado_id = e.empleado_id
  and vt.empleado_id = q.empleado_id
order by q.promedio_desempenio desc, vt.desempenio desc;

Prompt Consulta 2
-- Se requiere tener la lista de aquellos pasajeros que hayan tenido
-- inconvenientes en sus vuelos, todos aquellos que tuvieran algunos
-- vuelos cancelados o demorados se les dará un apoyo ecónomico
-- y además que hayan tomado más de dos vuelos

select p.nombre, p.apellido_paterno, p.apellido_materno, q.vuelo_id
from pasajero p, (
  (select vp.vuelo_id, vp.pasajero_id
  from cf_vuelo_pasajero vp, p_vuelo v, cf_status_vuelo sv
  where vp.vuelo_id = v.vuelo_id
    and v.status_vuelo_id = sv.status_vuelo_id
    and sv.clave = 'DEMORADO'
  union
  select vp.vuelo_id, vp.pasajero_id
  from cf_vuelo_pasajero vp, p_vuelo v, cf_status_vuelo sv
  where vp.vuelo_id = v.vuelo_id
    and v.status_vuelo_id = sv.status_vuelo_id
    and sv.clave = 'CANCELADO'
  )
  intersect
  (select vp.vuelo_id, vp.pasajero_id
  from cf_vuelo_pasajero vp
  minus
  select vp.vuelo_id, t.pasajero_id
  from vp.cf_vuelo_pasajero, (
    select count(*) as num_vuelos, pasajero_id
    from cf_vuelo_pasajero
    group by pasajero_id
    having count(*)<2 
    ) t
  where vp.pasajero_id = t.pasajero_id
  )
) q
where p.pasajero_id = q.pasajero_id;

Consulta 3
-- Se requiere ver la información monitoreada de los vuelos tomados
-- por el el usuarios con id 5
select  vuelo_id, pasajero_id, p.nombre, vmv.num_monitoreo, 
  vmv.aeronave_matricula, vmv.aeropuerto_origen, vmv.aeropuerto_llegada
from vuelo_pasajero vp 
natural join  v_monitoreo_vuelo vmv
join pasajero p using(pasajero_id) 
where pasajero_id=5;

Consulta 4
-- Se desea mostras todos los datos de los pasajeros, los posibles vuelos 
-- que han tomando y los datos de equipaje si es que tienen 
select p.*, v.* , e.peso as peso_equipaje
from pasajero p 
left join vuelo_pasajero on vp.pasajero_id=p.pasajero_id
left join vuelo v on vp.vuelo_id=v.vuelo_id
left join pase_abordo pa on vp.vuelo_pasajero_id=pa.vuelo_pasajero_id
left join equipaje e on pa.pase_abordo_id=e.pase_abordo_id;

Consulta 5
-- Tabla temporal 
-- Ver el nombre del rol y desmpeño que tiene la tabla temporal
select r.nombre as rol, vt.desempenio
from ora$ptt_vuelo_tripulacion_temporal vt
join rol r 
on vt.rol_id = r.rol_id;

Consulta 6
--Tabla externa
-- Mostrar el nombre de las aeronaves con modelo que contengan 
-- la palabra boeing sin importar mayusculas y minusculas y además
-- mostrar cuántas aeronaves son
select modelo, (
  select count(*) 
  from aeronave_ext 
  where upper(modelo) like '%BOEING%'
) as num_aeronaves_boeing
from aeronave_ext
where upper(modelo) like '%BOEING%'
group by modelo;

