--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación de usuarios

prompt Conectando con sys
connect sys/system as sysdba
prompt Limpiando

declare
  cursor cur_usuarios is
    select username from dba_users where username like 'CF_PROY%';
  cursor cur_roles is
    select role from dba_roles where role like 'CF_PROY%';
begin

  for r in cur_usuarios loop
    execute immediate 'drop user '||r.username||' cascade';
  end loop;

  for r in cur_roles loop
    execute immediate 'drop role '||r.role;
  end loop;

end;
/

--Creación de usarios y privilegios para cada usuario
prompt creando usuario cf_proy_admin
create user cf_proy_admin identified by admin quota 1024m on users;

Prompt creando al usuario cf_proy_invitado
create user cf_proy_invitado identified by invitado;

--Creación de roles y asignación de privilegios
Prompt creando roles
create role cf_proy_rol_admin not identified;
grant create session, create table, create procedure, create sequence,
	create trigger, create view, create synonym, create public synonym to cf_proy_rol_admin;

create role cf_proy_rol_invitado not identified;
grant create session to cf_proy_rol_invitado;

--Asignación de roles a usuarios
Prompt Asignando roles

grant cf_proy_rol_admin to cf_proy_admin;
grant cf_proy_rol_invitado to cf_proy_invitado;

Prompt Listo!

commit;