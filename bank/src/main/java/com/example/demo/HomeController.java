package com.example.demo;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.UserDTO;
import com.example.demo.service.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/Bank")
	public String Bank(Model model) {
		List<UserDTO> users = userService.getAllUser();
		model.addAttribute("users",users);
		return "DBBank";
	}
	
	@PostMapping("/Regist")
	public String Regist(UserDTO userDTO) {
		userService.Regist(userDTO);
		return "redirect:/Bank";
	}
	
	@GetMapping("/Deposit")
	public String Deposit(@RequestParam int num, @RequestParam int cash) {
		userService.Deposit(num, cash);
		return "redirect:Bank";
	}
	
	@GetMapping("/Withdrawal")
	public String Withdrawal(@RequestParam int num, @RequestParam int cash) {
		userService.Withdrawal(num, cash);
		return "redirect:Bank";
	}
	
	@GetMapping("/DeleteUser")
	public String DeleteUser(@RequestParam int num) {
		userService.DeleteUser(num);
		return "redirect:/Bank";
	}

}
