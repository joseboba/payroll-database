CREATE OR REPLACE PROCEDURE PA_OBTENER_TODO_PUESTOS(P_OUT_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_TODO_PUESTOS();
END;
/