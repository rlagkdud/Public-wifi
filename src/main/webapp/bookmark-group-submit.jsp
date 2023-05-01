<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="com.example.mission1.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/21
  Time: 5:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%


    // post한 body읽어오기
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String order =request.getParameter("order");


    BookmarkService bookmarkService = new BookmarkService();
    int res = bookmarkService.insertBookmarkGroup(name, order);
    if(res > 0){
%>
<script>
    alert("북마크 그룹 정보를 추가했습니다.");
    location.href="bookmark-group.jsp";
</script>
<%
    }
    else {
%>
<script>
    alert("북마크 그룹 정보 추가에 실패했습니다.");
    location.href="bookmark-group-add.jsp";
</script>
<%
    }
%>
</body>
</html>
