CREATE OR REPLACE PROCEDURE PA_OBTENER_DEPARTAMENTO_POR_ID(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_IN_DEP_CODIGO IN NMI_DEPARTAMENTO.DEP_CODIGO%TYPE
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_DEPARTAMENTO_POR_ID(P_IN_DEP_CODIGO);
END;
/