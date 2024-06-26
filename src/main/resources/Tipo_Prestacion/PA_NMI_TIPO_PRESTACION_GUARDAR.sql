CREATE OR REPLACE PROCEDURE PA_NMI_TIPO_PRESTACION_GUARDAR(
    P_IN_TPR_NOMBRE IN NMI_TIPO_PRESTACION.TPR_NOMBRE%TYPE,
    P_OUT_TPR_CODIGO OUT NMI_TIPO_PRESTACION.TPR_CODIGO%TYPE
) IS
BEGIN
    SAVEPOINT PS_AN_TIPO_PRESTACION_GUARDAR;
        INSERT INTO nmi_TIPO_PRESTACION (TPR_nombre) VALUES (P_IN_TPR_NOMBRE)
        RETURNING TPR_codigo INTO P_OUT_TPR_CODIGO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT PS_AN_TIPO_PRESTACION_GUARDAR;
END PA_NMI_TIPO_PRESTACION_GUARDAR;
/