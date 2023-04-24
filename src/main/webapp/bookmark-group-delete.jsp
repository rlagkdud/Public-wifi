<%@ page import="com.example.mission1.BookmarkService" %>
<%@ page import="com.example.mission1.BookmarkGroup" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>북마크 그룹 삭제</title>
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
    //System.out.println("id = " + id);
    BookmarkService bookmarkService = new BookmarkService();
    BookmarkGroup group = bookmarkService.selectOneBookmarkGroup(id);
    String name = group.getGroupName();
    int order = group.getGroupOrder();
    //int groupId = group.getGroupId();
%>
<table class="list">
    <tr>
        <th>북마크 이름</th>
        <td><%=name%></td>
    </tr>
    <tr>
        <th>순서</th>
        <td><%=order%></td>
    </tr>
    <tr>
        <td colspan="10%">
            <a href="bookmark-group.jsp">돌아가기</a>
            <a href="bookmark-group-delete-submit.jsp?id=<%=id%>">삭제</a>
        </td>
    </tr>
</table>

</body>
</html>
