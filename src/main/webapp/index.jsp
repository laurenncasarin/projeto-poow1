<%@ page import="br.csi.model.Filme" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<jsp:useBean id="daofilme" class="br.csi.dao.FilmeDAO"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <img src="imgs/logodisco.png" href="index.jsp" alt="Logo" width="80" height="80" class="d-inline-block align-text-top">
        <h2 class="custom-margin">Avaliação de álbuns</h2>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            </ul>
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <img src="imgs/icon.png" href="index.jsp" alt="Login" width="30" height="30" class="d-inline-block align-text-top">
                    <a class="login-link" href="login.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
    .custom-margin {
        margin-right: 10px;
        margin-left: 10px;
    }
</style>



<div class="container">
    <div class="row">

            <h1 class="text-center mt-4" style="color: #8B0000;">Avalie os discos:</h1>

        <div class="col-md-6 text-right">
            <a href="login.jsp" class="btn btn-light mt-4">Ver mais</a>
        </div>
    </div>
    <div class="row mt-4">
        <c:forEach var="filme" items="${daofilme.listarMelhoresFilmes()}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div style="width: 182px; height: 268px; margin: auto;">
                        <img src="${filme.imagem}" class="card-img-top" alt="${filme.nomefilme}" style="width: 100%; height: 100%; object-fit: contain;">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${filme.nomefilme}</h5>
                        <p class="card-text"><strong>Ano:</strong> ${filme.ano}</p>
                        <p class="card-text"><strong>Categoria:</strong> ${filme.categoria}</p>
                        <p class="card-text"><strong>Descrição:</strong> ${filme.descricao}</p>
                        <p class="card-text"><strong>Nota Média:</strong> <fmt:formatNumber value="${filme.notamedia}" maxFractionDigits="2"/></p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
