<%@ page import="com.example.mission1.WifiService" %>
<%@ page import="com.example.mission1.Wifi" %>
<%@ page import="com.example.mission1.BookmarkService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mission1.BookmarkGroup" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/21
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>detail</title>
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
            text-align: center;
        }

        .list td, .list th {
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
            text-align: center;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<h1> 와이파이 정보 구하기 </h1>
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

<%
    WifiService wifiService = new WifiService();
    String mgrNo = request.getParameter("mgr-no");
    Wifi wifi = wifiService.selectDetail(mgrNo);
%>

<%--TODO: 북마크 리스트 드롭다운 메뉴로 보여주고 insert하기--%>
<%-- 북마크 목록 불러오기--%>
<%
    BookmarkService bookmarkService = new BookmarkService();
    ArrayList<BookmarkGroup> groupList = bookmarkService.selectBookmarkGroup();
%>
<form action="bookmark-add-submit.jsp" method="post">
    <input type="hidden" name="mgrNo" value="<%=mgrNo%>">
    <select name="group">
        <option value="0">북마크 그룹이름 선택</option>
        <% for(BookmarkGroup group : groupList){ %>
        <option value="<%=group.getGroupId()%>"><%=group.getGroupName()%></option>
        <%}%>
    </select>
    <input type="submit" value="즐겨찾기 추가">
</form>

<table class="list">
    <tr>
        <th>거리(Km)</th>
        <td><%=wifi.getX_SIFI_DISTANCE()%></td>
    </tr>
    <tr>
        <th>관리번호</th>
        <td><%=wifi.getX_SWIFI_MGR_NO()%></td>
    </tr>

    <tr>
        <th>자치구</th>
        <td><%=wifi.getX_SWIFI_WRDOFC()%></td>
    </tr>
    <tr>
        <th>와이파이명</th>
        <td><%=wifi.getX_SWIFI_MAIN_NM()%>></td>
    </tr>
    <tr>
        <th>도로명주소</th>
        <td><%=wifi.getX_SWIFI_ADRES1()%></td>
    </tr>
    <tr>
        <th>상세주소</th>
        <td><%=wifi.getX_SWIFI_ADRES2()%></td>
    </tr>
    <tr>
        <th>설치위치(층)</th>
        <td><%=wifi.getX_SWIFI_INSTL_FLOOR()%></td>
    </tr>
    <tr>
        <th>설치유형</th>
        <td><%=wifi.getX_SWIFI_INSTL_TY()%></td>
    </tr>
    <tr>
        <th>설치기관</th>
        <td><%=wifi.getX_SWIFI_INSTL_MBY()%></td>
    </tr>
    <tr>
        <th>서비스구분</th>
        <td><%=wifi.getX_SWIFI_SVC_SE()%></td>
    </tr>
    <tr>
        <th>망종류</th>
        <td><%=wifi.getX_SWIFI_CMCWR()%></td>
    </tr>
    <tr>
        <th>설치년도</th>
        <td><%=wifi.getX_SWIFI_CNSTC_YEAR()%></td>
    </tr>
    <tr>
        <th>실내외구분</th>
        <td><%=wifi.getX_SWIFI_INOUT_DOOR()%></td>
    </tr>
    <tr>
        <th>WIFI접속환경</th>
        <td><%=wifi.getX_SWIFI_REMARS3()%></td>
    </tr>
    <tr>
        <th>X좌표</th>
        <td><%=wifi.getLAT()%></td>
    </tr>
    <tr>
        <th>Y좌표</th>
        <td><%=wifi.getLNT()%></td>
    </tr>
    <tr>
        <th>작업일자</th>
        <td><%=wifi.getWORK_DTTM()%></td>
    </tr>
</table>
</body>
</html>
