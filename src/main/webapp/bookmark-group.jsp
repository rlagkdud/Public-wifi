<%@ page import="com.example.mission1.WifiService" %>
<%@ page import="com.example.mission1.BookmarkService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mission1.BookmarkGroup" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/21
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>북마크 그룹</title>
    <style>
        .list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-size: 10pt;
            text-align: center;

        }

        th {
            border: solid 1px #ddd;
        }

        .list td, #list th {
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
<br/>


<a href="bookmark-group-add.jsp">
    <button>북마크 그룹 이름 추가</button>
</a>

<table class="list">
    <thead>
    <tr>
        <th>ID</th>
        <th>북마크 이름</th>
        <th>순서</th>
        <th>등록일자</th>
        <th>수정일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%--     북마크그룹 table select()한 결과 보여주기 - if 없으면 정보가 존재하지 않습니다. 보여주기 --%>
    <%
        BookmarkService bookmarkService = new BookmarkService();
        ArrayList<BookmarkGroup> bookmarkGroupList = bookmarkService.selectBookmarkGroup();
        if (bookmarkGroupList.size() == 0) {
    %>
    <tr>
        <td colspan="100%">정보가 존재하지 않습니다.</td>
    </tr>
    <%
    } else {
        for (BookmarkGroup group : bookmarkGroupList) {

    %>
<%--    <form>--%>
    <tr>
        <td><%=group.getGroupId()%>
        </td>
        <td><%=group.getGroupName()%>
        </td>
        <td><%=group.getGroupOrder()%>
        </td>
        <td><%=group.getGroupRegDate()%>
        </td>
        <td><%=group.getGroupEditDate()%>
        </td>
        <td>
            <a href="bookmark-group-edit.jsp?id=<%=group.getGroupId()%>">수정 </a>
            &nbsp;
            <a href="bookmark-group-delete.jsp?id=<%=group.getGroupId()%>">
                삭제
            </a>
        </td>
    </tr>
<%--    </form>--%>

    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>
