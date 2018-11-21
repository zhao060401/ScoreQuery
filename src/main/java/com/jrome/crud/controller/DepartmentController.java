package com.jrome.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jrome.crud.bean.Department;
import com.jrome.crud.bean.Msg;
import com.jrome.crud.service.DepartmentServer;

@Controller
public class DepartmentController {
	@Autowired
	private DepartmentServer departmentServer;
	
	
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDpet() {
		List<Department> list = departmentServer.getDepts();
		return Msg.success().add("depts", list);

	}

}
