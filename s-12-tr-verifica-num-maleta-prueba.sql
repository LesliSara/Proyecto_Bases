--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba de un trigger que valida el número de maleta en equipaje

set serveroutput on

Prompt ===========================================================
Prompt Prueba 1. Inserción de equipaje con num_maleta consecutivo
Prompt ===========================================================

Prompt Tomando en cuenta las maletas ya insertadas en pase_abordo con id 1
insert into equipaje (num_maleta, pase_abordo_id, peso) values (3, 1, 20.1);

declare 
  v_count number;
begin
  select count(*) into v_count
  from equipaje
  where pase_abordo_id = 1;

  if v_count = 3 then 
    dbms_output.put_line('Prueba 1 Exitosa: Se insertó la maleta 3.');
  else
    raise_application_error(-20010, 'ERROR: no se insertaron los registros correctamente.');
  end if;
end;
/
show errors

Prompt ========================================================================
Prompt Prueba 2. Inserción de equipaje con num_maleta no consecutivo (invalido)
Prompt ========================================================================

declare 
  v_codigo number;
  v_msg varchar2(1000);
begin
  insert into equipaje (num_maleta, pase_abordo_id, peso) values (3, 3, 5.7);
  raise_application_error(-20010, 'ERROR: se insertó equipaje con num_maleta no consecutivo. ' 
    || 'Trigger no está funcionando correctamente.');
exception
  when others then
    v_codigo := sqlcode;
    v_msg := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_msg);
    if v_codigo = -20001 then
      dbms_output.put_line('OK, prueba Exitosa: El trigger lanzó la excepción esperada.');
    else
      dbms_output.put_line('ERROR, se obtuvo excepción no esperada, corregir trigger.');
      raise;
    end if;
end;
/
show errors

select * from equipaje;

rollback;

Prompt Prueba Completada!
