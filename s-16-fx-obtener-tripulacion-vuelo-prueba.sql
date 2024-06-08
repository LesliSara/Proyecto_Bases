--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  07/06/2024
--@Descripción:     Prueba funcion para obtener la lista de empleados asignados 
--									a un vuelo con sus roles

declare
  v_tripulacion sys_refcursor;
  v_nombre_completo varchar2(120);
  v_rol varchar2(40);
begin
  -- llamada a la función con un id de vuelo 4
  v_tripulacion := obtener_tripulacion_vuelo(4); 

  -- procesar el cursor devuelto
  loop
    fetch v_tripulacion into v_nombre_completo, v_rol;
    exit when v_tripulacion%notfound;

    -- imprimir los resultados
    dbms_output.put_line('Nombre: ' || v_nombre_completo || ', rol: ' || v_rol);
  end loop;

  -- cerrar el cursor
  close v_tripulacion;
end;
/
show errors
