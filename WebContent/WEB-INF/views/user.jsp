<%@ page import="com.PricolAttendance.spring.model.AccessDatabase" %>
<%@ page import="java.time.Month" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.Year" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 17-01-2020
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<STYLE>
    .header {
        width: 100%;
        position: fixed;
        top: 0;
        bottom: auto;
        padding: 60px;
        text-align: center;
        background: #1abc9c;
        color: white;
        font-size: 20px;
    }
    .outer {
        position: relative;
        height: 1600px;
    }
    body  {
        background: url("//WEB-INF//Images//Image//tests.jpg") no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
    .tableOne {
        margin:auto;
        width:400px;
    }

    #wrapper {
        background:#CFC;
        float:left;
    }

    input[type=text], input[type=password] {
        width: 30%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    /* Set a style for all buttons */
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 10%;
    }

    button:hover {
        opacity: 0.8;
    }

    /* Extra styles for the cancel button */
    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }

    /* Center the image and position the close button */
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        position: relative;
    }

    img.avatar {
        width: 20%;
        border-radius: 10%;
    }

    .container {
        padding: 16px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }

    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        padding-top: 60px;
        text-align : center;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 25px;
        top: 0;
        color: #000;
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: red;
        cursor: pointer;
    }

    /* Add Zoom Animation */
    .animate {
        -webkit-animation: animatezoom 0.6s;
        animation: animatezoom 0.6s
    }

    @-webkit-keyframes animatezoom {
        from {-webkit-transform: scale(0)}
        to {-webkit-transform: scale(1)}
    }

    @keyframes animatezoom {
        from {transform: scale(0)}
        to {transform: scale(1)}
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }

    .overflow-container{max-height: 100px; overflow:auto;}

    .hoverStyle {
        cursor: pointer;
    }


</STYLE>















<style>
    div.relative {
        position: relative;
        width: 400px;
        height: 200px;
        border: 3px solid #73AD21;
    }
</style>













<!-- Style for submit button   -->
<style>
    .enjoy-css {
        -webkit-box-sizing: content-box;
        -moz-box-sizing: content-box;
        box-sizing: content-box;
        width: 250px;
        height: 70px;
        cursor: pointer;
        margin: 0 auto;
        border: 2px solid rgb(30,205,151);
        -webkit-border-radius: 40px;
        border-radius: 40px;
        font: normal 37px/70px "Advent Pro", Helvetica, sans-serif;
        color: rgb(30, 205, 151);
        text-align: center;
        -o-text-overflow: clip;
        text-overflow: clip;
        letter-spacing: 1px;
        background: rgba(0,0,0,0);
        -webkit-transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
        -moz-transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
        -o-transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
        transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
    }

    .enjoy-css:hover {
        color: rgba(255,255,255,1);
        background: rgb(30, 205, 151);
    }

    .enjoy-css:active {
        border: 2px solid rgba(33,224,163,1);
        background: rgba(33,224,163,1);
        -webkit-transition: none;
        -moz-transition: none;
        -o-transition: none;
        transition: none;
    }

</style>
<!-- submit button -->
























<script>
    function perLeave (){
        var toDateLeave = document.getElementById("toDateLeave");
        if(toDateLeave.value == ""){
            toDateLeave.value = "2000-01-01";
            alert(document.getElementById("toDateLeave"));
        }
    }
</script>

<script>
    function perPermission (){
        var to = document.getElementById("to");
        var from = document.getElementById("from");
        var onDate = document.getElementById("onDate")
        if(onDate == ""){
            onDate = "2000-01-01";
        }

        var rough = fromTime.value + " : " + toTime.value;
        alert(rough);
    }
</script>

<script>
    function perOD (){
        var toDate = document.getElementById("toDateOD");
        alert(toDate.value);
        if(toDate.value === ""){
            toDate.value = "2000-01-01";
            alert(toDate.value);}
    }
</script>



<!-- id script -->
<script>
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>

<script>
    // Get the modal
    var modal = document.getElementById('requestPermission');

    // When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>

<script>
    // Get the modal
    var modal = document.getElementById('requestLeave');

    // When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>


<script>
    // Get the modal
    var modal = document.getElementById('logout');

    // When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>

<script>
    // Get the modal
    var modal = document.getElementById('requestOnDuty');

    // When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>

<script>
    // Get the modal
    var modal = document.getElementById('permissions');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>
<script>

    var modal = document.getElementById('setPermissions');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    };

    $(function() {
        $('#closemodal').click(function() {
            $('#modalwindow').modal('hide');
        });
    });

</script>

<script>

    var modal = document.getElementById('ApprovePermissions');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>

<script>

    var modal = document.getElementById('Missed');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>
<script>

    var modal = document.getElementById('Card');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>
<script>

    var modal = document.getElementById('OnDuty');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }
</script>

<script>
    // Get the modal
    var modal = document.getElementById('reason');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>

<script>
    // Get the modal
    var modal = document.getElementById('permission');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>



<head>
    <title> Attendance record </title>
</head>


<div class="outer">
    <body background="${pageContext.request.contextPath}/WebContent/Resources/">

    <div class="header">

        <table class="tableOne" border=0 style="margin-right:150px" align = left>
            <%  AccessDatabase db = (AccessDatabase)request.getAttribute("database");
                long millis = System.currentTimeMillis();                     //This block takes in current date and time from the OS.

                Month mon1 = Month.of(Integer.parseInt(db.month));
                Month mon2 = Month.of((Integer.parseInt(db.month)+1)%12);

                out.println(" <b>\n" +
                        "                <tr>\n" +
                        "                    <td style = 'text-align:left' height='20' width='60%'><font style='color: black'>        </font></td>\n" +
                        "                    <td style = 'text-align:right' height='30' width='40%'>    </td>\n" +
                        "                </tr>\n" +
                        "\n" +
                        "                <tr>\n" +
                        "                    <td style = 'text-align:center' height='20'><font style='color: black'> " + mon1 +" - "+ mon2 + "</font></td>\n" +
                        "                    <td style = 'text-align:center' height='20'>   </td>\n" +
                        "                </tr>\n" +
                        "\n" +
                        "                <tr>\n" +
                        "                    <td style = 'text-align:center' height='20'><font style='color: black'> " + db.id + " </font></td>\n" +
                        "                    <td style = 'text-align:center' height='20'> <font style='color: green'>      </font> </td>\n" +
                        "                </tr>\n" +
                        "\n" +
                        "                <tr>\n" +
                        "                    <td style = 'text-align:center' height='20'><font style='color: black'> "+ db.getName()  +"  </font></td>\n" +
                        "                    <td style = 'text-align:center' height='20'>   </td>\n" +
                        "                </tr>\n" +
                        "\n" +
                        "                <tr>\n" +
                        "                    <td style = 'text-align:center' height='20'><font style='color: black'>  </font></td>\n" +
                        "                    <td style = 'text-align:center' height='20'> </td>\n" +
                        "                </tr>\n" +
                        "\n" +
                        "                <tr>\n" +
                        "                    <td style = 'text-align:center' height='20'><font style='color: black'>  </font></td>\n" +
                        "                    <td style = 'text-align:center' height='20'>  </td>\n" +
                        "                </tr>\n" +
                        "            </b>  ");


            %>
        </table>


        <%
            long days=db.getTotalDays();
            out.println("     <div width='50%' align='right'>\n" +
                    "\n" +
                    "\n" +
                    "        <table class='tableOne' border=1 style='margin-right:150px'>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'> <font style='color: black'> Total Number Of Days </font></td>\n" +
                    "                <td style = 'text-align:right' height='30' width='40%'>" + days + " </font> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Days attended </font></td>\n" +
                    "                <td style = 'text-align:right' height='20' > \n" + db.getAttended()  + "</font> </td>\n"+
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> On Duty </font></td>\n" +
                    "                <td style = 'text-align:right' height='20'> <font style='color: green'>  <div onclick= document.getElementById('OnDuty').style.display='block' style= 'width:auto'; -webkit-box-align:'center' > " + db.getOD() + " </div> </font> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Days Missed </font></td>\n" +
                    "                <td style = 'text-align:right' height='20'> <font style='color: red'> <div onclick= document.getElementById('Missed').style.display='block' style= 'width:auto'; -webkit-box-align:'center' >" +db.getMissed()+ " </div> </font> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Card Unpunched </font></td>\n" +
                    "                <td style = 'text-align:right' height='20'> <div onclick= document.getElementById('Card').style.display='block' style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown'>"+db.cardNotPunched +"</font></div> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Permission </font></td>\n" +
                    "                <td style = 'text-align:right' height='20'> <div onclick= document.getElementById('Permissions').style.display='block' style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown'>"+db.getPermission() +"</font></div> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "        </table>\n" +
                    "        </table>\n" +
                    "    </div>       ");

        %>
    </div>

    <body class="body">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%
    if(!db.isAdmin()){
        out.println("<button onclick=\"document.getElementById('setPermissions').style.display='block'\" style=\"width:auto; -webkit-box-align: center \">  Apply Permissions  </button><br>");
    }
 %>
    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto; -webkit-box-align: center ">  Check Month  </button>
    <br>

        <%
        if(db.isAdmin()){
            out.println("<button onclick=\"document.getElementById('ApprovePermissions').style.display='block'\" style=\"width:auto; -webkit-box-align: center \">  per  </button>\n");
        }
    %>

    <button onclick="document.getElementById('logout').style.display='block'" style="width:auto; -webkit-box-align: center ">  Log out  </button>



    <div id="output"></div>
        <%  try{

        int i,n=db.total;

        out.println("         <table border = \"1\" align=\"center\" width='600'>\n" +
                "         <tr>\n" +
                "            <th> Day </th>\n" +
                "            <th> Status </th>  \n" +
                "         </tr>");
        String highlight = " ";
        for(i=0;i<n;i++){
            String colour="Blue";
            if(db.status[i].equals("Missed")){
                colour="red";
            }

            if(db.status[i].equals("Card Not Punched")){
                colour="brown";
            }

            if(db.status[i].equals("On Duty")){
                colour="green";
            }

            if(db.status[i].equals("Attended")){
                colour="purple";
            }

            if(db.status[i].equals("Permission")){
                colour="yellow";
            }

            if(db.status[i].equals("Entered")){
                colour="blue";
            }

            if(db.status[i].equals("Not yet Attended")){
                colour="black";
            }

            //if((db.day[i].equals("Sunday"))||(db.day[i].equals("Saturday"))){
            //    highlight = "td bdcolor='Red'";
            //}
            out.println("     <tr>\n" +
                    "             <td style = 'text-align:center'  height=40 "+highlight+"> <font style = 'color: black' > " +db.date[i]+ " </font> </td>\n" +
                    "             <td style = 'text-align:center'  height=40 "+highlight+"> <div onclick= document.getElementById('Reason"+i+"').style.display='block' style= 'width:auto'; -webkit-box-align:'center' > <font style= 'color: "+colour+"'> " + db.status[i] + " </font>  </div> </td>\n" +
                    "         </tr>\n");
            highlight=" ";
        }
        out.println("</table>");
    }catch(Exception E){
        System.out.println("User : " + E);
    }
    %>

    <script>
        function setPermissionApproval(){
            var i;
            var dict;
            var val;
            val = document.getElementById('per0');
            dict[i.value] = val.value;
            alert( val.value );
    }

</script>


    <div id="id01" class="modal">     <!-- Check Month -->

        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="doctor.jpg" alt="Avatar" class="avatar">
            </div>
            <form id="differentMonth" action="differentMonth"  method="post">

                <label>
                    <select name="Month"  multiple="multiple">
                        <%
                            int i;
                            for(i=1;i<=12;i++){
                                out.print("<option value=" + i +">" + Month.of(i) +  "</option>");
                            }
                        %>
                    </select>
                </label>

                <label ><select name="Year"  multiple="multiple">
                    <%  int year1 = Integer.parseInt(Year.now().toString());
                        for(i=0;i<=10;i++){
                            out.print("<option value=" + year1 +">" + year1 +  "</option>");
                            year1=year1-1;
                        }
                    %>
                </select>
                </label>

                <input type="submit" name="submitted" value="submit" />
            </form>

            </centre>
            </div>

        </div>

    </div>


    <div id="Permissions" class="modal">

        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('Permissions').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="doctor.jpg" alt="Avatar" class="avatar">
            </div>
            <%
                if(db.permission==0){
                    out.println(" <br><br>You have taken no permissions so far this month <br><br><br> ");
                } else {
                    out.println("Permissions granted on : <br><br><br>");
                    for (i = 0; db.OndutyDays[i]!=0; i++) {
                        out.println(  db.date[db.permissionDays[i]] + " <br> Reason : " + db.reason[db.permissionDays[i]] + "<br><br>" );
                    }
                    out.println("<br><br><br>");
                }
            %>
        </div>
    </div>




    <div id="OnDuty" class="modal">

        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('OnDuty').style.display='none'" class="close" title="Close Modal">&times;</span>

            </div>
            <%
                if(db.Onduty==0){
                    out.println(" <br><br>You have no ODs so far this month <br><br><br> ");
                } else {
                    out.println("ODs taken on : <br><br><br>");
                    for (i = 0; db.OndutyDays[i]!=0; i++) {
                        out.println(  db.date[db.OndutyDays[i]] + " <br> Reason : " + db.reason[db.OndutyDays[i]] + "<br><br>" );
                    }
                    out.println("<br><br><br>");
                }
            %>
        </div>
    </div>


    <div id="Missed" class="modal">

        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('Missed').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="doctor.jpg" alt="Avatar" class="avatar">
            </div>
            <%
                if(db.missed==0){
                    out.println(" <br><br>You have not any day so far this month <br><br><br> ");
                } else {
                    out.println("Missed on : <br><br><br><br>");
                    for (i = 0; db.cardNotPunchedDays[i]!=0; i++) {
                        out.println( db.date[db.missedDays[i]] + "<br>" + "Reason : " + db.reason[db.missedDays[i]]+"<br><br>");
                    }
                    out.println("<br><br><br>");
                }
            %>
        </div>
    </div>


    <div id="Card" class="modal">

        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('Card').style.display='none'" class="close" title="Close">&times;</span>

            </div>
            <%
                if(db.cardNotPunched==0){
                    out.println(" <br><br>You have punched your card every day you attended <br><br><br> ");
                } else {
                    out.println("You have not punched on: <br><br>");
                    for (i = 0; db.cardNotPunchedDays[i]!=0; i++) {
                        out.println( db.date[db.cardNotPunchedDays[i]] + "<br>" + "Reason : " + db.reason[db.cardNotPunchedDays[i]] +"<br><br>");
                    }
                    out.println("<br><br><br>");
                }
            %>
        </div>
    </div>



    <%
        for(i=0;i<db.total;i++){

            out.println("   <div id='Reason"+i+"' class='modal'>\n" +
                        "\n" +
                        "        <div class='modal-content animate' >\n" +
                        "            <div class='imgcontainer'>\n" +
                        "                <span onclick=\"document.getElementById('Reason"+i+"').style.display='none'\" class='close' title='Close Modal'>&times;</span>\n" +
                        "            </div>\n" +
                        "\n" +
                        "  <br><br>     "+ db.date[i]+ " " + db.day[i] +"  \n </center>" +
                        "\n \n  "+
                        "\n <br> Status: "+ db.status[i] +"                        " +
                        "\n  <br>  Reason : "+ db.reason[i] +"  <br><br><br><br>  "+
                        "        </div>\n" +
                        "\n" +
                        "    </div> ");
                                };
    %>




    <div id="setPermissions" class="modal">
        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('setPermissions').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="doctor.jpg" alt="Avatar" class="avatar">
            </div>
            <%
               out.println("<div onclick=\"document.getElementById('setPermissions').style.display='none';document.getElementById('requestPermission').style.display='block'\" style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown' data-dismiss=\"modal\">\" Permission \"</font></div> ");
               out.println("<div onclick=\"document.getElementById('setPermissions').style.display='none';document.getElementById('requestOnDuty').style.display='block'\" style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown' data-dismiss=\"modal\">\" On duty \"</font></div> ");
               out.println("<div onclick=\"document.getElementById('setPermissions').style.display='none';document.getElementById('requestLeave').style.display='block'\" style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown' data-dismiss=\"modal\">\" Leave \"</font></div> ");
                out.println("<div onclick=\"document.getElementById('setPermissions').style.display='none';document.getElementById('RequestCard').style.display='block'\" style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown' data-dismiss=\"modal\">\" Card not punched \"</font></div> ");
            %>
        </centre>
        </div>
    </div>

    <div id="requestPermission" class="modal">
        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('requestPermission').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="doctor.jpg" alt="Avatar" class="avatar">
            </div>
            <form id="requestPermissions" action="permissions"  method="post">
                ON:
                <label><input id="onDate" type="date" name="onDate"></label>
                <br>
                From : <label><input id="from" type="time" name="from"></label>
                To : <label><input id="to" type="time" name="to"></label>
                <input type="submit" onclick="perPermission()" name="submitted" value="submit" />
            </form>
            </centre>
        </div>

    </div>

<div id="requestLeave" class="modal">
    <div class="modal-content animate" >
        <div class="imgcontainer">
            <span onclick="document.getElementById('requestLeave').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="doctor.jpg" alt="Avatar" class="avatar">
        </div>
        <form id="requestDaysOff" action="permissions"  method="post">
            <label><input id="fromDateLeave" type="date" name="fromDateLeave"></label>
            <label><input id="toDateLeave" type="date" name="toDateLeave"></label>
            <label><input id="reasonForAbsence" type="text" name="reason"></label>
            <input type="submit" onclick="perLeave()" name="submitted" value="submit" />
        </form>
        </centre>
    </div>

</div>

<div id="requestOnDuty" class="modal">
    <div class="modal-content animate" >
        <div class="imgcontainer">
            <span onclick="document.getElementById('requestOnDuty').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="doctor.jpg" alt="Avatar" class="avatar">
        </div>
        <form id="requestOD" action="permissions"  method="post">
            <label><input id="fromDateOD" type="date" name="fromDateOD"></label>
            <label><input id="toDateOD" type="date" name="toDateOD"></label>
            <label><input id="reasonForOD" type="text" name="reason"></label>
            <input type="submit" onclick="perOD()" name="submitted" value="submit" />
        </form>
        </centre>
    </div>

</div>

<div id="RequestCard" class="modal">
    <div class="modal-content animate" >
        <div class="imgcontainer">
            <span onclick="document.getElementById('RequestCard').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="doctor.jpg" alt="Avatar" class="avatar">
        </div>
        <form id="requestCardPermission" action="permissions"  method="post">
            <label><input id="cardDate" type="date" name="cardDate"></label>
            <label><input id="reasonForNotPunching" type="text" name="reason"></label>
            <input type="submit" name="submitted" value="submit" />
        </form>
        </centre>
    </div>

</div>

<div id="logout" class="modal">

    <div class="modal-content animate" >
        <div class="imgcontainer">
            <span onclick="document.getElementById('logout').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="doctor.jpg" alt="Avatar" class="avatar">
        </div>
        <form id="logoutform" action="logout" method="post">
            Are you sure you want to log out?
            <input type="radio" id='justlogoutaccept' name='logout' value="accept">
              <label > Accept </label>
              <input type="radio" id='justlogoutreject'  name='logout' value="reject">
              <label > Reject </label>
            <input type="submit" name="submitted" value="submit" />
        </form>
        </centre>
    </div>

</div>

<script>
    function setLogout(){
        var status = document.getElementById('logout');
        alert(status.value)
        if(status.value===""){
            status = "reject";
        }
    }
</script>

<%
    for(i=0;i<db.perCount;i++){

        out.println("   <div id='permission"+i+"' class='modal'>\n" +
                "\n" +
                "        <div class='modal-content animate' >\n" +
                "            <div class='imgcontainer'>\n" +
                "                <span onclick=\"document.getElementById('permission"+i+"').style.display='none';document.getElementById('ApprovePermissions').style.display='block'\" class='close' title='Close Modal'>&times;</span>\n" +
                "            </div>\n" +
                "\n" +
                "  <br><br>     "+ db.per[i].getRequested() + "  \n </center>" +
                "\n \n  "+
                "\n <br> Reason: "+ db.per[i].getReason() +"                        " +
                "  <br><br><br>      </div>\n" +
                "\n" +
                "    </div> ");
    };
%>



    <%
        if (db.isAdmin()) {

            out.println("<div id=\"ApprovePermissions\" class=\"modal\">\n" +
                    "    <div class=\"modal-content animate\" >\n" +
                    "        <div class=\"imgcontainer\">\n" +
                    "            <span onclick=\"document.getElementById('ApprovePermissions').style.display='none'\" class=\"close\" title=\"Close Modal\">&times;</span>\n" +
                    "            <img src=\"doctor.jpg\" alt=\"Avatar\" class=\"avatar\">\n" +
                    "        </div>");

            if(db.perCount>0){
                int limit = 3;
                if(db.perCount<3){
                    limit = db.perCount;
                }

            for (i=0;i<limit;i++) {
                out.println("<div onclick=\"document.getElementById('ApprovePermissions').style.display='none'; " +
                        "document.getElementById('permission" + i + "').style.display='block'\" style= 'width:auto'; -webkit-box-align:'center' > "
                        + db.per[i].id + " : " + db.per[i].getRequested() + " </font></div>");
                out.println("<form method='POST' action='approvePermissions'");
                out.println("<input type=\"radio\">\n");
                out.println("<input type=\"radio\" id='approved" + i + "' name='approved" + i + "' value=\"accept\">\n" +
                            "  <label for=\"Accept\"> Accept </label>\n" +
                            "  <input type=\"radio\" id='approved" + i + "'  name='approved" + i + "' value=\"reject\">\n" +
                            "  <label for=\"Reject\"> Reject </label>\n" +
                            "  <input type=\"radio\" id= 'approved" + i + "'  name='approved" + i + "' value=\"other\">\n" +
                            "  <label for=\"Later\"> Decide later</label>");

                out.println("<br><br><br>");

                }
            out.println("<input type=\"submit\"  value=\"Submit\">");
            out.println("</form>");
            }else{
                out.println("There are no permissions right now");
            }
            out.println("       </centre>\n" +
                    "    </div>\n" +
                    "\n" +
                    "</div>");
        }
        %>





<br><br>


</html>




















