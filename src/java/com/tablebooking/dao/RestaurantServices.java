/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Restaurant;
import com.tablebooking.core.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Apu
 */
public class RestaurantServices {
    
    public int registerNewRestaurant(String restaurantName, 
            String location, String timings, double approxCost) throws SQLException {
        int i =0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO restaurant (restaurantName"
                    + " , location , timings, approxCost) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, restaurantName);
            ps.setString(2, location);
            ps.setString(3, timings);
            ps.setDouble(3, approxCost);
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
    
    public List showAllRestaurants() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Restaurant> restaurantList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM restaurant WHERE status=1;";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Restaurant restaurant = new Restaurant();
                restaurant.setRestaurantId(rs.getInt("restaurantId"));
                restaurant.setRestaurantName(rs.getString("restaurantName"));
                restaurant.setLocation(rs.getString("location"));
                restaurant.setTimings(rs.getString("timings"));
                restaurant.setApproxCost(rs.getDouble("approxCost"));
                restaurantList.add(restaurant);
            }
            return restaurantList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public Restaurant fetchRestaurantDetails(int restaurantId) throws SQLException, Exception {
        System.out.println("Services: "+restaurantId);
        ResultSet rs = null;
        Connection con = null;
        Restaurant restaurant = new Restaurant();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM restaurant WHERE restaurantId= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("restaurantId = " + restaurantId);
            ps.setInt(1, restaurantId);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            if (rs.next()) {

                restaurant.setRestaurantId(rs.getInt("restaurantId"));
                restaurant.setRestaurantName(rs.getString("restaurantName"));
                restaurant.setLocation(rs.getString("location"));
                restaurant.setTimings(rs.getString("timings"));
                restaurant.setApproxCost(rs.getDouble("approxCost"));

            }
            return restaurant;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateRestaurantDetails(int restaurantId, String restaurantName, 
            String location, String timings, double approxCost) throws SQLException, Exception {

        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE restaurant\n"
                    + "SET\n"
                    + "restaurantName = ?,\n"
                    + "location = ?,\n"
                    + "timings = ?,\n"
                    + "approxCost = ?\n"
                    + "WHERE restaurantId = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, restaurantName);
            ps.setString(2, location);
            ps.setString(3, timings);
            ps.setDouble(4, approxCost);
            ps.setInt(5, restaurantId);
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
    
    
    public int deleteRestaurant(int restaurantId) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE restaurant SET status = 0 WHERE restaurantId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
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
    
}
