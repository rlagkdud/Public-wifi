<%@ page import="com.example.mission1.Bookmark" %>
<%@ page import="com.example.mission1.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bookmark delete</title>
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
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<h1>북마크 삭제</h1>
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
    int id = Integer.parseInt(request.getParameter("id"));
    Bookmark bookmark = bookmarkService.selectBookmark(id);
%>
<form action="bookmark-delete-submit.jsp" method="post">
    <input type="hidden" name="id" value="<%=id%>" />
    <table class="list">
        <tr>
            <th>북마크 이름</th>
            <td><%=bookmark.getBoomarkGroupName()%>
            </td>
        </tr>
        <tr>
            <th>와이파이명</th>
            <td><%=bookmark.getWifiName()%>
            </td>
        </tr>
        <tr>
            <th>등록일자</th>
            <td><%=bookmark.getBookmarkRegDate()%>
            </td>
        </tr>
        <tr>
            <td colspan="100%" style="text-align: center">
                <a href="bookmark-list.jsp">돌아가기</a>
                |
                <input type="submit" value="삭제">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
