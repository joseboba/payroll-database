CREATE OR REPLACE PROCEDURE PA_OBTENER_DEPARTAMENTO_LISTADO(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_OUT_TOTAL_ELEMENTS OUT NUMBER,
    P_IN_SEARCH IN VARCHAR2,
    P_IN_SIZE IN NUMBER,
    P_IN_PAGE IN NUMBER
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_LISTADO_DEPARTAMENTO(P_IN_SEARCH, P_IN_SIZE, P_IN_PAGE);
    P_OUT_TOTAL_ELEMENTS := FN_OBTENER_TOTAL_ELEMENTOS_DEPARTAMENTO(P_IN_SEARCH);
END;
/