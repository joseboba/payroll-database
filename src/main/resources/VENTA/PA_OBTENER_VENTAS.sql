CREATE OR REPLACE PROCEDURE PA_OBTENER_VENTAS(
    P_OUT_CURSOR OUT SYS_REFCURSOR,
    P_IN_FECHA_INICIO IN VARCHAR,
    P_IN_FECHA_FINAL IN VARCHAR
)
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_VENTA(P_IN_FECHA_INICIO, P_IN_FECHA_FINAL);
END;
