--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba del procedimiento de aumento de sueldo para empleados

set serveroutput on

Prompt ===========================================================
Prompt Prueba 1: Aumento de sueldo para pilotos con promedio alto
Prompt           y empleados con promedio alto
Prompt ===========================================================

begin
  p_empleado_aumento;
end;
/
show errors

select * from empleado;
rollback

Prompt Prueba Completada!