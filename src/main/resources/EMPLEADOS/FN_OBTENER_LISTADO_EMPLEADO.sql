CREATE OR REPLACE FUNCTION FN_OBTENER_LISTADO_EMPLEADO(
    P_IN_SEARCH IN VARCHAR2,
    P_IN_SIZE IN NUMBER,
    P_IN_PAGE IN NUMBER
)
    RETURN SYS_REFCURSOR
IS
    CUR_REGISTROS SYS_REFCURSOR;
    V_NEW_PAGE NUMBER := 0;
BEGIN
    V_NEW_PAGE := P_IN_PAGE * P_IN_SIZE;
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
                    EP.EPU_Estado = 1 AND
                    (P_IN_SEARCH IS NULL OR E.EMP_Codigo LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_CUI LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_NIT LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Primer_Nombre LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Segundo_Nombre LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Tercer_Nombre LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Primer_Apellido LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Segundo_Apellido LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Apellido_Casada LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Profesion LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Telefono LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Correo LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Codigo_IGSS LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR E.EMP_Numero_Cuenta LIKE '%' || UPPER(P_IN_SEARCH) || '%') OR
                    (P_IN_SEARCH IS NULL OR EP.EPU_Salario LIKE '%' || UPPER(P_IN_SEARCH) || '%')
                        OFFSET V_NEW_PAGE ROWS FETCH NEXT P_IN_SIZE ROWS ONLY;
    RETURN CUR_REGISTROS;
END;
/