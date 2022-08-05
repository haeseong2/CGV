package com.spring_movie.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ReservationDto;
import com.spring_movie.dto.ReserveInfoDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

public interface MovieDao {

	@Select("SELECT COUNT(*) FROM MOVIES WHERE MVTITLE = #{mvtitle} AND MVOPEN = TO_DATE(#{mvopen}, 'YYYY-MM-DD')")
	int checkMovie(@Param("mvtitle") String checkMvTitle, @Param("mvopen") String checkMvOpen);

	@Select("SELECT MAX(MVCODE) AS MVCODE FROM MOVIES")
	String getMaxMvCode();

	@Insert("INSERT INTO MOVIES(MVCODE, MVTITLE, MVPD, MVACTOR, MVGENRE, MVAGE, MVTIME, MVOPEN, MVPOSTER) VALUES(#{mvcode}, #{mvtitle}, #{mvpd}, #{mvactor}, #{mvgenre}, #{mvage}, #{mvtime}, TO_DATE(#{mvopen}, 'YYYY-MM-DD'), #{mvposter})")
	int insertMovie(MovieDto cgvMovie);

	ArrayList<MovieDto> selectMovieList();

	MovieDto selectMovie(String mvcode);

	ArrayList<MovieDto> selectReserveMvList();

	ArrayList<TheaterDto> getReserveThList(String mvcode);

	ArrayList<TheaterDto> selectReserveThList();

	ArrayList<ScheduleDto> getReserveScDateList(@Param("mvcode") String mvcode, @Param("thcode") String thcode);

	ArrayList<ScheduleDto> getScRoomTimeList(@Param("mvcode") String mvcode, @Param("thcode") String thcode, @Param("scdate") String scdate);

	@Insert("INSERT INTO RESERVATION(RECODE, REMID, RESCTHCODE, RESCROOM, RESCDATE, REAMOUNT) VALUES(#{recode}, #{remid}, #{rescthcode}, #{rescroom}, TO_DATE(#{rescdate}, 'YYYY-MM-DD HH24:MI'), #{reamount})")
	void movieReservation(ReservationDto reservation);

	@Select("SELECT MAX(RECODE) AS RECODE FROM RESERVATION")
	String getMaxReCode();

	ArrayList<ReserveInfoDto> reservationList(String remid);

	@Delete("DELETE FROM RESERVATION WHERE RECODE = #{recode}")
	void cancelReservation(String recode);

	ReserveInfoDto selReserveInfo(String recode);

	@Insert("INSERT INTO REVIEW(RVRECODE, RVMID, RVMVCODE, RVCOMMENT, RVDATE, RVRECOMMEND) VALUES(#{rvrecode}, #{rvmid}, #{rvmvcode}, #{rvcomment}, SYSDATE, #{rvrecommend})")
	void insertReview(ReviewDto reviewInfo);

	ArrayList<ReviewDto> selectReview(String mvcode);

	@Select("SELECT * FROM REVIEW WHERE RVRECODE = #{recode}")
	ReviewDto reviewInfo(String recode);

	ArrayList<ReviewDto> getMyReview(@Param("rvmvcode") String rvmvcode, @Param("rvmid") String rvmid);

	@Select("SELECT COUNT(*) FROM RESERVATION")
	int selectCountReservation();

	int selectMvCountReservation(String mvcode);

	@Update("UPDATE REVIEW SET RVCOMMENT = #{rvcomment}, RVRECOMMEND = #{rvrecommend} WHERE RVRECODE = #{rvrecode}")
	void reviewModify(ReviewDto review);

//	ArrayList<MovieDto> searchScMovieList(String searchWord, boolean check);
	
	ArrayList<MovieDto> searchMovieList(@Param("searchWord") String searchWord, @Param("scCheck") String scCheck);

	/*
	@Select("SELECT * FROM REVIEW WHERE RVRECODE = #{recode}")
	ReviewDto selReview(String recode);
	 */
}
