# Proyecto Retail - Base de Datos en PostgreSQL
**Pre-entrega: Tablas principales con restricciones y datos iniciales**

Este repositorio contiene el script DDL y DML para la creación y mantenimiento del esquema base del proyecto retail (`clientes`, `productos` y `ventas`).

## 🗄️ Estructura del Esquema
* **`clientes`**: Almacena clientes con clave primaria (`SERIAL`), email único y validación de edad mínima (`CHECK >= 16`).
* **`productos`**: Almacena el catálogo de productos con tipo `DECIMAL` para precios, validación de precio positivo (`CHECK > 0`) y stock no negativo (`CHECK >= 0`).
* **`ventas`**: Tabla de hechos con claves foráneas hacia `clientes` y `productos`, con restricción de eliminación (`ON DELETE RESTRICT`) y validación de cantidad vendida (`CHECK > 0`).

## 🚀 Instrucciones de Ejecución

1. Abrir **pgAdmin 4** o **DBeaver** y conectarse al servidor de PostgreSQL.
2. Crear una base de datos nueva:
   ```sql
   CREATE DATABASE retail_project;
