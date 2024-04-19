CREATE OR REPLACE PROCEDURE PA_OBTENER_TIPO_PRESTACION_POR_ID(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_IN_TPR_CODIGO IN NMI_TIPO_PRESTACION.TPR_CODIGO%TYPE
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_TIPO_PRESTACION_POR_ID(P_IN_TPR_CODIGO);
END;
/