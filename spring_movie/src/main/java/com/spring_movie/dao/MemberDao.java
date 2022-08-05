package com.spring_movie.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring_movie.dto.MemberDto;

public interface MemberDao {

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MBIRTH, MEMAIL, MADDRESS, MPROFILE, MSTATE) "
			+ "VALUES (#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth}, 'YYYY-MM-DD'), #{memail}, #{maddress}, #{mprofile}, 1)")
	int insertMember(MemberDto member);

	@Select("SELECT COUNT(*) FROM MEMBERS WHERE MID = #{inputId}")	// 매개변수를 쿼리문에 넣을때 : : #{변수이름}
	int memberIdCheck(String inputId);

//	String memberLogin(@Param("loginId") String loginId, @Param("loginPw") String loginPw);

	@Select("SELECT MID, MPROFILE, MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto memberLogin(MemberDto loginMember);


	// 매개변수가 여러개일때는 매개변수 앞에 @Param("쿼리문에 사용할 이름")을 작성한다.
	// 일반적으로는 변수와 같은 이름으로 작성한다.
	/*
	@Select("SELECT COUNT(*) FROM MEMBERS WHERE MID = #{inputId} AND MPW = #{inputPw}")	
	ex) 
	int memberIdCheck(@Param("inputId") String inputId, @Param("inputPw") String inputPw);
	*/
	
	@Select("SELECT MID, MPW, MNAME, TO_CHAR(MBIRTH, 'YYYY-MM-DD') AS MBIRTH, MEMAIL, MADDRESS, MPROFILE, MSTATE FROM MEMBERS WHERE MID = #{mid}")
	// mybatis는 column이름과 필드이름이 같으면 들어가는 방식이므로 TO_CHAR등을 이용해서 column이름이 바뀌게되면 column이름을 재설정한다.
	MemberDto getMemberView(String mid);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{kakaoId}")
	MemberDto kakaoLogin(String kakaoId);

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MEMAIL, MPROFILE, MSTATE) VALUES (#{mid}, '12345678', #{mname}, #{memail}, #{mprofile}, 2)")
	void insertKakaoMember(@Param("mid") String kakaoId, @Param("memail") String kakaoEmail, @Param("mname") String kakaoNickname, @Param("mprofile") String kakaoProfile);

	
}
