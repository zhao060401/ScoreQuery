package com.jrome.crud.test;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.test.web.servlet.setup.StandaloneMockMvcBuilder;

import com.jrome.crud.controller.DepartmentController;

public class MockTest {
	@Test
	public void testempsPage() throws Exception {
		DepartmentController departmentController=new DepartmentController();
		MockMvc mockMvc=MockMvcBuilders.standaloneSetup(departmentController).build();
		mockMvc.perform(MockMvcRequestBuilders.get("/")) .andExpect(view().name("depts"));
	}

}
