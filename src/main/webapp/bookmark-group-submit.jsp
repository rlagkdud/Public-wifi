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
    //System.out.println(request.getReader());
//    request.setCharacterEncoding("UTF-8");
//    String parameter = null;
//    StringBuilder stringBuilder = new StringBuilder();
//    BufferedReader bufferedReader = null;
//    try {
//        InputStream inputStream = request.getInputStream();
//        if (inputStream != null) {
//            bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
//            char[] charBuffer = new char[128];
//            int bytesRead = -1;
//            while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
//                stringBuilder.append(charBuffer, 0, bytesRead);
//            }
//        }
//    } catch (IOException ex) {
//        throw ex;
//    } finally {
//        if (bufferedReader != null) {
//            try {
//                bufferedReader.close();
//            } catch (IOException ex) {
//                throw ex;
//            }
//        }
//    }
//    parameter = stringBuilder.toString();
//    System.out.println(parameter);


    // post한 body읽어오기
    //request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String order =request.getParameter("order");
    System.out.println("name = " + name);
    System.out.println("order = " + order);

//    response.setContentType("text/html; charset=UTF-8");
//    BufferedReader reader = request.getReader();
//    StringBuffer sb = new StringBuffer();
//    String line = null;
//    while((line = reader.readLine()) != null){
//        sb.append(line);
//    }
//    String[] params = sb.toString().split("&");
//    String name = params[0].substring(5);
//    String order = params[1].substring(6);
//    System.out.println(name+" "+order);

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
