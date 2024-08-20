INSERT INTO vias_de_administracion (nombre) VALUES ('oral'), ('intravenosa');

INSERT INTO medicamentos (codigo, nombre, vias_de_administracion_id, descripcion) VALUES
('A2039J2', 'acetaminofen', 1, 'analgésico y antipirético'),
('A4039J3', 'ibuprofeno', 1, 'antiinflamatorio, analgésico y antipirético' ),
('A2039J4', 'amoxicilina', 1, 'antibiótico' ),
('A9039J5', 'omeprazol', 1, 'inhibidor de la bomba de protones' ),
('A2039J6', 'epinefrina', 2, 'agente vasopresor y broncodilatador' );

INSERT INTO generos (nombre) VALUES
('masculino'),
('femenino');

INSERT INTO salas (nombre) VALUES ('A'), ('B'), ('C'), ('D'), ('E');

INSERT INTO titulos (nombre) VALUES ('cardiologia'),
 ('medicina interna'),
 ('endrocrinologia'),
 ('neurologia'),
 ('gastroenterologia');

INSERT INTO tipos_de_documento (nombre, abreviatura) VALUES
('cédula de ciudadanía', 'cc'),
('cédula de extranjería', 'ce'),
('tarjeta de identidad', 'ti'),
('registro civil', 'rc'),
('pasaporte', 'pa');

INSERT INTO doctores (tipos_documento_id, numero_documento, nombre, apellido, fecha_nacimiento, generos_id, telefono, fecha_inicio_contrato, salario, anios_experiencia, titulos_id) VALUES
(1 , '12345678', 'luis', 'perez', '1990-10-10', 1, '3214567890', '2024-06-01', 3500000.0, 3.0, 1),
(1 , '12345671', 'maria', 'perez', '1990-10-11', 2, '3214567891', '2024-06-02', 3500000.0, 2.0, 2),
(1 , '12345672', 'sandra', 'perez', '1990-10-12', 2, '3214567892', '2024-06-02', 3500000.0, 2.0, 2),
(1 , '12345673', 'marcos', 'perez', '1990-10-13', 1, '3214567893', '2024-06-02', 3500000.0, 4.0, 2),
(1 , '12345671', 'maria', 'perez', '1990-10-11', 2, '3214567891', '2024-06-02', 3500000.0, 2.0, 2);

INSERT INTO examenes (nombre) VALUES
('hemograma completo'),
('electrocardiograma'),
('tomografía computarizada'),
('resonancia magnética'),
('prueba de glucosa en sangre');

INSERT INTO datos_ingreso_paciente (observacion_examenes, ordenes_examenes_id, datos_signos_vitales_id, administraciones_medicamentos_id) VALUES
('normal', 1, 1, 1),
('normal', 2, 2, 2),
('alterada', 3, 3, 3),
('normal', 4, 4, 4),
('normal', 5, 5, 5);

INSERT INTO enfermeras (tipos_documento_id, numero_documento, nombre, apellido, fecha_nacimiento, generos_id, telefono, fecha_inicio_contrato, salario, anios_experiencia) VALUES
(1 , '1002345678', 'luisa', 'perez', '1990-10-10', 2, '3214567890', '2024-06-01', 2500000, 3),
(1 , '1012345678', 'martina', 'perez', '1990-10-16', 2, '3214567891', '2024-06-01', 2500000, 3),
(1 , '1022345678', 'josefa', 'perez', '1990-10-17', 2, '3214567892', '2024-06-01', 2500000, 3),
(1 , '1032345678', 'julia', 'perez', '1990-10-17', 2, '3214567893', '2024-06-02', 2500000, 3),
(1 , '1022345679', 'mariana', 'perez', '1990-10-19', 2, '3214567894', '2024-06-01', 2500000, 3);

INSERT INTO contactos_emergencia (tipos_documento_id, numero_de_documento, nombre, apellido, fecha_nacimiento, telefono) VALUES
(1 , '1002345673', 'sergio', 'martinez', '1990-10-10','3214567811'),
(1 , '1001345673', 'carlos', 'martinez', '1990-10-20','3204567811'),
(1 , '1004345673', 'jorge', 'martinez', '1990-10-21','3224567811'),
(1 , '1005345673', 'juan', 'martinez', '1990-10-22','3274567811'),
(1 , '1007345673', 'pablo', 'martinez', '1990-10-23','3214967811');

INSERT INTO pacientes (tipos_documento_id, numero_documento, nombre, apellido, fecha_nacimiento, generos_id, telefono_paciente, datos_ingreso_paciente_id, razon_del_ingreso, fecha_del_ingreso, contactos_emergencia_id, razon_de_salida, fecha_de_salida, dias_de_estadia, camas_id) VALUES
(1 , '10023456781', 'pilar', 'castro', '1991-10-24', 2, '3174567890', 1, 'migraña', '2024-03-23', 1, 'dada de alta', '2024-03-24', 1, 1),
(1 , '10023456782', 'sandra', 'castro', '1992-10-24', 2, '3174567891', 2, 'dolor abdominal', '2024-03-24', 2, 'dada de alta', '2024-03-25', 1, 2),
(1 , '10023456783', 'sergio', 'castro', '1993-10-24', 1, '3174567892', 3, 'migraña', '2024-03-25', 3, 'dada de alta', '2024-03-27', 2, 3),
(1 , '10023456784', 'jose', 'castro', '1994-10-24', 1, '3174567893', 4, 'mareo', '2024-03-27', 4, 'dada de alta', '2024-03-29', 2, 4),
(1 , '10023456785', 'julia', 'castro', '1995-10-24', 2, '3174567894', 5, 'migraña', '2024-04-23', 5, 'dada de alta', '2024-04-24', 1, 5);

INSERT INTO administraciones_medicamentos (medicamentos_id, intervalo_de_horas, cantidad_dosis, tiempo_toma_en_dias, enfermeras_id, pacientes_id) VALUES
(1, 8, '500mg', 2, 1, 1),
(2, 6, '200mg', 3, 2, 2),
(3, 8, '500mg', 3, 3, 3),
(4, 6, '300mg', 2, 4, 4),
(1, 8, '500mg', 5, 5, 5);

INSERT INTO datos_signos_vitales (frecuencia_cardíaca, presión_arterial, frecuencia_respiratoria, temperatura_corporal, saturacion_oxigeno) VALUES
('200ppm', '80mmhg', '12rpm', '36ºC', '90%'),
('200ppm', '90mmhg', '12rpm', '36ºC', '90%'),
('200ppm', '80mmhg', '15rpm', '36ºC', '90%'),
('200ppm', '80mmhg', '12rpm', '37ºC', '90%'),
('200ppm', '80mmhg', '12rpm', '36ºC', '95%');

INSERT INTO asignaciones_salas (doctores_id, salas_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO camas (numero, asignaciones_salas_id, enfermeras_id) VALUES
('101', 1, 1),
('201', 2, 2),
('301', 3, 3),
('401', 4, 4),
('501', 5, 5);

INSERT INTO ordenes_examenes (examenes_id, resultados_examenes, observaciones_examenes, fecha_realizacion, pacientes_id, doctores_id) VALUES
(1, 1, 'normal', '2024-05-09', 1, 1),
(2, 2, 'normal', '2024-05-10', 2, 2),
(3, 3, 'normal', '2024-10-11', 3, 3),
(4, 4, 'normal', '2024-10-12', 4, 4),
(5, 5, 'normal', '2024-10-13', 5, 5);