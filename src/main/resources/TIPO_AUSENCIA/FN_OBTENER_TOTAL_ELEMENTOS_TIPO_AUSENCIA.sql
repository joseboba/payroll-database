CREATE OR REPLACE FUNCTION FN_OBTENER_TOTAL_ELEMENTOS_TIPO_AUSENCIA(
    P_IN_SEARCH IN VARCHAR2
)
    RETURN NUMBER
    IS
    TOTAL_ELEMENTS NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO TOTAL_ELEMENTS
    FROM NMI_TIPO_AUSENCIA
    WHERE (P_IN_SEARCH IS NULL OR TAU_CODIGO LIKE '%' || UPPER(P_IN_SEARCH) || '%')
       OR (P_IN_SEARCH IS NULL OR TAU_NOMBRE LIKE '%' || UPPER(P_IN_SEARCH) || '%')
       OR (P_IN_SEARCH IS NULL OR TAU_DESCRIPCION LIKE '%' || UPPER(P_IN_SEARCH) || '%')
       OR (P_IN_SEARCH IS NULL OR TAU_GOCE_SALARIO LIKE '%' || UPPER(P_IN_SEARCH) || '%');
    RETURN TOTAL_ELEMENTS;
END;
/
