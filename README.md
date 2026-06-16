# Refaccionaria Leo - Proyecto de Bases de Datos

**Instituto Politécnico Nacional - Escuela Superior de Cómputo** **Unidad de Aprendizaje:** Bases de Datos  
**Práctica:** Caso Integrador (Prácticas 7, 8 y 9: Operaciones del Álgebra Relacional)

## 👥 Integrantes
* Martínez Marín Nahum
* Miranda Arredondo Miguel Angel

## 📝 Descripción del Dominio del Problema
"Refaccionaria Leo" es una plataforma de e-commerce enfocada en la venta y distribución de autopartes y refacciones automotrices. El sistema de base de datos gestiona el catálogo de productos (clasificados por categorías y marcas), el inventario disponible, el registro de usuarios, las órdenes de compra (pedidos), los detalles de facturación de cada pedido, la cartera de proveedores y las reseñas de los clientes. El esquema garantiza la integridad referencial para rastrear el ciclo completo de venta, desde el proveedor hasta el consumidor final.

## 📊 Modelado de Datos
**Nota Técnica:** El Diagrama Entidad-Relación Extendido (EER) y el Modelo Relacional completos se encuentran implementados directamente en el archivo DDL `schema.sql`. La lógica de llaves primarias y foráneas documenta de forma explícita la interconexión de las 8 relaciones. Asimismo, el análisis algebraico se encuentra detallado en el documento PDF adjunto.

## ⚙️ Instalación y Ejecución

El proyecto está diseñado para ejecutarse en **PostgreSQL**. Sigue estos pasos para levantar el esquema y los datos de prueba:

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/Nahum1802/Practica_7_8_9.git](https://github.com/Nahum1802/Practica_7_8_9.git)
   cd Practica_7_8_9

2. **Acceder a PostgreSQL:**
   psql -U tu_usuario

3. **Crear una base de datos:**
   CREATE DATABASE refaccionaria_leo;
    \c refaccionaria_leo;

4. **Ejecutar el Script:**
   \i schema.sql

