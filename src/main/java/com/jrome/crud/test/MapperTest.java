	package com.jrome.crud.test;
	
	import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
	import org.junit.runner.RunWith;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.test.context.ContextConfiguration;
	import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
	
	import com.jrome.crud.bean.Department;
	import com.jrome.crud.bean.Empoyee;
	import com.jrome.crud.dao.DepartmentMapper;
	/**
	 * 
	 * @author zhao0
	 * 1.����springTest��
	 * 2.@ContextConfigurationָ��Spring�����ļ�λ��
	 * 3.ֱ��autoAwiredҪ�õ���� 	
	 *
	 */
	import com.jrome.crud.dao.EmpoyeeMapper;
	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
	public class MapperTest {
		@Autowired
		DepartmentMapper departmentMapper;
		@Autowired
		EmpoyeeMapper empoyeeMapper;
		@Autowired
		SqlSession  sqlSession;
		
		/**
		 * ����DepartmentMapper
		 */
		@Test
		public void testCRUD() {
			/*
			 * ����1
			 */
	/*		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
			DepartmentMapper dept=  ctx.getBean(DepartmentMapper.class);*/
			System.out.println(departmentMapper);
			departmentMapper.insertSelective(new Department(null,"���Բ�"));
			
		}
		@Test
		public void testCRUD2() {
			System.out.println(empoyeeMapper);
			empoyeeMapper.insertSelective(new Empoyee(2, "Jerry2", "M", "jreey@163.com", 1));
			System.out.println("���");
		}
		/*����*/
		@Test
	public void testCRUD3() {
			System.out.println("��ʼ");
			EmpoyeeMapper mapper=sqlSession.getMapper(EmpoyeeMapper.class);
			
			System.out.println("empoyeeMapper"+empoyeeMapper);
			for(int i=0;i<100;i++) {
				String uid=UUID.randomUUID().toString().substring(0, 5)+i;
				System.out.println(uid);
				mapper.insertSelective(new Empoyee(null, uid, "M", uid+"jreey@163.com", 1));
			}
			System.out.println("�������");
		}
	
	}
