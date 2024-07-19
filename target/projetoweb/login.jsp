<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<h1 class="text-center mt-4" style="color: #8B0000;">Login</h1>

<div class="container mt-10">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <div class="text-align right mt-3">
                        <a role="button" class="btn btn-outline-primary" href="./index.jsp" class="textcadastrar">Voltar</a>
                    </div>
                    <br>
                    <br>
                    <form action="login" method="POST">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="email@exemplo.com">
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha</label>
                            <input type="password" class="form-control" name="senha" id="senha" placeholder="***********">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Entrar</button>
                        </div>
                        <c:if test="${not empty erro}">
                            <div class="alert alert-dark text-center mt-4" role="alert">
                                <h3>${erro}</h3>
                            </div>
                        </c:if>
                    </form>
                    <div class="text-center mt-3">
                        <span>É novo por aqui?</span>
                        <a href="./cadastrarusuario.jsp" class="textcadastrar">Cadastre-se agora.</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
