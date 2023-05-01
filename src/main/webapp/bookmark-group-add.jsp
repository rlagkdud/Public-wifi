<%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/21
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>bookmark group add</title>
    <style>
        .list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-size: 10pt;

        }

        th {
            border: solid 1px #ddd;
        }

        .list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .list tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .list tr:hover {
            background-color: #ddd;
        }

        .list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<h1> 북마크 그룹 목록 </h1>
<br/>
<a href="index.jsp">홈</a>
|
<a href="history.jsp">위치 히스토리 목록</a>
|
<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
|
<a href="bookmark-list.jsp">즐겨 찾기 보기</a>
|
<a href="bookmark-group.jsp">즐겨찾기 그룹 관리</a>

<table class="list">
    <form action="bookmark-group-submit.jsp" method="POST">
        <tr>
            <th>북마크 이름</th>
            <td>
                <input name="name">
            </td>
        </tr>
        <tr>
            <th>순서</th>
            <td>
                <input name="order">
            </td>
        </tr>
        <tr>
            <td colspan="100%" style="text-align: center">
                <button type="submit">추가</button>
            </td>
        </tr>
    </form>
</table>
</body>
</html>
