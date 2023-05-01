<%@ page import="com.example.mission1.BookmarkService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mission1.Bookmark" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bookmark list</title>
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
            text-align: center;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<h1> 북마크 목록 </h1>
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

<%
    BookmarkService bookmarkService = new BookmarkService();
    ArrayList<Bookmark> bookmarkList = bookmarkService.selectBookmark();
%>
<table class="list">
    <thead>
    <tr>
        <th>ID</th>
        <th>북마크 이름</th>
        <th>와이파이명</th>
        <th>등록일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%for(Bookmark bookmark : bookmarkList){%>
        <tr>
            <td><%=bookmark.getBookmarkId()%></td>
            <td><%=bookmark.getBoomarkGroupName()%></td>
            <td><%=bookmark.getWifiName()%></td>
            <td><%=bookmark.getBookmarkRegDate()%></td>
            <td>
                <a href="bookmark-delete.jsp?id=<%=bookmark.getBookmarkId()%>">삭제</a>
            </td>

        </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>
