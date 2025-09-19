<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>แก้ไขโปรไฟล์</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        header {
            background-color: white;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            border-bottom: 4px solid #e60000;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            border-radius: 10px;
            text-align: center;
        }
        .submit-button {
            background-color: #e50012;
            color: white;
            transition: background-color 0.3s, color 0.3s;
        }
        .submit-button:hover {
            background-color: white;
            color: #e50012;
            border: 2px solid #e50012;
        }
    </style>
</head>
<body>
    <header>
        <div class="top-header">
            <div class="left-section d-flex align-items-center">
                <a href="home">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JEMoveYwRON1fon39eGsqjQdaDp11UehDw&s" alt="Honda Logo" height="50">
                </a>
                <div class="ml-3">
                    <h1 style="margin: 0; font-size: 24px; color: #000;">How we move you.</h1>
                    <p style="margin: 0; font-size: 12px; color: #000;">CREATE | TRANSCEND, AUGMENT</p>
                </div>
            </div>
        </div>
    </header>

    <div class="form-container">
        <h2 class="text-center text-danger">แก้ไขโปรไฟล์</h2>
        <form action="updateProfile" method="post">
            <div class="form-group">
                <label for="name">ชื่อ - นามสกุล</label>
                <input type="text" id="name" name="name" value="${user.name}" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="phone">หมายเลขโทรศัพท์</label>
                <input type="tel" id="phone" name="phone" value="${user.phone}" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="email">อีเมล</label>
                <input type="email" id="email" name="email" value="${user.email}" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="pic">URL รูปภาพโปรไฟล์</label>
                <input type="text" id="pic" name="pic" value="${user.pic}" class="form-control">
            </div>

            <button type="submit" class="btn btn-danger submit-button btn-block">ยืนยัน</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
