<%@ page import="com.example.mission1.BookmarkGroup" %>
<%@ page import="com.example.mission1.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>북마크 그룹 수정</title>
    <style>
        .list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-size: 10pt;

        }

        th {
            border: solid 1px #ddd;
            width: 30%;
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
<h1> 북마크 삭제 </h1>
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

<p>북마크 그룹 이름을 삭제 하시겠습니까?</p>
<%
    // id에 해당하는 row를 셀렉트 해오기
    int id = Integer.parseInt(request.getParameter("id"));
    //System.out.println("hidden id = " + id);
    BookmarkService bookmarkService = new BookmarkService();
    BookmarkGroup group = bookmarkService.selectOneBookmarkGroup(id);
    String name = group.getGroupName();
    int order = group.getGroupOrder();
    //int groupId = group.getGroupId();
%>
<table class="list">
    <form action="bookmark-group-edit-submit.jsp" method="post">
        <input name="id" type="hidden" value="<%=id%>">
        <tr>
            <th>북마크 이름</th>
            <td>
                <input name="name" value="<%=name%>">
            </td>
        </tr>
        <tr>
            <th>순서</th>
            <td>
                <input name="order" value="<%=order%>">
            </td>
        </tr>
        <tr>
            <td colspan="100%" style="text-align: center">
                <a href="bookmark-group.jsp">돌아가기</a>
                |
                <button type="submit">수정</button>
            </td>
        </tr>
    </form>
</table>

</body>
</html>
