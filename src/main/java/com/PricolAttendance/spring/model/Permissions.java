package com.PricolAttendance.spring.model;

import java.sql.Date;
import java.sql.Time;
import java.util.concurrent.TimeUnit;

public class Permissions {
    public String from;
    public String to;
    public String id;
    private Time fromTime;
    private Date fromDateLeave;
    private Date fromDateOD;
    private Time toTime;
    private Date toDateLeave;
    private Date toDateOD;
    private String reason;
    private Date cardDate;
    private Date onDate;
    public String type;
    private String status;//permission
    public String deletePermission;
    private String requested;
    private String approved;
    private String command;
    public String[] approveCommand = new String[3];
    public String rough=null;

    public void setFrom(String from) {
        this.from = from;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getRough() {
        return rough;
    }

    public void setRough(String rough) {
        this.rough = rough;
    }

    public String getStatus() {
        return status;
    }

    public Date getFromDateLeave() {
        return fromDateLeave;
    }

    public Date getFromDateOD() {
        return fromDateOD;
    }

    public Date getToDateLeave() {
        return toDateLeave;
    }

    public Date getToDateOD() {
        return toDateOD;
    }

    public void setFromDateLeave(Date fromDateLeave) {
        this.fromDateLeave = fromDateLeave;
    }

    public void setFromDateOD(Date fromDateOD) {
        this.fromDateOD = fromDateOD;

    }

    public void setToDateLeave(Date toDateLeave) {
        String st = "2020-01-01";
        Date date = Date.valueOf(st);
        if(toDateLeave==null){
            this.toDateLeave = null;
            return;
        }
        else if (toDateLeave.equals(date)){
            this.toDateLeave = null;
        }
        else{
            this.toDateLeave = toDateLeave;
        }
    }

    public void setToDateOD(Date toDateOD) {
        String st = "2020-01-01";
        Date date = Date.valueOf(st);
        if(toDateOD==null){
            this.toDateOD = null;
            return;
        }
        else if (toDateOD.equals(date)){
            this.toDateOD = null;
        }
        else{
            this.toDateOD = toDateOD;
        }
    }

    public Date getOnDate() {
        return onDate;
    }

    public void setOnDate(Date onDate) {
        this.onDate = onDate;
    }

    public String getCommand() {
        return command;
    }

    public String getRequested() {
        return requested;
    }



    public Date getCardDate() {
        return cardDate;
    }

    public void setCardDate(Date cardDate) {
        this.cardDate = cardDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void identifyPermission(){
        if(to!=null){
            to=to+":00";
            toTime = Time.valueOf(to);
        }
        if(from!=null){
            from=from+":00";
            fromTime = Time.valueOf(from);
        }
        if(toDateLeave != null){
            String st = "2000-01-01";
            String date = toDateLeave.toString();
            if(date.equals(st)){
                toDateLeave = null;
            }
        }
        if(toDateOD != null){
            String st = "2000-01-01";
            String date = toDateOD.toString();
            if(date.equals(st)){
                toDateOD = null;
            }
        }
        if (getCardDate() != null){
            approved = "Card Not Punched";
            requested = "Please approve card not punched on " +cardDate;
            System.out.println("ugvui" + reason);
            approveCommand[0] = "select * from Attendance.empStatus where id = '" + id + "' and dayOf = '" + cardDate + "'";
            approveCommand[1] = "insert into Attendance.empStatus values ('" + id + "','" + cardDate + "','"+ approved +"','" + reason + "');";
            approveCommand[2] = "delete from empStatus where id = \"" + id + "\" and dayOf = \"" + cardDate + "\";";
            deletePermission = "delete from permissionsPending where id = '" + id + "' and cardDate = '" + cardDate +"'; ";
            return;
        }

        else if (getFromDateLeave() != null){
            if(getToDateLeave() != null){
                approved = "Missed";
                requested =  "Leave be granted from " + fromDateLeave + " to " + toDateLeave;
                approveCommand[0] = "select * from Attendance.empStatus where id = '" + id + "' and dayOf >= '"+ fromDateLeave +"' and dayOf <= '" + toDateLeave + "';";
                approveCommand[1] = "insert into empStatus values ('" + id +"' ,'" + fromDateLeave + "','" + approved + "','" + reason + "')";
                Date date = fromDateLeave;
                while(toDateLeave.after(date)){
                    java.util.Date st = new java.util.Date(date.getTime() + TimeUnit.DAYS.toMillis( 1 ));
                    date= new java.sql.Date(st.getTime());
                    approveCommand[1] = approveCommand[1] + ",('" + id +"' ,'" + date + "','" + approved + "','" + reason + "')";
                }
                approveCommand[1] = approveCommand[1] + ";";
                approveCommand[2] = "delete from Attendance.empStatus where id = '" + id + "' and dayOf >= \""+ fromDateLeave +"\" and dayOf <= '" + toDateLeave + "';";
                deletePermission = "delete from permissionsPending where id = '" + id + "' and fromDateLeave = '" + fromDateLeave + "' and toDateLeave = '"+toDateLeave+"' ;";
                return;
            }
            approved = "Missed";
            requested =  "Leave be granted on " + fromDateLeave;
            deletePermission = "delete from permissionsPending where id = \"" + id + "\" and fromDateLeave = \"" + fromDateLeave + "\"; ";
            approveCommand[0] = "select * from Attendance.empStatus where id = '" + id + "' and dayOf = '" + fromDateLeave + "'";
            approveCommand[1] = "Insert into Attendance.empStatus values ( '" + id + "', '" + fromDateLeave + "' , '" + approved + "' , '" + reason + "' ) ; ";
            approveCommand[2] = "delete from empStatus where id = \"" + id + "\" and dayOf = \"" + fromDateLeave + "\";";
            deletePermission = "delete from permissionsPending where id = \"" + id + "\" and fromDateLeave = \"" + fromDateLeave + "\"; ";
            return;
        }

        else if (getFromDateOD() != null){
            if(getToDateOD() != null){
                approved = "On Duty";
                requested = "OD granted from " + fromDateOD + " to " + toDateOD;
                approveCommand[0] = "select * from Attendance.empStatus where id = '" + id + "' and dayOf >= '"+ fromDateOD +"' and dayOf <= '" + toDateOD + "';";
                approveCommand[1] = "insert into empStatus values ('" + id +"' ,'" + fromDateOD + "','" + approved + "','" + reason + "')";
                Date date = fromDateOD;
                while(toDateLeave.after(date)){
                    java.util.Date st = new java.util.Date(date.getTime() + TimeUnit.DAYS.toMillis( 1 ));
                    date= new java.sql.Date(st.getTime());
                    approveCommand[1] = approveCommand[1] + ",('" + id +"' ,'" + date + "','" + approved + "','" + reason + "')";
                }
                approveCommand[1] = approveCommand[1] + ";";
                approveCommand[2] = "delete from Attendance.empStatus where id = '" + id + "' and dayOf >= \""+ fromDateOD +"\" and dayOf <= '" + toDateOD + "';";
                deletePermission = "delete from permissionsPending where id = '" + id + "' and fromDateLeave = '" + fromDateOD + "' and toDateLeave = '" + toDateOD + "' ;";
                return;
            }
            requested = "OD requested on " + fromDateOD;
            approved = "On Duty";
            deletePermission = "delete from permissionsPending where id = \"" + id + "\" and fromDateOD = \"" + fromDateOD + "\";";
            approveCommand[0] = "select * from Attendance.empStatus where id = '" + id + "'and dayOf = '" + fromDateOD + "'; ";
            approveCommand[1] = "Insert into Attendance.empStatus values ( '" + id + "', '" + fromDateOD + "' , '" + approved + "' , '" + reason + "' ) ; ";
            approveCommand[2] = "delete from empStatus where id = \"" + id + "\" and dayOf = \"" + fromDateOD + "\";";
            return;
        }
        else {
            requested = "Permission be given from " + fromTime + " to " + toTime +  " on " + onDate;
            approved = "Permission";
            deletePermission = "delete from permissionsPending where id = '" + id + "' and onDate = '" + onDate + "';";
            approveCommand[0] = "select * from Attendance.empStatus where id = '" + id + "'and dayOf = '" + onDate + "'; ";
            approveCommand[1] = "Insert into Attendance.empStatus values ( '" + id + "', '" + onDate + "' , '" + approved + "' , '" + reason + "' ) ; ";
            approveCommand[2] =  "delete from permissionsPending where id = \"" + id + "\" and fromDateOD = \"" + onDate + "\";";
            return;
        }
    }

    public Time getFromTime() {
        return fromTime;
    }

    public Time getToTime() {
        return toTime;
    }


    public void setFromTime(Time from) {
        this.fromTime = from;
    }

    public void setToTime(Time to) {
        this.toTime = to;
    }

    public Permissions(){
        id = null;
        fromTime = null;
        fromDateLeave = null;
        fromDateOD = null;
        toTime = null;
        toDateLeave = null;
        toDateOD = null;
        reason = "HAS NOT BEEN SPECIFIED";
        cardDate = null;
        onDate = null;
        type = null;
        command = null;
    }


    public String getdeletePermission() {
        return deletePermission;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }
}

