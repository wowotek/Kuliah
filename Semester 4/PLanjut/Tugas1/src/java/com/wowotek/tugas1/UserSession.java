package com.wowotek.tugas1;

public class UserSession {
    private final String Nama;
    private final String NIM;
    
    public UserSession(String nama, String nim){
        this.Nama = nama;
        this.NIM = nim;
    }
    
    public String getNama(){
        return this.Nama;
    }
    
    public String getNIM(){
        return this.NIM;
    }
}
