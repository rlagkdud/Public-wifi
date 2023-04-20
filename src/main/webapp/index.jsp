<%@ page import="com.example.mission1.GetApi" %>
<%@ page import="com.example.mission1.Wifi" %>
<%@ page import="com.example.mission1.GetJson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.example.mission1.WifiService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        #wifiList {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-size: 7pt;
        }

        #wifiList td, #wifiList th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #wifiList tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #wifiList tr:hover {
            background-color: #ddd;
        }

        #wifiList th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="index.js"></script>

</head>
<body>
<%
    WifiService wifiService = new WifiService();
    System.out.println(request.getParameter("lat"));
    System.out.println(request.getParameter("lon"));
%>
<h1> 와이파이 정보 구하기 </h1>
<br/>
<a href="index.jsp">홈</a>
<a href="history.jsp">위치 히스토리 목록</a>
<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>

<div>
    <form>
        LAT: <input type="text" class="lat" name="lat" value="<%if(request.getParameter("lat") == null){out.write("0.0");} else {out.write(request.getParameter("lat"));}%>">,
        LNT: <input type="text"  class="lon" name="lon" value="<%if(request.getParameter("lat") == null){out.write("0.0");} else{out.write(request.getParameter("lon"));}%>">
        <button type="button" onclick="showPosition()">내 위치 가져오기</button>
        <button type="button" >근처 WIFI정보 보기</button>
    </form>


    <p>Click the button to get your coordinates.</p>

    <button onclick="getLocation2()">Try It</button>

    <input id="demo"/>
    <input id="demo2"/>

    <script>
        var z = document.getElementById("demo");
        var zz = document.getElementById("demo2");

        function getLocation2() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition2);
            } else {
                z.innerHTML = "Geolocation is not supported by this browser.";
            }
        }

        function showPosition2(position) {
            z.value = position.coords.latitude ;
            zz.value = position.coords.longitude;
        }
    </script>
</div>




<br/>
<table id="wifiList">
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