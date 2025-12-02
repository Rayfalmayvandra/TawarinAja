/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author rayfa
 */
public abstract class User {
    protected int id;
    protected String username;
    protected String email;
    protected String password;
    protected String role;

    public abstract String getPermissions();

    public void login() {
        // sementara kosong
    }

    public void logout() {
        // sementara kosong
    }

    public void updateProfil() {
        // sementara kosong
    }
}
