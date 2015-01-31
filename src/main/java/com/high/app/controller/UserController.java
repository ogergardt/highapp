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

import com.high.app.dao.UserDao;
import com.high.app.dao.RoleDao;
import com.high.app.model.User;
import com.high.app.util.Cryptologist;

@Controller
public class UserController {


	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
	 
	@Autowired
	private ApplicationContext context;
    
	private Cryptologist crpt = new Cryptologist();
	
	static String readFile(String path, Charset encoding) 
			  throws IOException 
			{
			  byte[] encoded = Files.readAllBytes(Paths.get(path));
			  return encoding.decode(ByteBuffer.wrap(encoded)).toString();
			}
	
    
	@RequestMapping(value="/users", method = RequestMethod.GET)
	public String getUsers(ModelMap model, Principal principal) {	
		String name = principal.getName();
		logger.info("GET: /users");
		UserDao userdao = (UserDao) context.getBean("UserDao");
		List<com.high.app.model.User> users = userdao.getUsers();
		model.addAttribute("users", users);
		model.addAttribute("username", name);
		return "user";
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.GET)
	public String adduser(ModelMap model, Principal principal){
		logger.info("GET: /adduser");
		String name = principal.getName();
		model.addAttribute("username", name);
		return "adduser";
	}
	
	@RequestMapping(value = "/updateuser_{id}", method = RequestMethod.GET)
	public String updateuser(@PathVariable("id") int id, ModelMap model, Principal principal){
		logger.info("GET: /updateuser_{id}");
		String name = principal.getName();
		UserDao userdao = (UserDao) context.getBean("UserDao");
		User user = userdao.getUserById(id);
		model.addAttribute("user", user);
		model.addAttribute("username", name);
		return "updateuser";
	}
	
/*	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public String submit(@ModelAttribute("user") User user,	BindingResult result) {
		//deleted , SessionStatus status, RedirectAttributes attrs
		logger.info("POST: /adduser");
		user.setPassword(crpt.getSHA1(user.getPassword()));
		UserDao userdao = (UserDao) context.getBean("UserDao");
		userdao.save(user);
		if( result.hasErrors() ) {
			logger.info("Error: (POST: /adduser)");
		}
		return "redirect:/users";
	}*/
	
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	@ResponseBody                                                   
    public boolean submit(@RequestBody User user) {    
		logger.info("POST(Ajax): /adduser");
		UserDao userdao = (UserDao) context.getBean("UserDao");
		user.setPassword(crpt.getSHA1(user.getPassword()));
		userdao.save(user);
        return true;                                                                 
    }      
	
	@RequestMapping(value = "/updateuser_{id}", method = RequestMethod.POST)
	@ResponseBody                                                   
    public boolean update(@PathVariable("id") String id, @RequestBody User changeduser) {    
		logger.info("POST(Ajax): /updateuser_{id}");
		UserDao userdao = (UserDao) context.getBean("UserDao");
		User user = userdao.getUserById(Integer.parseInt(id.trim()));
		if (changeduser.getPassword().equals(user.getPassword())) {
			user.setPassword(crpt.getSHA1(changeduser.getPassword()));	
		}
		user.setLogin(changeduser.getLogin());
		user.setName(changeduser.getName());
		user.setEmail(changeduser.getEmail());
		user.setRole(changeduser.getRole());
		userdao.update(user);
        return true;                                                                 
    }      
	
	@RequestMapping(value = "/users/{pk}", method = RequestMethod.DELETE)
	@ResponseBody
	public boolean delete(@PathVariable("pk") String id, HttpServletResponse response) {
		logger.info("DELETE(Ajax): /users/{pk}");
		UserDao userdao = (UserDao) context.getBean("UserDao");
		userdao.delete(userdao.getUserById(Integer.parseInt(id.trim())));
		response.setStatus(HttpServletResponse.SC_OK);
		return true;
	}
	
	@RequestMapping(value="/roles/all", method = RequestMethod.GET)
	public @ResponseBody String getRolesInJSON(ModelMap model) {
		logger.info("GET(Ajax): /roles/all");
		
		RoleDao roledao = (RoleDao) context.getBean("RoleDao");
		ObjectMapper mapper = new ObjectMapper();
		String result="";
		try {
			result=mapper.writeValueAsString(roledao.getRoles());	
		} catch (Exception e) {
			// TODO: handle exception
		}
		return  result;
	}
	
	@RequestMapping(value="/book/calendar", method = RequestMethod.GET)
	public @ResponseBody String getCalendarInJSON(ModelMap model) {
		String content="";
		try {
			content = readFile("C:\\Users\\o\\Desktop\\open_dates_new.json", StandardCharsets.UTF_8);	
		} catch (Exception e) {
			// TODO: handle exception
		}

		logger.info("{}", content);
		logger.info("GET(Ajax): /book/calendar");
		
		//RoleDao roledao = (RoleDao) context.getBean("RoleDao");
		//ObjectMapper mapper = new ObjectMapper();
		String result="";
		try {
			//result=mapper.writeValueAsString(roledao.getRoles());
			result=content;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return  result;
	}
	
	@RequestMapping(value="validator/{name}", method = RequestMethod.POST)                                                   
	@ResponseBody
	public boolean checkEmailAvailibility(@PathVariable("name") String name, @RequestBody  String uriParams) {
		logger.info("GET(Ajax):  /validator/{}", name);
		
		uriParams = uriParams.replace("%40", "@");
		
		Map<String, String> paramValue = new HashMap<String, String>();
		parseParam(uriParams, paramValue);
		paramValue.get(name);
		UserDao userdao = (UserDao) context.getBean("UserDao");
		boolean result = false;
		switch (name) {
		case "email":
			result = (userdao.getUserByEmail(paramValue.get(name))==null) ? true : false;
			break; 
		case "login":
			logger.info("GET(Ajax): ++++++++++++++++++++++++++++++++++++++++++++++ /validator/{}", name);
			result = (userdao.getUserByLogin(paramValue.get(name))==null) ? true : false;
			break; 	
		default: result = false;
			break;	
		}
		
        return result;                                                                 
    }     

	   private void parseParam(String parameters, Map<String, String> map){
		   StringTokenizer paramGroup = new StringTokenizer(parameters, "&");
		   while(paramGroup.hasMoreTokens()){
			   StringTokenizer value = new StringTokenizer(paramGroup.nextToken(), "=");
			   map.put(value.nextToken(), value.nextToken());
		   }
	   }
	
	
}

