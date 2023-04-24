<%@ page import="com.example.mission1.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 3:04 PM
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
  int isDelete = bookmarkService.deleteBookmark(id);

  if(isDelete>0){
%>
<script>
  alert("북마크 정보를 삭제했습니다.")
  location.href="bookmark-list.jsp";
</script>
<%
  } else{
%>
<script>
  alert("북마크 정보를 삭제하지 못했습니다.");
  location.href="bookmark-list.jsp";
</script>
<%
  }
%>

</body>
</html>
