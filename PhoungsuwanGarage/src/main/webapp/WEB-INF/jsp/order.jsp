<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>เพิ่มคำสั่งซื้อใหม่</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333333;
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            padding: 10px 0;
        }

        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            color: #FFFFFF;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: 80px auto; /* Adjusted margin for fixed header */
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .car-details {
            flex: 1;
            padding-right: 50px;
            text-align: center;
        }

        .car-details img {
            max-width: 100%;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .car-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-container {
            flex: 1;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .btn-submit {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #ff0000;
        }
    </style>
</head>
<body onload="initializeDates()">
    <header>
        <div class="top-header">
            <div class="d-flex align-items-center">
                <a href="home">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JEMoveYwRON1fon39eGsqjQdaDp11UehDw&s" alt="Honda Logo" height="50">
                </a>
                <div class="ml-3">
                    <h1 style="margin: 0; font-size: 24px; color: #FFFFFF;">How we move you.</h1>
                    <p style="margin: 0; font-size: 12px; color: #FFFFFF;">CREATE | TRANSCEND, AUGMENT</p>
                </div>
            </div>
            <a href="selectcar" class="text-light">ย้อนกลับ</a>
        </div>
    </header>

    <div class="container">
        <!-- ข้อมูลรถยนต์และรูปภาพ -->
        <div class="car-details">
            <label for="carId">รถยนต์:</label>
            <img src="${car.imageUrl}" alt="${car.model}" />
            <div class="car-name">${car.make.name} ${car.model} (${car.year})</div>
        </div>

        <!-- ฟอร์มการกรอกข้อมูล -->
        <div class="form-container">
            <h1>เพิ่มคำสั่งทดลองขับ</h1>

            <form action="saveOrder" method="post">
                <!-- ข้อมูลลูกค้า -->
                <label for="customerEmail">ชื่อลูกค้า:</label>
                <p>ชื่อ: ${customer.name}</p>
                <p>อีเมล: ${customer.email}</p>

                <!-- วันที่สั่งซื้อ -->
                <label for="orderDate">วันที่:</label>
                <input type="date" id="orderDate" name="orderDate" readonly>

                <!-- สีของรถยนต์ (Dropdown) -->
                <label for="colorcar">สีของรถยนต์:</label>
                <select id="colorcar" name="colorcar" required>
                    <option value="" disabled selected>เลือกสีของรถยนต์</option>
                    <option value="แดง">แดง</option>
                    <option value="น้ำเงิน">น้ำเงิน</option>
                    <option value="ดำ">ดำ</option>
                    <option value="ขาว">ขาว</option>
                    <option value="เทา">เทา</option>
                </select>

                <!-- วันที่เริ่มต้น -->
                <label for="startDate">วันที่เริ่มต้น:</label>
                <input type="date" id="startDate" name="startDate" required onchange="setEndDateMin()">

                <!-- วันที่สิ้นสุด -->
                <label for="endDate">วันที่สิ้นสุด:</label>
                <input type="date" id="endDate" name="endDate" required>

                <!-- ปุ่มบันทึก -->
                <input type="submit" value="บันทึกคำสั่งซื้อ" class="btn-submit">
            </form>
        </div>
    </div>

    <script>
        function initializeDates() {
            // ตั้งค่าวันที่ปัจจุบันในฟิลด์ orderDate และฟิลด์วันที่เริ่มต้นไม่ให้กรอกย้อนหลังได้
            const today = new Date();
            const formattedToday = today.toISOString().split('T')[0];
            document.getElementById('orderDate').value = formattedToday;
            document.getElementById('startDate').min = formattedToday;
            document.getElementById('endDate').min = formattedToday;
        }

        function setEndDateMin() {
            // ป้องกันไม่ให้วันที่สิ้นสุดอยู่ก่อนวันที่เริ่มต้น
            const startDate = document.getElementById('startDate').value;
            document.getElementById('endDate').min = startDate;
        }
    </script>
</body>
</html>
