CREATE OR REPLACE FUNCTION FN_OBTENER_TODO_EMPLEADO
    RETURN SYS_REFCURSOR
IS
    CUR_REGISTROS SYS_REFCURSOR;
BEGIN
    OPEN CUR_REGISTROS FOR
        SELECT
            E.EMP_Codigo,
            E.EMP_CUI,
            E.EMP_NIT,
            E.EMP_Primer_Nombre,
            E.EMP_Segundo_Nombre,
            E.EMP_Tercer_Nombre,
            E.EMP_Primer_Apellido,
            E.EMP_Segundo_Apellido,
            E.EMP_Apellido_Casada,
            E.EMP_Fecha_Nacimiento,
            E.EMP_Profesion,
            E.EMP_Telefono,
            E.EMP_Correo,
            E.EMP_Codigo_IGSS,
            E.EMP_Encargado,
            E.EMP_Fecha_Inicio,
            E.EMP_Numero_Cuenta,
            E.BAN_Codigo,
            E.TCU_Codigo,
            EP.EPU_Codigo,
            EP.PUE_Codigo,
            EP.TMO_Codigo,
            EP.EPU_Salario,
            EP.EPU_Estado
                FROM NMI_EMPLEADO E, NMI_EMPLEADO_PUESTO EP
                    WHERE E.EMP_Codigo = EP.EMP_Codigo AND
                    EP.EPU_Estado = 1;
    RETURN CUR_REGISTROS;
END;
/