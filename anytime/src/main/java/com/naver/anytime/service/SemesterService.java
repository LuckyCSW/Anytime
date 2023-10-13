package com.naver.anytime.service;

import java.util.List;

import com.naver.anytime.domain.Semester;

public interface SemesterService {

	public int insert(Semester semester);

	public List<Semester> getSemestersByUserId(int userId);
	
	
}