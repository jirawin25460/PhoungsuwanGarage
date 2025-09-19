<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>รายละเอียดรถยนต์</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin-top: 60px;
        }
        .car-details-container {
            display: flex;
            justify-content: center;
            padding: 30px;
            margin-top: 80px;
        }
        .car-details {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            border: 2px solid #e0e0e0;
            max-width: 800px;
            width: 100%;
            text-align: left;
        }
        .car-details img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        .car-title {
            font-size: 1.8em;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            text-align: center;
        }
        .car-price {
            font-size: 1.6em;
            color: red;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .button {
            background-color: #e60000;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: inline-block;
        }
        .button:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp"></jsp:include>

<div class="car-details-container">
    <div class="car-details">
        <div class="car-details-header">
            <h1 class="car-title">รายละเอียดรถยนต์: ${car.make.name} ${car.model} (${car.year})</h1>
            <img src="${car.imageUrl}" alt="${car.model}">
        </div>
        <div class="car-info">
            <p><strong>ผู้ผลิต:</strong> ${car.make.name}</p>
            <p><strong>รุ่น:</strong> ${car.model}</p>
            <p><strong>ปีที่ผลิต:</strong> ${car.year}</p>
            <p><strong>รายละเอียดเพิ่มเติม:</strong> ${car.details}</p>
        </div>
        <p class="car-price">ราคา: ${car.price} บาท</p>
        
        <!-- Button Container -->
        <div class="button-container">
            <form id="testDriveForm" action="orderForm" method="get">
                <input type="hidden" name="carId" value="${car.carId}">
                <button type="button" class="button" onclick="checkLogin()">สนใจทดลองขับ</button>
            </form>
            <c:if test="${user != null && user.email == 'Admin2546@gmail.com'}">
                <form action="editCar" method="get" style="display:inline;">
                    <input type="hidden" name="carId" value="${car.carId}">
                    <button type="submit" class="button">แก้ไขข้อมูล</button>
                </form>
                <form action="deleteCar" method="get" style="display:inline;" onsubmit="return confirmDelete();">
                    <input type="hidden" name="carId" value="${car.carId}">
                    <button type="submit" class="button">ลบข้อมูลรถ</button>
                </form>
            </c:if>
        </div>
    </div>
</div>

<script>
    function checkLogin() {
        <% boolean isLoggedIn = (session.getAttribute("user") != null); %>
        var isLoggedIn = <%= isLoggedIn %>;

        if (!isLoggedIn) {
            alert("กรุณาเข้าสู่ระบบก่อนทำการทดลองขับ");
            window.location.href = "customer";
        } else {
            document.getElementById("testDriveForm").submit();
        }
    }

    function confirmDelete() {
        return confirm("คุณแน่ใจว่าต้องการลบข้อมูลรถคันนี้?");
    }
</script>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
