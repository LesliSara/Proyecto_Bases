--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Creación de funcion para obtener la lista de empleados 
--                  asignados a un vuelo con sus roles

create or replace function obtener_tripulacion_vuelo(
  p_vuelo_id number
) return sys_refcursor is
  v_tripulacion sys_refcursor;
begin
  open v_tripulacion for
  select e.nombre || ' ' || e.apellido_paterno || ' ' 
    || e.apellido_materno as nombre_completo,
    r.nombre as rol
  from vuelo_tripulacion vt
  join empleado e on vt.empleado_id = e.empleado_id
  join rol r on vt.rol_id = r.rol_id
  where vt.vuelo_id = p_vuelo_id;

  return v_tripulacion;
end;
/
show errors
