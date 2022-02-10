/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Menu;
import com.tablebooking.core.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author amankumar
 */
public class MenuServices {
    
     public List showMenu() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Menu> menuList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM menu;";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Menu menu = new Menu();
                menu.setProductId(rs.getInt("productId"));
                menu.setFoodItems(rs.getString("foodItems"));
                menu.setPrice(rs.getDouble("price"));

                menuList.add(menu);
            }
            return menuList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

}
