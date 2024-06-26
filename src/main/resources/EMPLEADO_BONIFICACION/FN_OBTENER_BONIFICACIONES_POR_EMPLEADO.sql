CREATE OR REPLACE FUNCTION FN_OBTENER_BONIFICACIONES_POR_EMPLEADO(
    P_IN_EMP_CODIGO NMI_EMPLEADO.EMP_CODIGO%TYPE
)
RETURN SYS_REFCURSOR
IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
    OPEN CUR_REGISTROS FOR
SELECT  EP.EMP_CODIGO, EP.EPU_CODIGO, EB.EBO_CODIGO EMPLEADO_BONIFICACION_CODIGO, EB.EBO_ESTADO,
        B.BON_CODIGO, B.BON_NOMBRE, B.BON_DESCRIPCION, B.BON_MONTO, B.BON_PORCENTAJE,
        B.BON_ESTADO
FROM
    NMI_BONIFICACION B,
    NMI_EMPLEADO_BONIFICACION EB,
    NMI_EMPLEADO_PUESTO EP
WHERE
    B.BON_CODIGO = EB.BON_CODIGO AND
    EB.EPU_CODIGO = EP.EPU_CODIGO AND
    B.BON_ESTADO = 1 AND
    EP.EMP_CODIGO = P_IN_EMP_CODIGO AND
    EP.EPU_ESTADO = 1;
RETURN CUR_REGISTROS;
END;
/