CREATE OR REPLACE PROCEDURE PA_NMI_SUSPENSION_ELIMINAR (
     P_IN_CODIGO IN NMI_SUSPENSION.SUS_CODIGO%TYPE
)
AS
BEGIN
    SAVEPOINT PS_AN_ELIMINAR_SUS;
    
    DELETE FROM NMI_SUSPENSION WHERE SUS_CODIGO = P_IN_CODIGO;
    
    COMMIT;
EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK TO  PS_AN_ELIMINAR_SUSPENSION;
END;
/
