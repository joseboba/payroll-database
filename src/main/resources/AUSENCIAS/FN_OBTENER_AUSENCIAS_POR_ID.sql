CREATE OR REPLACE FUNCTION FN_OBTENER_AUSENCIAS_POR_ID(
    P_IN_AUS_CODIGO IN NMI_AUSENCIA.AUS_CODIGO%TYPE
)
    RETURN SYS_REFCURSOR
    IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
    OPEN CUR_REGISTROS FOR
SELECT
    A.AUS_CODIGO,
    A.EPU_CODIGO,
    A.TAU_CODIGO,
    A.TDS_CODIGO,
    A.AUS_FECHA_SALIDA,
    A.AUS_FECHA_REGRESO,
    EP.EMP_CODIGO,
    E.EMP_PRIMER_NOMBRE,
    E.EMP_PRIMER_APELLIDO,
    TA.TAU_NOMBRE,
    TD.TDS_NOMBRE
FROM NMI_AUSENCIA A INNER JOIN
     NMI_EMPLEADO_PUESTO EP ON A.EPU_CODIGO = EP.EPU_CODIGO
                        INNER JOIN NMI_EMPLEADO E ON EP.EMP_CODIGO = E.EMP_CODIGO,
     NMI_TIPO_AUSENCIA TA, NMI_TIPO_DESCUENTO TD
WHERE A.AUS_CODIGO = P_IN_AUS_CODIGO AND
    EP.EPU_ESTADO = 1 AND
    A.TAU_CODIGO = TA.TAU_CODIGO AND
    a.tds_codigo = td.tds_codigo
ORDER BY A.AUS_CODIGO;
RETURN CUR_REGISTROS;
END;
/