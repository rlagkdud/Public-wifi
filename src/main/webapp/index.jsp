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

        #wifiList tr:nth-child(even){background-color: #f2f2f2;}

        #wifiList tr:hover {background-color: #ddd;}

        #wifiList th {
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
    <a href="history.jsp">위치 히스토리 목록</a>
    <a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>

    <div>
        <form>
            LAT: <input type="text" name="LAT" placeholder="0.0">,
            LNT: <input type="text" name="LNT" placeholder="0.0">
            <input type="submit" value="내 위치 가져오기">
            <input type="submit" value="근처 WIFI정보 보기">
        </form>
    </div>
    <br/>
    <table id="wifiList">
        <thead>
        <tr>
            <th>거리(Km)</th>
            <th>관리번호 </th>
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
<%-- TODO: 위치정보가져왔을때 보여주는걸로 바꿔야겠다--%>
            <%
                int rowCnt = wifiService.selectCount();
                if(rowCnt == 0){
            %>
            <%--  select 했을때 row수가 0이면 위치 정보를 입력한 후에 조회해 주세요      --%>
            <tr>
                <td>위치 정보를 입력한 후에 조회해 주세요</td>
            </tr>
            <% }
                else {
                    ArrayList<Wifi> wifiList = wifiService.select();
                    System.out.println("wifilist.size()= "+wifiList.size());
                    for(Wifi wifi : wifiList){

            %>
            <tr>
                <td><%=wifi.getX_SIFI_DISTANCE()%>	 </td>
                <td><%=wifi.getX_SWIFI_MGR_NO()%> </td>
                <td><%=wifi.getX_SWIFI_WRDOFC()%> </td>
                <td><%=wifi.getX_SWIFI_MAIN_NM()%> </td>
                <td><%=wifi.getX_SWIFI_ADRES1()%> </td>
                <td><%=wifi.getX_SWIFI_ADRES2()%> </td>
                <td><%=wifi.getX_SWIFI_INSTL_FLOOR()%> </td>
                <td><%=wifi.getX_SWIFI_INSTL_TY()%> </td>
                <td><%=wifi.getX_SWIFI_INSTL_MBY()%> </td>
                <td><%=wifi.getX_SWIFI_SVC_SE()%> </td>
                <td><%=wifi.getX_SWIFI_CMCWR()%> </td>
                <td><%=wifi.getX_SWIFI_CNSTC_YEAR()%> </td>
                <td><%=wifi.getX_SWIFI_INOUT_DOOR()%> </td>
                <td><%=wifi.getX_SWIFI_REMARS3()%> </td>
                <td><%=wifi.getLAT()%> </td>
                <td><%=wifi.getLNT()%> </td>
                <td><%=wifi.getWORK_DTTM()%> </td>
            </tr>
            <%--  Open Api 와아파이 정보 가져오기누른 후에 테이블이 생성되어 있다면 보여주기  --%>
            <%
                    }
                }
            %>

        </tbody>
    </table>
</body>
</html>