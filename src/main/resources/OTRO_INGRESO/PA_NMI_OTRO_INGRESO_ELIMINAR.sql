CREATE OR REPLACE PROCEDURE PA_NMI_OTRO_INGRESO_ELIMINAR (
     P_IN_CODIGO IN NMI_OTRO_INGRESO.OIN_CODIGO%TYPE
)
AS
BEGIN
    SAVEPOINT PS_AN_ELIMINAR_OTRO_INGRESO;
    
    DELETE FROM NMI_OTRO_INGRESO WHERE OIN_CODIGO = P_IN_CODIGO;
    
    COMMIT;
EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK TO  PS_AN_ELIMINAR_OTRO_INGRESO;
END;
/