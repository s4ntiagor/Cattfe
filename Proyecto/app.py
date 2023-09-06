from flask import Flask, render_template, request, session,  jsonify, redirect, url_for
from flask_mysqldb import MySQL
from datetime import datetime
import pymysql

app = Flask(__name__, template_folder='template')

# Configuración para el acceso a la base de datos
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'mysql2023'
app.config['MYSQL_DB'] = 'catffe'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

# Inicialización de MySQL
mysql = MySQL(app)

# Ruta de la pagina principal/login
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/acceso-login', methods=["GET", "POST"])
def login():
    if request.method == 'POST' and 'txtIdentificacion' in request.form and 'txtPassword':
        _identificacion = request.form['txtIdentificacion']
        _password = request.form['txtPassword']
    
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM usuario WHERE identificacion_usuario = %s AND contrasena = %s', (_identificacion, _password))
        account = cur.fetchone()

    
        if account:
            session['logueado'] = True
            session['id'] = account['identificacion_usuario']
            session['rol'] = account['nombre_rol']

            
            if session['rol']==1:
                return render_template("admin_dashboard.html")
            elif session['rol']==2:
                return render_template("sale.html")
        else:
            return render_template('index.html', mensaje = "usuario o contraseña incorrecta")
        
# Ruta para el logout
@app.route('/logout')
def logout():
    # Eliminar el usuario de la sesión
    session.pop('id', None)
    return redirect(url_for('index'))

# Ruta para acceso del admin
@app.route('/admin_dashboard')
def admin_dashboard():
    return render_template('admin_dashboard.html')

### Rutas de solo acceso admin

# Ruta para registrar clientes (solo para el admin)
@app.route('/register_admin', methods=['GET', 'POST'])
def register_admin():
    if request.method == 'POST':
        
        # Recoger los datos del formulario
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        email = request.form['email']
        telefono = request.form['telefono']
        identificacion_cliente = request.form['identificacion']
        fecha_nacimiento = request.form['fecha_nacimiento']

        # Verificar si el cliente ya está registrado
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM cliente WHERE identificacion_cliente = %s', [identificacion_cliente])
        cliente_existente = cur.fetchone()

        if cliente_existente:
            return render_template('register.html', mensaje="El cliente con la identificación {} ya está registrado.".format(identificacion_cliente))

        # Si el cliente no existe, procede con la inserción
        cur.execute('INSERT INTO cliente (nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, identificacion_cliente, fecha_nacimiento_cliente) VALUES (%s, %s, %s, %s, %s, %s)', (nombre, apellido, email, telefono, identificacion_cliente, fecha_nacimiento))

        mysql.connection.commit()
        cur.close()

        return render_template('admin_dashboard.html', mensaje = "cliente registrado con éxito!")
    
    else:
        # Renderizar la página de registro
        return render_template('register_admin.html')

@app.route('/get_cliente/<identificacion>', methods=['GET'])
def get_cliente(identificacion):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente WHERE identificacion_cliente = %s', [identificacion])
    cliente = cur.fetchone()
    cur.close()

    if cliente:
        # Convertir el objeto cliente a un diccionario serializable
        cliente_dict = {
            'identificacion_cliente': cliente['identificacion_cliente'],
            'nombre_cliente': cliente['nombre_cliente'],
            'apellido_cliente': cliente['apellido_cliente'],
            'email_cliente': cliente['email_cliente'],
            'telefono_cliente': cliente['telefono_cliente'],
            'fecha_nacimiento_cliente': cliente['fecha_nacimiento_cliente']
            # ... otros campos del cliente ...
        }
        return jsonify(cliente_dict)
    else:
        return jsonify({"error": "Cliente no encontrado"}), 404


@app.route('/get_usuario/<identificacion>', methods=['GET'])
def get_usuario(identificacion):
    cur = mysql.connection.cursor()
    cur.execute('SELECT identificacion_usuario, nombre_rol, nombre_usuario, apellido_usuario FROM usuario WHERE identificacion_usuario = %s', [identificacion])
    usuario = cur.fetchone()
    cur.close()

    if usuario:
        return jsonify(usuario)
    else:
        return jsonify({"error": "Usuario no encontrado"}), 404

# Ruta para eliminar a un cliente por su identificacion
@app.route('/delete_cliente/<int:cliente_id>', methods=['POST'])
def delete_cliente(cliente_id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM cliente WHERE identificacion_cliente = %s', [cliente_id])
    mysql.connection.commit()
    cur.close()
    return jsonify(status="success", message="Cliente eliminado con éxito.")

# Ruta para agregar un producto nuevo
@app.route('/agregar_producto', methods=['POST'])
def agregar_producto():
    # Recoger los datos del formulario
        id_producto = int(request.form['id_producto'])
        nombre_producto = request.form['nombre_producto']
        precio_producto = float(request.form['precio_producto'])
        descripcion_producto = request.form['descripcion_producto']
        tipo = request.form['tipo']

        # Insertar los datos en la base de datos
        cur = mysql.connection.cursor()
        
        # Modificación de la consulta SQL para incluir todos los campos
        cur.execute('INSERT INTO productos (id_producto, nombre_producto, precio_producto, descripcion_producto, tipo) VALUES (%s, %s, %s, %s, %s)', 
                    (id_producto, nombre_producto, precio_producto, descripcion_producto, tipo))

        mysql.connection.commit()
        cur.close()
        return render_template('admin_dashboard.html', mensaje="Producto agregado con éxito!")
    
# Ruta para modificar un producto
@app.route('/modificar_producto', methods=['GET', 'POST'])
def modificar_producto():
    if request.method == 'POST':
        # Aquí iría el código para modificar un producto en la base de datos
        pass
    return render_template('modificar_producto.html')

# Ruta para agregar una mascota 
@app.route('/agregar_mascota_admin', methods=['GET', 'POST'])
def agregar_mascota_admin():
    mensaje = None  # Inicializa el mensaje como None
    if request.method == 'POST':
        id_cliente = request.form['id_cliente']
        nombre_mascota = request.form['nombre_mascota']
        color_mascota = request.form['color_mascota']
        fecha_nacimiento_mascota = request.form['fecha_nacimiento_mascota']

        # Conexión a la base de datos y guardar los datos
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO mascota (id_cliente, nombre_mascota, color_mascota, fecha_nacimiento_mascota) VALUES (%s, %s, %s, %s)', 
                    (id_cliente, nombre_mascota, color_mascota, fecha_nacimiento_mascota))
        mysql.connection.commit()
        cur.close()

        mensaje = "Mascota agregada con éxito!"  # Establece el mensaje solo después de agregar la mascota
    return render_template('agregar_mascota_admin.html', mensaje=mensaje)

## Rutas para el dashboard

@app.route('/dashboard')
def dashboard():
    cursor = mysql.connection.cursor()

    # Obtener el combo más vendido
    cursor.execute("""
        SELECT c.nombre_combo, COUNT(dv.id_combo) AS cantidad_vendida
        FROM detalle_de_venta dv
        JOIN combo c ON dv.id_combo = c.id_combo
        GROUP BY c.id_combo
        ORDER BY cantidad_vendida DESC
        LIMIT 1;
    """)
    combo = cursor.fetchone()

    # Obtener los productos más vendidos
    cursor.execute("""
        SELECT p.nombre_producto, COUNT(dv.id_producto) AS cantidad_vendida
        FROM detalle_de_venta dv
        JOIN venta v ON dv.id_venta = v.id_venta
        JOIN cliente c ON v.id_cliente = c.identificacion_cliente
        JOIN productos p ON dv.id_producto = p.id_producto
        WHERE DATE_ADD(c.fecha_nacimiento_cliente, INTERVAL 30 YEAR) >= CURDATE()
        GROUP BY p.id_producto
        ORDER BY cantidad_vendida DESC;
    """)
    productos = cursor.fetchall()

    # Obtener las ventas por día
    cursor.execute("""
        SELECT DAYNAME(fecha_hora) AS dia_semana, COUNT(*) AS cantidad
        FROM venta
        GROUP BY dia_semana
        ORDER BY cantidad DESC;
    """)
    dias = cursor.fetchall()

    # Obtener los toppings más vendidos
    cursor.execute("""
        SELECT
            p.nombre_producto AS topping,
            SUM(dv.cantidad) AS cantidad_vendida
        FROM
            detalle_de_venta dv
        INNER JOIN
            productos p ON dv.id_producto = p.id_producto
        WHERE
            p.tipo = 'topping'
        GROUP BY
            p.nombre_producto
        ORDER BY
            cantidad_vendida DESC;
    """)
    toppings = cursor.fetchall()
    
    # Obtener los productos más vendidos por rango de edad
    cursor.execute("""
        SELECT
            CASE
                WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento_cliente, CURDATE()) BETWEEN 18 AND 30 THEN '18-30 años'
                WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento_cliente, CURDATE()) BETWEEN 31 AND 43 THEN '31-43 años'
                WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento_cliente, CURDATE()) BETWEEN 44 AND 56 THEN '44-56'
                ELSE 'Más de 56'
            END AS rango_edad,
            productos.nombre_producto,
            SUM(detalle_de_venta.cantidad) AS cantidad_vendida
        FROM
            cliente
        JOIN
            venta ON cliente.identificacion_cliente = venta.id_cliente
        JOIN
            detalle_de_venta ON venta.id_venta = detalle_de_venta.id_venta
        JOIN
            productos ON detalle_de_venta.id_producto = productos.id_producto
        GROUP BY
            rango_edad, productos.nombre_producto
        ORDER BY
            rango_edad, cantidad_vendida DESC;
    """)
    productos_edad = cursor.fetchall()
    
    # Obtener los patrones de compra segmentados por edades y preferencias
    cursor.execute("""
        SELECT YEAR(CURDATE()) - YEAR(cliente.fecha_nacimiento_cliente) AS edad, productos.tipo, COUNT(detalle_de_venta.id_producto) AS cantidad
        FROM detalle_de_venta
        JOIN venta ON detalle_de_venta.id_venta = venta.id_venta
        JOIN cliente ON venta.id_cliente = cliente.identificacion_cliente
        JOIN productos ON detalle_de_venta.id_producto = productos.id_producto
        GROUP BY edad, productos.tipo
        ORDER BY edad, cantidad DESC
        LIMIT 0, 1000;
    """)
    patrones = cursor.fetchall()

    cursor.close()

    return render_template('dashboard.html', combo_mas_vendido=combo, productos_mas_vendidos=productos, dias_ventas=dias, toppings_vendidos=toppings, productos_por_rango_edad=productos_edad, patrones_compra=patrones)


### Rutas de solo acceso trabajador

# Ruta para registrar nuevo cliente
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        
        # Recoger los datos del formulario
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        email = request.form['email']
        telefono = request.form['telefono']
        identificacion_cliente = request.form['identificacion']
        fecha_nacimiento = request.form['fecha_nacimiento']

        # Verificar si el cliente ya está registrado
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM cliente WHERE identificacion_cliente = %s', [identificacion_cliente])
        cliente_existente = cur.fetchone()

        if cliente_existente:
            return render_template('register.html', mensaje="El cliente con la identificación {} ya está registrado.".format(identificacion_cliente))

        # Si el cliente no existe, procede con la inserción
        cur.execute('INSERT INTO cliente (nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, identificacion_cliente, fecha_nacimiento_cliente) VALUES (%s, %s, %s, %s, %s, %s)', (nombre, apellido, email, telefono, identificacion_cliente, fecha_nacimiento))

        mysql.connection.commit()
        cur.close()

        return render_template('sale.html', mensaje = "cliente registrado con éxito!")
    
    else:
        # Renderizar la página de registro
        return render_template('register.html')
    
## Rutas para la facturacion
 
# Ruta para buscar un producto por su id

@app.route('/get_producto/<int:id>', methods=['GET'])
def get_producto(id):
    cur = mysql.connection.cursor()
    
    # Buscar el producto por su ID en la base de datos
    cur.execute('SELECT * FROM productos WHERE id_producto = %s', [id])
    producto = cur.fetchone()
    
    cur.close()

    # Si no se encuentra el producto, devolver un error
    if not producto:
        return jsonify({"error": "Producto no encontrado"}), 404

    # Si se encuentra, devolver los detalles del producto en formato JSON
    return jsonify({
        "id": producto["id_producto"],
        "nombre": producto["nombre_producto"],
        "precio": producto["precio_producto"],
    })

@app.route('/get_combos', methods=['GET'])
def get_combos():
    cur = mysql.connection.cursor()
    cur.execute('SELECT id_combo, nombre_combo FROM combo')
    combos = cur.fetchall()
    cur.close()
    return jsonify(combos)

@app.route('/get_combo_price/<int:id>', methods=['GET'])
def get_combo_price(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT precio_combo FROM combo WHERE id_combo = %s', [id])
    combo = cur.fetchone()
    cur.close()
    if combo:
        return jsonify(combo)
    else:
        return jsonify({"error": "Combo no encontrado"}), 404



# Ruta para obtener un producto por su id
@app.route('/get_product/<int:product_id>', methods=['GET'])
def get_product(product_id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM productos WHERE id_producto = %s', [product_id])
    product = cur.fetchone()
    return jsonify(product)

# Ruta para procesar la venta
    
@app.route('/process_sale', methods=['POST'])
def process_sale():
    identificacion_cliente = request.form['identificacion_cliente']
    descuento = float(request.form['descuento'])
    
    # Crear el cursor aquí
    cur = mysql.connection.cursor()

    # Establecer la fecha y hora actuales
    fecha_hora = datetime.now()

    # Verificar que el cliente existe
    cur.execute('SELECT * FROM cliente WHERE identificacion_cliente = %s', [identificacion_cliente])
    cliente = cur.fetchone()
    if not cliente:
        cur.close()
        return render_template('sale.html', mensaje="Error: Cliente no encontrado")

    # Insertar la venta en la tabla venta
    cur.execute('INSERT INTO venta (fecha_hora, id_cliente, id_usuario) VALUES (%s, %s, %s)', 
                (fecha_hora, identificacion_cliente, session['id']))  # Asumiendo que tienes el id del usuario en la sesión

    # Obtener el ID de la venta que acabamos de insertar
    id_venta = cur.lastrowid

    # Procesar cada producto en la venta
    total_venta = 0.0
    productos = request.form.getlist('id_producto')
    cantidades = request.form.getlist('cantidad')
    for i, id_producto in enumerate(productos):
        cantidad = int(cantidades[i])
        
        # Verificar que el producto existe y que las cantidades son válidas
        cur.execute('SELECT * FROM productos WHERE id_producto = %s', [id_producto])
        producto = cur.fetchone()
        if not producto or cantidad <= 0:
            cur.close()
            return render_template('sale.html', mensaje="Error: Producto no válido o cantidad incorrecta")

        subtotal = producto['precio_producto'] * cantidad
        total_venta += subtotal

        # Insertar en la tabla detalle_de_venta
        cur.execute('INSERT INTO detalle_de_venta (cantidad, id_producto, id_venta, precio_unitario) VALUES (%s, %s, %s, %s)', 
                    (cantidad, id_producto, id_venta, producto['precio_producto']))

    # Aplicar descuento
    total_descuento = total_venta * descuento
    total_final = total_venta - total_descuento

    # Aquí puedes actualizar la tabla de venta con el total si lo necesitas

    mysql.connection.commit()
    cur.close()

    return render_template('sale.html', mensaje=f"Venta procesada con éxito!")


### Ruta para agregar una mascota
@app.route('/agregar_mascota', methods=['GET', 'POST'])
def agregar_mascota():
    mensaje = None  # Inicializa el mensaje como None
    if request.method == 'POST':
        id_cliente = request.form['id_cliente']
        nombre_mascota = request.form['nombre_mascota']
        color_mascota = request.form['color_mascota']
        fecha_nacimiento_mascota = request.form['fecha_nacimiento_mascota']

        # Conexión a la base de datos y guardar los datos
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO mascota (id_cliente, nombre_mascota, color_mascota, fecha_nacimiento_mascota) VALUES (%s, %s, %s, %s)', 
                    (id_cliente, nombre_mascota, color_mascota, fecha_nacimiento_mascota))
        mysql.connection.commit()
        cur.close()

        mensaje = "Mascota agregada con éxito!"  # Establece el mensaje solo después de agregar la mascota
    return render_template('agregar_mascota.html', mensaje=mensaje)


@app.route('/sale')
def sale():
    return render_template('sale.html')

if __name__ == '__main__':
    app.secret_key = '123456'
    app.run(debug=True, host='0.0.0.0', port=5000, threaded=True)