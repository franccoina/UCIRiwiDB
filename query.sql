/*CONSULTAS ENFERMERAS*/

/* Dado un número de cama, conocer los datos del paciente que se encuentra ACTUALMENTE allí.*/
SELECT p.nombre AS Nombre, p.apellido AS Apellido, tc.nombre AS Documento, p.numero_documento AS Numero_documento,  c.numero AS Numero_cama FROM pacientes p
INNER JOIN tipos_de_documento tc ON tc.id = p.tipos_documento_id 
INNER JOIN camas c ON p.camas_id = c.id WHERE c.numero='101';

/*Dado una identificación de un paciente, conocer sus motivos de ingreso a la UCI.*/
SELECT p.nombre AS Nombre,  p.apellido AS Apellido, tc.nombre AS Documento, p.numero_documento AS Numero_documento, p.razon_del_ingreso FROM pacientes p
INNER JOIN tipos_de_documento tc ON tc.id = p.tipos_documento_id
WHERE p.numero_documento = '10023456781';

/*- Dado una identificación de un paciente, conocer los exámenes realizados.*/
SELECT p.nombre AS Nombre,  p.apellido AS Apellido, tc.nombre AS Documento, p.numero_documento AS Numero_documento, e.nombre AS Examen FROM pacientes p
INNER JOIN tipos_de_documento tc ON tc.id = p.tipos_documento_id
INNER JOIN datos_ingreso_paciente dip ON dip.id = p.datos_ingreso_paciente_id
INNER JOIN ordenes_examenes oep ON oep.id = dip.ordenes_examenes_id
INNER JOIN examenes e ON e.id = oep.examenes_id
WHERE p.numero_documento = '10023456781';

/* Dada una sala, conocer el médico que la dirige.*/

SELECT d.nombre AS Nombre_doctor, s.nombre AS Nombre_sala FROM asignaciones_salas asalas
INNER JOIN salas s ON s.id = asalas.salas_id
INNER JOIN doctores d ON d.id = asalas.doctores_id
WHERE s.nombre = 'A';

/*Dado el nombre de un medicamento, conocer sus características*/
SELECT m.codigo AS Codigo, m.nombre AS Nombre, m.descripcion AS Descripcion FROM medicamentos m
WHERE m.nombre = 'acetaminofen';

/*CONSULTAS ADMINISTRADORES*/

/*Conocer el número de pacientes que se encuentran en UCI y en cada sala*/
SELECT  COUNT(p.id) AS Total_pacientes FROM pacientes p;
SELECT s.nombre AS Nombre_sala, COUNT(p.id) AS Total_pacientes FROM pacientes p
INNER JOIN camas c ON p.camas_id = c.id
INNER JOIN asignaciones_salas asalas ON c.asignaciones_salas_id = asalas.id
INNER JOIN salas s ON asalas.salas_id = s.id
GROUP BY s.nombre;

/*Conocer el total de ingresos de un mes dado.*/
SELECT COUNT(p.id) AS Total_ingresos FROM pacientes p
WHERE MONTH(p.fecha_del_ingreso)=3 AND YEAR(p.fecha_del_ingreso)=2024;

/*Dado una identificación de un médico, conocer sus datos personales y salario*/
SELECT d.nombre, d.apellido, td.nombre, d.numero_documento, d.fecha_nacimiento, g.nombre, d.fecha_inicio_contrato, d.salario, d.anIos_experiencia, t.nombre AS especialidad FROM doctores d
INNER JOIN titulos t ON d.titulos_id = t.id
INNER JOIN tipos_de_documento td ON d.tipos_documento_id = td.id
INNER JOIN generos g ON g.id = d.generos_id
WHERE d.numero_documento = '12345678';

/*Dado una identificación de una enfermera, conocer sus datos personales y salario.*/
SELECT e.nombre, e.apellido, td.nombre, e.numero_documento, e.fecha_nacimiento, g.nombre AS genero, e.fecha_inicio_contrato, e.salario, e.anIos_experiencia FROM enfermeras e
INNER JOIN tipos_de_documento td ON e.tipos_documento_id = td.id
INNER JOIN generos g ON g.id = e.generos_id
WHERE e.numero_documento = '1002345678';

