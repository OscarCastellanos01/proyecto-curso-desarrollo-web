CREATE DATABASE prueba;
USE prueba;

CREATE TABLE tbl_estado (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estado VARCHAR(255),
    descripcion_estado VARCHAR(255)
);

CREATE TABLE tbl_pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nombre_pais VARCHAR(255),
    codigo_pais INT
);

CREATE TABLE tbl_departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(255),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES tbl_pais(id_pais)
);

CREATE TABLE tbl_municipio (
    id_municipio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_municipio VARCHAR(255),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES tbl_departamento(id_departamento)
);

CREATE TABLE tbl_empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(255) NOT NULL,
    NIT_empresa INT NOT NULL,
    direccion_empresa VARCHAR(255),
    telefono_empresa VARCHAR(255),
    email_empresa VARCHAR(255),
    id_pais INT,
    id_departamento INT,
    id_municipio INT,
    id_estado INT,
    FOREIGN KEY (id_pais) REFERENCES tbl_pais(id_pais),
    FOREIGN KEY (id_departamento) REFERENCES tbl_departamento(id_departamento),
    FOREIGN KEY (id_municipio) REFERENCES tbl_municipio(id_municipio),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_sucursal (
    id_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sucursal VARCHAR(255),
    id_pais INT,
    id_departamento INT,
    id_municipio INT,
    telefono_sucursal VARCHAR(255),
    email_sucursal VARCHAR(255),
    id_estado INT,
    id_empresa INT,
    FOREIGN KEY (id_pais) REFERENCES tbl_pais(id_pais),
    FOREIGN KEY (id_departamento) REFERENCES tbl_departamento(id_departamento),
    FOREIGN KEY (id_municipio) REFERENCES tbl_municipio(id_municipio),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa)
);

CREATE TABLE tbl_rol (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(255),
    descripcion_rol VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(255),
    email_usuario VARCHAR(255),
    contraseña_usuario VARCHAR(255),
    id_estado INT,
    direccion_usuario VARCHAR(255),
    fecha_actualizacion_usuario DATE,
    telefono_usuario VARCHAR(255),
    id_rol INT,
    id_empresa INT,
    id_sucursal INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_rol) REFERENCES tbl_rol(id_rol),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_tipo_documento (
    id_documento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipoDocumento VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_series (
    id_serie INT PRIMARY KEY AUTO_INCREMENT,
    nombre_serie VARCHAR(255),
    descripcion_serie VARCHAR(255),
    id_documento INT,
    correlativo INT,
    id_estado INT,
    FOREIGN KEY (id_documento) REFERENCES tbl_tipo_documento(id_documento),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre_marca VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_subcategoria (
    id_subcategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_subcategoria VARCHAR(255),
    id_categoria INT,
    id_estado INT,
    FOREIGN KEY (id_categoria) REFERENCES tbl_categoria(id_categoria),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    sku_producto VARCHAR(255),
    cod_barra VARCHAR(255),
    nombre_producto VARCHAR(255),
    descripcion_producto VARCHAR(255),
    id_marca INT,
    id_subcategoria INT,
    vencimiento_producto DATE,
    precio_compra_producto DECIMAL(10, 2),
    precio_venta_producto DECIMAL(10, 2),
    id_estado INT,
    id_empresa INT,
    id_sucursal INT,
    FOREIGN KEY (id_marca) REFERENCES tbl_marca(id_marca),
    FOREIGN KEY (id_subcategoria) REFERENCES tbl_subcategoria(id_subcategoria),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_producto_imagen (
    id_producto INT,
    url_imagen VARCHAR(255),
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto)
);

CREATE TABLE tbl_historial_producto (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    id_usuario INT,
    id_movimiento INT,
    fecha_historial DATE,
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario)
);

CREATE TABLE tbl_metodo_pago (
    id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
    nombre_metodo_pago VARCHAR(255),
    descripcion_metodo_pago VARCHAR(255)
);

CREATE TABLE tbl_tipo_movimiento (
    id_tipoMovimiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipoMovimiento VARCHAR(255)
);

CREATE TABLE tbl_movimiento (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    monto_movimiento DECIMAL(10, 2),
    fecha_movimiento DATE,
    descripcion_movimiento VARCHAR(255),
    id_tipoMovimiento INT,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_tipo_persona (
    id_tipo_persona INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo_persona VARCHAR(255)
);

CREATE TABLE tbl_persona (
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    codigo_persona VARCHAR(255),
    nombre_persona VARCHAR(255),
    direccion_persona VARCHAR(255),
    telefono_persona VARCHAR(255),
    correo_persona VARCHAR(255),
    nit_persona VARCHAR(255) NULL,
    cui_persona VARCHAR(255) NULL,
    id_tipo_persona INT,
    id_estado INT,
    FOREIGN KEY (id_tipo_persona) REFERENCES tbl_tipo_persona(id_tipo_persona),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_bodega (
    id_bodega INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bodega VARCHAR(255),
    id_sucursal INT,
    id_empresa INT,
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa)
);

CREATE TABLE tbl_lote (
    id_lote INT PRIMARY KEY AUTO_INCREMENT,
    numero_lote VARCHAR (255),
    id_producto INT,
    fecha_produccion DATE,
    fecha_vencimiento DATE,
    cantidad_incial INT,
    cantidad_disponible INT,
    id_bodega INT,
    id_estado INT,
    id_sucursal INT,
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto),
    FOREIGN KEY (id_bodega) REFERENCES tbl_bodega(id_bodega),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_tipo_venta (
    id_tipoVenta INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipoVenta VARCHAR(255)
);

CREATE TABLE tbl_venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    documento_venta VARCHAR(255),
    total_venta DECIMAL(10, 2),
    fecha_venta DATE,
    fecha_entrega DATE,
    id_tipo_documento INT,
    id_medio_pago INT,
    id_usuario INT,
    id_persona INT,
    id_tipoVenta INT,
    id_empresa INT,
    id_sucursal INT,
    FOREIGN KEY (id_tipo_documento) REFERENCES tbl_tipo_documento(id_documento),
    FOREIGN KEY (id_medio_pago) REFERENCES tbl_metodo_pago(id_metodo_pago),
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario),
    FOREIGN KEY (id_persona) REFERENCES tbl_persona(id_persona),
    FOREIGN KEY (id_tipoVenta) REFERENCES tbl_tipo_venta(id_tipoVenta),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_venta_detalle (
    id_venta_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_producto INT,
    id_lote INT,
    cantidad_venta_detalle INT,
    descuento_venta_detalle DECIMAL(10, 2),
    subtotal_venta_detalle DECIMAL(10, 2),
    FOREIGN KEY (id_venta) REFERENCES tbl_venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto),
    FOREIGN KEY (id_lote) REFERENCES tbl_lote(id_lote)
);

CREATE TABLE tbl_tipo_compra (
    id_tipoCompra INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipoCompra VARCHAR(255)
);

CREATE TABLE tbl_compra (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    fecha_compra DATE,
    monto_total_compra DECIMAL(10, 2),
    descripcion_compra VARCHAR(255),
    referencia VARCHAR(255),
    id_metodo_pago INT,
    id_estado INT,
    id_tipoCompra INT,
    id_usuario INT,
    id_persona INT,
    id_empresa INT,
    id_sucursal INT,
    FOREIGN KEY (id_metodo_pago) REFERENCES tbl_metodo_pago(id_metodo_pago),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_tipoCompra) REFERENCES tbl_tipo_compra(id_tipoCompra),
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario),
    FOREIGN KEY (id_persona) REFERENCES tbl_persona(id_persona),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_compra_detalle (
    id_compra_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_compra INT,
    id_lote INT,
    nombre_producto_dcompra VARCHAR(255),
    cantidad_producto_dcompra INT,
    precio_unitario_producto_dcompra DECIMAL(10, 2),
    subtotal_dcompra DECIMAL(10, 2),
    FOREIGN KEY (id_compra) REFERENCES tbl_compra(id_compra),
    FOREIGN KEY (id_lote) REFERENCES tbl_lote(id_lote)
);

CREATE TABLE tbl_cuenta_x_cobrar (
    id_cxc INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    monto_cxc DECIMAL(10, 2),
    fecha_emision_cxc DATE,
    fecha_vencimiento_cxc DATE,
    id_estado INT,
    id_sucursal INT,
    descripcion_cxc VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES tbl_persona(id_persona),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_historial_cxc (
    id_historial_cxc INT PRIMARY KEY AUTO_INCREMENT,
    id_cxc INT,
    fecha_pago_historial_cxc DATE,
    monto_pagado_historial_cxc DECIMAL(10, 2),
    id_metodo_pago INT,
    referencia_pago_historial_cxc VARCHAR(255),
    FOREIGN KEY (id_cxc) REFERENCES tbl_cuenta_x_cobrar(id_cxc),
    FOREIGN KEY (id_metodo_pago) REFERENCES tbl_metodo_pago(id_metodo_pago)
);

CREATE TABLE tbl_imagen_cxc (
    id_imagen_cxc INT PRIMARY KEY AUTO_INCREMENT,
    id_historial_cxc INT,
    url_imagen_cxc VARCHAR(255),
    descripcion_imagen_cxc VARCHAR(255),
    fecha_subida_imagen_cxc DATE,
    FOREIGN KEY (id_historial_cxc) REFERENCES tbl_historial_cxc(id_historial_cxc)
);

CREATE TABLE tbl_cuenta_x_pagar (
    id_cxp INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    monto_cxp DECIMAL(10, 2),
    fecha_emision_cxp DATE,
    fecha_vencimiento_cxp DATE,
    id_estado INT,
    id_sucursal INT,
    descripcion_cxp VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES tbl_persona(id_persona),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal)
);

CREATE TABLE tbl_historial_cxp (
    id_historial_cxp INT PRIMARY KEY AUTO_INCREMENT,
    id_cxp INT,
    fecha_pago_historial_cxp DATE,
    monto_pagado_historial_cxp DECIMAL(10, 2),
    id_metodo_pago INT,
    referencia_pago_historial_cxp VARCHAR(255),
    FOREIGN KEY (id_cxp) REFERENCES tbl_cuenta_x_pagar(id_cxp),
    FOREIGN KEY (id_metodo_pago) REFERENCES tbl_metodo_pago(id_metodo_pago)
);

CREATE TABLE tbl_imagen_cxp (
    id_imagen_cxp INT PRIMARY KEY AUTO_INCREMENT,
    id_historial_cxp INT,
    url_imagen_cxp VARCHAR(255),
    descripcion_imagen_cxp VARCHAR(255),
    fecha_subida_imagen_cxp DATE,
    FOREIGN KEY (id_historial_cxp) REFERENCES tbl_historial_cxp(id_historial_cxp)
);

CREATE TABLE tbl_caja (
    id_caja INT PRIMARY KEY AUTO_INCREMENT,
    nombre_caja VARCHAR(255),
    id_sucursal INT,
    saldo_inicial_caja DECIMAL(10, 2),
    saldo_actual_caja DECIMAL(10, 2),
    fecha_creacion_caja DATE,
    descripcion_caja VARCHAR(255),
    id_estado INT,
    id_empresa INT,
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa)
);

CREATE TABLE tbl_apertura_caja (
    id_apertura_caja INT PRIMARY KEY AUTO_INCREMENT,
    id_caja INT,
    fecha_apertura_caja DATE,
    id_usuario INT,
    saldo_inicial_apertura_caja DECIMAL(10, 2),
    id_estado INT,
    FOREIGN KEY (id_caja) REFERENCES tbl_caja(id_caja),
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_detalle_apertura_caja (
    id_det_apertura_caja INT PRIMARY KEY AUTO_INCREMENT,
    id_apertura_caja INT,
    id_metodo_pago INT,
    monto_det_apertura_caja DECIMAL(10, 2),
    fecha_det_apertura_caja DATE,
    descripcion VARCHAR(255),
    FOREIGN KEY (id_apertura_caja) REFERENCES tbl_apertura_caja(id_apertura_caja),
    FOREIGN KEY (id_metodo_pago) REFERENCES tbl_metodo_pago(id_metodo_pago)
);

CREATE TABLE tbl_bodega_producto (
    id_bodega INT,
    id_producto INT,
    stock_producto INT,
    stock_min_producto INT,
    stock_max_producto INT,
    FOREIGN KEY (id_bodega) REFERENCES tbl_bodega(id_bodega),
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto)
);

CREATE TABLE tbl_lista_precio (
    id_lista_precio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_lista_precio VARCHAR(50) NOT NULL,
    descripcion_lista_precio VARCHAR(100) NULL,
    id_sucursal INT,
    id_empresa INT,
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursal(id_sucursal),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa)
);

CREATE TABLE tbl_lista_precio_producto (
    id_lista_precio_producto INT PRIMARY KEY AUTO_INCREMENT,
    id_lista_precio INT,
    id_producto INT,
    precio_producto DECIMAL(10,2),
    FOREIGN KEY (id_lista_precio) REFERENCES tbl_lista_precio(id_lista_precio),
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto)
);

CREATE TABLE tbl_traslado (
    id_traslado INT PRIMARY KEY AUTO_INCREMENT,
    fecha_traslado DATE,
    descripcion_traslado VARCHAR (255),
    documento_traslado VARCHAR (255),
    id_bodega_origen INT,
    id_bodega_destino INT,
    id_usuario INT,
    id_estado INT,
    id_empresa INT,
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario),
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado),
    FOREIGN KEY (id_bodega_origen) REFERENCES tbl_bodega(id_bodega),
    FOREIGN KEY (id_bodega_destino) REFERENCES tbl_bodega(id_bodega),
    FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa)
);

CREATE TABLE tbl_detalle_traslado (
    id_detalle_traslado INT PRIMARY KEY AUTO_INCREMENT,
    id_traslado INT,
    id_producto INT,
    cantidad_trasladar INT,
    FOREIGN KEY (id_traslado) REFERENCES tbl_traslado(id_traslado),
    FOREIGN KEY (id_producto) REFERENCES tbl_producto(id_producto)
);

CREATE TABLE tbl_modulo (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_modulo VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_permiso (
    id_permiso INT PRIMARY KEY AUTO_INCREMENT,
    nombre_permiso VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_usuario_permiso_modulo (
    id_usuario INT,
    id_permiso INT,
    id_modulo INT,
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario),
    FOREIGN KEY (id_permiso) REFERENCES tbl_permiso(id_permiso),
    FOREIGN KEY (id_modulo) REFERENCES tbl_modulo(id_modulo),
    PRIMARY KEY (id_usuario, id_permiso, id_modulo)
);

CREATE TABLE tbl_unidad_medida (
    id_unidad_medida INT AUTO_INCREMENT PRIMARY KEY,
    codigo_unidad_medida VARCHAR(4),
    nombre_unidad_medida VARCHAR(15),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES tbl_estado(id_estado)
);

CREATE TABLE tbl_auditoria (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    tabla_afectada VARCHAR(255),
    accion_realizada VARCHAR(255),
    fecha_accion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    datos_previos TEXT,
    datos_nuevos TEXT,
    FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario)
);
