<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mission1.GetApi" %>
<%@ page import="com.example.mission1.GetJson" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.mission1.Wifi" %>
<%@ page import="com.example.mission1.WifiService" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: hayeongkim
  Date: 2023/04/18
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Load Wifi</title>
    <style>
        body {
            text-align: center;
        }
    </style>
</head>
<body>
<%
    GetJson getJson = new GetJson();
    GetApi getApi = new GetApi();
    WifiService wifiService = new WifiService();

    String jsonString = getApi.jsonDownload();
    int listTotalCnt = getJson.getListTotalCnt(jsonString); // 총 데이터 개수
    ArrayList<String> wholeJsonList = getApi.wholeJsonDownLoad(listTotalCnt); // 모든 데이터를 api에서 가져온 문자열 리스트
    ArrayList<JsonElement> wifiList = getJson.getWifiList(wholeJsonList); // json wifi list

    // json-> java객체로 저장 -> 객체를 db에 insert
    wifiService.insertList(wifiList);
%>
<h1><%=listTotalCnt%>개의 WIFI 정보를 정상적으로 저장하였습니다</h1>
<a href="index.jsp">홈 으로 가기</a>


</body>
</html>
