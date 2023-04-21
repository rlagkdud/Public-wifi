package com.example.mission1;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class WifiService {

    public int selectCount() {

        // 1. 드라이버 로드
        // 2. database connection 생성
        // 3. sql을 위한 statement객체 생성
        // 4. sql문장 실행
        // 5. sql 결과 처리
        // 6. jdbc 객체 연결 해제

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int rowCnt = 0;

        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "select * from wifiinfo;";
            ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

            // 4. sql문장 실행
            rs = ps.executeQuery();

            // 5. sql 결과 처리
            // rowCnt 구하기

            rs.last();
            rowCnt = rs.getRow();
            rs.beforeFirst();

            System.out.println("rowCnt = " + rowCnt);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return rowCnt;
    }

    public ArrayList<Wifi> select() {

        // 1. 드라이버 로드
        // 2. database connection 생성
        // 3. sql을 위한 statement객체 생성
        // 4. sql문장 실행
        // 5. sql 결과 처리
        // 6. jdbc 객체 연결 해제

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Wifi> wifiList = new ArrayList<>();
        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "select * from wifiinfo;";
            ps = conn.prepareStatement(sql);

            // 4. sql문장 실행
            rs = ps.executeQuery();

            // 5. sql 결과 처리
            while (rs.next()) {
                // getString으로 16개 행전부 가져와서
                String no = rs.getString("X_SWIFI_MGR_NO");
                String distance = rs.getString("X_SWIFI_DISTANCE");
                String wrdofc = rs.getString("X_SWIFI_WRDOFC");
                String name = rs.getString("X_SWIFI_MAIN_NM");
                String adres1 = rs.getString("X_SWIFI_ADRES1");
                String adres2 = rs.getString("X_SWIFI_ADRES2");
                String floor = rs.getString("X_SWIFI_INSTL_FLOOR");
                String ty = rs.getString("X_SWIFI_INSTL_TY");
                String mby = rs.getString("X_SWIFI_INSTL_MBY");
                String se = rs.getString("X_SWIFI_SVC_SE");
                String cmcwr = rs.getString("X_SWIFI_CMCWR");
                String year = rs.getString("X_SWIFI_CNSTC_YEAR");
                String door = rs.getString("X_SWIFI_INOUT_DOOR");
                String remars3 = rs.getString("X_SWIFI_REMARS3");
                Double lat = rs.getDouble("LAT");
                Double lnt = rs.getDouble("LNT");
                String dttm = rs.getString("WORK_DTTM");
                // set해주고
                Wifi wifi = new Wifi();
                wifi.setX_SWIFI_MGR_NO(no);
                //wifi.setX_SIFI_DISTANCE(distance);
                wifi.setX_SWIFI_WRDOFC(wrdofc);
                wifi.setX_SWIFI_MAIN_NM(name);
                wifi.setX_SWIFI_ADRES1(adres1);
                wifi.setX_SWIFI_ADRES2(adres2);
                wifi.setX_SWIFI_INSTL_FLOOR(floor);
                wifi.setX_SWIFI_INSTL_TY(ty);
                wifi.setX_SWIFI_INSTL_MBY(mby);
                wifi.setX_SWIFI_SVC_SE(se);
                wifi.setX_SWIFI_CMCWR(cmcwr);
                wifi.setX_SWIFI_CNSTC_YEAR(year);
                wifi.setX_SWIFI_INOUT_DOOR(door);
                wifi.setX_SWIFI_REMARS3(remars3);
                wifi.setLAT(lat);
                wifi.setLNT(lnt);
                wifi.setWORK_DTTM(dttm);
                //wifiList에 추가
                wifiList.add(wifi);
            }
            // wifiList 반환

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return wifiList;
    }

    public ArrayList<Wifi> selectNearWifi(String latitud, String longitude) {

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Wifi> wifiList = new ArrayList<>();
        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);
            System.out.println(longitude);
            System.out.println(latitud);

            // 3. sql을 위한 statement객체 생성
            String sql = "SELECT" +
                    "    * , (" +
                    "       6371 * acos ( cos ( radians(?) )" +
                    "          * cos( radians( LAT ) )" +
                    "          * cos( radians( LNT) - radians(?) )" +
                    "          + sin ( radians(?) ) * sin( radians( LAT ) )" +
                    "       )" +
                    "   ) AS dist" +
                    " from wifiinfo" +
                    " order by dist" +
                    " limit 20;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, longitude);
            ps.setString(2, latitud);
            ps.setString(3, longitude);

            // 4. sql문장 실행
            rs = ps.executeQuery();

            // 5. sql 결과 처리
            while (rs.next()) {
                // getString으로 16개 행전부 가져와서
                String no = rs.getString("X_SWIFI_MGR_NO");
                Double distance = rs.getDouble("dist");
                String wrdofc = rs.getString("X_SWIFI_WRDOFC");
                String name = rs.getString("X_SWIFI_MAIN_NM");
                String adres1 = rs.getString("X_SWIFI_ADRES1");
                String adres2 = rs.getString("X_SWIFI_ADRES2");
                String floor = rs.getString("X_SWIFI_INSTL_FLOOR");
                String ty = rs.getString("X_SWIFI_INSTL_TY");
                String mby = rs.getString("X_SWIFI_INSTL_MBY");
                String se = rs.getString("X_SWIFI_SVC_SE");
                String cmcwr = rs.getString("X_SWIFI_CMCWR");
                String year = rs.getString("X_SWIFI_CNSTC_YEAR");
                String door = rs.getString("X_SWIFI_INOUT_DOOR");
                String remars3 = rs.getString("X_SWIFI_REMARS3");
                Double lat = rs.getDouble("LAT");
                Double lnt = rs.getDouble("LNT");
                String dttm = rs.getString("WORK_DTTM");
                // set해주고
                Wifi wifi = new Wifi();
                wifi.setX_SWIFI_MGR_NO(no);
                wifi.setX_SIFI_DISTANCE(distance);
                wifi.setX_SWIFI_WRDOFC(wrdofc);
                wifi.setX_SWIFI_MAIN_NM(name);
                wifi.setX_SWIFI_ADRES1(adres1);
                wifi.setX_SWIFI_ADRES2(adres2);
                wifi.setX_SWIFI_INSTL_FLOOR(floor);
                wifi.setX_SWIFI_INSTL_TY(ty);
                wifi.setX_SWIFI_INSTL_MBY(mby);
                wifi.setX_SWIFI_SVC_SE(se);
                wifi.setX_SWIFI_CMCWR(cmcwr);
                wifi.setX_SWIFI_CNSTC_YEAR(year);
                wifi.setX_SWIFI_INOUT_DOOR(door);
                wifi.setX_SWIFI_REMARS3(remars3);
                wifi.setLAT(lat);
                wifi.setLNT(lnt);
                wifi.setWORK_DTTM(dttm);
                //wifiList에 추가
                wifiList.add(wifi);
            }
            // wifiList 반환

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return wifiList;
    }

    public void insert(Wifi wifi) {

        // 1. 드라이버 로드
        // 2. database connection 생성
        // 3. sql을 위한 statement객체 생성
        // 4. sql문장 실행
        // 5. sql 결과 처리
        // 6. jdbc 객체 연결 해제

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "insert into wifiinfo (" +
                    "    X_SWIFI_MGR_NO," +
                    "    X_SWIFI_WRDOFC," +
                    "    X_SWIFI_MAIN_NM," +
                    "    X_SWIFI_ADRES1," +
                    "    X_SWIFI_ADRES2," +
                    "    X_SWIFI_INSTL_FLOOR," +
                    "    X_SWIFI_INSTL_TY," +
                    "    X_SWIFI_INSTL_MBY," +
                    "    X_SWIFI_SVC_SE," +
                    "    X_SWIFI_CMCWR," +
                    "    X_SWIFI_CNSTC_YEAR," +
                    "    X_SWIFI_INOUT_DOOR," +
                    "    X_SWIFI_REMARS3," +
                    "    LAT," +
                    "    LNT," +
                    "    WORK_DTTM)" +
                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            ps = conn.prepareStatement(sql);
            ps.setString(1, wifi.getX_SWIFI_MGR_NO());
            ps.setString(2, wifi.getX_SWIFI_WRDOFC());
            ps.setString(3, wifi.getX_SWIFI_MAIN_NM());
            ps.setString(4, wifi.getX_SWIFI_ADRES1());
            ps.setString(5, wifi.getX_SWIFI_ADRES2());
            ps.setString(6, wifi.getX_SWIFI_INSTL_FLOOR());
            ps.setString(7, wifi.getX_SWIFI_INSTL_TY());
            ps.setString(8, wifi.getX_SWIFI_INSTL_MBY());
            ps.setString(9, wifi.getX_SWIFI_SVC_SE());
            ps.setString(10, wifi.getX_SWIFI_CMCWR());
            ps.setString(11, wifi.getX_SWIFI_CNSTC_YEAR());
            ps.setString(12, wifi.getX_SWIFI_INOUT_DOOR());
            ps.setString(13, wifi.getX_SWIFI_REMARS3());
            ps.setDouble(14, wifi.getLAT());
            ps.setDouble(15, wifi.getLNT());
            ps.setString(16, wifi.getWORK_DTTM());


            // 4. sql문장 실행
            int affectedRows = ps.executeUpdate();
            // 5. sql 결과 처리
            if (affectedRows > 0) {
                System.out.println("저장 성공");
            } else {
                System.out.println("저장 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void insertList(ArrayList<JsonElement> list) {

        // 1. 드라이버 로드
        // 2. database connection 생성
        // 3. sql을 위한 statement객체 생성
        // 4. sql문장 실행
        // 5. sql 결과 처리
        // 6. jdbc 객체 연결 해제

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int affectedRows = 0;
        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "insert into wifiinfo (" +
                    "    X_SWIFI_MGR_NO," +
                    "    X_SWIFI_WRDOFC," +
                    "    X_SWIFI_MAIN_NM," +
                    "    X_SWIFI_ADRES1," +
                    "    X_SWIFI_ADRES2," +
                    "    X_SWIFI_INSTL_FLOOR," +
                    "    X_SWIFI_INSTL_TY," +
                    "    X_SWIFI_INSTL_MBY," +
                    "    X_SWIFI_SVC_SE," +
                    "    X_SWIFI_CMCWR," +
                    "    X_SWIFI_CNSTC_YEAR," +
                    "    X_SWIFI_INOUT_DOOR," +
                    "    X_SWIFI_REMARS3," +
                    "    LAT," +
                    "    LNT," +
                    "    WORK_DTTM)" +
                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

            for(int i = 0; i<list.size(); i++){
                ps = conn.prepareStatement(sql);
                Wifi wifi = new Gson().fromJson(list.get(i), Wifi.class);
                ps.setString(1, wifi.getX_SWIFI_MGR_NO());
                ps.setString(2, wifi.getX_SWIFI_WRDOFC());
                ps.setString(3, wifi.getX_SWIFI_MAIN_NM());
                ps.setString(4, wifi.getX_SWIFI_ADRES1());
                ps.setString(5, wifi.getX_SWIFI_ADRES2());
                ps.setString(6, wifi.getX_SWIFI_INSTL_FLOOR());
                ps.setString(7, wifi.getX_SWIFI_INSTL_TY());
                ps.setString(8, wifi.getX_SWIFI_INSTL_MBY());
                ps.setString(9, wifi.getX_SWIFI_SVC_SE());
                ps.setString(10, wifi.getX_SWIFI_CMCWR());
                ps.setString(11, wifi.getX_SWIFI_CNSTC_YEAR());
                ps.setString(12, wifi.getX_SWIFI_INOUT_DOOR());
                ps.setString(13, wifi.getX_SWIFI_REMARS3());
                ps.setDouble(14, wifi.getLAT());
                ps.setDouble(15, wifi.getLNT());
                ps.setString(16, wifi.getWORK_DTTM());
                // 4. sql문장 실행
                affectedRows = ps.executeUpdate();
            }
            // 5. sql 결과 처리
            if (affectedRows > 0) {
                System.out.println("저장 성공");
            } else {
                System.out.println("저장 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void insertHistory(String lat, String lnt, String searchDate) {

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "insert into HISTORY (X, Y, SEARCH_DATE)" +
                    "values (?, ?, ?);";
            ps = conn.prepareStatement(sql);
            ps.setString(1, lat);
            ps.setString(2, lnt);
            ps.setString(3, searchDate);

            // 4. sql문장 실행
            int affectedRows = ps.executeUpdate();
            // 5. sql 결과 처리
            if (affectedRows > 0) {
                System.out.println("히스토리 저장 성공");
            } else {
                System.out.println("히스토리 저장 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public ArrayList<History> selectHistory() {

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<History> historyList = new ArrayList<>();
        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "select * from HISTORY order by ID desc;";
            ps = conn.prepareStatement(sql);

            // 4. sql문장 실행
            rs = ps.executeQuery();

            // 5. sql 결과 처리
            while (rs.next()) {
                // getString으로 16개 행전부 가져와서
                String id = rs.getString("ID");
                String x = rs.getString("X");
                String y = rs.getString("Y");
                String search_date = rs.getString("SEARCH_DATE");

                // set해주고
                History history = new History();
                history.setId(id);
                history.setX(x);
                history.setY(y);
                history.setSearch_date(search_date);
                //wifiList에 추가
                historyList.add(history);
            }
            // wifiList 반환

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return historyList;
    }

    public Wifi selectDetail(String mgrNo) {

        String url = "jdbc:mariadb://127.0.0.1:3306/WIFI";
        String dbUserid = "testuser1";
        String dbPassword = "zerobase";
        // 1. 드라이버 로드
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // wifi 객체 생성
        Wifi wifi = new Wifi();

        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "select * from wifiinfo where X_SWIFI_MGR_NO=?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, mgrNo);

            // 4. sql문장 실행
            rs = ps.executeQuery();

            // 5. sql 결과 처리
            if (rs.next()) {
                // getString으로 16개 행전부 가져와서
                String no = rs.getString("X_SWIFI_MGR_NO");
                Double distance = rs.getDouble("X_SWIFI_DISTANCE");
                String wrdofc = rs.getString("X_SWIFI_WRDOFC");
                String name = rs.getString("X_SWIFI_MAIN_NM");
                String adres1 = rs.getString("X_SWIFI_ADRES1");
                String adres2 = rs.getString("X_SWIFI_ADRES2");
                String floor = rs.getString("X_SWIFI_INSTL_FLOOR");
                String ty = rs.getString("X_SWIFI_INSTL_TY");
                String mby = rs.getString("X_SWIFI_INSTL_MBY");
                String se = rs.getString("X_SWIFI_SVC_SE");
                String cmcwr = rs.getString("X_SWIFI_CMCWR");
                String year = rs.getString("X_SWIFI_CNSTC_YEAR");
                String door = rs.getString("X_SWIFI_INOUT_DOOR");
                String remars3 = rs.getString("X_SWIFI_REMARS3");
                Double lat = rs.getDouble("LAT");
                Double lnt = rs.getDouble("LNT");
                String dttm = rs.getString("WORK_DTTM");
                // set해주고
                wifi.setX_SWIFI_MGR_NO(no);
                wifi.setX_SIFI_DISTANCE(distance);
                wifi.setX_SWIFI_WRDOFC(wrdofc);
                wifi.setX_SWIFI_MAIN_NM(name);
                wifi.setX_SWIFI_ADRES1(adres1);
                wifi.setX_SWIFI_ADRES2(adres2);
                wifi.setX_SWIFI_INSTL_FLOOR(floor);
                wifi.setX_SWIFI_INSTL_TY(ty);
                wifi.setX_SWIFI_INSTL_MBY(mby);
                wifi.setX_SWIFI_SVC_SE(se);
                wifi.setX_SWIFI_CMCWR(cmcwr);
                wifi.setX_SWIFI_CNSTC_YEAR(year);
                wifi.setX_SWIFI_INOUT_DOOR(door);
                wifi.setX_SWIFI_REMARS3(remars3);
                wifi.setLAT(lat);
                wifi.setLNT(lnt);
                wifi.setWORK_DTTM(dttm);
            }
            // wifi 객체 반환

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // 6. jdbc 객체 연결 해제
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null && !ps.isClosed()) {
                    ps.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (conn != null && !conn.isClosed()) {
                    conn.isClosed();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return wifi;
    }
}
