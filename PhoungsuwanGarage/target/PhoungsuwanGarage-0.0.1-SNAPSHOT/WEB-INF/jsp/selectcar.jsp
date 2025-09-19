<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<title>Phoungsuwan Garage</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #e0e0e0;
        margin: 0;
        padding: 0;
    }
    header {
        background-color: #333;
        width: 100%;
        position: fixed;
        top: 0;
        z-index: 1000;
        box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
    }
    .top-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        color: #fff;
    }
    .car-selection {
        text-align: center;
        margin-top: 120px;
    }
    .car-selection img {
        width: 100%;
        max-width: 300px;
        height: auto;
    }
    .car-name {
        font-size: 24px;
        font-weight: bold;
        margin-top: 10px;
    }
    .button {
        margin-top: 20px;
    }
    .arrows {
        cursor: pointer;
        font-size: 36px;
        margin: 0 20px;
        display: inline-block;
        vertical-align: middle;
        user-select: none;
    }
    .top-header a {
        color: #fff;
        font-weight: bold;
        text-decoration: none;
    }
</style>
<script>
    let cars = [
        <c:forEach var="car" items="${carList}" varStatus="status">
        {
            id: "${car.carId}",
            name: "${car.make.name} ${car.model} (${car.year})",
            img: "${car.imageUrl}"
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    let currentIndex = 0;

    function prevCar() {
        if (cars.length > 0) {
            currentIndex = (currentIndex === 0) ? cars.length - 1 : currentIndex - 1;
            updateCarDisplay();
        }
    }

    function nextCar() {
        if (cars.length > 0) {
            currentIndex = (currentIndex === cars.length - 1) ? 0 : currentIndex + 1;
            updateCarDisplay();
        }
    }

    function updateCarDisplay() {
        const carImage = document.getElementById('carImage');
        const carName = document.getElementById('carName');
        const carId = document.getElementById('carId');

        if(cars[currentIndex]){
            carImage.src = cars[currentIndex].img;
            carImage.alt = cars[currentIndex].name;
            carName.textContent = cars[currentIndex].name;
            carId.value = cars[currentIndex].id;
        }
    }

    window.onload = function() {
        if (cars.length > 0) updateCarDisplay();
    }
</script>
</head>
<body>
<header>
    <div class="top-header">
        <div class="d-flex align-items-center">
            <a href="home">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JEMoveYwRON1fon39eGsqjQdaDp11UehDw&s" alt="Honda Logo" height="50">
            </a>
            <div class="ml-3">
                <h1 style="margin:0;font-size:24px;color:#fff;">How we move you.</h1>
                <p style="margin:0;font-size:12px;color:#fff;">CREATE | TRANSCEND, AUGMENT</p>
            </div>
        </div>
        <a href="home" class="text-light">ย้อนกลับ</a>
    </div>
</header>

<div class="container car-selection">
    <h1 class="mb-4">Select Your Car</h1>
    <form action="orderForm" method="get">
        <div class="d-flex justify-content-center align-items-center">
            <span class="arrows" onclick="prevCar()">&#9664;</span>
            <img id="carImage" src="" class="car-image mx-3" alt="Selected Car">
            <span class="arrows" onclick="nextCar()">&#9654;</span>
        </div>
        <div class="car-name mt-3" id="carName"></div>
        <input type="hidden" id="carId" name="carId" value="">
        <div class="button mt-4">
            <button type="submit" class="btn btn-danger">ยืนยัน</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
