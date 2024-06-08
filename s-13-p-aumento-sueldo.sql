--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Creación procedimiento del aumento de sueldo dependiendo su promedio

create or replace procedure p_empleado_aumento is

  cursor c_empleados is
    -- Seleccionar los empleados y calcular su promedio de desempeño
    select e.empleado_id, e.puesto_id,
      avg(vt.desempenio) as promedio_desempenio
    from empleado e
    join vuelo_tripulacion vt on e.empleado_id = vt.empleado_id
    group by e.empleado_id, e.puesto_id;

begin
  for r in c_empleados loop
    if r.promedio_desempenio > 90 or r.puesto_id = 1 then
      if r.puesto_id = 1 then
        -- Aumentar el sueldo en un 10% si es piloto
        update empleado
        set nuevo_sueldo = (
          select sueldo from puesto 
          where puesto_id=r.puesto_id)* 1.1
        where empleado_id = r.empleado_id;
        dbms_output.put_line('Sueldo del piloto con id: ' 
          || r.empleado_id 
          || ' aumentado en un 10%.');
      else
        -- Aumentar el sueldo en un 5% para otros empleados
        update empleado
        set nuevo_sueldo = (
          select sueldo from puesto 
          where puesto_id=r.puesto_id)* 1.05
        where empleado_id = r.empleado_id;
        dbms_output.put_line('Sueldo del empleado con id: ' 
          || r.empleado_id 
          || ' aumentado en un 5%.');
      end if;
    end if;
  end loop;
  commit;

exception
  when no_data_found then
    -- Manejo de excepción si no se encuentran empleados con un promedio 
    -- de desempeño mayor a 90
    dbms_output.put_line('No se encontraron empleados con un promedio '
      ||'de desempeño mayor a 90.');
  when others then
    -- Manejo de excepción genérica
    dbms_output.put_line('Error al intentar aumentar los sueldos de los '
      ||'empleados con un promedio de desempeño mayor a 90.');
end;
/
show errors