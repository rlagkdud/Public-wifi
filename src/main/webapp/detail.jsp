<%@ page import="com.example.mission1.WifiService" %>
<%@ page import="com.example.mission1.Wifi" %><%--
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
            font-size: 7pt;
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
<a href="history.jsp">위치 히스토리 목록</a>
<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>

<div>
    <form>
        LAT: <input id="lat" name="LAT" value="0.0">,
        LNT: <input id="lon" name="LNT" value="0.0">
        <button type="button" onclick="getLocation()">내 위치 가져오기</button>
        <button type="submit">근처 WIFI정보 보기</button>
    </form>

    <script>
        var z = document.getElementById("lat");
        var zz = document.getElementById("lon");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                z.innerHTML = "Geolocation is not supported by this browser.";
            }
        }

        function showPosition(position) {
            z.value = position.coords.latitude;
            zz.value = position.coords.longitude;
        }
    </script>
</div>
<br/>

<%
    WifiService wifiService = new WifiService();
    String mgrNo = request.getParameter("mgr-no");
    Wifi wifi = wifiService.selectDetail(mgrNo);
%>
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
