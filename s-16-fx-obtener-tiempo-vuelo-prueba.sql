--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba de funcion para obtener el tiempo de duración de un vuelo

declare
  v_vuelo_id vuelo.vuelo_id%type;
  v_fecha_salida vuelo.fecha_salida%type;
  v_fecha_llegada vuelo.fecha_llegada%type;
  v_tiempo_vuelo varchar2(20);
begin
  -- recuperar los datos de vuelos de la tabla de vuelos
  for r in (select vuelo_id, fecha_salida, fecha_llegada from vuelo) loop
    -- asignar los valores recuperados a las variables
    v_vuelo_id := r.vuelo_id;
    v_fecha_salida := r.fecha_salida;
    v_fecha_llegada := r.fecha_llegada;
    
    -- calcular la duración del vuelo usando la función calcular_duracion_vuelo
    v_tiempo_vuelo := calcular_duracion_vuelo(v_fecha_salida, v_fecha_llegada);
    
    -- imprimir los resultados
    dbms_output.put_line('Vuelo id: ' || v_vuelo_id || ', Fecha de salida: ' || v_fecha_salida || ', Fecha de llegada: ' || v_fecha_llegada || ', tiempo de vuelo: ' || v_tiempo_vuelo);
  end loop;
end;
/
show errors