CREATE OR REPLACE PROCEDURE PA_NMI_BONIFICACION_INSERTAR (
    P_IN_NOMBRE in NMI_BONIFICACION.BON_NOMBRE%TYPE,
    P_IN_DESCRIPCION in NMI_BONIFICACION.BON_DESCRIPCION%TYPE,
    P_IN_MONTO in NMI_BONIFICACION.BON_MONTO%TYPE,
    P_IN_PORCENTAJE in NMI_BONIFICACION.BON_PORCENTAJE%TYPe,
    P_IN_ESTADO in NMI_BONIFICACION.BON_ESTADO%TYPE,
    P_OUT_CODIGO out NMI_BONIFICACION.BON_CODIGO%TYPE
)
AS
BEGIN
    SAVEPOINT PS_AN_INSERTAR_BONIFICACION ;
    
    INSERT INTO NMI_BONIFICACION (BON_NOMBRE,BON_DESCRIPCION,BON_MONTO,BON_PORCENTAJE,BON_ESTADO)
        VALUES(P_IN_NOMBRE,P_IN_DESCRIPCION,P_IN_MONTO,P_IN_PORCENTAJE,P_IN_ESTADO)
        RETURNING BON_CODIGO INTO P_OUT_CODIGO;
    
    COMMIT;
EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK TO PS_AN_INSERTAR_BONIFICACION;
END;
/
