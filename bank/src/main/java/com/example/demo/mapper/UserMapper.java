package com.example.demo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.demo.model.UserDTO;

@Mapper
public interface UserMapper {
	List<UserDTO> getAllUser();
	int Regist(UserDTO userDTO);
	int Deposit(int num, int cash);
	int Withdrawal(int num, int cash);
	int DeleteUser(int num);
}
