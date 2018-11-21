package com.jrome.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrome.crud.bean.Empoyee;
import com.jrome.crud.dao.EmpoyeeMapper;
@Service
public class EmployeeService {
	@Autowired
	EmpoyeeMapper empoyeeMapper;

	public List<Empoyee> getAll() {
		// TODO Auto-generated method stub
		return empoyeeMapper.selectByExampleWithDept(null);
	}

}
