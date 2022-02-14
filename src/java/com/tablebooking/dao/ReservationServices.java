/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Reservations;
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
public class ReservationServices {

    public int makeReservation(int restaurantId, String restaurantName, String customerId, String customerName,
            String bookingDate, int bookedTable, int person, int orderId,
            String email, String phoneNumber) throws SQLException {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO reservation\n"
                    + "(restaurantId,\n"
                    + "restaurantName,\n"
                    + "customerId,\n"
                    + "customerName,\n"
                    + "bookingDate,\n"
                    + "bookedTable,\n"
                    + "person,\n"
                    + "orderId,\n"
                    + "email,\n"
                    + "phoneNumber)\n"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
            ps.setString(2, restaurantName);
            ps.setString(3, customerId);
            ps.setString(4, customerName);
            ps.setString(5, bookingDate);
            ps.setInt(6, bookedTable);
            ps.setInt(7, person);
            ps.setInt(8, orderId);
            ps.setString(9, email);
            ps.setString(10, phoneNumber);
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

    public List showAllReservations() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Reservations> reservationsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM reservation;";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Reservations reservation = new Reservations();
                reservation.setReservationId(rs.getInt("reservationId"));
                reservation.setRestaurantName(rs.getString("restaurantName"));
                reservation.setCustomerId(rs.getString("customerId"));
                reservation.setBookingDate(rs.getString("bookingDate"));
                reservation.setBookedTable(rs.getInt("bookedTable"));
                reservation.setOrderId(rs.getInt("orderId"));
                reservation.setEmail(rs.getString("email"));
                reservation.setCustomerName(rs.getString("customerName"));
                System.out.println("Customer Admin: "+rs.getString("customerName"));
                reservation.setOrderId(rs.getInt("orderId"));
                reservation.setPerson(rs.getInt("person"));
                reservation.setStatus(rs.getBoolean("status"));

                reservationsList.add(reservation);
            }
            return reservationsList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public List fetchReservationDetails(String customerId) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Reservations> reservationsList = new ArrayList<>();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM reservation WHERE customerId=? and status=1;";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("reservationId = " + customerId);
            ps.setString(1, customerId);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            while (rs.next()) {
                Reservations reservation = new Reservations();
                reservation.setRestaurantName(rs.getString("restaurantName"));
                reservation.setReservationId(rs.getInt("reservationId"));
                reservation.setBookingDate(rs.getString("bookingDate"));
                System.out.println("Date :" + rs.getString("bookingDate"));
                reservation.setBookedTable(rs.getInt("bookedTable"));
                reservation.setPerson(rs.getInt("person"));
                reservationsList.add(reservation);

            }
            return reservationsList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateReservationDetails(int reservationId, int restaurantId, int customerId,
            String dateTime, int bookedTable, int orderId) throws SQLException, Exception {

        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE reservation\n"
                    + "SET\n"
                    + "restaurantId = ?,\n"
                    + "customerId = ?,\n"
                    + "dateTime = ?,\n"
                    + "bookedTable = ?,\n"
                    + "orderId = ?\n"
                    + "WHERE reservationId = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
            ps.setInt(2, customerId);
            ps.setString(3, dateTime);
            ps.setInt(4, bookedTable);
            ps.setInt(5, orderId);
            ps.setInt(6, reservationId);
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

    public int cancelReservation(int reservationId) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE reservation SET status = 0 WHERE reservationId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, reservationId);
            i = ps.executeUpdate();
            System.out.println(ps);
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
