package com.jrome.crud.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//���صĽ����� 100�ɹ���200ʧ��
	private int code;
	//������ʾ��Ϣ
	private String msg;
	//���ظ������������
	private Map<String, Object> map=new HashMap<String, Object>();
	
	public static Msg success() {
		Msg result=new Msg();
		result.setCode(100);
		result.setMsg("����ɹ�");
		return result;
	}
	
	public static Msg fail() {
		Msg result=new Msg();
		result.setCode(200);
		result.setMsg("����ʧ��");
		return result;
	}
	
	public Msg add(String key,Object value) {
		this.getMap().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	

}
