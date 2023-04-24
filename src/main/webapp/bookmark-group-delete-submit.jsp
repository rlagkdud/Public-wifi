<%@ page import="com.example.mission1.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  BookmarkService bookmarkService = new BookmarkService();
  int isDelete = bookmarkService.deleteBookmarkGroup(id);

  if(isDelete>0){

%>
<script>
  alert("북마크 삭제 성공");
  location.href="bookmark-group.jsp";
</script>
<%
  } else{

%>
<script>
  alert("북마크 삭제 실패");
  location.href="bookmark-group.jsp";
</script>
<%
  }
%>

</body>
</html>
