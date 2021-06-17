package com.PricolAttendance.spring.controller;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.time.ZoneId;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

import com.PricolAttendance.spring.model.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
     User user;
     AccessDatabase db;
     Supervisor sp;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		sp = new Supervisor();
		return "home";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String user(@Validated User user, Model model) throws SQLException {
		model.addAttribute("userName", user.getUserName());
		model.addAttribute("password", user.getPassword());
		db = new AccessDatabase(user.getUserName());
	    int l = db.addEntryRecord("4");
		try(Connection con = AccessDatabase.getConnection()) {

		} catch (Exception E){
		    System.out.println("HomeController/user : Failed to connect to database");
		    return "Noconnection";
		}
		if (db.login(user)) {
			model.addAttribute("database", db);
			model.addAttribute("user",user);
			return "user";
		} else {
			return "LoginFailed";
		}
	}


	@RequestMapping(value = "/differentMonth", method = RequestMethod.POST)
	public String differentMonth(@Validated @ModelAttribute DifferentMonth mon, Model model) {
        System.out.println("HomeController/differentMonth : Fetched details of the selected month");
	    if((mon.getMonth()!=null)&(mon.getYear()!=null)){
            String[] month = mon.getMonth().split(",");
            String[] year = mon.getYear().split(",");
            this.db.setStatusOfMonth(this.db.id,month[0],year[0]);}
        model.addAttribute("database", this.db);
        return "user";
	}

	@RequestMapping(value = "/permissions", method = RequestMethod.POST)
	public String Permissions(@Validated @ModelAttribute Permissions per, Model model) {
		System.out.println("HomeController/Permissions : Setting requested permissions");
		db.applyPermissions(per);
	//	System.out.println( per.to + " " + per.from );
		db.setPendingPermissions();
		model.addAttribute("database", this.db);
		return "user";
	}
    @RequestMapping(value = "/approvePermissions", method = RequestMethod.POST)
    public String approvePermissions(@Validated @ModelAttribute Approve app, Model model) {
        System.out.println("HomeController/approvePermissions : Setting approved permissions");
        this.db.approvePermissions(app);
        model.addAttribute("database", this.db);
        return "user";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout (HttpServletRequest request, @RequestParam String logout,Model modal) {
        if(logout.equals("accept")){
        	System.out.println("HomeController/logout : Logging out ");
        	return "home";
		}else{
        	modal.addAttribute("database", this.db);
        	return "user";
		}

    }

}