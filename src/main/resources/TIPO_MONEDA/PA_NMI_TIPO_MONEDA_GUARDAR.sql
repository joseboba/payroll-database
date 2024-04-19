CREATE OR REPLACE PROCEDURE PA_NMI_TIPO_MONEDA_GUARDAR(
    P_IN_TMO_NOMBRE IN NMI_TIPO_MONEDA.TMO_NOMBRE%TYPE,
    P_IN_TMO_SIMBOLO IN NMI_TIPO_MONEDA.TMO_SIMBOLO%TYPE,
    P_IN_TMO_TASA_CAMBIO IN NMI_TIPO_MONEDA.TMO_TASA_CAMBIO%TYPE,
    P_IN_TMO_ESTADO IN NMI_TIPO_MONEDA.TMO_ESTADO%TYPE,
    P_OUT_TMO_CODIGO OUT NMI_TIPO_MONEDA.TMO_CODIGO%TYPE
) IS
BEGIN
SAVEPOINT PS_AN_TIPO_MONEDA_GUARDAR;
INSERT INTO NMI_TIPO_MONEDA(TMO_NOMBRE, TMO_SIMBOLO, TMO_TASA_CAMBIO, TMO_ESTADO)
VALUES (P_IN_TMO_NOMBRE, P_IN_TMO_SIMBOLO, P_IN_TMO_TASA_CAMBIO, P_IN_TMO_ESTADO)
    RETURNING TMO_CODIGO INTO P_OUT_TMO_CODIGO;
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT PS_AN_TIPO_MONEDA_GUARDAR;
END PA_NMI_TIPO_MONEDA_GUARDAR;
/