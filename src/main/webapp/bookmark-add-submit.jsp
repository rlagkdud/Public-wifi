<%@ page import="com.example.mission1.*" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/24
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String mgrNo = request.getParameter("mgrNo");
    int groupId = Integer.parseInt(request.getParameter("group"));
//    System.out.println("mgrNo = " + mgrNo);
//    System.out.println("groupId = " + groupId);
    if (groupId == 0) {
%>
<script>
    alert("북마크 그룹을 선택하세요!");
    location.href = "index.jsp";
</script>
<% } else {
    // TODO: insert 북마크그룹 이름, 와아피이이름, 현재시간
    BookmarkService bookmarkService = new BookmarkService();
    WifiService wifiService = new WifiService();
    BookmarkGroup group = bookmarkService.selectOneBookmarkGroup(groupId);
    Wifi wifi = wifiService.selectDetail(mgrNo);
    String groupName = group.getGroupName();
    String wifiName = wifi.getX_SWIFI_MAIN_NM();
//    System.out.println("goupName = " + groupName);
//    System.out.println("wifiName = " + wifiName);

    int isBookmarkInsert = bookmarkService.insertBookmark(groupName, wifiName);

    if (isBookmarkInsert > 0) {
%>
<script>
    alert("북마크 정보를 추가하였습니다.")
    location.href="bookmark-list.jsp";
</script>
<%
} else {

%>
<script>
    alert("북마크 정보를 추가하지 못했습니다.");
    location.href="bookmark-list.jsp";
</script>

<%
        }
    }
%>

</body>
</html>
