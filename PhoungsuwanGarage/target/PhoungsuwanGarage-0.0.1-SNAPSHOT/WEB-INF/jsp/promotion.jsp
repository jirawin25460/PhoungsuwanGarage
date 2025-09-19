<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<title>รายการโปรโมชั่น</title>
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
    .promo-section {
        background-size: cover;
        background-position: center;
        height: 750px;
        position: relative;
        margin-bottom: 20px;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }
    .button-container {
        position: absolute;
        bottom: 20px;
        left: 20px;
        display: flex;
        gap: 10px;
    }
    .promo-button {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .red-button { background-color: #e60000; }
    .red-button:hover { background-color: #cc0000; }
    .gray-button { background-color: #333; }
    .gray-button:hover { background-color: #555; }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/head-foot/my-header.jsp"></jsp:include>

<div class="container">
    <h1 class="my-4">โปรโมชั่น</h1>

    <c:forEach var="promotion" items="${promotions}" begin="0" end="2">
        <div class="promo-section" style="background-image: url('${promotion.imageUrl}');">
            <div class="button-container">
                <form action="detailPromotion" method="get" style="display:inline;">
                    <input type="hidden" name="promotionId" value="${promotion.promotionId}">
                    <button type="submit" class="promo-button red-button">สนใจโปรโมชั่นนี้</button>
                    <button type="button" class="promo-button gray-button" onclick="window.location.href='detailPromotion?promotionId=${promotion.promotionId}'">รายละเอียดเพิ่มเติม</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
