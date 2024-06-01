CREATE OR REPLACE FUNCTION FN_OBTENER_TOTAL_ELEMENTOS_OTRO_INGRESO(
    P_IN_SEARCH IN VARCHAR2
)
    RETURN NUMBER
    IS
    TOTAL_ELEMENTS NUMBER := 0;
BEGIN
SELECT COUNT(*)
INTO TOTAL_ELEMENTS
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
        OR (P_IN_SEARCH IS NULL OR UPPER(E.EMP_PRIMER_APELLIDO) LIKE '%' || UPPER(P_IN_SEARCH) || '%'));
RETURN TOTAL_ELEMENTS;
END;
/