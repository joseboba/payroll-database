CREATE OR REPLACE FUNCTION FN_CALCULAR_TOTAL_HORAS_EXTRA(
    P_IN_EPU_Codigo IN NMI_HORAS_EXTRA.EPU_Codigo%TYPE,
    P_IN_FECHA_INICIO IN VARCHAR,
    P_IN_FECHA_FINAL IN VARCHAR
)
    RETURN NUMBER
IS
    CURSOR C_Horas_Extra IS SELECT SUM(H.HEX_Cantidad) AS Total_Horas FROM NMI_HORAS_EXTRA H
        WHERE H.EPU_Codigo = P_IN_EPU_Codigo AND
        (H.HEX_Fecha BETWEEN TO_TIMESTAMP(P_IN_FECHA_INICIO, 'DD-MM-YYYY') AND TO_TIMESTAMP(P_IN_FECHA_FINAL, 'DD-MM-YYYY'));
    CURSOR C_Sueldo_Empleado IS SELECT E.EPU_Salario FROM NMI_EMPLEADO_PUESTO E
        WHERE E.EPU_Codigo = P_IN_EPU_Codigo;
    V_Total_Horas_Extra NMI_HORAS_EXTRA.HEX_Cantidad%TYPE;
    V_Salario NMI_EMPLEADO_PUESTO.EPU_Salario%TYPE;
    V_Monto_Hora_Extra NMI_EMPLEADO_PUESTO.EPU_Salario%TYPE;
    V_Resultado NMI_EMPLEADO_PUESTO.EPU_Salario%TYPE;
BEGIN

    OPEN C_Horas_Extra;
        FETCH C_Horas_Extra INTO V_Total_Horas_Extra;
    CLOSE C_Horas_Extra;

    OPEN C_Sueldo_Empleado;
        FETCH C_Sueldo_Empleado INTO V_Salario;
    CLOSE C_Sueldo_Empleado;

    V_Monto_Hora_Extra := ((V_Salario / 30) / 8) * 1.5;

    V_Resultado := V_Total_Horas_Extra * V_Monto_Hora_Extra;

    RETURN V_Resultado;

END;
/