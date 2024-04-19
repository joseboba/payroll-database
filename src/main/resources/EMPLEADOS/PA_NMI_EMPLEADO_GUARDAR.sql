CREATE OR REPLACE PROCEDURE PA_NMI_EMPLEADO_GUARDAR(
    P_IN_EMP_CUI IN NMI_EMPLEADO.EMP_CUI%TYPE,
    P_IN_EMP_NIT IN NMI_EMPLEADO.EMP_NIT%TYPE,
    P_IN_EMP_Primer_Nombre IN NMI_EMPLEADO.EMP_Primer_Nombre%TYPE,
    P_IN_EMP_Segundo_Nombre IN NMI_EMPLEADO.EMP_Segundo_Nombre%TYPE,
    P_IN_EMP_Tercer_Nombre IN NMI_EMPLEADO.EMP_Tercer_Nombre%TYPE,
    P_IN_EMP_Primer_Apellido IN NMI_EMPLEADO.EMP_Primer_Apellido%TYPE,
    P_IN_EMP_Segundo_Apellido IN NMI_EMPLEADO.EMP_Segundo_Apellido%TYPE,
    P_IN_EMP_Apellido_Casada IN NMI_EMPLEADO.EMP_Apellido_Casada%TYPE,
    P_IN_EMP_Fecha_Nacimiento IN NMI_EMPLEADO.EMP_Fecha_Nacimiento%TYPE,
    P_IN_EMP_Profesion IN NMI_EMPLEADO.EMP_Profesion%TYPE,
    P_IN_EMP_Telefono IN NMI_EMPLEADO.EMP_Telefono%TYPE,
    P_IN_EMP_Correo IN NMI_EMPLEADO.EMP_Correo%TYPE,
    P_IN_EMP_Codigo_IGSS IN NMI_EMPLEADO.EMP_Codigo_IGSS%TYPE,
    P_IN_EMP_Encargado IN NMI_EMPLEADO.EMP_Encargado%TYPE,
    P_IN_EMP_Fecha_Inicio IN NMI_EMPLEADO.EMP_Fecha_Inicio%TYPE,
    P_IN_EMP_Numero_Cuenta IN NMI_EMPLEADO.EMP_Numero_Cuenta%TYPE,
    P_IN_BAN_Codigo IN NMI_EMPLEADO.BAN_Codigo%TYPE,
    P_IN_TCU_Codigo IN NMI_EMPLEADO.TCU_Codigo%TYPE,
    P_IN_PUE_Codigo IN NMI_EMPLEADO_PUESTO.PUE_Codigo%TYPE,
    P_IN_TMO_Codigo IN NMI_EMPLEADO_PUESTO.TMO_Codigo%TYPE,
    P_IN_EPU_Salario IN NMI_EMPLEADO_PUESTO.EPU_Salario%TYPE,
    P_OUT_EMP_Codigo OUT NMI_EMPLEADO.EMP_Codigo%TYPE
) IS
BEGIN
    SAVEPOINT PS_AN_EMPLEADO_GUARDAR;
    INSERT INTO NMI_EMPLEADO (EMP_CUI, EMP_NIT, EMP_Primer_Nombre, EMP_Segundo_Nombre, EMP_Tercer_Nombre, EMP_Primer_Apellido, EMP_Segundo_Apellido, EMP_Apellido_Casada, EMP_Fecha_Nacimiento, EMP_Profesion, EMP_Telefono, EMP_Correo, EMP_Codigo_IGSS, EMP_Encargado, EMP_Fecha_Inicio, EMP_Numero_Cuenta, BAN_Codigo, TCU_Codigo)
        VALUES (P_IN_EMP_CUI, P_IN_EMP_NIT, P_IN_EMP_Primer_Nombre, P_IN_EMP_Segundo_Nombre, P_IN_EMP_Tercer_Nombre, P_IN_EMP_Primer_Apellido, P_IN_EMP_Segundo_Apellido, P_IN_EMP_Apellido_Casada, P_IN_EMP_Fecha_Nacimiento, P_IN_EMP_Profesion, P_IN_EMP_Telefono, P_IN_EMP_Correo, P_IN_EMP_Codigo_IGSS, P_IN_EMP_Encargado, P_IN_EMP_Fecha_Inicio, P_IN_EMP_Numero_Cuenta, P_IN_BAN_Codigo, P_IN_TCU_Codigo)
        RETURNING EMP_Codigo INTO P_OUT_EMP_Codigo;
    INSERT INTO NMI_EMPLEADO_PUESTO (EMP_Codigo, PUE_Codigo, TMO_Codigo, EPU_Fecha_Inicio, EPU_Salario, EPU_Estado)
        VALUES (P_OUT_EMP_Codigo, P_IN_PUE_Codigo, P_IN_TMO_Codigo, P_IN_EMP_Fecha_Inicio, P_IN_EPU_Salario, 1);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT PS_AN_EMPLEADO_GUARDAR;
END PA_NMI_EMPLEADO_GUARDAR;
/