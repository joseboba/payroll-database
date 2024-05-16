CREATE OR REPLACE PROCEDURE PA_NMI_VENTA_GUARDAR(
    P_IN_EMP_CODIGO IN NMI_EMPLEADO.EMP_CODIGO%TYPE,
    P_IN_VEN_MONTO IN NMI_VENTA.VEN_MONTO%TYPE,
    P_IN_VEN_FECHA IN VARCHAR,
    P_OUT_VEN_CODIGO OUT NMI_VENTA.VEN_CODIGO%TYPE
) AS
    V_EMPLEADO_PUESTO NMI_EMPLEADO_PUESTO.EPU_CODIGO%TYPE;
BEGIN
    SAVEPOINT PS_AN_VENTA_GUARDAR;

    SELECT EPU_CODIGO INTO V_EMPLEADO_PUESTO
        FROM NMI_EMPLEADO_PUESTO
            WHERE EMP_CODIGO = P_IN_EMP_CODIGO
                AND ROWNUM = 1;

    INSERT INTO NMI_VENTA(EPU_CODIGO, VEN_MONTO, VEN_FECHA)
        VALUES (V_EMPLEADO_PUESTO, P_IN_VEN_MONTO, TO_TIMESTAMP(P_IN_VEN_FECHA, 'DD-MM-YYYY'))
            RETURNING VEN_CODIGO INTO P_OUT_VEN_CODIGO;

    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO SAVEPOINT PS_AN_VENTA_GUARDAR;
END PA_NMI_VENTA_GUARDAR;
/
