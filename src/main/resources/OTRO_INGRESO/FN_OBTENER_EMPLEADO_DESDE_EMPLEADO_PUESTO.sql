CREATE OR REPLACE FUNCTION FN_OBTENER_EMPLEADO_DESDE_EMPLEADO_PUESTO
RETURN SYS_REFCURSOR
IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
    OPEN CUR_REGISTROS FOR
        SELECT  EP.EPU_CODIGO,E.EMP_CODIGO, E.EMP_PRIMER_NOMBRE,
                E.EMP_SEGUNDO_NOMBRE, E.EMP_PRIMER_APELLIDO, E.EMP_SEGUNDO_APELLIDO
        FROM NMI_EMPLEADO E, NMI_EMPLEADO_PUESTO EP
        WHERE E.EMP_CODIGO = EP.EMP_CODIGO AND
              EP.EPU_ESTADO = 1;

    RETURN CUR_REGISTROS;
END;
/
