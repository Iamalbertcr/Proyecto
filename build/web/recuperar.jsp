<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Recuperar Contraseña</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .volver {
                position: absolute;
                top: 20px;
                left: 20px;
                padding: 10px 15px;
                background: #007bff;
                color: white;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
                transition: 0.3s;
            }

            .volver:hover {
                background: #0056b3;
            }

            .contenedor {
                width: 700px;
                height: 250px;
                display: flex;
                flex-direction: column;
                margin: 10% auto;
                background: white;
                padding: 20px;
                text-align: center;
                border-radius: 10px;
                box-shadow: 1px 1px 10px rgba(0,0,0,0.2);
            }

            input {
                width: 90%;
                padding: 15px;
                margin-top: 30px;
                margin-bottom: 40px;
                border-radius: 5px;
                border: 1px solid gray;
                font-size: 15px;
            }

            button {
                width: 30%;
                padding: 10px;
                background: #28a745;
                color: white;
                border: none;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                background: #1f7e33;
            }

            .mensaje {
                color: #d00;
                font-weight: bold;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>

        <!-- BOTÓN VOLVER -->
        <a class="volver" href="login.jsp">Volver</a>

        <br>
        <br>
        <br>
        <br>
        <div class="contenedor">
            <h2>Recuperar Contraseña</h2>

            <form action="RecuperarServlet" method="post">
                <input type="text" name="usuario" placeholder="Ingrese su usuario" required>
                <button type="submit">Recuperar Contraseña</button>
            </form>

            <% if (request.getAttribute("mensaje") != null) {%>
            <p class="mensaje"><%= request.getAttribute("mensaje")%></p>
            <% }%>
        </div>

    </body>
</html>
