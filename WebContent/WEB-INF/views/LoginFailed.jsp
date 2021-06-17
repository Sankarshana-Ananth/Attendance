<!DOCTYPE html>
<html lang="en">
<title>Login</title>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <meta name="description" content=" " />
    <meta name="author" content="Codeconvey" />
    <!--	<link rel="stylesheet" type="text/css" href="demo.css" />
        <link rel="stylesheet" type="text/css" href="style.css" />
    -->
</head>
<body>
<style>


    html {
        box-sizing: border-box;
    }
    *, *:before, *:after {
        box-sizing: inherit;
    }

    article, header, section, aside, details, figcaption, figure, footer, header, hgroup, main, nav, section, summary {
        display: block;
    }
    body {
        background:#eee4f5 none repeat scroll 0 0;
        color: #b95d5d;
        font-family: "Raleway",sans-serif;
        font-size: 100%;
        line-height: 24px;
        margin: 0;
        padding:0;

    }
    a{
        font-family: "Raleway",sans-serif;
        text-decoration: none;
        outline: none;
    }
    a:hover, a:focus {
        color: #373e18;
    }
    section {
        float: left;
        width: 100%;
        margin-top:3em;
        margin-bottom:2em;
    }
    h2 {
        color: #1a0e0e;
        font-size: 26px;
        font-weight: 700;
        margin: 0;
        line-height: normal;
        text-transform:uppercase;
    }
    h2 span {
        display: block;
        padding: 0;
        font-size: 18px;
        opacity: 0.7;
        margin-top: 5px;
        text-transform:uppercase;
    }

    #float-right{
        float:right;
    }

    /* ******************************************************
        Header
    *********************************************************/

    .ScriptTop {
        background: #fff none repeat scroll 0 0;
        float: left;
        font-size: 0.69em;
        font-weight: 600;
        line-height: 2.2;
        padding: 12px 0;
        text-transform: uppercase;
        width: 100%;
    }

    /* To Navigation Style 1*/
    .ScriptTop ul {
        margin: 24px 0;
        padding: 0;
        text-align: left;
    }
    .ScriptTop li{
        list-style:none;
        display:inline-block;
    }
    .ScriptTop li a {
        background: #6a4aed none repeat scroll 0 0;
        color: #fff;
        display: inline-block;
        font-size: 14px;
        font-weight: 600;
        padding: 5px 18px;
        text-decoration: none;
        text-transform: capitalize;
    }
    .ScriptTop li a:hover{
        background:#000;
        color:#fff;
    }


    /* Header*/
    .ScriptHeader {
        float: left;
        width: 100%;
        padding-top: 3em;
    }
    .rt-heading {

        border-bottom: solid 4px #ed9a4a;
        padding-bottom: 10px;
        margin: 0 auto;
        display: table;
        text-align: center;

    }
    .ScriptHeader h1{
        color: #ed9a4a;
        font-size: 28px;
        font-weight: 700;
        margin: 0;
        line-height: normal;
    }
    .ScriptHeader h2 {
        color: #ed9a4a;
        font-size: 18px;
        font-weight: 400;
        margin: 5px 0 0;
        line-height: normal;

    }

    .ScriptHeader h1 span {
        display: block;
        padding: 0;
        font-size: 22px;
        opacity: 0.7;
        margin-top: 5px;
        text-transform:uppercase;
    }
    .ScriptHeader span {
        display: block;
        padding: 0;
        font-size: 22px;
        opacity: 0.7;
        margin-top: 5px;
    }




    /* ******************************************************
        Live Demo
    *********************************************************/





    /* ******************************************************
        Responsive Grids
    *********************************************************/

    .rt-container {
        margin: 0 auto;
        padding-left:12px;
        padding-right:12px;
    }
    .rt-row:before, .rt-row:after {
        display: table;
        line-height: 0;
        content: "";
    }

    .rt-row:after {
        clear: both;
    }
    [class^="col-rt-"] {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -o-box-sizing: border-box;
        -ms-box-sizing: border-box;
        padding: 0 15px;
        min-height: 1px;
        position: relative;
    }


    @media (min-width: 768px) {
        .rt-container {
            width: 750px;
        }
        [class^="col-rt-"] {
            float: left;
            width: 49.9999999999%;
        }
        .col-rt-6, .col-rt-12 {
            width: 100%;
        }

    }

    @media (min-width: 1200px) {
        .rt-container {
            width: 1170px;
        }
        .col-rt-1 {
            width:16.6%;
        }
        .col-rt-2 {
            width:30.33%;
        }
        .col-rt-3 {
            width:50%;
        }
        .col-rt-4 {
            width: 67.664%;
        }
        .col-rt-5 {
            width: 83.33%;
        }


    }

    @media only screen and (min-width:240px) and (max-width: 768px){
        .ScriptTop h1, .ScriptTop ul {
            text-align: center;
        }
        .ScriptTop h1{
            margin-top:0;
            margin-bottom:15px;
        }
        .ScriptTop ul{
            margin-top:12px;
        }

        .ScriptHeader h1,
        .ScriptHeader h2,
        .scriptnav ul{
            text-align:center;
        }
        .scriptnav ul{
            margin-top:12px;
        }
        #float-right{
            float:none;
        }

    }
    body{
        height:100vh;
        background: rgba(241,231,103,1);
        background: -moz-linear-gradient(-45deg, rgba(241,231,103,1) 0%, rgba(254,182,69,1) 100%);
        background: -webkit-gradient(left top, right bottom, color-stop(0%, rgba(241,231,103,1)), color-stop(100%, rgba(254,182,69,1)));
        background: -webkit-linear-gradient(-45deg, rgba(241,231,103,1) 0%, rgba(254,182,69,1) 100%);
        background: -o-linear-gradient(-45deg, rgba(241,231,103,1) 0%, rgba(254,182,69,1) 100%);
        background: -ms-linear-gradient(-45deg, rgba(241,231,103,1) 0%, rgba(254,182,69,1) 100%);
        background: linear-gradient(135deg, rgba(241,231,103,1) 0%, rgba(254,182,69,1) 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f1e767', endColorstr='#feb645', GradientType=1 );
    }
    .simpleLogin {

    }
    .simpleLogin form {
        max-width: 400px;
        margin: auto;
        background:#fefefd;

        box-shadow: 0 10px 10px #222;
    }

    .simpleLogin form fieldset {
        border: 0 none;
        margin: 0;
        padding: 20px;
    }
    .simpleLogin form legend,
    .simpleLogin form fieldset input {
        font-family: Open Sans;
        font-size:15px;
    }

    .simpleLogin form legend {
        background-color: #8fc400;
        border-top: 0 none;
        color: white;
        display: table-cell;
        padding: 10px 20px;
        width: auto;
    }
    .simpleLogin form fieldset input {
        width: 90%;
        margin: 10px 0;
        padding: 10px 5%;
        border: thin #8fc400 solid;
    }
    .simpleLogin input[type="submit"] {
        width: 100px;
        float: right;
        background: #8fc400;
        color: white;
        transition: .2s;
        border: 0;
        cursor:pointer;
    }


    .simpleLogin input[type="submit"]:focus,
    .simpleLogin input[type="submit"]:hover,
    .simpleLogin input[type="submit"]:active {
        padding: 10px 5%;
        background:#B3E226;
        outline: none;
    }





</style>

<header class="ScriptHeader">
    <div class="rt-container">
        <div class="col-rt-12">
            <div class="rt-heading">
                <h1>CSS Simple Login Form<span>Easy to customize and re-useable Form</span></h1>
            </div>
        </div>
    </div>
</header>

<section>
    <div class="rt-container">
        <div class="col-rt-12">

            <div class="simpleLogin">
                <form action="user" method="post">
                    <legend>Let's Login</legend>
                    <fieldset>
                        <label><input id="name" placeholder="Username" type="text" name="userName"></label>
                        <label><input id="pass" placeholder="Password" type="password" name="password"></label>
                        <label><input id="submit" type="submit" value="Login"></label>
                               Login Failed. Try again.
                    </fieldset>
                </form>
                <p style="text-align:center;">Here is code example of CSS Simple Login Form. See the demo and downlaod free login form template.<br />The form have quite uniqe design and simple username, password and a button. The form is easy to implemenet and customization.</p>
            </div>

        </div>
    </div>
</section>



</body>
</html>





<!--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
<h1>Hello world!</h1>

<P>The time on the server is ${serverTime}.</p>

<form action="user" method="post">
<label>
<input type="text" name="userName">
</label><br>
<label>
<input type="text" name="password">
</label><input
type="submit" value="Login">
</form>
</body>
</html>
-->