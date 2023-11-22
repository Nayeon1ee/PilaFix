package com.dev.pilafix.member.reserve.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.reserve.ReservService;

@Service
public class ReservServiceImpl implements ReservService {
	
	@Autowired
	private ReservDAO dao;

}
