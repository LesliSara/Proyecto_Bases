--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación sinonimos

Prompt Creación de los sinonimos

--Sinonimos publicos que le pertenezcan a admin

create or replace public synonym p_pasajero for cf_proy_admin.pasajero;
create or replace public synonym p_vuelo for cf_proy_admin.vuelo;
create or replace public synonym p_aeropuerto for cf_proy_admin.aeropuerto;

--Otorgar persimos de lectura a usuario invitado


grant select on paquete to cf_proy_invitado;
grant select on vuelo to cf_proy_invitado;
grant select on vuelo_pasajero to cf_proy_invitado;
grant select on pasajero to cf_proy_invitado;
grant select on aeropuerto to cf_proy_invitado;
grant select on aeronave to cf_proy_invitado;
grant select on status_vuelo to cf_proy_invitado;

-- Otorgando permisos de crear sinonimos
Prompt Conectando con sys
connect sys/system as sysdba

grant create synonym to cf_proy_invitado;

--Creando sinonimos privados a invitado
prompt Conectando con invitado
connect cf_proy_invitado/invitado

create or replace synonym i_paquete for cf_proy_admin.paquete;
create or replace synonym i_vuelo for cf_proy_admin.vuelo;
create or replace synonym i_vuelo_pasaje for cf_proy_admin.vuelo_pasaje;
create or replace synonym i_pasajero for cf_proy_admin.pasajero;
create or replace synonym i_aeropuerto for cf_proy_admin.aeropuerto;
create or replace synonym i_aeronave for cf_proy_admin.aeronave;
create or replace synonym i_status_vuelo for cf_proy_admin.status_vuelo;

Prompt Listo!

Prompt Conectando con cf_proy_admin
connect cf_proy_admin/admin

--Creando sinonimos privados con iniciales

declare
    v_table_name varchar2(50);
    v_synonym_name varchar2(50);
begin
    for i in (select table_name from all_tables where owner = 'CF_PROY_ADMIN') loop
        v_table_name := i.table_name;
        v_synonym_name := 'CF_' || v_table_name;

        execute immediate 'CREATE SYNONYM ' || v_synonym_name || ' FOR CF_PROY_ADMIN.' || v_table_name;
    end loop;
end;
/