<%@ page import="com.example.mission1.GetApi" %>
<%@ page import="com.example.mission1.Wifi" %>
<%@ page import="com.example.mission1.GetJson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.example.mission1.WifiService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
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
    <%-- TODO: 위치정보가져왔을때 보여주는걸로 바꿔야겠다--%>
    <tbody>
        <%
            if(request.getParameter("LAT") == null || request.getParameter("LNT") == null){
        %>
        <tr>
            <td colspan="100%">위치 정보를 입력한 후에 조회해 주세요</td>
        </tr>
        <%
            } else {
                //TODO: 히스토리에 내 LAT, LNT 저장하기 --> O
                String lat = request.getParameter("LAT");
                String lnt = request.getParameter("LNT");
                String searchDate = String.valueOf(LocalDate.now());
                wifiService.insertHistory(lat, lnt, searchDate);
                //TODO: 와이파이정보 가까운거 20개 가져오기 key값인 LAT이랑 LNT받아서 wifiService메소드로 넘겨서 쿼리처리하고 ArrayList<Wifi> wifiList반환하면 될듯!
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



<%--    <%--%>
<%--        int rowCnt = wifiService.selectCount();--%>
<%--        if (rowCnt == 0) {--%>
<%--    %>--%>
<%--    &lt;%&ndash;  select 했을때 row수가 0이면 위치 정보를 입력한 후에 조회해 주세요      &ndash;%&gt;--%>
<%--    <tr>--%>
<%--        <td>위치 정보를 입력한 후에 조회해 주세요</td>--%>
<%--    </tr>--%>
<%--    <% } else {--%>
<%--        ArrayList<Wifi> wifiList = wifiService.select();--%>
<%--        System.out.println("wifilist.size()= " + wifiList.size());--%>
<%--        for (Wifi wifi : wifiList) {--%>

<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%=wifi.getX_SIFI_DISTANCE()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_MGR_NO()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_WRDOFC()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_MAIN_NM()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_ADRES1()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_ADRES2()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_INSTL_FLOOR()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_INSTL_TY()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_INSTL_MBY()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_SVC_SE()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_CMCWR()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_CNSTC_YEAR()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_INOUT_DOOR()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getX_SWIFI_REMARS3()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getLAT()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getLNT()%>--%>
<%--        </td>--%>
<%--        <td><%=wifi.getWORK_DTTM()%>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    &lt;%&ndash;  Open Api 와아파이 정보 가져오기누른 후에 테이블이 생성되어 있다면 보여주기  &ndash;%&gt;--%>
<%--    <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>

    </tbody>
</table>


</body>
</html>