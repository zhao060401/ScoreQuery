package com.jrome.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jrome.crud.bean.Msg;
import com.jrome.crud.service.PassServer;

@Controller
@RequestMapping(value="/pass")
public class PassController {
	@Autowired
	PassServer passServer;
	
	@RequestMapping(value="register")
	public String register() {
		System.out.println("注册界面");
		return "login/register";
	}

}
