<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>แก้ไขโปรโมชั่น</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
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

        .top-header img {
            height: 50px;
        }

        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            margin-top: 100px;
        }

        h2 {
            color: #e50012;
            margin-bottom: 20px;
            text-align: center;
        }

        .btn-submit {
            background-color: #e50012;
            color: white;
           
        .btn-submit {
            background-color: #e50012;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #cc0000;
        }

        .form-group label {
            font-weight: bold;
        }
    </style>
</head>
<body>

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
        <a href="listPromotion" class="text-light">ย้อนกลับ</a>
    </div>
</header>
    
<div class="container">
    <h2>แก้ไขโปรโมชั่น</h2>
    <form action="updatePromotion" method="post">
        <!-- Hidden field to store promotion ID -->
        <input type="hidden" name="promotionId" value="${promotion.promotionId}">
        
        <div class="form-group">
            <label for="promotionName">ชื่อโปรโมชั่น</label>
            <input type="text" id="promotionName" name="promotionName" class="form-control" required value="${promotion.promotionName}">
        </div>
        
        <div class="form-group">
            <label for="description">รายละเอียด</label>
            <textarea id="description" name="description" class="form-control" rows="4">${promotion.description}</textarea>
        </div>

        <div class="form-group">
            <label for="imageUrl">URL รูปภาพ</label>
            <input type="text" id="imageUrl" name="imageUrl" class="form-control" value="${promotion.imageUrl}">
        </div>

        <div class="form-group">
            <label for="startDate">วันที่เริ่มต้น</label>
            <input type="date" id="startDate" name="startDate" class="form-control" required value="${promotion.startDate}">
        </div>

        <div class="form-group">
            <label for="endDate">วันที่สิ้นสุด</label>
            <input type="date" id="endDate" name="endDate" class="form-control" required value="${promotion.endDate}">
        </div>

        <button type="submit" class="btn btn-danger btn-submit btn-block">บันทึกการแก้ไข</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
           