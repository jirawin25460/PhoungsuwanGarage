<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phoungsuwan Garage</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        .carousel-container {
            width: 100%;
            height: 600px;
            overflow: hidden;
            position: relative;
        }

        .carousel-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
            font-size: 2.5rem;
            font-weight: bold;
        }

        h2::after {
            content: '';
            display: block;
            width: 100px;
            height: 3px;
            background-color: red;
            margin: 10px auto 0;
        }

        .car-section {
            text-align: center;
            margin-bottom: 50px;
        }

        .car-item {
            display: inline-block;
            margin: 10px;
            max-width: 300px;
            text-align: center;
        }

        .car-image-container {
            width: 100%;
            height: 200px;
            overflow: hidden;
            border-radius: 10px;
        }

        .car-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .car-image-container img:hover {
            transform: scale(1.05);
        }

        .promo-section {
            background-size: cover;
            background-position: center;
            height: 750px;
            position: relative;
            margin-bottom: 20px;
        }

        .button-container {
            position: absolute;
            bottom: 20px;
            display: flex;
            gap: 20px;
            width: 100%;
            justify-content: flex-end;
            padding-right: 20px;
        }

        .promo-button {
            font-size: 1.2rem;
            padding: 15px 30px;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 4px;
        }

        .red-button { background-color: #e31e24; }
        .gray-button { background-color: #333; }

        .promo-button:hover { opacity: 0.8; }

        @media (max-width: 768px) {
            .carousel-container { height: 400px; }
            .promo-section { height: 500px; }
            .promo-button {
                font-size: 1rem;
                padding: 10px 20px;
            }
        }
    </style>

    <script>
        let currentSlide = 0;

        function showSlide(index) {
            const slides = document.querySelectorAll('.carousel-img');
            slides.forEach((slide, i) => {
                slide.style.display = (i === index) ? 'block' : 'none';
            });
        }

        function nextSlide() {
            const slides = document.querySelectorAll('.carousel-img');
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }

        function startCarousel() {
            showSlide(currentSlide);
            setInterval(nextSlide, 3000);
        }

        window.onload = startCarousel;
    </script>
</head>

<body>
    <!-- Header -->
    <jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp" />

    <div class="container-fluid">

        <!-- Carousel -->
        <div class="carousel-container">
            <div class="carousel-slide-container">
                <img src="https://www.mendetails.com/wp-content/uploads/2016/10/supercar1.jpg" 
                     class="carousel-img" alt="slide 1" />
                <img src="https://cdn.carsome.co.th/news/230321-MKT_Songkran-Landing-Page-Banner-TH-Header_1416x800px.png" 
                     class="carousel-img" alt="slide 2" />
                <img src="https://www.toyotakan.com/wp-content/uploads/2022/10/%E0%B8%9B%E0%B8%81%E0%B8%AA%E0%B8%B2%E0%B8%A3%E0%B8%B0-scaled.jpg" 
                     class="carousel-img" alt="slide 3" />
                <img src="https://www.headlightmag.com/hlmwp/wp-content/uploads/2023/09/Polestones-01_01.jpg" 
                     class="carousel-img" alt="slide 4" />
            </div>
        </div>

        <!-- Car Section -->
        <h2>รุ่นรถยนต์</h2>
        <div class="container car-section">
            <c:forEach items="${carList}" var="car" begin="0" end="2">
                <div class="car-item">
                    <a href="detail?carId=${car.carId}" class="car-link">
                        <div class="car-image-container">
                            <img src="${car.imageUrl}" class="card-img-top" alt="${car.model}">
                        </div>
                    </a>
                    <h3>${car.model}</h3>
                    <p>เริ่มต้น ${car.price} บาท</p>
                </div>
            </c:forEach>
        </div>

        <!-- Promotion Section -->
        <h2>โปรโมชัน</h2>
        <c:forEach var="promotion" items="${promotions}" begin="0" end="2">
            <div class="promo-section" style="background-image: url('${promotion.imageUrl}');">
                <div class="button-container">
                    <form action="detailPromotion" method="get" style="display:inline;">
                        <input type="hidden" name="promotionId" value="${promotion.promotionId}">
                        <button type="submit" class="promo-button red-button">สนใจโปรโมชั่นนี้</button>
                    </form>
                    <a href="detailPromotion?promotionId=${promotion.promotionId}" class="promo-button gray-button">
                        รายละเอียดเพิ่มเติม
                    </a>
                </div>
            </div>
        </c:forEach>

    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/jsp/head-foot/my-footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
