package com.spring_movie.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring_movie.dto.MemberDto;
import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

public interface AdminDao {

	@Select("SELECT MVCODE, MVTITLE, MVPD, MVACTOR, MVGENRE, MVAGE, MVTIME, TO_CHAR(MVOPEN, 'YYYY-MM-DD') AS MVOPEN, MVPOSTER, MVSTATE FROM MOVIES")
	ArrayList<MovieDto> selectMovieList();
	
	@Select("SELECT * FROM THEATERS")
	ArrayList<TheaterDto> selectTheaterList();

	@Select("SELECT SCMVCODE, SCTHCODE, SCROOM, TO_CHAR(SCDATE, 'YYYY-MM-DD') AS SCDATE, TO_CHAR(SCDATE, 'HH24:MI') AS SCTIME FROM SCHEDULES WHERE SCMVCODE = #{scmvcode} AND SCDATE = #{scdate}")
	ArrayList<ScheduleDto> selectMvDateScheduleList(@Param("scmvcode") String scmvcode, @Param("scdate") String scdate);

	void changeMvstate(@Param("mvcode") String mvcode, @Param("mvstate") int mvstate);

	/*
	@Select("SELECT MVCODE, MVTITLE, MVPD, MVACTOR, MVGENRE, MVAGE, MVTIME, TO_CHAR(MVOPEN, 'YYYY-MM-DD') AS MVOPEN, MVPOSTER, MVSTATE FROM MOVIES WHERE MVCODE = #{mvcode}")
	*/
	MovieDto selectMovie(String mvcode);

	ArrayList<ReviewDto> selectReview(String mvcode);

	@Update("UPDATE MOVIES SET MVPD = #{mvpd}, MVACTOR = #{mvactor}, MVGENRE = #{mvgenre}, MVAGE = #{mvage}, MVTIME = #{mvtime}, MVOPEN = #{mvopen} WHERE MVCODE = #{mvcode}")
	void modifyMovie(MovieDto movie);

	void changeThstate(@Param("thcode") String thcode, @Param("thstate") int thstate);

	@Select("SELECT * FROM THEATERS WHERE THCODE = #{thcode}")
	TheaterDto selectTheater(String thcode);

	@Update("UPDATE THEATERS SET THNAME = #{thname}, THADDR = #{thaddr}, THTEL = #{thtel} WHERE THCODE = #{thcode}")
	int modifyTheater(TheaterDto theater);

	@Insert("INSERT INTO SCHEDULES (SCROOM, SCDATE, SCTHCODE, SCMVCODE) VALUES (#{scroom}, TO_DATE(#{scdate}, 'YYYY-MM-DD HH24:MI:SS'), #{scthcode}, #{scmvcode})")
	int insertSchedule(ScheduleDto schedule);

	ArrayList<ScheduleDto> getScRoomTime(@Param ("scthcode") String scthcode, @Param ("scdate") String scdate);

	@Select("SELECT * FROM MEMBERS")
	ArrayList<MemberDto> selectMemberList();

	void updateMstate(@Param("mid") String mid, @Param("mstate") String mstate);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid}")
	MemberDto selectMember(String mid);
	
}
