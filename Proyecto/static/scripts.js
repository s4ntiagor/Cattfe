console.log("Script cargado");

function searchClient() {
    const identificacion = document.getElementById('search_cliente_identificacion').value;
    fetch(`/get_cliente/${identificacion}`)
        .then(response => response.json())
        .then(cliente => {
            const detallesDiv = document.getElementById('clienteDetalles');
            detallesDiv.innerHTML = `
                <strong>Nombre:</strong> ${cliente.nombre_cliente}<br>
                <strong>Apellido:</strong> ${cliente.apellido_cliente}<br>
                <strong>Email:</strong> ${cliente.email_cliente}<br>
                <strong>Teléfono:</strong> ${cliente.telefono_cliente}<br>
                <strong>Fecha de Nacimiento:</strong> ${cliente.fecha_nacimiento_cliente}<br>
            `;
            // Establecer el valor de identificación en el campo oculto para eliminar
            document.getElementById('clienteIdentificacion').value = identificacion;
        });
}

function deleteCliente() {
    const identificacion = document.getElementById('clienteIdentificacion').value;

    fetch(`/delete_cliente/${identificacion}`, {
        method: 'POST'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Error en la respuesta del servidor');
        }
        return response.json();
    })
    .then(data => {
        if (data.status === "success") {
            alert(data.message);
            // Aquí puedes agregar cualquier otra acción que quieras realizar después de eliminar el cliente, como limpiar el formulario o redirigir a otra página.
        } else {
            alert("Hubo un error al eliminar el cliente.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert("Hubo un error al eliminar el cliente.");
    });
}

function showProductFields() {
    const tipo = document.getElementById('tipo').value;

    // Ocultar todos los campos específicos primero
    document.getElementById('divTipoLeche').style.display = 'none';
    document.getElementById('divGenero').style.display = 'none';
    // ... otros campos ...

    // Mostrar campos según el tipo seleccionado
    if (tipo === 'bebida') {
        document.getElementById('divTipoLeche').style.display = 'block';
    } else if (tipo === 'libro') {
        document.getElementById('divGenero').style.display = 'block';
        // ... otros campos ...
    }
    // ... otros tipos ...
}

function searchProduct() {
    const productID = document.getElementById('productID').value;
    fetch(`/search_product/${productID}`)
        .then(response => response.json())
        .then(product => {
            addToTable(product);
        });
}

function addToTable(product) {
    const table = document.getElementById('selectedProducts').getElementsByTagName('tbody')[0];
    let row = table.insertRow();
    let cell1 = row.insertCell(0);
    let cell2 = row.insertCell(1);
    let cell3 = row.insertCell(2);
    let cell4 = row.insertCell(3);
    cell1.innerHTML = product.nombre_producto;
    cell2.innerHTML = product.precio_producto;
    cell3.innerHTML = 1; // Cantidad inicial
    cell4.innerHTML = product.precio_producto; // Subtotal inicial
    updateTotal();
}



function searchUser() {
    const identificacion_usuario = document.getElementById('search_usuario_identificacion').value;
    fetch(`/get_usuario/${identificacion_usuario}`)
        .then(response => response.json())
        .then(usuario => {
            const detallesDiv = document.getElementById('usuarioDetalles');
            detallesDiv.innerHTML = `
            <strong>Nombre:</strong> ${cliente.nombre_cliente}<br>
            <strong>Apellido:</strong> ${cliente.apellido_cliente}<br>
            <strong>Email:</strong> ${cliente.email_cliente}<br>
            <strong>Teléfono:</strong> ${cliente.telefono_cliente}<br>
            <strong>Fecha de Nacimiento:</strong> ${cliente.fecha_nacimiento_cliente}<br>
        `;
            document.getElementById('usuarioIdentificacion').value = usuario.identificacion_usuario;
        });
}

function deleteUser() {
    const identificacion = document.getElementById('usuarioIdentificacion').value;

    fetch(`/delete_usuario/${identificacion_usuario}`, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === "success") {
            alert(data.message);
            // Aquí puedes agregar cualquier otra acción que quieras realizar después de eliminar el usuario.
        } else {
            alert("Hubo un error al eliminar el usuario.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert("Hubo un error al eliminar el usuario.");
    });
}

document.addEventListener("DOMContentLoaded", function() {
    console.log("Script cargado");  
    var alertElement = document.getElementById("dynamicAlert");
    
    if (alertElement) {
        setTimeout(function() {
            alertElement.remove();
        }, 5000);
    }
});


/////// Funciones para el formulario de facturacion //////////////////

// Buscar cliente por identificación
function searchClientV() {
    const identificacion = document.getElementById('identificacion_cliente').value;

    fetch(`/get_cliente/${identificacion}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Cliente no encontrado');
            }
            return response.json();
        })
        .then(cliente => {
            const detallesDiv = document.getElementById('clienteDetallesV');
            detallesDiv.innerHTML = `
            <strong>Nombre:</strong> ${cliente.nombre_cliente}<br>
            <strong>Apellido:</strong> ${cliente.apellido_cliente}<br>
            <strong>Email:</strong> ${cliente.email_cliente}<br>
            <strong>Teléfono:</strong> ${cliente.telefono_cliente}<br>
            <strong>Fecha de Nacimiento:</strong> ${cliente.fecha_nacimiento_cliente}<br>
        `;
            document.getElementById('clienteIdentificacion').value = cliente.identificacion_cliente;
        })
        .catch(error => {
            alert(error.message);
        });
}

document.getElementById("btnBuscarCliente").addEventListener("click", function(event) {
    // Esto previene que el formulario se envíe
    event.preventDefault();
    searchClientV();
});

function searchProduct() {
    const productId = document.getElementById('product_id').value;

    fetch(`/get_producto/${productId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Producto no encontrado');
            }
            return response.json();
        })
        .then(producto => {
            const selectedProductsTable = document.getElementById('selectedProductsTable');
            const newRow = `
                <tr>
                    <td>${producto.nombre}</td>
                    <td>${producto.precio}</td>
                    <td><input type="number" name="cantidad_${producto.id}" min="1" value="1" onchange="calculateTotal()"></td>
                    <td>${producto.precio}</td> <!-- Este es el subtotal inicial, que cambiará cuando se modifique la cantidad -->
                    <td><button type="button" onclick="removeProductRow(this)">Eliminar</button></td>
                </tr>
            `;
            selectedProductsTable.innerHTML += newRow;
        })
        .catch(error => {
            alert(error.message);
        });
}
document.getElementById('btnBuscarProducto').addEventListener('click', searchProduct);

function loadCombos() {
    fetch('/get_combos')
        .then(response => response.json())
        .then(combos => {
            const comboSelect = document.getElementById('combo');
            comboSelect.innerHTML = ''; // Limpiar las opciones existentes
            combos.forEach(combo => {
                const option = document.createElement('option');
                option.value = combo.id_combo;
                option.textContent = combo.nombre_combo;
                comboSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error al cargar los combos:', error);
        });
}

// Llama a la función cuando se carga la página
window.onload = loadCombos;

function addComboToTable() {
    const comboSelect = document.getElementById('combo');
    const selectedComboId = comboSelect.value;
    const selectedComboName = comboSelect.options[comboSelect.selectedIndex].text;

    // Realizar una solicitud fetch para obtener el precio del combo seleccionado
    fetch(`/get_combo_price/${selectedComboId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al obtener el precio del combo');
            }
            return response.json();
        })
        .then(combo => {
            const table = document.getElementById('selectedProductsTable');
            const newRow = document.createElement('tr');
            newRow.innerHTML = `
                <td>${selectedComboName}</td>
                <td>${combo.precio_combo}</td>
                <td>1</td>
                <td>${combo.precio_combo}</td>
                <td><button type="button" onclick="removeProductRow(this, event)">Eliminar</button></td>
            `;
            table.appendChild(newRow);
            calculateTotal();
        })
        .catch(error => {
            console.error('Error al agregar el combo a la tabla:', error);
        });
}


// Agregar otro producto al formulario
function addProductRow() {
    const productSelection = document.getElementById('productSelection');
    const newRow = document.createElement('div');
    newRow.className = 'productRow';
    newRow.innerHTML = `
        <input type="number" name="producto" class="productID" placeholder="Ingrese ID del producto">
        <input type="number" name="cantidad" placeholder="Cantidad">
    `;
    productSelection.appendChild(newRow);
}

function calculateTotal() {
    const table = document.getElementById('selectedProductsTable');
    const rows = table.getElementsByTagName('tr');
    let total = 0;

    for (let i = 0; i < rows.length; i++) {
        const cells = rows[i].getElementsByTagName('td');
        const precio = parseFloat(cells[1].innerText);
        
        // Aquí es donde parece que ocurre el error. Asegúrate de que el input existe.
        const cantidadInput = cells[2].getElementsByTagName('input')[0];
        
        if (cantidadInput) {  // Verifica si el input existe antes de intentar acceder a su valor.
            const cantidad = parseFloat(cantidadInput.value);
            const subtotal = precio * cantidad;
            cells[3].innerText = subtotal.toFixed(2);
            total += subtotal;
        } else {
            // Si no hay un input, asume que la cantidad es 1 (como en el caso de los combos).
            total += precio;
        }
    }

    const discount = parseFloat(document.getElementById('discount').value);
    total = total * (1 - discount);

    document.getElementById('totalAmount').innerText = `$${total.toFixed(2)}`;
}


function removeProductRow(button, event) {
    event.preventDefault();
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
    calculateTotal(); // Recalcula el total después de eliminar un producto o combo
}


// Funciones para el dashboard

window.onload = function() {
    fetch('/data/dias_ventas')
        .then(response => response.json())
        .then(data => {
            const labels = data.map(item => item.dia_semana);
            const values = data.map(item => item.cantidad);

            const ctx = document.getElementById('ventasPorDia').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Ventas por día',
                        data: values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 99, 132, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(255, 99, 132, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error("Error al cargar los datos:", error);
        });
}

console.log("Script cargado");