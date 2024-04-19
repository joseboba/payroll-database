CREATE OR REPLACE FUNCTION FN_OBTENER_TODO_TIPO_PRESTACION
    RETURN SYS_REFCURSOR
    IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
    OPEN CUR_REGISTROS FOR
        SELECT TPR_CODIGO,
               TPR_NOMBRE
        FROM NMI_TIPO_PRESTACION;
    RETURN CUR_REGISTROS;
END;
/

