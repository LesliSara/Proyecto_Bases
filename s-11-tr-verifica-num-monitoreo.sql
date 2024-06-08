--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  06/06/2024
--@Descripción:     Creación de un trigger que valida que el numero de la
--                  monitoreo sea consecutivo

set serveroutput on

create or replace trigger t_valida_num_monitoreo
before insert on monitoreo_vuelo
for each row
declare
  v_max_num_monitoreo number;
  v_expected_num_monitoreo number;
begin
  -- Obtener el máximo num_monitoreo para el vuelo_id actual
  select nvl(max(num_monitoreo), 0)
  into v_max_num_monitoreo
  from monitoreo_vuelo
  where vuelo_id = :new.vuelo_id;

  -- Calcular el siguiente valor esperado
  v_expected_num_monitoreo := v_max_num_monitoreo + 1;

  -- Verificar si el num_monitoreo es el esperado
  if :new.num_monitoreo != v_expected_num_monitoreo then
    raise_application_error(-20001, 'Error en el monitoreo: '
      || :new.num_monitoreo
      || ' con vuelo_id: '
      || :new.vuelo_id
      || '. No es consecutivo.');
  end if;
end;
/
show errors;