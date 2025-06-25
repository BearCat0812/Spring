package com.example.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UserMapper;
import com.example.demo.model.UserDTO;

@Service
public class UserService implements UserMapper {
	@Autowired
	private UserMapper userMapper; // 필드 주입

//	public UserService(UserMapper userMapper) {
//		this.userMapper = userMapper;
//	} // 생성자 주입

	public List<UserDTO> getAllUser(){
		return userMapper.getAllUser();
	}
	
	public int InsertText(UserDTO userDTO) {
		return userMapper.InsertText(userDTO);
	}
	
	public int DeleteText(int id) {
		return userMapper.DeleteText(id);
	}
	
	public int UpdateText(UserDTO userDTO) {
		return userMapper.UpdateText(userDTO);
	}
	
	public int Check(int id, Boolean isChecked) {
		if(isChecked) {
	        return userMapper.Check(id, true);
		} else {
	        return userMapper.Check(id, false);
		}
	}

}
