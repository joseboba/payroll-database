CREATE OR REPLACE FUNCTION FN_OBTENER_BONIFICACION_POR_ID(
    P_IN_BON_CODIGO IN NMI_BONIFICACION.BON_CODIGO%TYPE
)
    RETURN SYS_REFCURSOR
    IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
    OPEN CUR_REGISTROS FOR
SELECT
    BON_CODIGO,
    BON_NOMBRE,
    BON_DESCRIPCION,
    BON_MONTO,
    BON_PORCENTAJE,
    BON_ESTADO
FROM NMI_BONIFICACION
WHERE BON_CODIGO = P_IN_BON_CODIGO
ORDER BY BON_CODIGO;
RETURN CUR_REGISTROS;
END;
/