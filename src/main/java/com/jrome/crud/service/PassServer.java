package com.jrome.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrome.crud.dao.EUserMapper;

@Service
public class PassServer {
	@Autowired
	EUserMapper eUserMapper;
	
	public void registerEuser() {
		
	}
	
}
