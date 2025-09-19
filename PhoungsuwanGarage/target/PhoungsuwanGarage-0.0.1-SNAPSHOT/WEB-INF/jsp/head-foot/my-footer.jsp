<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phoungsuwan Garage</title>
    <style>
        footer {
            background-color: #f1f1f1;
            padding: 20px;
            border-top: 4px solid #e60000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: Arial, sans-serif;
            font-size: 14px;
            margin-top: auto;
        }

        .footer-container {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-left {
            display: flex;
            align-items: center;
        }

        .footer-logo {
            height: 40px;
            margin-right: 20px;
        }

        .footer-right ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .footer-right ul li {
            margin-left: 20px;
        }

        .footer-right ul li a {
            text-decoration: none;
            color: #333;
        }

        .footer-right ul li a:hover {
            color: #e60000;
        }
    </style>
</head>
<body>

    <footer>
        <div class="footer-container">
            <div class="footer-left">
                
                <p>© 2024 Phoungsuwan Garage. All Rights Reserved.</p>
            </div>
            <div class="footer-right">
                <ul>
                    <li><a href="#privacy-policy">Privacy Policy</a></li>
                    <li><a href="#terms">Terms & Conditions</a></li>
                    <li><a href="#contact">Contact Us</a></li>
                </ul>
            </div>
        </div>
    </footer>
</body>
</html>
