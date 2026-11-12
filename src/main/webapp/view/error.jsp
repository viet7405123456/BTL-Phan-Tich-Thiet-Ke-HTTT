<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lỗi</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="container">
    <h2>Đã có lỗi xảy ra</h2>
    <div class="alert alert-warning"><%= exception != null ? exception.getMessage() : "Không rõ nguyên nhân" %></div>
    <a class="btn" href="<%=request.getContextPath()%>/">Về trang chủ</a>
</div>
</body>
</html>
