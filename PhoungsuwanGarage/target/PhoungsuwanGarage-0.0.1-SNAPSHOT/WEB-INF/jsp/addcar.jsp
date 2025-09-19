<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>Phoungsuwan Garage - เพิ่มรถใหม่</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
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

        .top-header img { height: 50px; }
        .top-header a { color: #fff; font-weight: bold; text-decoration: none; }

        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            border-radius: 8px;
            margin-top: 120px;
        }

        h2 { color: #e50012; margin-bottom: 20px; text-align: center; }

        .btn-submit {
            background-color: #e50012;
            color: #fff;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover { background-color: #cc0000; }

        .form-group label { font-weight: bold; }
    </style>
</head>
<body>

<header>
    <div class="top-header">
        <div class="left-section d-flex align-items-center">
            <a href="home">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JEMoveYwRON1fon39eGsqjQdaDp11UehDw&s" alt="Honda Logo">
            </a>
            <div class="ml-3">
                <h1 style="margin:0; font-size:24px;">How we move you.</h1>
                <p style="margin:0; font-size:12px;">CREATE | TRANSCEND, AUGMENT</p>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <h2>เพิ่มรถใหม่</h2>
    <form action="saveCar" method="post">
        <div class="form-group">
            <label for="make">ยี่ห้อ</label>
            <select id="make" name="makeId" class="form-control" required>
                <option value="" disabled selected>เลือกยี่ห้อ</option>
                <c:forEach var="make" items="${makes}">
                    <option value="${make.makeId}">${make.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="model">รุ่น</label>
            <input type="text" id="model" name="model" class="form-control" placeholder="กรอกรุ่นรถ" required>
        </div>

        <div class="form-group">
            <label for="year">ปีที่ผลิต</label>
            <input type="number" id="year" name="year" class="form-control" placeholder="กรอกปีที่ผลิต" required>
        </div>

        <div class="form-group">
            <label for="price">ราคา</label>
            <input type="number" id="price" name="price" step="0.01" class="form-control" placeholder="กรอกราคาของรถ" required>
        </div>

        <div class="form-group">
            <label for="details">รายละเอียดเพิ่มเติม</label>
            <textarea id="details" name="details" class="form-control" rows="4" placeholder="กรอกรายละเอียดเพิ่มเติม"></textarea>
        </div>

        <div class="form-group">
            <label for="imageUrl">URL รูปภาพ</label>
            <input type="text" id="imageUrl" name="imageUrl" class="form-control" placeholder="กรอก URL ของรูปภาพ">
        </div>

        <div class="form-group">
            <label for="promotion">โปรโมชั่น (ถ้ามี)</label>
            <select id="promotion" name="promotionId" class="form-control">
                <option value="">ไม่มีโปรโมชั่น</option>
                <c:forEach var="promotion" items="${promotions}">
                    <option value="${promotion.promotionId}">${promotion.promotionName}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-danger btn-submit btn-block">บันทึก</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
