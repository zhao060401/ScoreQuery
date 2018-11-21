package com.jrome.crud.bean;

import org.hibernate.validator.constraints.Email;

public class Empoyee {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emp.emp_id
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    private Integer empId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emp.emp_name
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    private String empName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emp.gendar
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    private String gendar;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emp.email
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    private String email;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emp.d_id
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    private Integer dId;
    private Department department;

    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emp.emp_id
     *
     * @return the value of tbl_emp.emp_id
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public Integer getEmpId() {
        return empId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emp.emp_id
     *
     * @param empId the value for tbl_emp.emp_id
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emp.emp_name
     *
     * @return the value of tbl_emp.emp_name
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public String getEmpName() {
        return empName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emp.emp_name
     *
     * @param empName the value for tbl_emp.emp_name
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emp.gendar
     *
     * @return the value of tbl_emp.gendar
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public String getGendar() {
        return gendar;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emp.gendar
     *
     * @param gendar the value for tbl_emp.gendar
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public void setGendar(String gendar) {
        this.gendar = gendar == null ? null : gendar.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emp.email
     *
     * @return the value of tbl_emp.email
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emp.email
     *
     * @param email the value for tbl_emp.email
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emp.d_id
     *
     * @return the value of tbl_emp.d_id
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public Integer getdId() {
        return dId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emp.d_id
     *
     * @param dId the value for tbl_emp.d_id
     *
     * @mbg.generated Wed May 16 23:39:22 CST 2018
     */
    public void setdId(Integer dId) {
        this.dId = dId;
    }

	public Empoyee(Integer empId, String empName, String gendar, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gendar = gendar;
		this.email = email;
		this.dId = dId;
	}

	public Empoyee() {
		super();
		// TODO Auto-generated constructor stub
	}
}