<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.springmvc.model.Customer" %>
<%
    Customer user = (Customer) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>โปรไฟล์ผู้ใช้</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0e0e0; /* พื้นหลังสีเทาอ่อน */
            margin: 0;
            padding-top: 80px;
        }
        header {
            background-color: #333333; /* สีดำ */
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
            border-bottom: 4px solid #e60000; /* เส้นล่างสีแดง */
        }
        .profile-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }
        h1 {
            color: #333333; /* สีดำ */
            font-size: 24px;
        }
        p {
            font-size: 16px;
            color: #333;
        }
        .profile-info img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-custom {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            font-size: 16px;
            border-radius: 5px;
            font-weight: bold;
            color: white;
            cursor: pointer;
            border: none; /* ลบขอบปุ่ม */
            text-decoration: none; /* ลบเส้นขีด */
        }
        .btn-logout {
            background-color: white;
            color: #e50012;
        }
        .btn-logout:hover {
            background-color: #e50012;
            color: white;
        }
        .btn-add, .btn-promotion-add {
            background-color: #333333;
        }
        .btn-add:hover, .btn-promotion-add:hover {
            background-color: #e60000;
        }
        .btn-edit, .btn-promotion-edit, .btn-profile-edit {
            background-color: #e50012;
        }
        .btn-edit:hover, .btn-promotion-edit:hover, .btn-profile-edit:hover {
            background-color: #333333;
        }
        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 10px;
        }
        a {
            color: white; /* เปลี่ยนสีตัวหนังสือเป็นสีขาว */
            text-decoration: none; /* ลบเส้นขีด */
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
                    <h1 style="margin: 0; font-size: 24px; color: white;">How we move you.</h1>
                    <p style="margin: 0; font-size: 12px; color: white;">CREATE | TRANSCEND, AUGMENT</p>
                </div>
            </div>
            <a href="home" class="text-light">ย้อนกลับ</a>
        </div>
    </header>

    <div class="profile-container">
        <h1>โปรไฟล์ของคุณ</h1>
        <div class="profile-info">
            <img src="<%= user.getPic() %>" alt="Profile Picture">
            <p>ชื่อ: <%= user.getName() %></p>
            <p>อีเมล: <%= user.getEmail() %></p>
            <p>เบอร์โทรศัพท์: <%= user.getPhone() %></p>
        </div>

        <!-- Edit Profile Button -->
        <form action="editProfile" method="get">
            <button type="submit" class="btn-custom btn-profile-edit">แก้ไขโปรไฟล์</button>
        </form>

        <!-- Logout Button -->
        <form action="logout" method="get">
            <button type="submit" class="btn-custom btn-logout">ออกจากระบบ</button>
        </form>

        <!-- Admin Buttons (only shown if email matches Admin) -->
        <c:if test="${user.email == 'Admin2546@gmail.com'}">
            <div class="button-group">
                <a href="addCar" class="btn-custom btn-add">เพิ่มรถ</a>
                <a href="addPromotion" class="btn-custom btn-promotion-add">เพิ่มโปรโมชั่น</a>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
