--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  06/07/2024
--@Descripción:     Creación de un trigger que valida la aeronave comercial

set serveroutput on

create or replace trigger t_valida_comercial 
  before insert on vuelo_pasajero
  for each row 
declare 
  v_count_tipo number;
begin 
  select count(*) into v_count_tipo 
  from vuelo_pasajero vp 
  join vuelo v on vp.vuelo_id=v.vuelo_id
  join aeronave a on v.aeronave_id=a.aeronave_id
  where a.es_comercial = 1
    and vp.vuelo_id = :new.vuelo_id;  

  if v_count_tipo = 0 then 
    raise_application_error(-20001, 'Error en vuelo comercial con vuelo ID: '
      || :new.vuelo_id
      || '. Tipo de aeronave no válida.');
  end if;
end;
/
show errors
