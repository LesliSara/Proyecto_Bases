--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba funcion que genera folios de pase de abordar

declare
	v_vuelo_id number;
  v_pasajero_id number;
  v_vuelo_pasajero_id number;
  v_folio varchar2(50);
begin
  -- insertar un vuelo de prueba
  insert into vuelo (vuelo_id, fecha_llegada, fecha_salida, aeropuerto_origen_id,
    aeropuerto_destino_id, status_vuelo_id, aeronave_id) 
	values (vuelo_seq.nextval, sysdate + 1,sysdate, 1, 2, 1, 1)
  returning vuelo_id into v_vuelo_id;

	-- insertar un pasajero de prueba
  insert into pasajero (pasajero_id, nombre, email, fecha_nacimiento, curp,
    apellido_paterno, apellido_materno) 
	values (pasajero_seq.nextval,'Juan','juan@gmail.com', to_date('1980-01-01', 'yyyy-mm-dd'),
  	'PEGJ010180HDFRNSA0', 'Perez', 'Gomez') 
	returning pasajero_id into v_pasajero_id;

  -- insertar un vuelo_pasajero de prueba
  insert into vuelo_pasajero (vuelo_pasajero_id, num_asiento, presento, atencion_especial,
    pasajero_id, vuelo_id)
	values ( vuelo_pasajero_seq.nextval, 1, 1, null, v_pasajero_id, v_vuelo_id) 
	returning vuelo_pasajero_id into v_vuelo_pasajero_id;

  -- llamar a la función para generar el pase de abordo
  v_folio := generar_folio_pase_abordo(v_vuelo_pasajero_id);

  -- mostrar el resultado
  dbms_output.put_line(v_folio);

	select * from pase_abordo
	where folio_abordo=v_folio;

end;
/
show errors
