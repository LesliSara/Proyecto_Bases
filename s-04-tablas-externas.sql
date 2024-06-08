--@Autor(es):       Lesliee Sarahí Cruz Buenavista
--                  Brenda Lucrecia Flores Rivera
--@Fecha creación:  03/06/2024
--@Descripción:     Creación tabla externa

--Ejemplo tabla externa
prompt Conectando como sys
connect sys/system as sysdba

prompt Creando un objeto tipo directory
create or replace directory ext_dir as '/unam-bd/proyecto';
--otorgar permisos a cf_proy_admin
grant read, write on directory ext_dir to cf_proy_admin;

prompt Conectando como cf_proy_admin para crear la tabla externa
-- las columnas deben ser nulas y sin constraint
create table aeronave_ext(
  aeronave_id number(10, 0),
  matricula varchar2(10),
  modelo varchar2(50),
  pdf blob,
  es_carga number(1, 0),
  es_comercial number(1, 0)
)
organization external(
  type oracle_loader
  default directory ext_dir
  access parameters (
    records delimited by newline
    badfile ext_dir:'aeronave_ext_bad.log'
    logfile ext_dir:'aeronave_ext.log'
    fields terminated by ','
    lrtrim
    missing field values are null
    (
      aeronave_id, matricula, modelo, pdf, es_carga, es_comercial
    )
  )
  location('aeronave_ext.csv')
) 
reject limit unlimited;

prompt configurando el directorio
--crear directorio
!mkdir -p /unam-bd/proyecto
--tanto el usuario cf_proy_admin requieren leer y escribir
!chmod 777 /unam-bd/proyecto

prompt creando archivo de prueba
!touch /unam-bd/proyecto/aeronave_ext.csv
!echo "1000,AAF2006K3B,Boeing 373,,1" > /unam-bd/proyecto/aeronave_ext.csv
!echo "1001,DANI45EL86,Airbus 484,,0" >> /unam-bd/proyecto/aeronave_ext.csv
!echo "1002,FER1208005, BoeinG 343,,0" >> /unam-bd/proyecto/aeronave_ext.csv
!echo "1004,AAF2006K3B,Boeing 703,,1" > /unam-bd/proyecto/aeronave_ext.csv
!echo "1005,DANI45EL86,Airbus 800,,0" >> /unam-bd/proyecto/aeronave_ext.csv
!echo "1006,FER1208005,boeing 967,,0" >> /unam-bd/proyecto/aeronave_ext.csv
!echo "1OO3,BUENO59045,Boeing,,A" >> /unam-bd/proyecto/aeronave_ext.csv
!echo ",DSFBODSB75,HOLASIHOLA,,2" >> /unam-bd/proyecto/aeronave_ext.csv

prompt Mostrando datos
select * from aeronave_ext;

