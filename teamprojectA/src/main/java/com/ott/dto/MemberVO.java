package com.ott.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class MemberVO {
	private String userid;
	private int admin;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private String address;
	private String detailAddress;
}
