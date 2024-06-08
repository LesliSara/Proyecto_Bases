--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Creación de un procedimiento que corrige la hora de llegada de
--                  ciertos vuelos

create or replace procedure corregir_hora_llegada_por_fecha(
    p_fecha_vieja in date,
    p_fecha_nueva in date
) is

declare

  cursor c_vuelos is
    select vuelo_id, fecha_llegada
    from vuelo;
        
begin
  -- recorrer el cursor y actualizar la hora de llegada si la fecha coincide
  for r in c_vuelos loop
    if r.fecha_llegada= p_fecha_origen then
      -- actualizar la hora de llegada del vuelo
      update vuelo
      set fecha_llegada = p_fecha_nueva
      where vuelo_id = r.vuelo_id;
 
      -- mostrar mensaje de éxito
      dbms_output.put_line('Hora de llegada del vuelo con id ' 
        || rec.vuelo_id 
        || ' cambiada de ' 
        || to_char(r.fecha_llegada, 'dd/mm/yyyy hh24:mi') 
        || ' a ' 
        || to_char(p_fecha_nueva, 'dd/mm/yyyy hh24:mi'));
    end if;
  end loop;  
  -- confirmar la transacción
  commit;

exception
  when no_data_found then
    dbms_output.put_line('No se encontraron vuelos en la fecha especificada.');
  when others then
    dbms_output.put_line('Error al intentar corregir la hora de llegada de los vuelos en la fecha especificada.');
end;
/
show errors