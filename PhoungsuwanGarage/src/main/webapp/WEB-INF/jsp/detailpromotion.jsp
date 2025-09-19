<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>รายละเอียดโปรโมชั่น</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding-top: 80px;
        }
        .promo-detail-container {
            max-width: 700px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            margin: 0 auto;
        }
        .promo-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .promo-title {
            font-size: 1.8em;
            color: #e60000;
            margin-top: 20px;
        }
        .promo-description, .promo-dates {
            font-size: 1.1em;
            color: #555;
            margin-top: 10px;
        }
        .btn-custom {
            padding: 10px 20px;
            color: white;
            background-color: #e60000;
            border-radius: 5px;
            text-decoration: none;
            margin: 10px 5px;
            border: none;
        }
        .btn-custom:hover {
            background-color: #cc0000;
        }
        .btn-delete {
            background-color: #6c757d;
            margin: 10px 5px;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            border: none;
        }
        .btn-delete:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp"></jsp:include>

<div class="promo-detail-container">
    <img src="${promotion.imageUrl}" alt="${promotion.promotionName}" class="promo-image mb-3">
    <h1 class="promo-title">${promotion.promotionName}</h1>
    <p class="promo-description">${promotion.description}</p>
    <p class="promo-dates"><strong>วันที่เริ่มต้น:</strong> ${promotion.startDate}</p>
    <p class="promo-dates"><strong>วันที่สิ้นสุด:</strong> ${promotion.endDate}</p>

    <c:if test="${user.email == 'Admin2546@gmail.com'}">
        <div class="mt-4">
            <!-- ปุ่มแก้ไขโปรโมชั่น -->
            <form action="editPromotion" method="get" style="display: inline;">
                <input type="hidden" name="promotionId" value="${promotion.promotionId}">
                <button type="submit" class="btn btn-custom">แก้ไขโปรโมชั่น</button>
            </form>

            <!-- ปุ่มลบโปรโมชั่น -->
            <form action="deletePromotion" method="get" onsubmit="return confirm('คุณแน่ใจว่าต้องการลบโปรโมชั่นนี้?');" style="display: inline;">
                <input type="hidden" name="promotionId" value="${promotion.promotionId}">
                <button type="submit" class="btn btn-delete">ลบโปรโมชั่น</button>
            </form>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
