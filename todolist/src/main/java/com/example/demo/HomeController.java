package com.example.demo;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.model.UserDTO;
import com.example.demo.service.UserService;

@Controller
public class HomeController {
	@RequestMapping(value = "/home")
	@ResponseBody
	public String Home() {
		return "Hello Spring Boot";
	}

	@RequestMapping(value = "homehtml")
	public String Homehtml() {
		return "Home";
	}

	@GetMapping("/TestJsp")
	public String Jsp() {
		return "Test";
	}
	
	@Autowired
	private UserService userService; // 의존성 주입 - 필드주입
	
	@GetMapping("/Text")
	public String Test(Model model) {
		List<UserDTO> users = userService.getAllUser();
		model.addAttribute("users",users);
		return "DBTest";
	}
	
	@PostMapping("/InsertText")
	public String InsertText(UserDTO userDTO) {
		userService.InsertText(userDTO);
		return "redirect:/Text";
	}
	
	@GetMapping("/DeleteText")
	public String DeleteText(@RequestParam int id) {
		userService.DeleteText(id);
		return "redirect:/Text";
	}
	
	@GetMapping("/UpdateText")
	public String UpdateText(UserDTO userDTO) {
		userService.UpdateText(userDTO);
		return "redirect:/Text";
	}
	
	@PostMapping("/Check")
	public String Check(@RequestParam int id, @RequestParam(required = false) String checked) {
	    boolean isChecked = (checked != null);
	    userService.Check(id, isChecked);
	    return "redirect:/Text";
	}
	
}
