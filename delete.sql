prompt Conectando con sys
connect sys/system as sysdba
prompt Limpiando
BEGIN
    FOR rec IN (SELECT SID, SERIAL# FROM v$session WHERE USERNAME = 'CF_PROY_ADMIN') LOOP
        EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION ''' || rec.SID || ',' || rec.SERIAL# || ''' IMMEDIATE';
    END LOOP;
    FOR rec IN (SELECT SID, SERIAL# FROM v$session WHERE USERNAME = 'CF_PROY_INVITADO') LOOP
        EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION ''' || rec.SID || ',' || rec.SERIAL# || ''' IMMEDIATE';
    END LOOP;
END;
/

-- Espera un momento para asegurarte de que las sesiones se hayan cerrado
EXEC DBMS_LOCK.SLEEP(5);

-- Elimina el usuario
DROP USER cf_proy_admin CASCADE;
DROP USER cf_proy_invitado CASCADE;
