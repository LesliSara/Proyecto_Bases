--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba funcion que genera folios de pase de abordar

declare
  v_folio varchar2(8);
begin
  -- insertar un vuelo_pasajero de prueba
  insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial,
    pasajero_id, vuelo_id)
	values (1010, 2, 1, null, 8, 1);

  -- llamar a la función para generar el pase de abordo
  v_folio := generar_folio_pase_abordo(1010);

  -- mostrar el resultado
  dbms_output.put_line(v_folio);
end;
/
show errors
