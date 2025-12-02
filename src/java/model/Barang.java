/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Barang {
    private int id;
    private String title;
    private String description;
    private double initialPrice;
    private long endTime;

    public Barang(int id, String title, String description, double initialPrice, long endTime) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.initialPrice = initialPrice;
        this.endTime = endTime;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public double getInitialPrice() { return initialPrice; }
    public long getEndTime() { return endTime; }
}










