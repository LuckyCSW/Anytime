package com.naver.anytime.service;

import java.util.List;

import com.naver.anytime.domain.Member;
import com.naver.anytime.domain.School;

public interface MemberService {

	public int isId(String id, String pass);

	public int isId(String id);

	public int isNickname(String nickname);

	public int getSchoolIdByName(String campusName);

	public int insert(Member m);

	public Member member_info(String id);

	public void delete(String id);

	public int update(Member m);

	public List<Member> getSearchList(int index, String search_word, int page, int limit);

	public int getSearchListCount(int index, String search_word);

	public Member findMemberByUserId(int user_id);

	public String findIdByEmail(String email);

	void changePassword(String login_id, String password);

	// 윤희
	public String getSchoolDomain(String id);

	public Member getLoginMember(String id);

	public int getSchoolId(String id);

	public School getSchool(String id);
}
