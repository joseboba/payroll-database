CREATE OR REPLACE PROCEDURE PA_OBTENER_HORAS_POR_FECHA(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_IN_EPU_Codigo IN NMI_HORAS.EPU_Codigo%TYPE,
    P_IN_Fecha IN VARCHAR
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_HORAS_POR_FECHA(P_IN_EPU_Codigo, P_IN_Fecha);
END;
/