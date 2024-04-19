CREATE OR REPLACE FUNCTION FN_OBTENER_TODO_BANCOS
    RETURN SYS_REFCURSOR
IS
        CUR_REGISTROS SYS_REFCURSOR;
BEGIN
OPEN CUR_REGISTROS FOR
SELECT
    BAN_CODIGO,
    BAN_NOMBRE
FROM NMI_BANCO;
RETURN CUR_REGISTROS;
END;
/