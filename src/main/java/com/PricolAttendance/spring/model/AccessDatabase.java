package com.PricolAttendance.spring.model;

//Class that handles the database.

import java.sql.*;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;

import java.time.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

public class AccessDatabase {
    public String[] reason = new String[50];
    public String[] status = new String[50];
    public int total;
    public java.sql.Date[] date = new java.sql.Date[50];
    public String[] day = new String[50];
    public String name;
    public int missed = 0;
    public int[] missedDays = new int[30];
    public int Onduty = 0;
    public int[] OndutyDays = new int[30];
    public int permission = 0;
    public int[] permissionDays = new int[30];
    public int cardNotPunched = 0;
    public int[] cardNotPunchedDays = new int[30];
    public long totaldates = 0;
    public int attended = 0;
    public int onRecord = 0;
    public String id;
    public String month = " ";
    public String year = " ";
    public String type;
    public Permissions[] per = new Permissions[40];
    public int perCount=0;

    public String getType() {
        return type;
    }

    public AccessDatabase(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false", "root", "banusanka");
            Statement stmt = con.createStatement();
            LocalDate today = LocalDate.now();
            int month = today.getMonthValue();
            if (today.getDayOfMonth() < 25) {
                month = (month - 1);
                if (month == 0) {
                    month = 12;
                }
            }
            int year = today.getYear();

            this.month = Integer.toString(month);
            this.year = Integer.toString(year);
            setStatusOfMonth(id, this.month, this.year);
        } catch (Exception e) {
            log("AccessDatabase/Constructor : " + e );
        }
    }
    //Class constructor. Tested verified.


    public int addEntryRecord(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = getConnection();

            long millis = System.currentTimeMillis();                     //This block takes in current date and time from the OS.
            java.sql.Date date = new java.sql.Date(millis);
            Date today = new Date();
            Date currentTime = new Time(today.getTime());

            PreparedStatement stmt = con.prepareStatement("SELECT id from Attendance.EntryTable WHERE EntryTable.id = '" + id + "' and EntryTable.DayOF = '" + date + "'");
            stmt.executeQuery();
            ResultSet rs = stmt.getResultSet();                      //This block checks if the record exists in the entry table.

            if (rs.next()) {
                PreparedStatement stmt1 = con.prepareStatement("SELECT id from Attendance.ExitTable WHERE exittable.id = '" + id + "' and exittable.DayOF = '" + date + "'");
                stmt1.executeQuery();
                ResultSet rs1 = stmt1.getResultSet();                //This block checks if the record is in exit table.

                if (rs1.next()) {
                    String ssl = "UPDATE ExitTable SET exittable.ExitTime = '" + currentTime + "' WHERE  id = '" + id + "' AND Dayof = '" + date + "';";
                    Statement st = con.prepareStatement(ssl);
                    st.execute(ssl);
                    System.out.println("Good job. Out time = " + currentTime);
                }                                 //If the record exists, it is updated

                else {
                    String ssl = "INSERT INTO exittable VALUES ('" + id + "', '" + date + "' , '" + currentTime + "' );";
                    Statement st = con.prepareStatement(ssl);
                    st.execute(ssl);
                }                                             //If it does not exist, it is inserted into the table


            }                                       //When the record does exit in EntryTable.

            else {

                String ssl = "INSERT INTO EntryTable VALUES ('" + id + "', '" + date + "' , '" + currentTime + "' );";
                Statement st = con.prepareStatement(ssl);
                st.execute(ssl);

                stmt = con.prepareStatement("SELECT * from Attendance.empstatus WHERE empstatus.id = '" + id + "' and empstatus.DayOf = '" + date + "'");
                stmt.executeQuery();
                ResultSet status = stmt.getResultSet();
                if (!status.next()) {
                    ssl = "INSERT INTO empstatus VALUES ('" + id + "','" + date + "','Entered',' ')";
                    st.execute(ssl);
                }

            }                                                                     //If the record isn't in  the entry table, then it is inserted
        } catch (Exception e) {
            log("AccessDatabase/addEntryRecord : ");
        }

        return 0;
    }
    //This function updates entry time, exit time and status to the database. This does not set the status directly. Invokes setstatus() function.


    public boolean login(User user) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false", "root", "banusanka");
            PreparedStatement sql = con.prepareStatement("SELECT * FROM attendance.login WHERE id = '" + user.getUserName() + "'");
            sql.executeQuery();
            this.id = user.getUserName();
            ResultSet Rs = sql.getResultSet();
            if (Rs.next()) {
                if (Rs.getString("pass").equals(user.getPassword())) {
                    long millis = System.currentTimeMillis();                     //This block takes in current date and time from the OS.
                    java.sql.Date date = new java.sql.Date(millis);
                    System.out.println("AccessDatabase/login : Login Successful");
                    if(Rs.getString("accType").equals("admin")){
                        this.type= "admin";
                        log("AccessDatabase/login : " + type);
                        setPendingPermissions();
                    }else{
                        this.type="user";
                        log("AccessDatabase/login : " + type);
                    }
                    return true;
                }
            }
            System.out.println("AccessDatabase/login : Login unsuccessful");
        } catch (Exception E) {
            System.out.println("AccessDatabase/login : " + E);
        }
        return false;
    }

    public boolean isAdmin(){
        if(this.type.equals("admin")){
            return true;
        }
        return false;
    }


    public void clear() {
        reason = new String[reason.length];
        status = new String[status.length];
        date = new java.sql.Date[date.length];
        permissionDays = new int[permission];
        cardNotPunchedDays = new int[cardNotPunched];
        missedDays = new int[missed];
        OndutyDays = new int[Onduty];
    }


    public static Connection getConnection() {
        try{
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false", "root", "banusanka");
        return con;}
          catch (Exception E){
                 System.out.println("AccessDatabase/getConnection : ");
        }
        return null;
    }

    public void setStatusOfMonth(String id, String month, String year) {
        //month is a string in number form.
        clear();
        try (Connection con = getConnection()) {
            this.month = month;
            String stringStartDate = year + "-" + month + "-" + "26";
            SimpleDateFormat simpleStartDate = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = simpleStartDate.parse(stringStartDate);
            java.sql.Date startDate = new java.sql.Date(date1.getTime());
            int month2 = Integer.parseInt(month);
            month2 += 1;
            if(month2==13){
                month2=1;
                int year2 = Integer.parseInt(year);
                year2+=1;
                year=Integer.toString(year2);
            }
            String strMonth2 = Integer.toString(month2);
            String stringEndDate = year + "-" + strMonth2 + "-" + "25";

            Date date2 = simpleStartDate.parse(stringEndDate);
            java.sql.Date endDate = new java.sql.Date(date2.getTime());
            PreparedStatement sql = con.prepareStatement("SELECT * FROM attendance.EmpStatus WHERE id = '" + id + "' and DayOf>='" + startDate + "' and MONTH(Dayof) = '" + month + "' ORDER BY DayOf asc ");
            sql.executeQuery();

            ResultSet Rs = sql.getResultSet();
            PreparedStatement sql2 = con.prepareStatement("SELECT * FROM attendance.EmpStatus WHERE id = '" + id + "' and DayOf<='" + endDate + "' and MONTH(DayOf) = '" + strMonth2 + "' ORDER BY DayOf asc");

            sql2.executeQuery();
            ResultSet Rs1 = sql2.getResultSet();
            setName(id);
            int i = 0;
            total = 1;
            TotalDays(month, year);
            DateFormat format1 = new SimpleDateFormat("EEEE");
            date[0]=startDate;
            status[0]= "Yet to attend";
            reason[0]="Yet to attend";
            totaldates =1 ;
            while(endDate.after(date[i])){
                i=i+1;
                Date st = new Date(date[i-1].getTime() + TimeUnit.DAYS.toMillis( 1 ));
                date[i]= new java.sql.Date(st.getTime());
                totaldates = totaldates + 1;
                total = total + 1;
                status[i] = "Yet to attend";
                reason[0] = "Yet to attend";
                if((format1.format(date[i]).equals("Sunday"))||(format1.format(date[i]).equals("Saturday"))) {
                    status[i] = "HOLIDAY";
                    totaldates = totaldates - 1;
                }
                day[i] = format1.format(date[i]);
            }
            cardNotPunchedDays = new int[7];
            java.sql.Date atDate;
            String ofStatus;
            String ofReason;

            missed = 0;
            missedDays = new int[30];
            Onduty = 0;
            OndutyDays = new int[30];
            permission = 0;
            permissionDays = new int[3];
            cardNotPunched = 0;
            cardNotPunchedDays = new int[30];
            totaldates = 0;
            attended = 0;

            while (Rs.next()) {
                ofStatus = Rs.getString(3);
                atDate = Rs.getDate("DayOf");
                ofReason = Rs.getString("Reason");
                i=getDate(atDate);
                status[i] = ofStatus;
                reason[i] = ofReason;
                if (ofStatus.equals("Card Not Punched")) {
                    log("okay "+cardNotPunchedDays.length);
                    cardNotPunchedDays[cardNotPunched]=i;
                    cardNotPunched += 1;
                }
                if (ofStatus.split(" ")[0].equals("Permission")) {
                    permissionDays[permission]=i;
                    permission += 1;
                    log("A permission");
                }
                if (ofStatus.equals("Granted Leave")) {
                    missedDays[missed]=i;
                    missed += 1;
                }
                if (ofStatus.equals("Granted OD")) {
                    OndutyDays[Onduty]=i;
                    Onduty += 1;
                }
                if (ofStatus.equals("Attended")) {
                    attended += 1;
                }
            }
            while (Rs1.next()) {
                ofStatus = Rs1.getString(3);
                atDate = Rs1.getDate("DayOf");
                ofReason = Rs1.getString("Reason");
                i=getDate(atDate);
                status[i] = ofStatus;
                reason[i] = ofReason;
                if(status[i].equals("HOLIDAY")){
                    continue;
                }
                if (ofStatus.equals("Card Not Punched")) {
                    cardNotPunchedDays[cardNotPunched]=i;
                    cardNotPunched += 1;
                }

                if (ofStatus.split(" ")[0].equals("Permission")) {
                    permissionDays[permission]=i;
                    permission += 1;
                }

                if (ofStatus.equals("Missed")) {
                    missedDays[missed]=i;
                    missed += 1;
                }

                if (ofStatus.equals("On Duty")) {
                    OndutyDays[Onduty]=i;
                    Onduty += 1;
                }
                if (ofStatus.equals("Attended")) {
                    attended += 1;
                }
            }

        } catch (Exception E) {
            log("AccessDatabase/setStatusOfMonth: " + E);
        }
    }

    public void UpdateStatus(String id, Date date) {
        try {
            Boolean permission = false;
            DateTimeFormatter format = DateTimeFormatter.ofPattern("HH:mm:ss");
            Connection con = getConnection();

            PreparedStatement stmt = con.prepareStatement("SELECT * from Attendance.exittable WHERE exittable.id = '" + id + "' and exittable.DayOf = '" + date + "'");
            stmt.executeQuery();
            ResultSet exit = stmt.getResultSet();

            PreparedStatement stmt1 = con.prepareStatement("SELECT * from Attendance.entrytable WHERE entrytable.id = '" + id + "' and entrytable.DayOf = '" + date + "'");
            stmt1.executeQuery();
            ResultSet entered = stmt1.getResultSet();
            entered.next();

            stmt1 = con.prepareStatement("SELECT * from Attendance.empstatus WHERE empstatus.id = '" + id + "' and empstatus.DayOf = '" + date + "'");
            stmt1.executeQuery();
            ResultSet status = stmt1.getResultSet();


            PreparedStatement stmt2 = con.prepareStatement("SELECT * from Attendance.empDetails WHERE empDetails.id = '" + id + "' ");
            stmt2.executeQuery();
            ResultSet details = stmt2.getResultSet();
            details.next();

            LocalTime entryTime = entered.getTime(3).toLocalTime();
            LocalTime expEntryTime = details.getTime(3).toLocalTime();
            LocalTime expExitTime = details.getTime(4).toLocalTime();

            if (status.next()) {
                String[] statusState = status.getString(3).split("\\s");
                if (statusState[0].equals("On") || statusState[0].equals("Permission")) {
                    permission = true;                        //On duty from  ....
                    String des = status.getString(4);  //Permission given from ...
                    String from = status.getString(4).split(" ")[3];
                    String to = status.getString(4).split(" ")[5];
                    LocalTime fromtime = LocalTime.parse(from, format);
                    LocalTime totime = LocalTime.parse(to, format);
                    if (expEntryTime.getMinute() == fromtime.getMinute() && expEntryTime.getHour() == fromtime.getHour()) {
                        expEntryTime = totime;
                    }
                    if (expExitTime.getMinute() == totime.getMinute() && expEntryTime.getHour() == totime.getHour()) {
                        expExitTime = fromtime;
                    }
                    exit.beforeFirst();
                    if (exit.next()) {
                        LocalTime exitTime = exit.getTime(3).toLocalTime();
                        if (exitTime.toString().equals(to)) {
                            exitTime = LocalTime.parse(from, format);
                        }
                    }
                }
                exit.beforeFirst();
            }    //To consider pre-established Permission and on duty status.

            exit.beforeFirst();
            long elapsedMinutes = Duration.between(expEntryTime, entryTime).toMinutes();

            if (elapsedMinutes > 10) {
                String des = "Missed for being late. Arrived at " + entryTime + ".";

                stmt2 = con.prepareStatement("UPDATE Attendance.empStatus SET EmpStatus.EmpStatus= 'Missed'" +
                        " and EmpStatus.Reason = '" + des + "' " +
                        " Where id = '" + id + "' and dayOf = '" + date + "' ");
                stmt2.execute();
                System.out.println("You missed for being late");
            } else {
                if (!exit.next()) {
                    if (!permission) {
                        exit.beforeFirst();
                        stmt2 = con.prepareStatement("UPDATE Attendance.empStatus SET EmpStatus = ' Entered And Working ' and Reason = 'You are on time. Entered and working' Where id = '" + id + "' and dayOf = '" + date + "'; ");
                        System.out.println("You are on time. Entered and working");
                        stmt2.execute();
                    }
                } else {
                    LocalTime exitTime = exit.getTime(3).toLocalTime();
                    Duration exitHowLate = Duration.between(expExitTime, exitTime);
                    Long exitHowLateMins = exitHowLate.toMinutes();
                    if (exitHowLateMins > 0) {
                        if (!permission) {
                            System.out.println("You have attended");
                            stmt2 = con.prepareStatement("UPDATE Attendance.empStatus SET EmpStatus = ' Attended ' Where id = '" + id + "' and dayOf = '" + date + "'; ");
                            stmt2.execute();
                        }
                    } else {
                        System.out.println("You missed. Try again by the end of your shift");
                        stmt2 = con.prepareStatement("UPDATE Attendance.empStatus SET EmpStatus = ' Missed For Leaving early.' Where id = '" + id + "' and dayOf = '" + date + "'; ");
                        stmt2.execute();
                    }
                }
            }                                        //As of now, it only enters. Doesnt check.Two finish
        } catch (Exception e) {
          log("AccessDatabase/updateStatus: " + e);
        }
    }      //This function sets the status in the status table. Tested verified


    public void setName(String id) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT attendance.empdetails.EmpName from empdetails where id = '" + id + "'; ");
            ps.executeQuery();
            ResultSet rs = ps.getResultSet();
            rs.next();
            name = rs.getString(1);

        } catch (Exception e) {
            log("AccessDatabase/setName: " + e);
        }
    }


    public void applyPermissions(Permissions per){
        try(Connection con = getConnection()){
            per.identifyPermission();
            log("435");
            String ssl = "INSERT INTO permissionspending VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(ssl);
            pstmt.setString(1, id);
            if(per.getToDateLeave()!=null){
            if(per.getToDateLeave().toString().equals("2000-01-01")){
                per.setToDateLeave(null);
            }}
            if(per.getToDateOD()!=null){
            if(per.getToDateOD().toString().equals("2000-01-01")){
                per.setToDateOD(null);
            }}
            if (per.getFromTime() == null){
                pstmt.setNull(2,Types.NULL );
            }else{
                pstmt.setTime(2,per.getFromTime());
            }
            if (per.getToTime() == null){
                pstmt.setNull(3,Types.NULL );
            }else{
                pstmt.setTime(3,per.getToTime());
            }
            if (per.getFromDateOD() == null){
                pstmt.setNull(4,Types.NULL );
            }else{
                pstmt.setDate(4,per.getFromDateOD());
            }
            if (per.getToDateOD() == null){
                pstmt.setNull(5,Types.NULL );
            }else{
                pstmt.setDate(5,per.getToDateOD());
            }
            if (per.getFromDateLeave() == null){
                pstmt.setNull(6,Types.NULL );
            }else{
                pstmt.setDate(6,per.getFromDateLeave());
            }
            if (per.getToDateLeave() == null){
                pstmt.setNull(7,Types.NULL );
            }else{
                pstmt.setDate(7,per.getToDateLeave());
            }
            if (per.getOnDate() == null){
                pstmt.setNull(8,Types.NULL );
            }else{
                pstmt.setDate(8,per.getOnDate());
            }
            if (per.getCardDate() == null){
                pstmt.setNull(9,Types.NULL );
            }else{
                pstmt.setDate(9,per.getCardDate());
            }
            if (per.getReason() == null){
                pstmt.setNull(10,Types.NULL );
            }else{
                pstmt.setString(10,per.getReason());
            }
            System.out.println(pstmt);
            pstmt.execute();

        }catch(Exception e){
            log("AccessDatabase/applypermissions : " + e);
        }
    }

    public String getName() {
        return name;
    }

    public void TotalDays(String month, String year) {
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateBeforeString = year + "-" + month + "-" + "21";
        int mon = Integer.parseInt(month);
        mon = mon + 1;
        if (mon == 13) {
            int incYear = Integer.parseInt(year);
            incYear += 1;
            year = Integer.toString(incYear);
            mon = 1;
        }
        month = Integer.toString(mon);
        String dateAfterString = year + "-" + month + "-" + "21";
        try {
            Date dateBefore = myFormat.parse(dateBeforeString);
            Date dateAfter = myFormat.parse(dateAfterString);
            long difference = dateAfter.getTime() - dateBefore.getTime();
            totaldates = (difference / (1000 * 60 * 60 * 24));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getOD() {
        return Onduty;
    }

    public int getMissed() {
        return missed;
    }

    public int getPermission() {
        return permission;
    }

    public int getCardNotPunched() {
        return cardNotPunched;
    }

    public long getTotalDays() {
        return totaldates;
    }

    public int getAttended() {
        return attended;
    }

    public int getDate(java.sql.Date date){
        int i=0;
        for(i=0;i<total;i++){
            if(this.date[i].toString().equals(date.toString())){
                return i;
            }
        }
        return -1;
    }

    public void setPendingPermissions() {
        try  {
            Connection con = getConnection();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM attendance.permissionspending");
            sql.executeQuery();
            ResultSet rs = sql.getResultSet();
            int i = 0;
            perCount = 0;
            while (rs.next()) {
                per[i] = new Permissions();
                String reason = rs.getString("reason");
                per[i].setFromTime(rs.getTime("fromTime"));
                per[i].setToTime(rs.getTime("toTime"));
                per[i].setFromDateLeave(rs.getDate("fromDateLeave"));
                per[i].setId(rs.getString("id"));
                per[i].setToDateLeave(rs.getDate("toDateLeave"));
                per[i].setFromDateOD(rs.getDate("fromDateOD"));
                per[i].setToDateOD(rs.getDate("toDateOD"));
                per[i].setCardDate(rs.getDate("cardDate"));
                per[i].setOnDate(rs.getDate("onDate"));
                per[i].setReason(reason);
                per[i].identifyPermission();
                i=i+1;
                perCount=perCount+1;
                if(perCount == 10){
                    break;
                }
            }
            log("AccessDatabase/setPendingPermission : Pending permission set.");
        } catch (Exception E) {
            log("AccessDatabase/setPendingPermission : " + E);
        }
    }

    public void log(String S){
        System.out.println(S);
    }


    public void approvePermissions(Approve app) {
        Connection con = getConnection();
        try {
            int limit = 7;
            if(perCount<7){
               limit = perCount;
            }
            int i=0,j=0;
            for (i = 0; i < limit; i++) {
                if (app.approval[i].equals("reject")) {
                    log(per[i].getdeletePermission());
                    PreparedStatement ptst = con.prepareStatement(per[i].getdeletePermission());
                    ptst.execute();
                    log("ApprovePErmissions / 613 : Done");
                }
                if (app.approval[i].equals("accept")) {
                    PreparedStatement ptst = con.prepareStatement(per[i].approveCommand[0]);
                    ptst.execute();
                    ResultSet rs = ptst.getResultSet();
                    if(rs.next()){
                        ptst = con.prepareStatement(per[i].approveCommand[2]);
                        log("624 " + ptst.toString());
                        ptst.execute();
                        ptst = con.prepareStatement(per[i].approveCommand[1]);
                        ptst.execute();
                        log("628 " + ptst.toString());
                    }else{
                        ptst = con.prepareStatement(per[i].approveCommand[1]);
                        log("628 " + ptst.toString());
                        ptst.execute();
                    }
                    ptst = con.prepareStatement(per[i].getdeletePermission());
                    ptst.execute();
                    log("Statement (633) " +  ptst.toString());
                }
            }
            per = new Permissions[per.length];
            setPendingPermissions();
        } catch (Exception E){
            log("AccessDatabase/approvePermissions : " + E ) ;
        }
    }
}








