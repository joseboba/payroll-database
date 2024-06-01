CREATE OR REPLACE FUNCTION FN_OBTENER_TODO_AUSENCIAS
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
    a.aus_fecha_regreso,
    EP.EMP_CODIGO,
    E.EMP_PRIMER_NOMBRE,
    E.EMP_PRIMER_APELLIDO,
    ta.tau_nombre,
    td.tds_nombre
FROM NMI_AUSENCIA A INNER JOIN
     NMI_EMPLEADO_PUESTO EP ON O.EPU_CODIGO = EP.EPU_CODIGO
                        INNER JOIN NMI_EMPLEADO E ON EP.EMP_CODIGO = E.EMP_CODIGO,
     NMI_TIPO_AUSENCIA TA, NMI_TIPO_DESCUENTO TD
WHERE EP.EPU_ESTADO = 1 AND
  a.tau_codigo=ta.tau_codigo AND
  a.tds_codigo=td.tds_codigo
ORDER BY A.AUS_CODIGO;
RETURN CUR_REGISTROS;
END;
/