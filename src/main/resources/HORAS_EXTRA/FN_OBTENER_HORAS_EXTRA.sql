CREATE OR REPLACE FUNCTION FN_OBTENER_HORAS_EXTRA(
    P_IN_FECHA_INICIO IN VARCHAR,
    P_IN_FECHA_FINAL IN VARCHAR
)
    RETURN SYS_REFCURSOR
    IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
OPEN CUR_REGISTROS FOR
SELECT
    HE.HEX_CODIGO,
    HE.HEX_CANTIDAD,
    HE.HEX_FECHA,
    E.EMP_PRIMER_NOMBRE,
    E.EMP_SEGUNDO_NOMBRE,
    E.EMP_PRIMER_APELLIDO,
    E.EMP_SEGUNDO_APELLIDO
FROM NMI_EMPLEADO E
         JOIN NMI_EMPLEADO_PUESTO EP ON E.EMP_CODIGO = EP.EMP_CODIGO
         JOIN NMI_HORAS_EXTRA HE ON EP.EPU_CODIGO = HE.EPU_CODIGO
  WHERE HE.HEX_FECHA BETWEEN TO_TIMESTAMP(P_IN_FECHA_INICIO, 'DD-MM-YYYY')
    AND TO_TIMESTAMP(P_IN_FECHA_FINAL, 'DD-MM-YYYY');
RETURN CUR_REGISTROS;
END;
/
