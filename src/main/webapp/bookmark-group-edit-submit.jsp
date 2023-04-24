<%@ page import="com.example.mission1.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>북마크 수정</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String name = request.getParameter("name");
  int order = Integer.parseInt(request.getParameter("order"));
  String id = request.getParameter("id");
  System.out.println("name = " + name);
  System.out.println("order = " + order);
  System.out.println("hidden id = " + id);

  // update해서 결과가 0보다 크면 성공 아니면 실패
  BookmarkService bookmarkService = new BookmarkService();
  int isUpdate = bookmarkService.updateBookmarkGroup(id, name, order);

  if(isUpdate > 0){

%>
<script>
  alert("북마크 수정 완료");
  location.href = "bookmark-group.jsp";
</script>
<%
  } else {
%>
<script>
  alert("북마크 수정 실패");
  location.href = "bookmark-group.jsp";
</script>
<%
  }
%>

</body>
</html>
