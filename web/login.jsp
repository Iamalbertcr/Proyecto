<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <!-- FAVICON -->
        <link rel="icon" type="image/x-icon"
              href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <div class="login-container">
            <h2>Login</h2>

            <form class="longinServlet" action="LoginServlet" method="post">
                <input type="text" name="usuario" placeholder="Usuario" required><br>
                <input type="password" name="clave" placeholder="Clave" required><br>

                <button type="submit">
                    <span class="span-mother">
                        <span>E</span><span>n</span><span>t</span><span>r</span><span>a</span><span>r</span>
                    </span>
                    <span class="span-mother2">
                        <span>E</span><span>n</span><span>t</span><span>r</span><span>a</span><span>r</span>
                    </span>
                </button>
            </form>

            <% if (request.getAttribute("error") != null) {%>
            <p style="color:red"><%= request.getAttribute("error")%></p>
            <% }%>

            <!-- ENLACE A RECUPERAR CONTRASEÑA -->
            <p><a href="recuperar.jsp">¿Olvidó su contraseña?</a></p>

        </div>
        <div class="img-container"></div>

    </body>
</html>
