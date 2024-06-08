--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  06/07/2024
--@Descripción:     Prueba de un trigger que valida la aeronave comercial

set serveroutput on

Prompt ========================================================
Prompt Prueba 1. Inserción de un pasajero en vuelo comercial
Prompt ========================================================

insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, 
  atencion_especial, pasajero_id, vuelo_id)
values (1000, 13, 1, null, 2, 1);

declare 
  v_count number;
  v_vuelo_pasajero_id number := 1000;
begin
  select count(*) into v_count
  from vuelo_pasajero
  where vuelo_pasajero_id = v_vuelo_pasajero_id
    and vuelo_id = 1;
  if v_count > 0 then 
    dbms_output.put_line('El trigger funciona');
  else
    raise_application_error(-20010, 'ERROR: el registro no se insertó. 
      Corregir trigger');
  end if;
end;
/
show errors

Prompt
Prompt
Prompt

Prompt ================================================================
Prompt Prueba 2. Inserción de un paquete en vuelo comericial (invalido)
Prompt ================================================================

declare 
  v_codigo number;
  v_msg varchar2(1000);
begin
  
  insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, 
    atencion_especial, pasajero_id, vuelo_id)
  values (1001, 14, 1, null, 3, 6);

  raise_application_error(-20010, 'ERROR: se insertó un paquete en un vuelo comercial'||
    'Trigger no está funcionando correctamente.');
  exception
  when others then
    v_codigo := sqlcode;
    v_msg := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_msg);
    if v_codigo = -20001 then
    	dbms_output.put_line('OK, prueba Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    	raise;
    end if;
end;
/
show errors

select * from vuelo_pasaje;

rollback

Prompt Prueba Completada!