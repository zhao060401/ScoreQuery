package com.jrome.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jrome.crud.bean.Empoyee;
import com.jrome.crud.bean.Msg;
import com.jrome.crud.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		/**
		 * @ResponseBody ���Զ��ѷ��ض�����jason
		 * ����Jason��ʽ������
		 */
		PageHelper.startPage(pn, 5);
		//startPage��������Ĳ�ѯ����һ����ҳ��ѯ,����������ʾ��ҳ��
		List<Empoyee> emps=employeeService.getAll();
		PageInfo page=new PageInfo(emps,5);
		return Msg.success().add("pageInfo", page);
		
	}
	
	
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		/*
		 * ����pageHelper��ҳ���,��ʼҳ��ÿҳ��ʾ������
		 */
		PageHelper.startPage(pn, 5);
		//startPage��������Ĳ�ѯ����һ����ҳ��ѯ,����������ʾ��ҳ��
		List<Empoyee> emps=employeeService.getAll();
		PageInfo page=new PageInfo(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
		
	}
}
