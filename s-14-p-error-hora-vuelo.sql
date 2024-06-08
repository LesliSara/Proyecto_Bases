--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba del procedimiento para corregir la hora de llegada de 
--                  ciertos vuelos

set serveroutput on

Prompt ================================================================
Prompt Prueba 1: Corrección de la hora de llegada de vuelos existentes
Prompt ================================================================

begin
  corregir_hora_llegada_por_fecha(to_date('10/06/2024 12:00', 'dd/mm/yyyy hh24:mi'),
   to_date('10/06/2024 11:00', 'dd/mm/yyyy hh24:mi'));
end;
/

Prompt
Prompt
Prompt

Prompt ================================================================
Prompt Prueba 2: Intento de corrección de hora de vuelos inexistentes
Prompt ================================================================

begin
  corregir_hora_llegada_por_fecha('to_date('10/06/2024 14:00', 'dd/mm/yyyy hh24:mi')',
  to_date('10/06/2024 15:00', 'dd/mm/yyyy hh24:mi'));
end;
/
show errors

select * from vuelo;

rollback

Prompt Prueba Completada!
