--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Creación de funcion que genera folios de pase de abordar

create or replace function generar_folio_pase_abordo (
  p_vuelo_pasajero_id number
) return varchar2 is
  v_pase_abordo_id number;
  v_folio_abordo varchar2(8);
begin
  select pase_abordo_seq.nextval into v_pase_abordo_id from dual;
    
  -- genera un folio único basado en el pase_abordo_id y un sufijo aleatorio
  v_folio_abordo := to_char(v_pase_abordo_id) || '-' || dbms_random.string('x', 8);

  insert into pase_abordo (pase_abordo_id,folio_abordo, vuelo_pasajero_id) 
	values (v_pase_abordo_id, v_folio_abordo, p_vuelo_pasajero_id);

  return 'Pase de abordar generado exitosamente con folio ' || v_folio_abordo;
end;
/
show errors
