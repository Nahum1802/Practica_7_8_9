# Refaccionaria Leo - Proyecto de Bases de Datos

**Instituto Politécnico Nacional - Escuela Superior de Cómputo** **Unidad de Aprendizaje:** Bases de Datos  
**Práctica:** Caso Integrador (Prácticas 7, 8 y 9: Operaciones del Álgebra Relacional)

## 👥 Integrantes
* Martínez Marín Nahum
* Miranda Arredondo Miguel Angel

## 📝 Descripción del Dominio del Problema
"Refaccionaria Leo" es una plataforma de e-commerce enfocada en la venta y distribución de autopartes y refacciones automotrices. El sistema de base de datos gestiona el catálogo de productos (clasificados por categorías y marcas), el inventario disponible, el registro de usuarios, las órdenes de compra (pedidos), los detalles de facturación de cada pedido, la cartera de proveedores y las reseñas de los clientes. El esquema garantiza la integridad referencial para rastrear el ciclo completo de venta, desde el proveedor hasta el consumidor final.

## 📊 Modelado de Datos

### Diagrama Entidad-Relación (EER) y Relacional
*Generado dinámicamente con Mermaid.*

```mermaid
erDiagram
    USUARIO {
        int id_usuario PK
        string nombre
        string apellido
        string email
        string telefono
        date fecha_registro
    }
    CATEGORIA {
        int id_categoria PK
        string nombre
        string descripcion
        date fecha_creacion
        string estatus
    }
    MARCA {
        int id_marca PK
        string nombre
        string pais_origen
    }
    PROVEEDOR {
        int id_proveedor PK
        string nombre_empresa
        string contacto
        string telefono
    }
    PRODUCTO {
        int id_producto PK
        string nombre
        string descripcion
        numeric precio
        int stock
        int id_categoria FK
        int id_marca FK
        int id_proveedor FK
    }
    PEDIDO {
        int id_pedido PK
        date fecha_pedido
        numeric total
        string estado
        string metodo_pago
        int id_usuario FK
    }
    DETALLE_PEDIDO {
        int id_detalle PK
        int id_pedido FK
        int id_producto FK
        int cantidad
        numeric precio_unitario
        numeric subtotal
    }
    RESENA {
        int id_resena PK
        int id_producto FK
        int id_usuario FK
        int calificacion
        string comentario
        date fecha_resena
    }

    USUARIO ||--o{ PEDIDO : "realiza"
    USUARIO ||--o{ RESENA : "escribe"
    CATEGORIA ||--|{ PRODUCTO : "clasifica"
    MARCA ||--|{ PRODUCTO : "fabrica"
    PROVEEDOR ||--|{ PRODUCTO : "suministra"
    PRODUCTO ||--o{ DETALLE_PEDIDO : "incluye"
    PRODUCTO ||--o{ RESENA : "recibe"
    PEDIDO ||--|{ DETALLE_PEDIDO : "contiene"

## ⚙️ Instalación y Ejecución

El proyecto está diseñado para ejecutarse en **PostgreSQL**. Sigue estos pasos para levantar el esquema y los datos de prueba:

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/Nahum1802/Practica_7_8_9.git](https://github.com/Nahum1802/Practica_7_8_9.git)
   cd refaccionaria-leo-db

2. **Acceder a PostgreSQL:**
   psql -U tu_usuario

3. **Crear una base de datos:**
   CREATE DATABASE refaccionaria_leo;
    \c refaccionaria_leo;

4. **Ejecutar el Script:**
   \i schema.sql

