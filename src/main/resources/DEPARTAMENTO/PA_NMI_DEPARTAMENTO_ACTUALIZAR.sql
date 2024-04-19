CREATE OR REPLACE PROCEDURE PA_NMI_DEPARTAMENTO_ACTUALIZAR(
    P_IN_DEP_CODIGO IN NMI_DEPARTAMENTO.DEP_CODIGO%TYPE,
    P_IN_DEP_NOMBRE IN NMI_DEPARTAMENTO.DEP_NOMBRE%TYPE,
    P_IN_DEP_DESCRIPCION IN NMI_DEPARTAMENTO.DEP_DESCRIPCION%TYPE
) IS
BEGIN
    SAVEPOINT PS_AN_DEPARTAMENTO_ACTUALIZAR;
    UPDATE nmi_departamento
    SET
        dep_nombre = P_IN_DEP_NOMBRE,
        dep_descripcion = P_IN_DEP_DESCRIPCION
    WHERE dep_codigo = P_IN_DEP_CODIGO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT PS_AN_DEPARTAMENTO_ACTUALIZAR;
END PA_NMI_DEPARTAMENTO_ACTUALIZAR;
/