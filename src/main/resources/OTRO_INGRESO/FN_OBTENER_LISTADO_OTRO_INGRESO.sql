CREATE OR REPLACE FUNCTION FN_OBTENER_LISTADO_OTRO_INGRESO(
    P_IN_SEARCH IN VARCHAR2,
    P_IN_SIZE IN NUMBER,
    P_IN_PAGE IN NUMBER
)
    RETURN SYS_REFCURSOR
    IS
    CUR_REGISTROS SYS_REFCURSOR;
V_NEW_PAGE    NUMBER := 0;
BEGIN
    V_NEW_PAGE := P_IN_PAGE * P_IN_SIZE;
OPEN CUR_REGISTROS FOR
SELECT
    O.OIN_CODIGO,
    O.EPU_CODIGO,
    O.OIN_MONTO,
    O.OIN_FECHA,
    EP.EMP_CODIGO,
    E.EMP_PRIMER_NOMBRE,
    E.EMP_PRIMER_APELLIDO
FROM NMI_OTRO_INGRESO O INNER JOIN
     NMI_EMPLEADO_PUESTO EP ON O.EPU_CODIGO = EP.EPU_CODIGO
                        INNER JOIN NMI_EMPLEADO E ON EP.EMP_CODIGO = E.EMP_CODIGO
WHERE EP.EPU_ESTADO = 1 AND (
    (P_IN_SEARCH IS NULL OR UPPER(O.OIN_CODIGO) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
        OR (P_IN_SEARCH IS NULL OR UPPER(O.EPU_CODIGO) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
        OR (P_IN_SEARCH IS NULL OR UPPER(O.OIN_MONTO) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
        OR (P_IN_SEARCH IS NULL OR UPPER(O.OIN_FECHA) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
        OR (P_IN_SEARCH IS NULL OR UPPER(EP.EMP_CODIGO) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
        OR (P_IN_SEARCH IS NULL OR UPPER(E.EMP_PRIMER_NOMBRE) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
        OR (P_IN_SEARCH IS NULL OR UPPER(E.EMP_PRIMER_APELLIDO) LIKE '%' || UPPER(P_IN_SEARCH) || '%'))
ORDER BY O.OIN_CODIGO
    OFFSET V_NEW_PAGE ROWS FETCH NEXT P_IN_SIZE ROWS ONLY;
RETURN CUR_REGISTROS;
END;
/