package com.example.mission1;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import java.util.ArrayList;

public class WifiMain {
    public static void main(String[] args) {
        GetJson getJson = new GetJson();
        GetApi getApi = new GetApi();

        String jsonString = getApi.jsonDownload();
        int listTotalCnt = getJson.getListTotalCnt(jsonString); // 총 데이터 개수
//        System.out.println("listTotalCnt = " + listTotalCnt);

        ArrayList<String> wholeJsonList = getApi.wholeJsonDownLoad(listTotalCnt); // 모든 데이터를 api에서 가져온 문자열 리스트
//        System.out.println("size: "+ wholeJsonList.size());
//
        ArrayList<JsonElement> wifiList = getJson.getWifiList(wholeJsonList); // 모든 와이파이 json 객체 list
//        System.out.println(wifiList.get(0));
//        System.out.println("wifiList Count(must same with totalListCount): "+wifiList.size());

        // TODO
        // json-> java객체로 저장
        // java객체를 database에 insert(받아온 wifi list를 sqlite에 insert하기)

        WifiService wifiService = new WifiService();
//        System.out.println(wifiService.selectCount());
//        wifiService.select();

        // json-> java객체로 저장
//        Wifi wifi;
//        Gson gson = new Gson();
//        String firstWifiStr = wifiList.get(20000).toString();
//        wifi = gson.fromJson(firstWifiStr, Wifi.class);
//        System.out.println(wifi.getX_SWIFI_MGR_NO());
//        wifiService.insert(wifi);


        // java객체를 database에 insert // 받아온 wifi list를 sqlite에 insert하기
        //wifiService.insert(wifi);
//        String wifiStr;
//        Gson gson = new Gson();
//        for(JsonElement je : wifiList){
//            wifiStr = je.toString(); // json객체를 String으로
//            Wifi wifi = gson.fromJson(wifiStr, Wifi.class); // json string을 wifi객체로
//            wifiService.insert(wifi); // 객체를 db에 insert
//        }

//        ArrayList<String> list = new ArrayList<>(); // json -> String
//        for (JsonElement je : wifiList) {
//            list.add(je.toString());
//        }
//        System.out.println(list.size());
//        ArrayList<Wifi> wifiObj = new ArrayList<>(); // String -> WIFI
//        for (String s : list) {
//            wifiObj.add(gson.fromJson(s, Wifi.class));
//        }
//        System.out.println(wifiObj.size());

        //wifiService.insertList(wifiList);
        wifiService.select();


        // TODO: history delete 만들기
        // TODO: 와아피아 상세정보 보여주기

    }
}
