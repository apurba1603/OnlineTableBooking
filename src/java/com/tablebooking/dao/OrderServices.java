/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Order;
import com.tablebooking.beans.User;
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
public class OrderServices {
      public int registerOrder(int orderId, int restaurantId, int customerId, 
            int items) throws Exception { 
         int i = 0;
        Connection con = null;
         try {
        con = ConnectionManager.getConnection();
         String sql = "INSERT INTO orders (orderId,restaurantId,customerId,items) VALUES (?,?,?,?)";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, orderId);
         ps.setInt(2, restaurantId);
         ps.setInt(3, customerId);
         ps.setInt(4, items);
        
         System.out.println("SQL for insert=" + ps);
         i = ps.executeUpdate(); 
         return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
         }
    }
      
    public List report() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Order> orderList = new ArrayList<>();
        try {
            String sql = "SELECT orderId, restaurantId, customerId, items FROM orders";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Order order = new Order();
                order.setOrderId(rs.getInt("orderId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setCustomerId(rs.getInt("customerId"));
                order.setItems(rs.getInt("items"));
               


                orderList.add(order);
            }
            return orderList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    
    public Order fetchOrderDetails(Integer orderId) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        Order order = new Order();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT orderId, restaurantId, customerId, "
                    + "items FROM orders WHERE orderId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("orderId = " + orderId);
            ps.setInt(1, orderId);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            if (rs.next()) {

                order.setOrderId(rs.getInt("orderId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setCustomerId(rs.getInt("customerId"));
                order.setItems(rs.getInt("items"));
             

            }
            return order;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateOrderDetails(Integer orderId, Integer restaurantId, Integer customerId, 
            Integer items) throws SQLException, Exception {

        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE orders SET restaurantId = ?, customerId = ?, "
                    + " items = ?"
                    + "WHERE orderId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
            ps.setInt(2, customerId);
            ps.setInt(3, items);
            ps.setInt(4, orderId);
          
            System.out.println("Select SQL = " + ps);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int deleteOrderDetails(Integer orderId) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE orders SET status = 0 WHERE orderId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public Order validateLoginCredentials(Integer orderId) throws SQLException {
        ResultSet rs = null;
        Connection con = null;
        Order order = null;
        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM orders WHERE orderId= ? AND status= 1;";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("orderId = " + orderId);
            ps.setInt(1, orderId);
          
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();

            if (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getInt("orderId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setCustomerId(rs.getInt("customerId"));
                order.setItems(rs.getInt("items"));
                order.setStatus(true);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (con != null) {
                con.close();
            }
        }
        return order;
    }

}



