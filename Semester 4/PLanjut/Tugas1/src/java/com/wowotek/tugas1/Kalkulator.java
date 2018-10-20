package com.wowotek.tugas1;

public class Kalkulator {
    private final float a;
    private final float b;
    
    public Kalkulator(float a, float b){
        this.a = a;
        this.b = b;
    }
    
    public Kalkulator(int a, int b){
        this.a = a;
        this.b = b;
    }
    
    public String kurang(){
        return Float.toString(this.a - this.b);
    }
    
    public String tambah(){
        return Float.toString(this.a + this.b);
    }
    
    public String kali(){
        return Float.toString(this.a * this.b);
    }
    
    public String bagi(){
        if(this.b == 0){
            return "Infinity";
        }
        return Float.toString(this.a / this.b);
    }
}
