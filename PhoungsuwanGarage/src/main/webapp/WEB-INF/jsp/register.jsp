<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Register Form</title>
    <!-- Bootstrap CSS -->
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
        }

        header {
            background-color: #333333;
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
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
            margin-top: 100px; /* Adjust for fixed header */
        }

        .submit-button, .login-button {
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 0;
            border-radius: 5px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .submit-button {
            background-color: #e50012;
        }

        .submit-button:hover {
            background-color: #cc0000;
            color: white;
        }

        .login-button {
            background-color: #333;
            margin-top: 20px;
        }

        .login-button:hover {
            background-color: #555;
        }

        .error-message {
            color: red;
            font-size: 14px;
            display: none;
            text-align: left;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        .top-header a {
            color: #FFFFFF;
            font-weight: bold;
            text-decoration: none;
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
                    <h1 style="margin: 0; font-size: 24px; color: #FFFFFF;">How we move you.</h1>
                    <p style="margin: 0; font-size: 12px; color: #FFFFFF;">CREATE | TRANSCEND, AUGMENT</p>
                </div>
            </div>
            <a href="customer" class="text-light">ย้อนกลับ</a>
        </div>
    </header>

    <div class="form-container">
        <h1 class="text-danger">ลงทะเบียน</h1>

        <form id="registerForm" action="register" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">ชื่อ - นามสกุล</label>
                <input type="text" id="name" name="name" class="form-control">
                <div class="error-message" id="nameError">กรุณากรอกชื่อ-นามสกุล</div>
            </div>

            <div class="form-group">
                <label for="phone">หมายเลขโทรศัพท์</label>
                <input type="tel" id="phone" name="phone" class="form-control">
                <div class="error-message" id="phoneError">กรุณากรอกหมายเลขโทรศัพท์</div>
            </div>

            <div class="form-group">
                <label for="email">อีเมล</label>
                <input type="email" id="email" name="email" class="form-control">
                <div class="error-message" id="emailError">กรุณากรอกอีเมล</div>
            </div>

            <div class="form-group">
                <label for="password">รหัสผ่าน</label>
                <input type="password" id="password" name="password" class="form-control" autocomplete="off">
                <div class="error-message" id="passwordError">กรุณากรอกรหัสผ่าน</div>
            </div>

            <div class="form-group">
                <label for="pic">รูปภาพโปรไฟล์</label>
                <input type="text" id="pic" name="pic" class="form-control">
            </div>

            <button type="submit" class="btn submit-button">ยืนยัน</button>
        </form>

        <!-- Modal แจ้งเตือน -->
        <c:if test="${not empty message}">
            <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="messageModalLabel">แจ้งเตือน</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ${message}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">ปิด</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            if ($("#messageModal").length) {
                $("#messageModal").modal("show");
                setTimeout(function() {
                    $("#messageModal").modal("hide");
                }, 3000); 
            }
        });

        function validateForm() {
            let isValid = true;

            const name = document.getElementById("name").value.trim();
            const phone = document.getElementById("phone").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();

            document.getElementById("nameError").style.display = name ? "none" : "block";
            document.getElementById("phoneError").style.display = phone ? "none" : "block";
            document.getElementById("emailError").style.display = email ? "none" : "block";
            document.getElementById("passwordError").style.display = password ? "none" : "block";

            return name && phone && email && password;
        }
    </script>
</body>
</html>
