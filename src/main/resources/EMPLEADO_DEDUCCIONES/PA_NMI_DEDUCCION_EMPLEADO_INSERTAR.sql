CREATE OR REPLACE PROCEDURE PA_NMI_DEDUCCION_EMPLEADO_INSERTAR (
    P_IN_TDE_CODIGO IN NMI_DEDUCCION_EMPLEADO.TDE_CODIGO%TYPE,
    P_IN_EMP_CODIGO IN NMI_EMPLEADO_PUESTO.EMP_CODIGO%TYPE,
    P_IN_DEM_ESTADO IN NMI_DEDUCCION_EMPLEADO.DEM_ESTADO%TYPE,
    P_OUT_CODIGO OUT NMI_DEDUCCION_EMPLEADO.DEM_CODIGO%TYPE
)
AS
    V_EPU_CODIGO NMI_DEDUCCION_EMPLEADO.EPU_CODIGO%TYPE;
BEGIN
    SAVEPOINT PS_AN_INSERTAR_DEDUCCION_EMPLEADO ;

    SELECT EP.EPU_CODIGO INTO V_EPU_CODIGO FROM NMI_EMPLEADO_PUESTO EP WHERE EP.EMP_CODIGO = P_IN_EMP_CODIGO AND EP.EPU_ESTADO = 1;

    INSERT INTO NMI_DEDUCCION_EMPLEADO (TDE_CODIGO,EPU_CODIGO,DEM_ESTADO)
    VALUES(P_IN_TDE_CODIGO ,V_EPU_CODIGO,P_IN_DEM_ESTADO)
    RETURNING DEM_CODIGO INTO P_OUT_CODIGO;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO PS_AN_INSERTAR_DEDUCCION_EMPLEADO ;
END;
/