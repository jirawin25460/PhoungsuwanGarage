<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>บริการหลังการขาย</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        h1.my-4 {
            font-size: 36px;
            color: #fff;
            background-color: #333;
            padding: 20px;
            margin-bottom: 20px;
            border-left: 10px solid #FF0000;
            text-align: center;
        }

        .content-section {
            position: relative;
            background-size: cover;
            background-position: center;
            border-radius: 8px;
            margin: 20px 0;
            padding: 80px 30px;
            color: #fff;
        }

        .content-section .text-box {
            max-width: 500px;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 8px;
        }

        .text-box h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .text-box p {
            font-size: 16px;
            margin-bottom: 15px;
        }

        .text-box ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        /* Alternate alignment for sections */
        .section-left .text-box { margin-left: 0; }
        .section-right { justify-content: flex-end; }
        .section-right .text-box { margin-right: 0; }

        @media (max-width: 768px) {
            .content-section { padding: 50px 20px; }
            .text-box { max-width: 100%; }
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp"></jsp:include>

<div class="container my-4">
    <h1 class="my-4">บริการหลังการขาย</h1>

    <!-- เช็กรถยนต์ตามระยะ -->
    <div class="content-section d-flex align-items-center section-left" 
         style="background-image: url('https://e-training.tpqi.go.th/data-file/courses/thumbnail/080720083015-%E0%B8%9A%E0%B8%A3%E0%B8%B4%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A2%E0%B8%B2%E0%B8%99%E0%B8%A2%E0%B8%99%E0%B8%95%E0%B9%8C.jpg');">
        <div class="text-box">
            <h2>เช็กรถยนต์ตามระยะ</h2>
            <p>ค้นหาข้อมูลรายการอะไหล่ที่ต้องเปลี่ยนตามระยะทาง พร้อมประเมินค่าบริการเบื้องต้น</p>
        </div>
    </div>

    <!-- นัดหมายเข้ารับบริการ -->
    <div class="content-section d-flex align-items-center section-right" 
         style="background-image: url('https://via.placeholder.com/1200x400.png?text=Appointment+Service');">
        <div class="text-box">
            <h2>นัดหมายเข้ารับบริการ</h2>
            <p>เติมเต็มความสบายใจไปกับคุณทุกที่ กับโปรแกรมการให้บริการพิเศษด้านคุณภาพรถยนต์ ฮอนด้า อัลติเมท แคร์ สิทธิพิเศษเฉพาะคนสำคัญของฮอนด้า ในการให้บริการรับประกัน</p>
        </div>
    </div>

    <!-- บริการพิเศษ -->
    <div class="content-section d-flex align-items-center section-left" 
         style="background-image: url('https://via.placeholder.com/1200x400.png?text=Special+Service');">
        <div class="text-box">
            <h2>บริการพิเศษ</h2>
            <p>หลากหลายโปรแกรมบริการสำหรับลูกค้าคนสำคัญเช่นคุณ:</p>
            <ul>
                <li>Honda Ultimate Care</li>
                <li>Honda Paysave</li>
                <li>Honda Drop & Go</li>
                <li>Honda Quick Services</li>
                <li>Honda Body & Paint</li>
                <li>บริการช่วยเหลือฉุกเฉิน 24 ชั่วโมง</li>
            </ul>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
