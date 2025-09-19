<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.springmvc.model.Customer" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    Customer user = (Customer) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phoungsuwan Garage</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #e0e0e0; /* Lighter background for the main content */
            overflow-x: hidden;
        }

        header {
            background-color: #333333; /* Dark header background */
            width: 100%;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px; /* Increased padding for better spacing */
        }

        .bottom-red-line {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: #ff4d4d; /* Red accent for the bottom line */
        }

        .top-header img {
            height: 50px;
        }

        .slogan h1, .slogan p {
            margin: 0;
            color: #f0f0f0; /* Light color for text on the dark header */
        }

        .slogan h1 {
            font-size: 24px;
        }

        .slogan p {
            font-size: 12px;
        }

        .btn-custom {
            background-color: #ff4d4d; /* Bright red button background */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            margin-right: 15px; /* Added margin to space out buttons */
        }

        .btn-custom:hover {
            background-color: white;
            color: #ff4d4d;
            border: 1px solid #ff4d4d;
        }

        .tooltip-custom {
            position: absolute;
            top: 60px;
            right: 5px;
            background-color: #333;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            display: none;
            font-size: 14px;
            z-index: 1000;
        }

        .content {
            padding-top: 20px;
        }

        .navbar-nav .nav-link {
            padding: 15px;
            color: white; /* White color for nav links */
            font-weight: bold;
        }

        .navbar-nav .nav-link:hover {
            color: #ff4d4d;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header class="container-fluid px-0">
        <div class="top-header d-flex justify-content-between align-items-center w-100">
            <div class="d-flex align-items-center">
                <a href="home">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JEMoveYwRON1fon39eGsqjQdaDp11UehDw&s" alt="Honda Logo">
                </a>
                <div class="slogan ml-3">
                    <h1>How we move you.</h1>
                    <p>CREATE | TRANSCEND, AUGMENT</p>
                </div>
            </div>

            <div class="d-flex align-items-center">
                <nav class="navbar navbar-expand-lg navbar-dark">
                    <div class="navbar-nav">
                        <a class="nav-link" href="listcar">รุ่นรถ</a>
                        <a class="nav-link" href="listPromotion">โปรโมชั่น</a>
                        <a class="nav-link" href="contact">ติดต่อ</a>
                    </div>
                </nav>
                
                <!-- Button for Test Drive -->
                <c:choose>
                    <c:when test="${user != null}">
                        <form action="selectcar" method="get" class="mr-2">
                            <button class="btn btn-custom">ทดลองขับ</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-custom" onclick="alert('กรุณาเข้าสู่ระบบก่อนทำการทดลองขับ'); window.location.href='customer';">
                            ทดลองขับ
                        </button>
                    </c:otherwise>
                </c:choose>

                <form action="<%= (user != null) ? "profile" : "customer" %>" method="get" class="d-inline">
                    <button class="btn btn-link p-0" type="submit" onmouseover="showTooltip()" onmouseout="hideTooltip()">
                        <img src="https://static.vecteezy.com/system/resources/previews/002/318/271/non_2x/user-profile-icon-free-vector.jpg" class="rounded-circle" alt="User Profile" style="width: 40px; height: 40px;">
                    </button>
                    <div class="tooltip-custom" id="tooltip"><%= (user != null) ? user.getName() : "กรุณาเข้าสู่ระบบ" %></div>
                </form>
            </div>
        </div>
        <div class="bottom-red-line"></div>
    </header>

    <div class="content container-fluid">
        <!-- Main website content -->
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        function showTooltip() {
            document.getElementById('tooltip').style.display = 'block';
        }

        function hideTooltip() {
            document.getElementById('tooltip').style.display = 'none';
        }
    </script>
</body>
</html>
