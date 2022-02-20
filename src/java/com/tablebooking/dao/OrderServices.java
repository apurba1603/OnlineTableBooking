/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Menu;
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

    public int registerOrder(int restaurantId, String customerId) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO orders (restaurantId,customerId) VALUES (?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
            ps.setString(2, customerId);

            System.out.println("SQL for insert=" + ps);
            i = ps.executeUpdate();

            sql = "SELECT MAX(orderId) as orderId from orders where customerId=?;";
            ps = con.prepareStatement(sql);
            ps.setString(1, customerId);
            ResultSet rs = null;
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt("orderId");
            }

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

    public int orderItems(int orderId, ArrayList cart) throws SQLException, Exception {
        int j = 0;
        int i=0;
        Connection con = null;
        System.out.println("orderItems");
        try {
            while (i < cart.size()) {
                Menu product = (Menu) cart.get(i);
                con = ConnectionManager.getConnection();
                String sql = "INSERT INTO itemsordered\n"
                        + "VALUES(?,?,?,?,?);";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.setInt(2, product.getProductId());
                ps.setString(3, product.getFoodItems());
                ps.setInt(4, product.getQuantity());
                ps.setDouble(5, product.getItemTotal());
                System.out.println("orderItems: " + ps);
                j=ps.executeUpdate();
                
                i++;

            }
            return j;
        } catch (Exception e) {
            e.printStackTrace();
            return j;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public List showOrders(int reservationId) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        System.out.println("showOrders:@94 "+reservationId);
        List<Menu> orderList = new ArrayList<>();
        try {
            String sql = "SELECT foodItems from itemsordered WHERE orderId=( SELECT orderId FROM reservation WHERE reservationId=?)";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, reservationId);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("showOrders: "+ps);

                Menu order = new Menu();
                order.setFoodItems(rs.getString("foodItems"));

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
                order.setCustomerId(rs.getString("customerId"));
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
                order.setCustomerId(rs.getString("customerId"));
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
