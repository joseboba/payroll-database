CREATE OR REPLACE PROCEDURE PA_NMI_TIPO_SUSPENSION_INSERTAR (
    P_IN_NOMBRE in NMI_TIPO_SUSPENSION.TSU_NOMBRE%type,
    P_IN_DESCRIPCION in NMI_TIPO_SUSPENSION.TSU_DESCRIPCION%type,
    P_OUT_CODIGO out NMI_TIPO_SUSPENSION.TSU_CODIGO%type
)
AS
BEGIN
    SAVEPOINT PS_AN_INSERTAR_TIPO_SUSPENSION;
    
    INSERT INTO NMI_TIPO_SUSPENSION (TSU_NOMBRE,TSU_DESCRIPCION)
        VALUES(P_IN_NOMBRE,P_IN_DESCRIPCION)
        RETURNING TSU_CODIGO INTO P_OUT_CODIGO;
    
    COMMIT;
EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK TO PS_AN_INSERTAR_TIPO_SUSPENSION;
END;
/