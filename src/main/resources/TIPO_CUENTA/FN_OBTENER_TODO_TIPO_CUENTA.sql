CREATE OR REPLACE FUNCTION FN_OBTENER_TODO_TIPO_CUENTA
    RETURN SYS_REFCURSOR
IS
        CUR_REGISTROS SYS_REFCURSOR;
BEGIN
OPEN CUR_REGISTROS FOR
SELECT
    TCU_CODIGO,
    TCU_NOMBRE
FROM NMI_TIPO_CUENTA;
RETURN CUR_REGISTROS;
END;
/