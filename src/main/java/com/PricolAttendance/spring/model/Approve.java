package com.PricolAttendance.spring.model;

public class Approve {
    private String approved0;
    private String approved1;
    private String approved2;
    private String approved3;
    private String approved4;
    private String approved5;
    private String approved6;
    private int top=-1;
    public String[] approval = new String[15];

    public String getApproved3() {
        return approved3;
    }

    public String getApproved4() {
        return approved4;
    }

    public String getApproved5() {
        return approved5;
    }

    public String getApproved6() {
        return approved6;
    }

    public void setApproved3(String approved3) {
        this.approved3 = approved3;
        approval[3] = approved3;
    }

    public void setApproved4(String approved4) {
        this.approved4 = approved4;
        approval[4] = approved4;
    }

    public void setApproved5(String approved5) {
        this.approved5 = approved5;
        approval[5] = approved5;
    }

    public void setApproved6(String approved6) {
        this.approved6 = approved6;
        approval[6] = approved6;
    }

    public String getApproved0() {
        return approved0;
    }

    public String getApproved1(){
        return approved1;
    }

    public String getApproved2(){
        return approved2;
    }


    public void setApproved0(String app){
        approved0 = app;
        approval[0] = app;
    }

    public void setApproved1(String app){
        approved1 = app;
        approval[1] = app;
    }

    public void setApproved2(String app){
        approved2 = app;
        approval[2] = app;
    }

    public Approve(){
        approved0 = "0";
        approved1 = "0";
        approved2 = "0";
        approved3 = "0";
        approved4 = "0";
        approved5 = "0";
        approved6 = "0";
    }

}
