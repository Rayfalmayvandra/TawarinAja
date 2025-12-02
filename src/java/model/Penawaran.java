/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Penawaran {
    private static int counter = 1;
    private int id;
    private int barangId;
    private double amount;
    private String status;

    public Penawaran(int barangId, double amount) {
        this.id = counter++;
        this.barangId = barangId;
        this.amount = amount;
        this.status = "BELUM_MENANG";
    }

    public int getId() { return id; }
    public int getBarangId() { return barangId; }
    public double getAmount() { return amount; }
    public String getStatus() { return status; }
    public void setStatus(String s) { status = s; }

    public void setAlamat(String alamat) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setMetode(String metode) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}








