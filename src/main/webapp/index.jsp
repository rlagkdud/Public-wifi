<%@ page import="com.example.mission1.GetApi" %>
<%@ page import="com.example.mission1.Wifi" %>
<%@ page import="com.example.mission1.GetJson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.example.mission1.WifiService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
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
            text-align: center;
            padding-top: 12px;
            padding-bottom: 12px;
            background-color: #04AA6D;
            color: white;
        }
    </style>


</head>
<body>
<%
    WifiService wifiService = new WifiService();
%>
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

<div>
    <form>
        LAT: <input  id="lat" name="LAT" value="0.0">,
        LNT: <input  id="lon" name="LNT" value="0.0">
        <button type="button" onclick="getLocation()">내 위치 가져오기</button>
        <button type="submit" >근처 WIFI정보 보기</button>
    </form>

    <script>
        var lat = document.getElementById("lat");
        var lon = document.getElementById("lon");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                lat.value = "Geolocation is not supported by this browser.";
                lon.value= "Geolocation is not supported by this browser."
            }
        }

        function showPosition(position) {
            lat.value = position.coords.latitude ;
            lon.value = position.coords.longitude;
        }
    </script>
</div>

<br/>
<table class="list">
    <thead>
    <tr>
        <th>거리(Km)</th>
        <th>관리번호</th>
        <th>자치구</th>
        <th>와이파이명</th>
        <th>도로명주소</th>
        <th>상세주소</th>
        <th>설치위치(층)</th>
        <th>설치유형</th>
        <th>설치기관</th>
        <th>서비스구분</th>
        <th>망종류</th>
        <th>설치년도</th>
        <th>실내외구분</th>
        <th>WIFI접속환경</th>
        <th>X좌표</th>
        <th>Y좌표</th>
        <th>작업일자</th>
    </tr>
    </thead>

    <tbody>
        <%
            if(request.getParameter("LAT") == null || request.getParameter("LNT") == null){
        %>
        <tr>
            <td colspan="100%">위치 정보를 입력한 후에 조회해 주세요</td>
        </tr>
        <%
            } else {
                //히스토리에 내 LAT, LNT 저장하기
                String lat = request.getParameter("LAT");
                String lnt = request.getParameter("LNT");
                String searchDate = String.valueOf(LocalDateTime.now());
                wifiService.insertHistory(lat, lnt, searchDate);
                // 와이파이정보 가까운거 20개 가져오기
                ArrayList<Wifi> nearWifiList = wifiService.selectNearWifi(lat, lnt);
        %>
        <%for(Wifi wifi: nearWifiList){ %>
            <tr>
                <td><%=wifi.getX_SIFI_DISTANCE()%></td>
                <td><%=wifi.getX_SWIFI_MGR_NO()%></td>
                <td><%=wifi.getX_SWIFI_WRDOFC()%></td>

                <td>
                    <a href="detail.jsp?mgr-no=<%=wifi.getX_SWIFI_MGR_NO()%>">
                        <%=wifi.getX_SWIFI_MAIN_NM()%>
                    </a>
                </td>

                <td><%=wifi.getX_SWIFI_ADRES1()%></td>
                <td><%=wifi.getX_SWIFI_ADRES2()%></td>
                <td><%=wifi.getX_SWIFI_INSTL_FLOOR()%></td>
                <td><%=wifi.getX_SWIFI_INSTL_TY()%></td>
                <td><%=wifi.getX_SWIFI_INSTL_MBY()%></td>
                <td><%=wifi.getX_SWIFI_SVC_SE()%></td>
                <td><%=wifi.getX_SWIFI_CMCWR()%></td>
                <td><%=wifi.getX_SWIFI_CNSTC_YEAR()%></td>
                <td><%=wifi.getX_SWIFI_INOUT_DOOR()%></td>
                <td><%=wifi.getX_SWIFI_REMARS3()%></td>
                <td><%=wifi.getLAT()%></td>
                <td><%=wifi.getLNT()%></td>
                <td><%=wifi.getWORK_DTTM()%></td>
            </tr>
        <%
                }
            }
        %>

    </tbody>
</table>


</body>
</html>