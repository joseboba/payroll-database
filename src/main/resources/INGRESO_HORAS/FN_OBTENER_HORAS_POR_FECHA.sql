CREATE OR REPLACE FUNCTION FN_OBTENER_HORAS_POR_FECHA(
    P_IN_EPU_Codigo IN NMI_HORAS.EPU_Codigo%TYPE,
    P_IN_Fecha IN VARCHAR
)
    RETURN SYS_REFCURSOR
IS
    CUR_REGISTROS SYS_REFCURSOR;
    V_Fecha TIMESTAMP;
    V_Codigo NMI_EMPLEADO_PUESTO.EPU_Codigo%TYPE;
    CURSOR C_Codigo IS
        SELECT EP.EPU_Codigo
            FROM NMI_EMPLEADO_PUESTO EP
                WHERE EP.EMP_Codigo = P_IN_EPU_Codigo AND EP.EPU_Estado = 1
                    FETCH FIRST ROW ONLY;
BEGIN
    V_Fecha := TO_TIMESTAMP(P_IN_Fecha, 'DD-MM-YYYY');
    OPEN C_Codigo;
        FETCH C_Codigo INTO V_Codigo;
    CLOSE C_Codigo;
    OPEN CUR_REGISTROS FOR
        SELECT
            H.HRS_Codigo,
            H.EPU_Codigo,
            H.HRS_Hora_Entrada,
            H.HRS_Hora_Salida
                FROM NMI_HORAS H
                    WHERE H.EPU_Codigo = V_Codigo AND
                    EXTRACT(YEAR FROM H.HRS_Hora_Entrada) = EXTRACT(YEAR FROM V_Fecha) AND
                    EXTRACT(MONTH FROM H.HRS_Hora_Entrada) = EXTRACT(MONTH FROM V_Fecha) AND
                    EXTRACT(DAY FROM H.HRS_Hora_Entrada) = EXTRACT(DAY FROM V_Fecha);
    RETURN CUR_REGISTROS;
END;
/