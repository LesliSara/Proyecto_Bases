--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Creación de funcion que genera folios de pase de abordar

create or replace function generar_folio_pase_abordo (
  p_vuelo_pasajero_id number
) return varchar2 is
  v_folio_abordo varchar2(8);
  v_pase_abordo_id number;
  v_random_string varchar2(4);
begin
  -- Obtener el próximo valor de la secuencia
  select pase_abordo_seq.nextval into v_pase_abordo_id from dual;

  -- Generar un sufijo aleatorio de 4 caracteres
  v_random_string := dbms_random.string('x', 4);

  -- Tomar los últimos 4 dígitos del pase_abordo_id y concatenar con la cadena aleatoria
  v_folio_abordo := v_random_string || to_char(v_pase_abordo_id, 'FM0000');

  -- Insertar el nuevo pase de abordo
  insert into pase_abordo (pase_abordo_id, folio_abordo, vuelo_pasajero_id) 
  values (v_pase_abordo_id, v_folio_abordo, p_vuelo_pasajero_id);

  return v_folio_abordo;
end;
/
show errors;
