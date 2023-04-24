<%@ page import="com.example.mission1.History" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mission1.WifiService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/18
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History</title>
    <style>
        .list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-size: 10pt;
            text-align: center;
        }

        .list td, .list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
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
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<h1>위치 히스토리 목록</h1>
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
    <thead>
    <tr>
        <th>ID</th>
        <th>X좌표</th>
        <th>Y좌표</th>
        <th>조회일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <%-- TODO: delete 만들기   --%>
<%--    1. getHistoryInfo로 history info를 url의 parameter로 전달--%>
<%--    2. 전달된 파라미터를 가지고 deleteHistory.jsp?파라미터들 url로 이동--%>
<%--    3. 삭제하기를 누르면 parameter를 가진 deleteHistory()실행--%>
    <%
        WifiService wifiService = new WifiService();
        ArrayList<History> historyList = wifiService.selectHistory();
    %>
    <tbody>
        <% for(History h : historyList) { %>
            <tr>
                <td id="historyId"><%=h.getId()%></td>
                <td>
                    <%=h.getX()%>
                </td>
                <td>
                    <%=h.getY()%>
                </td>
                <td>
                    <%=h.getSearch_date()%>
                </td>
                <td>
                    <button type="button">
                        <a href="deleteHistory.jsp?mrg-no=<%=h.getId()%>">
                            삭제
                        </a>
                    </button>
                </td>

            </tr>

        <% } %>
    </tbody>


</body>
</html>
