<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22.03.2021
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="ru.job4j.dream.store.PsqlStore" %>
<%@ page import="ru.job4j.dream.model.Candidate" %>
<%@ page import="ru.job4j.dream.model.City" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>

    <%
        String id = request.getParameter("id");
        City city = null;
        Candidate candidate = null;
        if (id != null) {
            candidate = PsqlStore.instOf().findByIdCandidate(Integer.valueOf(id));
            if (candidate.getCityid() != 0) {
                city = PsqlStore.instOf().getCity(candidate.getCityid());
            }
        }
        if (candidate == null) {
            candidate = new Candidate(0, "", 0);
        }
        if (city == null) {
            city = new City(0, "");
        }

    %>
    <script>
    function validate() {
        if ($('#name').val() == '') {
            alert($('#name').attr('placeholder'));
            return false;
        }
        if ($('#city').val() == '') {
            alert($('#city').attr('placeholder'));
            return false;
        }
        return true;
    }

    function getCities() {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/job4j_dreamjob/city",
            dataType: "json",
            success: function (data) {
                var cityId = <%=city.getId()%>;
                let cities = "<option value=\"\"></option>";
                for (let i = 0; i < data.length; i++) {
                    if (cityId === data[i]['id']) {
                        cities += "<option value=" + data[i]['id'] + " selected>" + data[i]['name'] + "</option>";
                    } else {
                        cities += "<option value=" + data[i]['id'] + ">" + data[i]['name'] + "</option>";
                    }
                }
                $('#city').html(cities);
            }
        })
    }
</script>
    <title>Работа мечты</title>
</head>
<body onload="getCities()">>

<li class="nav-item">
    <a class="nav-link" href="<%=request.getContextPath()%>/login.jsp"> <c:out value="${user.name}"/> | Выйти</a>
</li>
<div class="container pt-3">
    <div class="row">
        <div class="card" style="width: 100%">
            <div class="card-header">
                <% if (id == null) { %>
                Новый кандидат.
                <% } else { %>
                Редактирование кандидата.
                <% } %>
            </div>

            <div class="card-body">
                <form action="<%=request.getContextPath()%>/candidates.do?id=<%=candidate.getId()%>" method="post">
                    <div class="form-group">
                        <label>Имя</label>
                        <input type="text" class="form-control" name="name"
                               placeholder="Введите имя"
                               id="name" value="<%=candidate.getName()%>">
                    </div>
                    <div class="form-group">
                        <label for="city">Город</label>
                        <select class="form-control" id="city" name="city"
                                placeholder="Введите город"
                                value="<%=city.getName()%>">
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary" onclick="return validate();">Сохранить</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>