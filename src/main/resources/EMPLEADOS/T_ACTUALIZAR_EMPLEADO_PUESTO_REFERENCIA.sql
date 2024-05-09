CREATE OR REPLACE TRIGGER T_ACTUALIZAR_EMPLEADO_PUESTO_REFERENCIA
    AFTER INSERT ON NMI_EMPLEADO_PUESTO FOR EACH ROW
    DECLARE
        V_ULTIMO_EPU_CODIGO NUMBER := NULL;
BEGIN
        SELECT MAX(EPU_CODIGO)
        INTO V_ULTIMO_EPU_CODIGO
        FROM (SELECT EPU_CODIGO
              FROM NMI_EMPLEADO_PUESTO
              WHERE EMP_CODIGO = NEW.EMP_CODIGO
              ORDER BY EPU_CODIGO DESC)
        WHERE ROWNUM <= 2;

        IF V_ULTIMO_EPU_CODIGO IS NOT NULL THEN
            FOR PRESTAMO IN (SELECT * FROM NMI_PRESTAMO  WHERE NMI_PRESTAMO.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_PRESTAMO
                SET EPU_CODIGO = NEW.EPU_CODIGO
                WHERE PRE_CODIGO = PRESTAMO.PRE_CODIGO;
            END LOOP;

            FOR EMPLEADO_BONIFICACION IN (SELECT * FROM NMI_EMPLEADO_BONIFICACION WHERE NMI_EMPLEADO_BONIFICACION.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_EMPLEADO_BONIFICACION
                SET NMI_EMPLEADO_BONIFICACION.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE EBO_CODIGO = EMPLEADO_BONIFICACION.EBO_CODIGO;
            END LOOP;

            FOR PAGO IN (SELECT * FROM NMI_PAGO WHERE NMI_PAGO.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_PAGO
                SET NMI_PAGO.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE PAG_CODIGO = PAGO.PAG_CODIGO;
            END LOOP;

            FOR HORAS_EXTRA IN (SELECT * FROM NMI_HORAS_EXTRA WHERE NMI_HORAS_EXTRA.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_HORAS_EXTRA
                SET NMI_HORAS_EXTRA.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE HEX_CODIGO = HORAS_EXTRA.HEX_CODIGO;
            END LOOP;

            FOR HORAS IN (SELECT * FROM NMI_HORAS WHERE NMI_HORAS.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_HORAS
                SET NMI_HORAS.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE HRS_CODIGO = HORAS.HRS_CODIGO;
            END LOOP;

            FOR SUSPENSION IN (SELECT * FROM NMI_SUSPENSION WHERE NMI_SUSPENSION.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_SUSPENSION
                SET NMI_SUSPENSION.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE SUS_CODIGO = SUSPENSION.SUS_CODIGO;
            END LOOP;

            FOR PRODUCCION IN (SELECT * FROM NMI_PRODUCCION WHERE NMI_PRODUCCION.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_PRODUCCION
                SET NMI_PRODUCCION.EPU_CODIGO = NEW.EMP_CODIGO
                WHERE PRO_CODIGO = PRODUCCION.PRO_CODIGO;
            END LOOP;

            FOR VENTA IN (SELECT * FROM NMI_VENTA WHERE NMI_VENTA.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_VENTA
                SET NMI_VENTA.EPU_CODIGO = NEW.EMP_CODIGO
                WHERE VEN_CODIGO = VENTA.VEN_CODIGO;
            END LOOP;

            FOR OTRO_INGRESO IN (SELECT * FROM NMI_OTRO_INGRESO WHERE NMI_OTRO_INGRESO.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_OTRO_INGRESO
                SET NMI_OTRO_INGRESO.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE OIN_CODIGO = OTRO_INGRESO.OIN_CODIGO;
            END LOOP;

            FOR PRESTACION_PAGADA IN (SELECT * FROM NMI_PRESTACION_PAGADA WHERE NMI_PRESTACION_PAGADA.EPU_CODIGO = V_ULTIMO_EPU_CODIGO) LOOP
                UPDATE NMI_PRESTACION_PAGADA
                SET NMI_PRESTACION_PAGADA.EPU_CODIGO = NEW.EPU_CODIGO
                WHERE PPA_CODIGO = PRESTACION_PAGADA.PPA_CODIGO;
            END LOOP;
        END IF;
END;
/
