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
        background: url("/WebContent/Resources/tests.jpg") no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
    .tableOne {
        margin:auto;
        width:400px;
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








































<

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
    var modal = document.getElementById('permissions');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }

    }

</script>
<script>

    var modal = document.getElementById('Setpermissions');

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


<head>
    <title> Attendance record </title>
</head>

<div class="outer">

    <div class="header">
    </div>


    <div class="header">

        <table class="tableOne" border=0 style="margin-right:150px" align = left>
            <%  AccessDatabase db = (AccessDatabase)request.getAttribute("database");
                long millis = System.currentTimeMillis();                     //This block takes in current date and time from the OS.

                Month mon1 = Month.of(Integer.parseInt(db.month));
                Month mon2 = Month.of(Integer.parseInt(db.month)+1);

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
                    "                <td style = 'text-align:right' height='20'> <font style='color: green'> <a href=\"id01\"> " + db.getOD() + " </a> </font> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Days Missed </font></td>\n" +
                    "                <td style = 'text-align:right' height='20'> <font style='color: red'>" +db.getMissed()+ "  </font> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "            <tr>\n" +
                    "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Card Unpunched </font></td>\n" +
                    "                <td style = 'text-align:right' height='20'> <div onclick= document.getElementById('Card').style.display='block' style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown'>"+db.getCardNotPunched() +"</font></div> </td>\n" +
                    "            </tr>\n" +
                    "\n" +
                    "        </table>\n" +
                    "        </table>\n" +
                    "    </div>       ");

        %>
    </div>

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
            background: url("/WebContent/Resources/tests.jpg") no-repeat center center fixed;
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








































    <

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
        var modal = document.getElementById('permissions');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }

        }

    </script>
    <script>

        var modal = document.getElementById('Setpermissions');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }

        }

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


    <head>
        <title> Attendance record </title>
    </head>

    <div class="outer">

        <div class="header">
        </div>


        <div class="header">

            <table class="tableOne" border=0 style="margin-right:150px" align = left>
                <%  AccessDatabase db = (AccessDatabase)request.getAttribute("database");
                    long millis = System.currentTimeMillis();                     //This block takes in current date and time from the OS.

                    Month mon1 = Month.of(Integer.parseInt(db.month));
                    Month mon2 = Month.of(Integer.parseInt(db.month)+1);

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
                        "                <td style = 'text-align:right' height='20'> <font style='color: red'> <div onclick= document.getElementById('missed').style.display='block' style= 'width:auto'; -webkit-box-align:'center' >" +db.getMissed()+ " </div> </font> </td>\n" +
                        "            </tr>\n" +
                        "\n" +
                        "            <tr>\n" +
                        "                <td style = 'text-align:left' height='20' width='60%'><font style='color: black'> Card Unpunched </font></td>\n" +
                        "                <td style = 'text-align:right' height='20'> <div onclick= document.getElementById('Card').style.display='block' style= 'width:auto'; -webkit-box-align:'center' ><font style='color: brown'>"+db.getCardNotPunched() +"</font></div> </td>\n" +
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

        Hello

        <div id="output"></div>
            <%  try{

        out.println("<br></br><br></br><br></br><br></br><br></br><br><br><br><br>");
        int i,n=db.date.length;

        out.println("         <table border = \"1\" align=\"center\" width='600'>\n" +
                "         <tr>\n" +
                "            <th> Day </th>\n" +
                "            <th> Status </th>  \n" +
                "         </tr>");
        String highlight = " ";
        for(i=0;!db.status[i].isEmpty();i++){

            String colour = null;
            if(db.status[i].equals("Missed")){
                colour=String.valueOf("red");
            }
            if(db.status[i].equals("Card Not Punched")){
                colour=String.valueOf("brown");
            }
            if(db.status[i].equals("On Duty")){
                colour=String.valueOf("green");
            }
            if(db.status[i].equals("Attended")){
                colour=String.valueOf("blue");
            }
            if(db.status[i].equals("Permission")){
                colour=String.valueOf("yellow");
            }
            if(db.status[i].equals("Entered")){
                colour=String.valueOf("blue");
            }
            if(db.status[i].equals("Not yet Attended")){
                colour=String.valueOf("black");
            }

            if((db.day[i].equals("Sunday"))||(db.day[i].equals("Saturday"))){
                highlight = "td bdcolor='Red'";

            }
            String t = " ";
            out.println("     <tr>\n" +
                    "             <td style = 'text-align:center'  height=40 "+highlight+"> <font style = 'color: black' > " +db.date[i]+ " </font> </td>\n" +
                    "             <td style = 'text-align:center'  height=40 "+highlight+"> <div onclick= document.getElementById('Reason"+i+"').style.display='block' style= 'width:auto'; -webkit-box-align:'center' > <font style= 'color: "+colour+"'> " + db.status[i] + " </font>  </div> </td>\n" +
                    "         </tr>\n");
            highlight=" ";
        }
        out.println("</table>");
    }catch(Exception E){
        System.out.println(E);
    }
    %>


        <div id="id01" class="modal">

            <div class="modal-content animate" >
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <img src="doctor.jpg" alt="Avatar" class="avatar">
                </div>
                <form id="DifferentMonth" action="DifferentMonth"  method="post">

                    <select name="month" multiple="multiple">
                        <%
                            int i;
                            for(i=1;i<=12;i++){
                                out.print("<option value=" + i +">" + Month.of(i) +  "</option>");
                            }
                        %>
                    </select>



                    <select id="year" multiple="multiple">
                        <%  int year1 = Integer.parseInt(Year.now().toString());
                            for(i=0;i<=10;i++){
                                year1=year1-1;
                                out.print("<option value=" + i +">" + ( year1) +  "</option>");
                            }
                        %>
                    </select>

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
                if(db.cardNotPunched==0){
                    out.println(" <br><br>You have taken no permissions so far this month <br><br><br> ");
                } else {
                    out.println("Permissions granted on : <br><br><br><br>");
                    for (i = 0; db.permissionDays[i]!=0; i++) {
                        out.println(  db.date[db.permissionDays[i]] + " : " +db.day[db.permissionDays[i]] + "<br>" );
                    }
                    out.println("<br><br><br>");
                }
            %>
        </div>
    </div>

    <div id="ApprovePermissions" class="modal">

        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('ApprovePermissions').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="doctor.jpg" alt="Avatar" class="avatar">
            </div>

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
                    out.println("ODs taken on : <br><br><br><br>");
                    for (i = 0; db.OndutyDays[i]!=0; i++) {
                        out.println(  db.date[db.OndutyDays[i]] + " : " +db.date[db.OndutyDays[i]] + "<br>" );
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
                    out.println("You have not punched on: <br><br><br><br>");
                    for (i = 0; db.cardNotPunchedDays[i]!=0; i++) {
                        out.println(  db.date[db.cardNotPunchedDays[i]] + " : " +db.date[db.cardNotPunchedDays[i]] + "<br>" );
                    }
                    out.println("<br><br><br>");
                }
            %>
        </div>
    </div>



        <%

        String day;
        String highlight = " ";
        for(i=0;i<db.totaldates;i++){

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
                        "\n  <br>  "+ db.reason[i] +"  <br><br><br><br>  "+
                        "        </div>\n" +
                        "\n" +
                        "    </div> ");
                                };
    %>




    <div id="Setpermissions" class="modal">
        <script>
            function check() {
                document.getElementById("confirmation").innerHTML=" Submitted Successfully";
            }

        </script>
        <div class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('Setpermissions').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            <script>
                var nativePicker = document.querySelector('.nativeDateTimePicker');
                var fallbackPicker = document.querySelector('.fallbackDateTimePicker');
                var fallbackLabel = document.querySelector('.fallbackLabel');

                var yearSelect = document.querySelector('#year');
                var monthSelect = document.querySelector('#month');
                var daySelect = document.querySelector('#day');
                var hourSelect = document.querySelector('#hour');
                var minuteSelect = document.querySelector('#minute');

                // hide fallback initially
                fallbackPicker.style.display = 'none';
                fallbackLabel.style.display = 'none';

                // test whether a new datetime-local input falls back to a text input or not
                var test = document.createElement('input');

                try {
                    test.type = 'datetime-local';
                } catch (e) {
                    console.log(e.description);
                }

                // if it does, run the code inside the if() {} block
                if(test.type === 'text') {
                    // hide the native picker and show the fallback
                    nativePicker.style.display = 'none';
                    fallbackPicker.style.display = 'block';
                    fallbackLabel.style.display = 'block';

                    // populate the days and years dynamically
                    // (the months are always the same, therefore hardcoded)
                    populateDays(monthSelect.value);
                    populateYears();
                    populateHours();
                    populateMinutes();
                }

                function populateDays(month) {
                    // delete the current set of <option> elements out of the
                    // day <select>, ready for the next set to be injected
                    while(daySelect.firstChild){
                        daySelect.removeChild(daySelect.firstChild);
                    }

                    // Create variable to hold new number of days to inject
                    var dayNum;

                    // 31 or 30 days?
                    if(month === 'January' || month === 'March' || month === 'May' || month === 'July' || month === 'August' || month === 'October' || month === 'December') {
                        dayNum = 31;
                    } else if(month === 'April' || month === 'June' || month === 'September' || month === 'November') {
                        dayNum = 30;
                    } else {
                        // If month is February, calculate whether it is a leap year or not
                        var year = yearSelect.value;
                        var isLeap = new Date(year, 1, 29).getMonth() == 1;
                        isLeap ? dayNum = 29 : dayNum = 28;
                    }

                    // inject the right number of new <option> elements into the day <select>
                    for(i = 1; i <= dayNum; i++) {
                        var option = document.createElement('option');
                        option.textContent = i;
                        daySelect.appendChild(option);
                    }

                    // if previous day has already been set, set daySelect's value
                    // to that day, to avoid the day jumping back to 1 when you
                    // change the year
                    if(previousDay) {
                        daySelect.value = previousDay;

                        // If the previous day was set to a high number, say 31, and then
                        // you chose a month with less total days in it (e.g. February),
                        // this part of the code ensures that the highest day available
                        // is selected, rather than showing a blank daySelect
                        if(daySelect.value === "") {
                            daySelect.value = previousDay - 1;
                        }

                        if(daySelect.value === "") {
                            daySelect.value = previousDay - 2;
                        }

                        if(daySelect.value === "") {
                            daySelect.value = previousDay - 3;
                        }
                    }
                }

                function populateYears() {
                    // get this year as a number
                    var date = new Date();
                    var year = date.getFullYear();

                    // Make this year, and the 100 years before it available in the year <select>
                    for(var i = 0; i <= 100; i++) {
                        var option = document.createElement('option');
                        option.textContent = year-i;
                        yearSelect.appendChild(option);
                    }
                }

                function populateHours() {
                    // populate the hours <select> with the 24 hours of the day
                    for(var i = 0; i <= 23; i++) {
                        var option = document.createElement('option');
                        option.textContent = (i < 10) ? ("0" + i) : i;
                        hourSelect.appendChild(option);
                    }
                }

                function populateMinutes() {
                    // populate the minutes <select> with the 60 hours of each minute
                    for(var i = 0; i <= 59; i++) {
                        var option = document.createElement('option');
                        option.textContent = (i < 10) ? ("0" + i) : i;
                        minuteSelect.appendChild(option);
                    }
                }

                // when the month or year <select> values are changed, rerun populateDays()
                // in case the change affected the number of available days
                yearSelect.onchange = function() {
                    populateDays(monthSelect.value);
                }

                monthSelect.onchange = function() {
                    populateDays(monthSelect.value);
                }

                //preserve day selection
                var previousDay;

                // update what day has been set to previously
                // see end of populateDays() for usage
                daySelect.onchange = function() {
                    previousDay = daySelect.value;
                }
            </script>




            <form id="toDate" action="Permissions"method="post">
                <div class="nativeDateTimePicker">
                    <label for="party">Choose a date and time for your party:</label>
                    <input type="datetime-local" id="party" name="toDate">
                    <input type="submit" value="Submit">
                    <span class="validity"></span>
                </div>

            </form>
        </div>

    </div>






    <button onclick="document.getElementById('Setpermissions').style.display='block'" style="width:auto; -webkit-box-align: center ">  Apply Permissions  </button>

    <br><br>

    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto; -webkit-box-align: center ">  Check Month  </button>



</div>
</html>




















<!--

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home Page</title>
</head>
<body>
<h3>Hi ${userName} ${password}</h3>
</body>
</html>
--></div>
</html>




















<!--

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home Page</title>
</head>
<body>
<h3>Hi ${userName} ${password}</h3>
</body>
</html>
-->