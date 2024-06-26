CREATE OR REPLACE FUNCTION FN_OBTENER_LISTADO_TIPO_AUSENCIA(
    P_IN_SEARCH IN VARCHAR2,
    P_IN_SIZE IN NUMBER,
    P_IN_PAGE IN NUMBER
)
RETURN SYS_REFCURSOR
IS
    CUR_REGISTROS SYS_REFCURSOR;
    V_NEW_PAGE NUMBER := 0;
BEGIN
    V_NEW_PAGE := P_IN_PAGE * P_IN_SIZE;
OPEN CUR_REGISTROS FOR
SELECT
    TAU_CODIGO,
    TAU_NOMBRE,
    TAU_DESCRIPCION,
    TAU_GOCE_SALARIO
FROM NMI_TIPO_AUSENCIA
WHERE
    (P_IN_SEARCH IS NULL OR UPPER(TAU_CODIGO) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TAU_NOMBRE) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TAU_DESCRIPCION) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TAU_GOCE_SALARIO) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
OFFSET V_NEW_PAGE ROWS
    FETCH NEXT P_IN_SIZE ROWS ONLY;
RETURN CUR_REGISTROS;
END;
/
