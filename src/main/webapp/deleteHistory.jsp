<%@ page import="com.example.mission1.WifiService" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/21
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete History</title>
    <style>
    .list {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
      font-size: 10pt;
      text-align: center;
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
<h1> 와이파이 정보 구하기 </h1>
<br/>
<a href="index.jsp">홈</a>
|
<a href="history.jsp">위치 히스토리 목록</a>
|
<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>
|
<a href="">즐겨 찾기 보기</a>
|
<a href="bookmark-group.jsp">즐겨찾기 그룹 관리</a>

<div>
    <form>
    LAT: <input  id="lat" name="LAT" value="0.0">,
    LNT: <input  id="lon" name="LNT" value="0.0">
    <button type="button" onclick="getLocation()">내 위치 가져오기</button>
    <button type="submit" >근처 WIFI정보 보기</button>
  </form>

  <script>
    var z = document.getElementById("lat");
    var zz = document.getElementById("lon");

    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
      } else {
        z.value = "Geolocation is not supported by this browser.";
        zz.value= "Geolocation is not supported by this browser."
      }
    }

    function showPosition(position) {
      z.value = position.coords.latitude ;
      zz.value = position.coords.longitude;
    }
  </script>
</div>

<%
    WifiService wifiService = new WifiService();
    String mrgNo = request.getParameter("mrg-no");
    int res = wifiService.deleteHistory(mrgNo);
    if(res > 0){
%>
<script>
    alert("삭제 성공");
    location.href="history.jsp";
</script>
<%
    } else{
%>
<script>
    alert("삭제 실패");
    location.href="history.jsp";
</script>
<%
    }
%>

</body>
</html>
