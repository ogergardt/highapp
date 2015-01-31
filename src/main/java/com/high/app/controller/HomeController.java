package com.high.app.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String welcome(Locale locale, ModelMap model, Principal principal) {
		
		String name = principal != null ? principal.getName() : "anonymous";
		logger.info("/home?username={}", name);	

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				
		model.addAttribute("username", name);
		model.addAttribute("message", "Accounts manager is a simple web application that do basic operations (create,read,update and delete) on 2 entities: Account and Role.");
		model.addAttribute("locale", locale.getLanguage());

		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Locale locale, ModelMap model, Principal principal) {
		
		String name = principal != null ? principal.getName() : "anonymous";
		logger.info("/about?username={}", name);	

		model.addAttribute("username", name);
		model.addAttribute("locale", locale.getLanguage());
		
		return "about";
	}
	
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book(Locale locale, ModelMap model, Principal principal) {
		
		String name = principal != null ? principal.getName() : "anonymous";
		logger.info("/book?username={}", name);	

		model.addAttribute("username", name);
		model.addAttribute("locale", locale.getLanguage());
		
		return "book";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() { // no ModelMap
//Locale locale, ModelMap model, Principal principal
		
		logger.info("/login");	 
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(Locale locale, ModelMap model, Principal principal) {
		logger.info("/loginfailed?error=true");
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Locale locale, ModelMap model, Principal principal) {
 
		return "login";
 
	}
	
}
