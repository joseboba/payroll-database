CREATE OR REPLACE PROCEDURE PA_OBTENER_NOMBRE_TIPO_SUSPENSION (
    P_OUT_CURSOR OUT SYS_REFCURSOR
  )
AS
BEGIN
    P_OUT_CURSOR := FN_OBTENER_NOMBRE_TIPO_SUSPENSION();
END;
