<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>เพิ่มโปรโมชั่นใหม่</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0e0e0;
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
            align-items: center;
            padding: 0 20px;
            color: #FFFFFF;
        }

        .top-header img { height: 50px; }
        .top-header a { color: #FFFFFF; font-weight: bold; text-decoration: none; }

        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            border-radius: 8px;
            margin: 120px auto 50px; /* header + spacing */
        }

        h2 { color: #e50012; margin-bottom: 20px; text-align: center; }
        .btn-submit { background-color: #e50012; color: white; transition: background-color 0.3s ease; width: 100%; }
        .btn-submit:hover { background-color: #cc0000; }
        .form-group label { font-weight: bold; }
    </style>
</head>
<body onload="setCurrentDate()">
    <header>
        <div class="top-header">
            <a href="home">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JEMoveYwRON1fon39eGsqjQdaDp11UehDw&s" alt="Honda Logo">
            </a>
            <div class="ml-3">
                <h1 style="margin:0; font-size:24px; color:#FFFFFF;">How we move you.</h1>
                <p style="margin:0; font-size:12px; color:#FFFFFF;">CREATE | TRANSCEND, AUGMENT</p>
            </div>
        </div>
    </header>

    <div class="container">
        <h2>เพิ่มโปรโมชั่นใหม่</h2>
        <form action="addPromotion" method="post">
            <div class="form-group">
                <label for="promotionName">ชื่อโปรโมชั่น</label>
                <input type="text" id="promotionName" name="promotionName" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="description">รายละเอียด</label>
                <textarea id="description" name="description" class="form-control" rows="4"></textarea>
            </div>

            <div class="form-group">
                <label for="imageUrl">URL รูปภาพ</label>
                <input type="text" id="imageUrl" name="imageUrl" class="form-control">
            </div>

            <div class="form-group">
                <label for="startDate">วันที่เริ่มต้น</label>
                <input type="date" id="startDate" name="startDate" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="endDate">วันที่สิ้นสุด</label>
                <input type="date" id="endDate" name="endDate" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-submit btn-block">บันทึกโปรโมชั่น</button>
        </form>
    </div>

    <script>
        function setCurrentDate() {
            const today = new Date();
            const date = today.toISOString().split('T')[0];
            document.getElementById('startDate').value = date;

            const tomorrow = new Date(today);
            tomorrow.setDate(tomorrow.getDate() + 1);
            document.getElementById('endDate').value = tomorrow.toISOString().split('T')[0];
        }
    </script>
</body>
</html>
