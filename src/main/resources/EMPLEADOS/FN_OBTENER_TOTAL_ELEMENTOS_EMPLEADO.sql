CREATE OR REPLACE FUNCTION FN_OBTENER_TOTAL_ELEMENTOS_EMPLEADO(
    P_IN_SEARCH IN VARCHAR2
)
    RETURN NUMBER
IS
    TOTAL_ELEMENTS NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO TOTAL_ELEMENTS
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
            (P_IN_SEARCH IS NULL OR EP.EPU_Salario LIKE '%' || UPPER(P_IN_SEARCH) || '%');
    RETURN TOTAL_ELEMENTS;
END;
/