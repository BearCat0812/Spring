package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UserMapper;
import com.example.demo.model.UserDTO;

@Service
public class UserService implements UserMapper {
	@Autowired
	private UserMapper userMapper;
	
	public List<UserDTO> getAllUser(){
		return userMapper.getAllUser();
	}
	
	public int Regist(UserDTO userDTO) {
		return userMapper.Regist(userDTO);
	}
	
	public int Deposit(int num, int cash) {
		return userMapper.Deposit(num, cash);
	}
	
	public int Withdrawal(int num, int cash) {
		return userMapper.Withdrawal(num, cash);
	}
	
	public int DeleteUser(int num) {
		return userMapper.DeleteUser(num);
	}

}
