--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Creación de funcion para obtener el tiempo de duración de un vuelo

create or replace function calcular_duracion_vuelo(
  p_hora_salida in date,
  p_hora_llegada in date
)
return varchar2 is
  v_duracion interval day to second;
  v_horas number;
  v_minutos number;
  v_resultado varchar2(20);
begin
  -- calcular la duración en interval day to second
  v_duracion := p_hora_llegada - p_hora_salida;

  -- extraer horas y minutos de la duración
  v_horas := extract(hour from v_duracion) + extract(day from v_duracion) * 24;
  v_minutos := extract(minute from v_duracion);

  -- formatear el resultado como 'hh24:mi'
  v_resultado := lpad(v_horas, 2, '0') || ':' || lpad(v_minutos, 2, '0');
    
  return v_resultado;
end;
/
show errors;