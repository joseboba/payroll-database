CREATE OR REPLACE PROCEDURE PA_NMI_TIPO_AUSENCIA_ACTUALIZAR(
    P_IN_TAU_CODIGO IN NMI_TIPO_AUSENCIA.TAU_CODIGO%TYPE,
    P_IN_TAU_NOMBRE IN NMI_TIPO_AUSENCIA.TAU_NOMBRE%TYPE,
    P_IN_TAU_DESCRIPCION IN NMI_TIPO_AUSENCIA.TAU_DESCRIPCION%TYPE,
    P_IN_TAU_GOCE_SALARIO IN NMI_TIPO_AUSENCIA.TAU_GOCE_SALARIO%TYPE
) IS
BEGIN
SAVEPOINT PS_AN_TIPO_AUSENCIA_ACTUALIZAR;
UPDATE nmi_tipo_ausencia
SET
    tau_nombre = P_IN_TAU_NOMBRE,
    tau_descripcion = P_IN_TAU_DESCRIPCION,
    tau_goce_salario = P_IN_TAU_GOCE_SALARIO
WHERE tau_codigo = P_IN_TAU_CODIGO;
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT PS_AN_TIPO_AUSENCIA_ACTUALIZAR;
END PA_NMI_TIPO_AUSENCIA_ACTUALIZAR;
/