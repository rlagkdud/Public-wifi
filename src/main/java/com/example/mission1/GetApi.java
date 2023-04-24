package com.example.mission1;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;


public class GetApi {
    //private ArrayList<String> list = new ArrayList<>();
    public String getJsonPage(int start, int end){
        BufferedReader br = null;
        try {
            String urlStr = "http://openapi.seoul.go.kr:8088/69674c45676b696d3130337959656457/json/TbPublicWifiInfo/"+start+"/"+end+"/";
            URL url = new URL(urlStr);

            HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
            urlConn.setRequestMethod("GET");
            urlConn.setRequestProperty("Contect-type", "application/xml");
            //System.out.println("response Code: "+ urlConn.getResponseCode());

            if(urlConn.getResponseCode() >= 200 && urlConn.getResponseCode() <= 300){
                br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(), StandardCharsets.UTF_8));
            } else{
                br = new BufferedReader(new InputStreamReader(urlConn.getErrorStream(),StandardCharsets.UTF_8));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while((line = br.readLine())!=null){
                sb.append(line);
            }
            br.close();
            urlConn.disconnect();

            return sb.toString();

        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public  String jsonDownload() {
        return getJsonPage(1, 5);
    }

    public  ArrayList<String> wholeJsonDownLoad(int listTotalCnt) {
        ArrayList<String> list = new ArrayList<>(); // 여기다가 모든 페이징 리스트를 다 담아 올거야
        int q = listTotalCnt / 1000;
        int mod = listTotalCnt % 1000;

        int start =1;
        int end = 1000;
        for(int i = 1; i<=q; i++){

            // string url만들기
            String s = getJsonPage(start, end);
            list.add(s);

            // string url의 페이징 변경해주기 (start, end)
            start = end +1;
            end += 1000;
        }

        // 마지막 나머지 페이징 처리
        String s = getJsonPage(start, listTotalCnt);
        list.add(s);
        return list;

    }

}
