package com.example.demo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.UserDTO;

@Mapper
public interface UserMapper {
	List<UserDTO> getAllUser();
	int InsertText(UserDTO userDTO);
	int DeleteText(int id);
	int UpdateText(UserDTO userDTO);
	int Check(int id, Boolean checked);
}
