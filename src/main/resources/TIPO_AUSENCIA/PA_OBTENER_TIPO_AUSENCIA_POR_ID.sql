CREATE OR REPLACE PROCEDURE PA_OBTENER_TIPO_AUSENCIA_POR_ID(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_IN_TAU_CODIGO IN NMI_TIPO_AUSENCIA.TAU_CODIGO%TYPE
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_TIPO_AUSENCIA_POR_ID(P_IN_TAU_CODIGO);
END;