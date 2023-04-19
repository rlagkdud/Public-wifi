package com.example.mission1;

import com.google.gson.*;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class GetJson { // jsonstring으로 Wifi 객체 만들기

    public int getListTotalCnt(String jsonString){
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(jsonString);
        JsonElement tbPublicWifiInfo = element.getAsJsonObject().get("TbPublicWifiInfo");
        String listTotalCnt = tbPublicWifiInfo.getAsJsonObject().get("list_total_count").getAsString();
        return Integer.parseInt(listTotalCnt);

    }

    public ArrayList<JsonElement> getWifiList(ArrayList<String> list){
        ArrayList<JsonElement> wifiList = new ArrayList<>();
        JsonParser parser = new JsonParser();
        JsonElement element;
        JsonObject tbPublicWifiInfo;
        // json문자열 리스트를 순회하며 모든 와이파이 정보를 가져오기
        for(String s : list){
            element = parser.parse(s);
            tbPublicWifiInfo = (JsonObject)element.getAsJsonObject().get("TbPublicWifiInfo");
            JsonArray row = tbPublicWifiInfo.getAsJsonArray("row"); // 1000개의 와아피이 정보를 담은 배열
            for(JsonElement je : row){
                wifiList.add(je);
            }
        }
        return wifiList;

    }
}
