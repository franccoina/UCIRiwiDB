/*Tabla vias_de_administracion*/
CREATE TABLE `vias_de_administracion` (
  `id` INT AUTO_INCREMENT,
  `nombre` VARCHAR(100),
  PRIMARY KEY (`id`)
);

/*Tabla medicamentos*/
CREATE TABLE `medicamentos` (
  `id` INT AUTO_INCREMENT,
  `codigo` VARCHAR(50),
  `nombre`VARCHAR(50),
  `vias_de_administracion_id` INT,
  `descripcion` VARCHAR(100),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`vias_de_administracion_id`) REFERENCES `vias_de_administracion`(`id`)
);

/*Tabla generos*/
CREATE TABLE `generos` (
  `id` INT AUTO_INCREMENT,
  `nombre` VARCHAR(10),
  PRIMARY KEY (`id`)
);

/*Tabla salas*/
CREATE TABLE `salas` (
  `id` INT AUTO_INCREMENT,
  `nombre` VARCHAR(10),
  PRIMARY KEY (`id`)
);

/*Tabla titulos*/
CREATE TABLE `titulos` (
  `id` INT AUTO_INCREMENT,
  `nombre` VARCHAR(100),
  PRIMARY KEY (`id`)
);

/*Tabla tipos_de_documento*/
CREATE TABLE `tipos_de_documento` (
  `id` INT AUTO_INCREMENT,
  `nombre` VARCHAR(50),
  `abreviatura` VARCHAR(15),
  PRIMARY KEY (`id`)
);

/*Tabla doctores*/
CREATE TABLE `doctores` (
  `id` INT AUTO_INCREMENT,
  `tipos_documento_id` INT,
  `numero_documento` VARCHAR(50),
  `nombre` VARCHAR(50),
  `apellido` VARCHAR(50),
  `fecha_nacimiento` DATE,
  `generos_id` INT,
  `telefono` VARCHAR(50),
  `fecha_inicio_contrato` DATE,
  `salario` FLOAT(50),
  `anos_experiencia` FLOAT(2),
  `titulos_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`generos_id`) REFERENCES `generos`(`id`),
  FOREIGN KEY (`titulos_id`) REFERENCES `titulos`(`id`),
  FOREIGN KEY (`tipos_documento_id`) REFERENCES `tipos_de_documento`(`id`)
);

/*Tabla examenes*/
CREATE TABLE `examenes` (
  `id` INT AUTO_INCREMENT,
  `nombre` VARCHAR(100),
  PRIMARY KEY (`id`)
);

/*Tabla datos_ingreso_paciente*/
CREATE TABLE `datos_ingreso_paciente` (
  `id` INT AUTO_INCREMENT,
  `observacion_examenes` VARCHAR(500),
  `ordenes_examenes_id` INT,
  `datos_signos_vitales_id` INT,
  `administraciones_medicamentos_id` INT,
  PRIMARY KEY (`id`)
);

/*Tabla enfermeras*/
CREATE TABLE `enfermeras` (
  `id` INT AUTO_INCREMENT,
  `tipos_documento_id` INT,
  `numero_documento`  VARCHAR(50),
  `nombre`  VARCHAR(50),
  `apellido`  VARCHAR(50),
  `fecha_nacimiento` DATE,
  `generos_id` INT,
  `telefono`  VARCHAR(50),
  `fecha_inicio_contrato` DATE,
  `salario`  VARCHAR(50),
  `anos_experiencia`  VARCHAR(2),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tipos_documento_id`) REFERENCES `tipos_de_documento`(`id`),
  FOREIGN KEY (`generos_id`) REFERENCES `generos`(`id`)
);

/*Tabla contactos_emergencia*/
CREATE TABLE `contactos_emergencia` (
  `id` INT AUTO_INCREMENT,
  `tipos_documento_id` INT,
  `numero_de_documento` VARCHAR(15),
  `nombre` VARCHAR(50),
  `apellido` VARCHAR(50),
  `fecha_nacimiento` DATE,
  `telefono` VARCHAR(15),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tipos_documento_id`) REFERENCES `tipos_de_documento`(`id`)
);

/*Tabla pacientes*/
CREATE TABLE `pacientes` (
  `id` INT AUTO_INCREMENT,
  `tipos_documento_id` INT,
  `numero_documento` VARCHAR(50),
  `nombre` VARCHAR(50),
  `apellido` VARCHAR(50),
  `fecha_nacimiento` DATE,
  `generos_id` INT,
  `telefono_paciente` VARCHAR(50),
  `datos_ingreso_paciente_id` INT,
  `razon_del_ingreso` VARCHAR(500),
  `fecha_del_ingreso` DATE,
  `contactos_emergencia_id` INT,
  `razon_de_salida` VARCHAR(500),
  `fecha_de_salida` DATE,
  `dias_de_estadia` FLOAT(5),
  `camas_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tipos_documento_id`) REFERENCES `tipos_de_documento`(`id`),
  FOREIGN KEY (`generos_id`) REFERENCES `generos`(`id`),
  FOREIGN KEY (`contactos_emergencia_id`) REFERENCES `contactos_emergencia`(`id`)
);

/*Tabla administraciones_medicamentos*/
CREATE TABLE `administraciones_medicamentos` (
  `id` INT AUTO_INCREMENT,
  `medicamentos_id` INT,
  `intervalo_de_horas` FLOAT,
  `cantidad_dosis` VARCHAR(100),
  `tiempo_toma_en_dias` INT,
  `enfermeras_id` INT,
  `pacientes_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`medicamentos_id`) REFERENCES `medicamentos`(`id`),
  FOREIGN KEY (`enfermeras_id`) REFERENCES `enfermeras`(`id`),
  FOREIGN KEY (`pacientes_id`) REFERENCES `pacientes`(`id`)
);

/*Tabla datos_signos_vitales*/
CREATE TABLE `datos_signos_vitales` (
  `id` INT AUTO_INCREMENT,
  `frecuencia_cardíaca` VARCHAR(100),
  `presión_arterial` VARCHAR(100),
  `frecuencia_respiratoria` VARCHAR(100),
  `temperatura_corporal` VARCHAR(100),
  `saturacion_oxigeno` VARCHAR(100),
  PRIMARY KEY (`id`)
);

/*Tabla asignaciones_salas*/
CREATE TABLE `asignaciones_salas` (
  `id` INT AUTO_INCREMENT,
  `doctores_id` INT,
  `salas_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`doctores_id`) REFERENCES `doctores`(`id`),
  FOREIGN KEY (`salas_id`) REFERENCES `salas`(`id`)
);

/*Tabla camas*/
CREATE TABLE `camas` (
  `id` INT AUTO_INCREMENT,
  `numero` VARCHAR(5),
  `asignaciones_salas_id` INT,
  `enfermeras_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`enfermeras_id`) REFERENCES `enfermeras`(`id`),
  FOREIGN KEY (`asignaciones_salas_id`) REFERENCES `asignaciones_salas`(`id`)
);

/*Tabla ordenes_examenes*/
CREATE TABLE `ordenes_examenes` (
  `id` INT AUTO_INCREMENT,
  `examenes_id` INT,
  `resultados_examenes` VARCHAR(50),
  `observaciones_examenes` VARCHAR(50),
  `fecha_realizacion` DATE,
  `pacientes_id` INT,
  `doctores_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`examenes_id`) REFERENCES `examenes`(`id`),
  FOREIGN KEY (`pacientes_id`) REFERENCES `pacientes`(`id`),
  FOREIGN KEY (`doctores_id`) REFERENCES `doctores`(`id`)
);