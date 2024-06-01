CREATE OR REPLACE PROCEDURE PA_OBTENER_SUSPENSION_POR_ID(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_IN_SUS_CODIGO IN NMI_SUSPENSION.SUS_CODIGO%TYPE
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_SUSPENSIONES_POR_ID(P_IN_SUS_CODIGO);
END;
/