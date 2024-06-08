--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  06/07/2024
--@Descripción:     Creación de un trigger que valida la carga de la aeronave

set serveroutput on

create or replace trigger t_valida_carga
  before insert on paquete
  for each row 
declare 
  v_count_tipo number;
begin 
  select count(*) into v_count_tipo 
  from paquete p 
  join vuelo v on p.vuelo_id=v.vuelo_id
  join aeronave a on v.aeronave_id=a.aeronave_id
  where a.es_carga = 1
    and p.vuelo_id = :new.vuelo_id;  

  if v_count_tipo = 0 then 
    raise_application_error(-20001, 'Error en vuelo de carga con vuelo ID '
      || :new.vuelo_id
      || '. Tipo de aeronave no válida.');
  end if;
end;
/
show errors
