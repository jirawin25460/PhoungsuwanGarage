<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>รุ่นรถทั้งหมด</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin-top: 60px;
        }

        h1.my-4 {
            font-size: 36px;
            color: #fff;
            background-color: #333;
            padding: 20px;
            border-left: 10px solid #FF0000;
            text-align: center;
        }

        .button-group,
        .make-dropdown {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
            align-items: center;
        }

        input[type="text"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 300px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #FF0000;
            outline: none;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #FF0000;
        }

        select.make-dropdown {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .error {
            color: red;
            margin-top: 10px;
            display: none;
        }

        .car-title {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .car-link {
            color: white;
            text-decoration: none;
        }

        .car-title:hover {
            background-color: #FF0000;
            text-decoration: none;
        }

        .car-price {
            font-size: 18px;
            color: #e31e24;
            font-weight: bold;
            margin-top: 10px;
        }

        .card {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s ease;
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            transition: opacity 0.3s ease;
        }

        .card:hover img {
            opacity: 0.9;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-body {
            text-align: center;
            padding: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>
</head>

<body>

    <!-- Header -->
    <jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp" />

    <div class="container">

        <!-- Page Title -->
        <h1 class="my-4">รุ่นรถทั้งหมด</h1>

        <!-- Search Form -->
        <form name="frm2" action="searchCar" method="post" class="button-group">
            <input type="text" name="keyword" placeholder="ค้นหารถยนต์" required>
            <input type="submit" value="ค้นหารถยนต์">
            <p class="error">${error}</p>
        </form>

        <!-- Filter by Make -->
        <form action="filterCarsByMake" method="get" class="button-group">
            <select name="makeId" class="make-dropdown" onchange="this.form.submit()">
                <option value="">เลือกยี่ห้อรถ</option>
                <c:forEach var="make" items="${makes}">
                    <option value="${make.makeId}" 
                        <c:if test="${make.makeId == selectedMakeId}">selected</c:if>>
                        ${make.name}
                    </option>
                </c:forEach>
            </select>
        </form>

        <!-- Car List -->
        <div class="row">
            <c:forEach items="${carList}" var="car">
                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                    <div class="card h-100">
                        <img src="${car.imageUrl}" class="card-img-top" alt="${car.model}">
                        <div class="card-body">
                            <a href="detail?carId=${car.carId}" class="car-link">
                                <h4 class="car-title">
                                    ${car.make.name} ${car.model} (${car.year})
                                </h4>
                            </a>
                            <p class="card-text">
                                <c:choose>
                                    <c:when test="${fn:length(car.details) > 45}">
                                        ${fn:substring(car.details, 0, 45)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${car.details}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p class="car-price">เริ่มต้นที่ : ${car.price} บาท</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
