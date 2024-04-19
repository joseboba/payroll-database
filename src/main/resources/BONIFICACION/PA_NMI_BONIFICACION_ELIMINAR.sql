CREATE OR REPLACE PROCEDURE PA_NMI_BONIFICACION_ELIMINAR (
    P_IN_CODIGO IN NMI_BONIFICACION.BON_CODIGO%TYPE
)
AS
BEGIN
    SAVEPOINT PS_AN_ELIMINAR_BONIFICACION ;
    
    DELETE FROM NMI_BONIFICACION WHERE BON_CODIGO = P_IN_CODIGO;
    
    COMMIT;
EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK TO PS_AN_ELIMINAR_BONIFICACION ;
END;
/