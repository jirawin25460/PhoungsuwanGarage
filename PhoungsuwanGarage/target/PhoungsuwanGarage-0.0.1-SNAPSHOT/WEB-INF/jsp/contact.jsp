<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>ติดต่อเรา</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin-top: 60px;
        }

        h1.my-4 {
            font-size: 36px;
            color: #fff;
            background-color: #333;
            padding: 20px;
            margin-top: 20px;
            border-left: 10px solid #FF0000;
            text-align: center;
        }

        .contact-box {
            border: 1px solid #ddd;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
            margin-bottom: 20px;
            transition: transform 0.3s;
        }

        .contact-box:hover {
            transform: translateY(-5px);
        }

        .contact-box .icon {
            font-size: 40px;
            color: #FF0000;
            margin-bottom: 15px;
        }

        .contact-box h5 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #333;
        }

        .contact-box p {
            color: #666;
            margin-bottom: 15px;
        }

        .contact-box h3 {
            color: #333;
            font-weight: bold;
        }

        .map-container {
            position: relative;
            overflow: hidden;
            width: 100%;
            height: 300px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .map-container iframe {
            width: 100%;
            height: 100%;
            border: 0;
        }

        @media (max-width: 767px) {
            .contact-box {
                padding: 20px;
            }
            .contact-box .icon {
                font-size: 30px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp"></jsp:include>

<div class="container">
    <h1 class="my-4">ติดต่อเรา</h1>

    <div class="row">
        <!-- โทรศัพท์ -->
        <div class="col-md-6">
            <div class="contact-box">
                <div class="icon">
                    <i class="fas fa-phone-alt"></i>
                </div>
                <h5>โทรหาเรา</h5>
                <p>ที่ศูนย์บริการรอบด้านตลอด 24 ชั่วโมง</p>
                <h3>0 2341 7777</h3>
            </div>
        </div>

        <!-- ที่อยู่และแผนที่ -->
        <div class="col-md-6">
            <div class="contact-box">
                <div class="icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h5>ที่อยู่</h5>
                <p>สำนักงานใหญ่: ถนนพระราม 9, กรุงเทพฯ</p>
                <div class="map-container">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.756723458716!2d100.55316881522296!3d13.745916890354205!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e29edb0f9fe0ff%3A0x4f9e14feaedb8e13!2z4LiB4Lij4Liw4LiK4Li04LiXIOC4reC4suC4m-C5gOC4h-C4oeC5ieC4suC4l-C5jA!5e0!3m2!1sen!2sth!4v1637082057525!5m2!1sen!2sth" 
                        allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
