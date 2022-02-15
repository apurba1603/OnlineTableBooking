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
    
     public List showMenu(int restaurantId) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Menu> menuList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM menu WHERE restaurantId=?";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
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
     
     public Menu fetchProduct(int productId)throws SQLException, Exception {
         Menu product = new Menu();
         ResultSet rs = null;
        Connection con = null;
        try {
            String sql = "SELECT * FROM menu WHERE productId =?;";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            if (rs.next()) {
                product.setProductId(rs.getInt("productId"));
                product.setFoodItems(rs.getString("foodItems"));
                product.setPrice(rs.getDouble("price"));
            }
            return product;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
     }
     
     public int addItem(int restaurantId, String foodItems, double price) throws SQLException {
        int i=0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO menu (foodItems"
                    + " , price , restaurantId) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, foodItems);
            ps.setDouble(2, price);
            ps.setInt(3,restaurantId);
            System.out.println("SQL for insert=" + ps);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
     }

}
