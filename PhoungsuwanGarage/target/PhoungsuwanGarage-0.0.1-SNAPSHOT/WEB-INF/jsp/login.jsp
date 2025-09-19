<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Login Form</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
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

        .form-container {
            background-color: white;
            padding: 40px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
            margin-top: 80px; /* Adjust for fixed header */
            border-radius: 10px;
        }

        .submit-button {
            background-color: #e50012;
            color: white;
            border: none; /* Remove border */
            font-weight: bold;
            margin-top: 10px;
        }

        .submit-button:hover {
            background-color: #cc0000;
            color: white;
        }

        .register-button {
            background-color: #333333; /* สีดำ */
            color: white;
            border: none;
            font-weight: bold;
            margin-top: 20px;
        }

        .register-button:hover {
            background-color: #555555;
            color: white; /* สีเทาเข้ม */
        }

        .error-message {
            color: red;
            font-size: 14px;
            display: none;
        }

        .top-header a {
            color: #FFFFFF; /* เปลี่ยนสีของลิงก์เป็นสีขาว */
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
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
            <a href="home" class="text-light">ย้อนกลับ</a>
        </div>
    </header>

    <div class="form-container">
        <h1 class="text-danger">ลงชื่อเข้าใช้</h1>

        <form id="loginForm" action="processLogin" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">อีเมล</label>
                <input type="email" id="email" name="email" class="form-control">
                <div class="error-message" id="emailError">กรุณากรอกอีเมล</div>
            </div>
            <div class="form-group">
                <label for="password">รหัสผ่าน</label>
                <input type="password" id="password" name="password" class="form-control">
                <div class="error-message" id="passwordError">กรุณากรอกรหัสผ่าน</div>
            </div>
            <button type="submit" class="btn submit-button btn-block">ลงชื่อเข้าใช้</button>
        </form>

        <hr class="my-4">

        <p>ไม่มีบัญชีใช่ไหม</p>
        <form action="cust" method="get">
            <button type="submit" class="btn register-button btn-block">ลงทะเบียน</button>
        </form>

        <!-- Modal for login error message -->
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

    <!-- JavaScript แจ้งเตือน -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            if ($("#messageModal").length) {
                $("#messageModal").modal("show");
                setTimeout(function() {
                    $("#messageModal").modal("hide");
                }, 3000); // ปิด modal หลังจาก 3 วินาที
            }
        });

        // ฟังก์ชันตรวจสอบความถูกต้องของฟอร์ม
        function validateForm() {
            let isValid = true;

            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();
            const emailError = document.getElementById("emailError");
            const passwordError = document.getElementById("passwordError");

            // ตรวจสอบอีเมล
            emailError.style.display = "none";
            if (email === "") {
                emailError.style.display = "block";
                isValid = false;
            }

            // ตรวจสอบรหัสผ่าน
            passwordError.style.display = "none";
            if (password === "") {
                passwordError.style.display = "block";
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>
