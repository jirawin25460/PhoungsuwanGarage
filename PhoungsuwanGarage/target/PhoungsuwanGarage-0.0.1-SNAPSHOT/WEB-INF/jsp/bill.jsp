<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>ใบคำสั่งซื้อ</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
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
        }

        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            color: #FFFFFF;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 100px;
            font-weight: bold;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 30px;
            max-width: 700px;
            margin-top: 120px;
        }

        .order-details {
            margin-top: 20px;
            border-top: 2px solid #e0e0e0;
            padding-top: 15px;
        }

        .order-details div {
            margin-bottom: 15px;
            font-size: 16px;
        }

        .order-details strong {
            color: #555;
        }

        .thank-you-text {
            text-align: center;
            font-size: 18px;
            color: #28a745;
            font-weight: bold;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .btn-print {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
        }

        .btn-home {
            background-color: #6c757d;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <header>
        <div class="top-header">
            <div class="d-flex align-items-center">
                <a href="home">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Honda-logo.svg/1280px-Honda-logo.svg.png" alt="Honda Logo" height="50">
                </a>
                <div class="ml-3">
                    <h1 style="margin: 0; font-size: 24px; color: #FFFFFF;">How we move you.</h1>
                    <p style="margin: 0; font-size: 12px; color: #FFFFFF;">CREATE | TRANSCEND, AUGMENT</p>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <h2>ทดลองขับ</h2>
        <div class="order-details">
            <div><strong>ชื่อ:</strong> <c:out value="${order.customer.name}"/></div>
            <div><strong>อีเมล:</strong> <c:out value="${order.customer.email}"/></div>
            <div><strong>รถที่เลือก:</strong> <c:out value="${order.car.model} (${order.car.year})"/></div>
            <div><strong>สีรถ:</strong> <c:out value="${order.colorcar}"/></div>
            <div><strong>วันที่:</strong> <c:out value="${order.orderDate}"/></div>
            <div><strong>วันที่เริ่มต้น:</strong> <c:out value="${order.startDate}"/></div>
            <div><strong>วันที่สิ้นสุด:</strong> <c:out value="${order.endDate}"/></div>
        </div>
        <p class="thank-you-text mt-4">ขอบคุณสำหรับการทดลองขับ!</p>

        <div class="btn-container mt-4">
            <!-- ปุ่มสำหรับพิมพ์ใบเสร็จ -->
            <button onclick="window.print()" class="btn btn-print">พิมพ์ใบเสร็จ</button>
            <a href="home" class="btn btn-home">ตกลง</a>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
