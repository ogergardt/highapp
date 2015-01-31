package com.high.app.controller;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.high.app.dao.ScheduleDao;
import com.high.app.dao.UseravailableDao;
import com.high.app.dao.UserDao;
import com.high.app.dao.RoleDao;
import com.high.app.model.User;
import com.high.app.util.Cryptologist;

@Controller
public class ScheduleController {


	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
	 
	@Autowired
	private ApplicationContext context;
    
	@RequestMapping(value="/schedule", method = RequestMethod.GET)
	public String getSchedule(ModelMap model, Principal principal) {	
		String name = principal.getName();
		logger.info("GET: /schedule");
		ScheduleDao scheduledao = (ScheduleDao) context.getBean("ScheduleDao");
		List<com.high.app.model.Schedule> schedule = scheduledao.getSchedule();
		model.addAttribute("schedule", schedule);
		model.addAttribute("username", name);
		return "schedule";
	}
	
	@RequestMapping(value = "/addschedule", method = RequestMethod.GET)
	public String adduser(ModelMap model, Principal principal){
		logger.info("GET: /addschedule");
		String name = principal.getName();
		model.addAttribute("username", name);
		return "addschedule";
	}
	
	@RequestMapping(value = "/accountavailable", method = RequestMethod.GET)
	public String vailablity(ModelMap model, Principal principal){
		logger.info("GET: /accountavailable");
		String name = principal.getName();
		model.addAttribute("username", name);
		return "accountavailable";
	}
	
	@RequestMapping(value="/usersavailability", method = RequestMethod.GET)
	public String getUseravailable(ModelMap model, Principal principal) {	
		String name = principal.getName();
		logger.info("GET: /usersavailability");
		UseravailableDao useravailabledao = (UseravailableDao) context.getBean("UseravailableDao");
		List<com.high.app.model.Useravailable> schedule = useravailabledao.getUseravailable();
		model.addAttribute("useravailable", schedule);
		model.addAttribute("username", name);
		return "usersavailability";
	}
		
}
