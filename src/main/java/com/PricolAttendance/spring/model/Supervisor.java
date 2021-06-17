package com.PricolAttendance.spring.model;


import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

public class Supervisor {
    private Time[] entryTimes = new Time[50];
    private Time[] exitTimes = new Time[50];
    private int enterLength = 0;
    private int exitLength = 0;
    private int nowAt =0 ;
    private Time sample;
    public Supervisor(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false", "root", "password");
            PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT inTime from Attendance.empdetails ORDER BY inTime");
            stmt.executeQuery();
            ResultSet rs = stmt.getResultSet();
            int i=0;
            entryTimes = new Time[50];
            while(rs.next()){
                entryTimes[i] =rs.getTime("inTime");;
                enterLength = enterLength + 1;
                System.out.println(entryTimes[i]);
                i++;
            }
            stmt = con.prepareStatement("SELECT DISTINCT outTime from Attendance.empdetails ORDER BY outTime");
            stmt.executeQuery();
            rs = stmt.getResultSet();
            i=0;
            while(rs.next()){
                exitTimes[i] = rs.getTime("outTime");
                exitLength = exitLength + 1;
                i++;
            }
            scheduler();
        }catch(Exception E){
            System.out.println("Supervisor/Constructor : " + E);
        }
    }


    public static Connection getConnection() {
        try{
            Connection con = AccessDatabase.getConnection();
            return con;}
        catch (Exception E){
            System.out.println("Supervisor/getConnection : " + E);
        }
        return null;
    }

    public void setMissedEntries(Time time) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false", "root", "banusanka");
            PreparedStatement stmt = con.prepareStatement("SELECT id from Attendance.empdetails where inTime = '" + time + "'");
            stmt.executeQuery();
            ResultSet rs = stmt.getResultSet();

            long millis = System.currentTimeMillis();                     //This block takes in current date and time from the OS.
            java.sql.Date today = new java.sql.Date(millis);

            String id = null;
            while(rs.next()){
                id = rs.getString("id");
                stmt = con.prepareStatement("SELECT * from empstatus where DayOf = '" + today.toString() + "' and id = '" + id+ "' ");
                stmt.executeQuery();
                ResultSet rs1 = stmt.getResultSet();
                if(rs1.next()){
                    System.out.println(id + " has entered ");
                }
                else{
                    String ssl = "INSERT INTO empstatus VALUES ('" + id + "', '" + today + "' , 'Missed', 'For being late' );";
                    Statement st = con.prepareStatement(ssl);
                    st.execute(ssl);
                    System.out.println(id + " missed for being late");
                }
            }
        } catch (Exception E) {
            System.out.println("EntrySupervisor/setMissedEntries : " + E);
        }
    }

    public void scheduler() throws ParseException {
        java.util.Timer _timer = new Timer();
        TimerTask tt;
        tt = new TimerTask() {
            @Override
            public void run() {
                foo();
            }
        };
        nowAt = 0;
        sample = Time.valueOf("14:47:00");
        while(true){
            long millis = System.currentTimeMillis();
            java.sql.Date date1 = new java.sql.Date(millis);
            DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date time = dateFormatter.parse(date1.toString() + " " + sample.toString());
            System.out.println();
            _timer.schedule(tt, time);
            int temp = nowAt + 1;
            while(nowAt != temp ){
                ;
            }
        }
    }
    public void foo(){
        System.out.println("foo " + sample);
        sample = Time.valueOf("14:48:00");
        nowAt = nowAt +1;
    }


    /**
    public void scheduler()
    {
        try{
            int[] finall = new int[enterLength];
            java.util.Timer _timer = new Timer();
            int i=0;
            TimerTask[] tt = new TimerTask[enterLength];
            for (i = 0; i < enterLength; i++) {
                nowAt = i;
                tt[i] = new TimerTask() {
                    @Override
                    public void run() {
                        foo(nowAt);
                    }
                };
                long millis = System.currentTimeMillis();
                java.sql.Date date1 = new java.sql.Date(millis);
                DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                java.util.Date date = dateFormatter.parse(date1.toString() + " " + entryTimes[i].toString());
                _timer.schedule(tt[i], date);
                System.out.println(date + " and " + date1 + " and " + entryTimes[i]);
            }
        }catch(Exception E){
            System.out.println("Supervisor/schedular : "+ E);
        }
    }
**/
}
