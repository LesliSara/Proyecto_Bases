--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  06/06/2024
--@Descripción:     Creación de un trigger que valida que el numero de la
--                  maleta sea consecutivo

set serveroutput on

create or replace trigger t_valida_num_maleta
before insert on equipaje
for each row
declare
  v_max_num_maleta number;
  v_expected_num_maleta number;
begin
  -- Obtener el máximo num_maleta para el pase_abordo_id actual
  select nvl(max(num_maleta), 0)
  into v_max_num_maleta
  from equipaje
  where pase_abordo_id = :new.pase_abordo_id;

  -- Calcular el siguiente valor esperado
  v_expected_num_maleta := v_max_num_maleta + 1;

  -- Verificar si el num_maleta es el esperado
  if :new.num_maleta != v_expected_num_maleta then
    raise_application_error(-20001, 'Error en la maleta: '
      || :new.num_maleta
      || ' con pase_abordo_id: '
      || :new.pase_abordo_id
      || '. No es consecutivo.');
  end if;
end;
/
show errors;
