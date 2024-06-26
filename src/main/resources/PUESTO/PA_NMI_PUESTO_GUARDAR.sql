CREATE OR REPLACE PROCEDURE PA_NMI_PUESTO_GUARDAR(
    P_IN_DEP_CODIGO IN NMI_PUESTO.DEP_CODIGO%TYPE,
    P_IN_PUE_NOMBRE IN NMI_PUESTO.PUE_NOMBRE%TYPE,
    P_IN_PUE_DESCRIPCION IN NMI_PUESTO.PUE_DESCRIPCION%TYPE,
    P_IN_PUE_ESTADO IN NMI_PUESTO.PUE_ESTADO%TYPE,
    P_OUT_PUE_CODIGO OUT NMI_PUESTO.PUE_CODIGO%TYPE
) IS
BEGIN
SAVEPOINT PS_AN_PUESTO_GUARDAR;
INSERT INTO NMI_PUESTO(DEP_CODIGO, PUE_NOMBRE, PUE_DESCRIPCION, PUE_ESTADO)
VALUES (P_IN_DEP_CODIGO, P_IN_PUE_NOMBRE, P_IN_PUE_DESCRIPCION, P_IN_PUE_ESTADO)
    RETURNING PUE_CODIGO INTO P_OUT_PUE_CODIGO;
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT PS_AN_PUESTO_GUARDAR;
END PA_NMI_PUESTO_GUARDAR;
/