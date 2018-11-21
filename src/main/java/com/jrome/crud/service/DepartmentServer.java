package com.jrome.crud.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrome.crud.bean.Department;
import com.jrome.crud.dao.DepartmentMapper;

@Service
public class DepartmentServer {
	@Autowired
	DepartmentMapper  departmentMapper;
	
	public List<Department> getDepts(){
		List<Department> lists=departmentMapper.selectByExample(null);
		return lists;
	}
	
}
