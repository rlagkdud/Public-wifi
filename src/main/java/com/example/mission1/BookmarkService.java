package com.example.mission1;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class BookmarkService {
    public ArrayList<BookmarkGroup> selectBookmarkGroup() {


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

        ArrayList<BookmarkGroup> boomarkGroupList = new ArrayList<>();
        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "select * from BOOKMARK_GROUP;";
            ps = conn.prepareStatement(sql);

            // 4. sql문장 실행
            rs = ps.executeQuery();

            // 5. sql 결과 처리
            while (rs.next()) {
                // getString으로 16개 행전부 가져와서
                int groupId = rs.getInt("GROUP_ID");
                String groupName = rs.getString("GROUP_NM");
                int groupOrder = rs.getInt("GROUP_ORDER");
                String groupRegDate = rs.getString("GROUP_REG_DATE");
                String groupEditDate = rs.getString("GROUP_EDIT_DATE");

                // set해주고
                BookmarkGroup group = new BookmarkGroup();
                group.setGroupId(groupId);
                group.setGroupName(groupName);
                group.setGroupOrder(groupOrder);
                group.setGroupRegDate(groupRegDate);
                group.setGroupEditDate(groupEditDate);

                //wifiList에 추가
                boomarkGroupList.add(group);
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
        return boomarkGroupList;
    }

    public int insertBookmarkGroup(String name, String order) {

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
        int res = 0;

        // 2. database connection 생성
        try {
            conn = DriverManager.getConnection(url, dbUserid, dbPassword);

            // 3. sql을 위한 statement객체 생성
            String sql = "insert into BOOKMARK_GROUP (GROUP_NM, GROUP_ORDER, GROUP_REG_DATE, GROUP_EDIT_DATE)" +
                    "values (?, ?, ?, ?);";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, order);
            ps.setString(3, String.valueOf(LocalDateTime.now()));
            ps.setString(4, "");


            // 4. sql문장 실행
            res = ps.executeUpdate();
            // 5. sql 결과 처리
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
        return res;
    }
}
