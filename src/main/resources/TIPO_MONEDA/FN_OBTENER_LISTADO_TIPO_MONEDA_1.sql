CREATE OR REPLACE FUNCTION FN_OBTENER_LISTADO_TIPO_MONEDA(
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
    TMO_CODIGO,
    TMO_NOMBRE,
    TMO_SIMBOLO,
    TMO_TASA_CAMBIO,
    TMO_ESTADO
FROM NMI_TIPO_MONEDA
WHERE
    (P_IN_SEARCH IS NULL OR UPPER(TMO_CODIGO) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TMO_NOMBRE) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TMO_SIMBOLO) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TMO_TASA_CAMBIO) LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
    (P_IN_SEARCH IS NULL OR UPPER(TMO_ESTADO) LIKE '%' || UPPER(P_IN_SEARCH) || '%')
OFFSET V_NEW_PAGE ROWS
    FETCH NEXT P_IN_SIZE ROWS ONLY;
RETURN CUR_REGISTROS;
END;
/