package com.spring_movie.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring_movie.dao.MovieDao;
import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ReservationDto;
import com.spring_movie.dto.ReserveInfoDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

@Service
public class MovieService {

	@Autowired
	MovieDao mvdao;

	@Autowired
	HttpSession session;

	public ModelAndView getCgvMovieList() throws IOException {
		System.out.println("MovieService.getCgvMovieList() 호출");

		ModelAndView mav = new ModelAndView();

		String cgvMovieUrl = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Document doc = Jsoup.connect(cgvMovieUrl).get();

		Elements moiveList_div = doc.select("div.sect-movie-chart"); // class가 sect-movie-chart인 div태그 선택

		Elements movieList_ol = moiveList_div.eq(0).select("ol"); // movieList_div중 첫번째 div에서 ol태그 선택

		ArrayList<MovieDto> cgvMvList = new ArrayList<MovieDto>();

		for (int i = 0; i < movieList_ol.select("li").size(); i++) {
			MovieDto cgvMv = new MovieDto();

			String detailUrl = "http://www.cgv.co.kr"
					+ movieList_ol.select("li").eq(i).select("div.box-image a").eq(0).attr("href"); // 영화 상세링크
			Document detailDoc = Jsoup.connect(detailUrl).get();
			Elements movieView = detailDoc.select("div.sect-base-movie"); // 상세페이지에서 select

			// 영화제목
			String movieTitle = movieView.select("div.box-contents div.title strong").text();

			// 영화 포스터 주소
			String posterUrl = movieView.select("div.box-image a").attr("href");

			// 감독
			String movieDirector = movieView.select("div.box-contents div.spec dl dd a").eq(0).text();

			// 배우
			String movieActors = "";
			movieActors = movieView.select("div.box-contents div.spec dl dd").eq(2).text();

			// 관람연령, 상영시간, 국가
			String[] movieBasic = movieView.select("div.box-contents div.spec dl dd").eq(4).text().split(",");
			String movieGrade = movieBasic[0].trim();
			String movieTime = movieBasic[1].trim();

			// 개봉일
			String movieOpen = movieView.select("div.box-contents div.spec dl dd").eq(5).text();

			// 장르 인덱스
			// dd.on태그를 찾고 그뒤 .next()로 찾아도 된다.
			int genreIndex = movieView.select("div.box-contents div.spec dl dt").size() - 3;
			String movieGenre = movieView.select("div.box-contents div.spec dl dt").eq(genreIndex).text()
					.replace("장르 :", "").trim();

//			System.out.println("movieRank : " + (i + 1) + "등");

//			System.out.println("movieTitle : " + movieTitle);
			cgvMv.setMvtitle(movieTitle);
//			System.out.println("posterUrl : " + posterUrl);
			cgvMv.setMvposter(posterUrl);
//			System.out.println("movieDirector : " + movieDirector);
			cgvMv.setMvpd(movieDirector);
//			System.out.println("movieActors : " + movieActors);
			cgvMv.setMvactor(movieActors);
//			System.out.println("movieGenre : " + movieGenre);
			cgvMv.setMvgenre(movieGenre);
//			System.out.println("movieGrade : " + movieGrade);
			cgvMv.setMvage(movieGrade);
//			System.out.println("movieTime : " + movieTime);
			cgvMv.setMvtime(movieTime);
//			System.out.println("movieOpen : " + movieOpen);
			cgvMv.setMvopen(movieOpen);
			cgvMvList.add(cgvMv);
		}
		System.out.println(cgvMvList);

		for (int i = 0; i < cgvMvList.size(); i++) {
			// 등록된 영화와 중복 확인
			String checkMvTitle = cgvMvList.get(i).getMvtitle();
			String checkMvOpen = cgvMvList.get(i).getMvopen();
			int duplicateResult = mvdao.checkMovie(checkMvTitle, checkMvOpen);
			if (duplicateResult > 0) {
				System.out.println("이미 등록된 영화입니다.");
			} else {
				// 1. 영화코드 생성
				String mvcode = mvdao.getMaxMvCode();
				if (mvcode == null) {
					mvcode = "MV001";
				} else {
					int new_mvcode = Integer.parseInt(mvcode.substring(2)) + 1;
					if (new_mvcode < 10) {
						mvcode = "MV00" + new_mvcode;
					} else if (new_mvcode < 100) {
						mvcode = "MV0" + new_mvcode;
					} else if (new_mvcode < 1000) {
						mvcode = "MV" + new_mvcode;
					} else {
						System.out.println("범위초과");
						return null;
					}

				}

				cgvMvList.get(i).setMvcode(mvcode);
				// 2. 영화정보 insert
				int insertResult = mvdao.insertMovie(cgvMvList.get(i)); // int가 아니라 반환값을 void로 설정하여도 된다(try-catch문이 없으므로
																		// error가 발생시 멈춤)
				if (insertResult > 0) {
					System.out.println(cgvMvList.get(i).getMvtitle() + " 등록성공");
				} else {
					System.out.println(cgvMvList.get(i).getMvtitle() + " 등록실패");
				}
			}

		}

		mav.setViewName("redirect:/movieMain");
		return mav;
	}

	public ModelAndView movieChart() {
		System.out.println("MovieService.movieChart() 호출");

		ModelAndView mav = new ModelAndView();

		// 1. 영화목록 조회
		ArrayList<MovieDto> movieList = mvdao.selectMovieList();
		System.out.println(movieList);
		
		// SQL이 아닌 JAVA로 계산하는 경우 
		/*
		for(int i =0; i < movieList.size(); i++) {
			String mvcode = movieList.get(i).getMvcode();
			ArrayList<ReviewDto> reviewList = mvdao.selectReview(mvcode);
			int rvlike = 0;
			int rvdislike = 0;
			for (int j = 0; j < reviewList.size(); j++) {	// 관람평 공백, 개행 변환
				// 추천, 비추천 계산
				if(reviewList.get(i).getRvrecommend() == 1) {
					rvlike++;
				}else {
					rvdislike++;
				}
			}
			movieList.get(i).setRvlike(rvlike);
			movieList.get(i).setRvdislike(rvdislike);
			
			int totalReservation = mvdao.selectCountReservation();				// 총 예매수
			int mvCountReservation = mvdao.selectMvCountReservation(mvcode);	// 영화 예매수
			double rerate = 100 * (double) mvCountReservation / totalReservation;	// 예매율
			rerate = Math.round(rerate * 100) / 100;
			movieList.get(i).setRerate(rerate);
		}
		*/
		
		
		mav.addObject("movieList", movieList);
		// 2. 영화목록페이지
		mav.setViewName("movie/MovieChart");

		return mav;
	}

	public ModelAndView movieView(String mvcode) {
		System.out.println("MovieService.movieView() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		// 영화 정보 조회
		MovieDto movie = mvdao.selectMovie(mvcode);
		System.out.println(movie);		
		
		// 관람평 목록 조회
		ArrayList<ReviewDto> reviewList = mvdao.selectReview(mvcode);
		/*
		int rvlike = 0;
		int rvdislike = 0;
		*/
		for (int i = 0; i < reviewList.size(); i++) {	// 관람평 공백, 개행 변환
			// 전에 작성한 리뷰는 변환되지 않았으므로 남겨둠
			reviewList.get(i).setRvcomment(reviewList.get(i).getRvcomment().replace(" ", "&nbsp"));
			reviewList.get(i).setRvcomment(reviewList.get(i).getRvcomment().replace("\r\n", "<br>"));	// \r도 개행문자이므로 같이 작성해 주는 것이 좋음
			
			// SQL이 아닌 JAVA로 계산하는 경우 
			// 추천, 비추천 계산
			/*
			if(reviewList.get(i).getRvrecommend() == 1) {
				rvlike++;
			}else {
				rvdislike++;
			}
			*/
		}
		System.out.println(reviewList);
		/*
		movie.setRvlike(rvlike);
		movie.setRvdislike(rvdislike);
		
		int totalReservation = mvdao.selectCountReservation();				// 총 예매수
		int mvCountReservation = mvdao.selectMvCountReservation(mvcode);	// 영화 예매수
		double rerate = 100 * (double) mvCountReservation / totalReservation;
		rerate = Math.round(rerate * 100) / 100;
		movie.setRerate(rerate);
		*/
		
		mav.addObject("movie", movie);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("movie/MovieView");
		return mav;
	}

	public ModelAndView getCgvMovieSchduleList() throws IOException {
		System.out.println("MovieService.getCgvMovieSchduleList() 호출");

		ModelAndView mav = new ModelAndView();

		String cgvMovieUrl = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Document doc = Jsoup.connect(cgvMovieUrl).get();

		Elements moiveList_div = doc.select("div.sect-movie-chart"); // class가 sect-movie-chart인 div태그 선택

		Elements movieList_ol = moiveList_div.eq(0).select("ol"); // movieList_div중 첫번째 div에서 ol태그 선택

		ArrayList<MovieDto> cgvMvList = new ArrayList<MovieDto>();

		for (int i = 0; i < movieList_ol.select("li").size(); i++) {
			MovieDto cgvMv = new MovieDto();

			String detailUrl = "http://www.cgv.co.kr"
					+ movieList_ol.select("li").eq(i).select("div.box-image a").eq(0).attr("href"); // 영화 상세링크
			Document detailDoc = Jsoup.connect(detailUrl).get();
			Elements movieView = detailDoc.select("div.sect-base-movie"); // 상세페이지에서 select

			// 영화제목
			String movieTitle = movieView.select("div.box-contents div.title strong").text();

			// 영화 포스터 주소
			String posterUrl = movieView.select("div.box-image a").attr("href");

			// 감독
			String movieDirector = movieView.select("div.box-contents div.spec dl dd a").eq(0).text();

			// 배우
			String movieActors = "";
			movieActors = movieView.select("div.box-contents div.spec dl dd").eq(2).text();

			// 관람연령, 상영시간, 국가
			String[] movieBasic = movieView.select("div.box-contents div.spec dl dd").eq(4).text().split(",");
			String movieGrade = movieBasic[0].trim();
			String movieTime = movieBasic[1].trim();

			// 개봉일
			String movieOpen = movieView.select("div.box-contents div.spec dl dd").eq(5).text();

			// 장르 인덱스
			// dd.on태그를 찾고 그뒤 .next()로 찾아도 된다.
			int genreIndex = movieView.select("div.box-contents div.spec dl dt").size() - 3;
			String movieGenre = movieView.select("div.box-contents div.spec dl dt").eq(genreIndex).text()
					.replace("장르 :", "").trim();

//			System.out.println("movieRank : " + (i + 1) + "등");

//			System.out.println("movieTitle : " + movieTitle);
			cgvMv.setMvtitle(movieTitle);
//			System.out.println("posterUrl : " + posterUrl);
			cgvMv.setMvposter(posterUrl);
//			System.out.println("movieDirector : " + movieDirector);
			cgvMv.setMvpd(movieDirector);
//			System.out.println("movieActors : " + movieActors);
			cgvMv.setMvactor(movieActors);
//			System.out.println("movieGenre : " + movieGenre);
			cgvMv.setMvgenre(movieGenre);
//			System.out.println("movieGrade : " + movieGrade);
			cgvMv.setMvage(movieGrade);
//			System.out.println("movieTime : " + movieTime);
			cgvMv.setMvtime(movieTime);
//			System.out.println("movieOpen : " + movieOpen);
			cgvMv.setMvopen(movieOpen);
			cgvMvList.add(cgvMv);
		}
		System.out.println(cgvMvList);

		for (int i = 0; i < cgvMvList.size(); i++) {
			// 등록된 영화와 중복 확인
			String checkMvTitle = cgvMvList.get(i).getMvtitle();
			String checkMvOpen = cgvMvList.get(i).getMvopen();
			int duplicateResult = mvdao.checkMovie(checkMvTitle, checkMvOpen);
			if (duplicateResult > 0) {
				System.out.println("이미 등록된 영화입니다.");
			} else {
				// 1. 영화코드 생성
				String mvcode = mvdao.getMaxMvCode();
				if (mvcode == null) {
					mvcode = "MV001";
				} else {
					int new_mvcode = Integer.parseInt(mvcode.substring(2)) + 1;
					if (new_mvcode < 10) {
						mvcode = "MV00" + new_mvcode;
					} else if (new_mvcode < 100) {
						mvcode = "MV0" + new_mvcode;
					} else if (new_mvcode < 1000) {
						mvcode = "MV" + new_mvcode;
					} else {
						System.out.println("범위초과");
						return null;
					}

				}

				cgvMvList.get(i).setMvcode(mvcode);
				// 2. 영화정보 insert
				int insertResult = mvdao.insertMovie(cgvMvList.get(i)); // int가 아니라 반환값을 void로 설정하여도 된다(try-catch문이 없으므로
																		// error가 발생시 멈춤)
				if (insertResult > 0) {
					System.out.println(cgvMvList.get(i).getMvtitle() + " 등록성공");
				} else {
					System.out.println(cgvMvList.get(i).getMvtitle() + " 등록실패");
				}
			}

		}

		mav.setViewName("redirect:/movieMain");
		return mav;
	}

	public ModelAndView movieReservationPage() {
		System.out.println("MovieService.movieReservationPage() 호출");
		ModelAndView mav = new ModelAndView();

		// 1. 영화목록 조회 (예매가능한 영화)
		ArrayList<MovieDto> reMvList = mvdao.selectReserveMvList();
		System.out.println(reMvList);

		ArrayList<TheaterDto> reThList = mvdao.selectReserveThList();
		System.out.println(reThList);

		mav.addObject("reMvList", reMvList);
		mav.addObject("reThList", reThList);
		mav.setViewName("movie/MovieReservationPage");

		return mav;
	}

	public String getThList(String mvcode) {
		System.out.println("MovieService.getThList() 호출");
		ArrayList<TheaterDto> thList = mvdao.getReserveThList(mvcode);
		System.out.println(thList);
		Gson gson = new Gson();
		String thList_json = gson.toJson(thList);
		System.out.println(thList_json);
		return thList_json;
	}

	public String getScDateList(String mvcode, String thcode) {
		System.out.println("MovieService.getScDateList() 호출");
		ArrayList<ScheduleDto> scDateList = mvdao.getReserveScDateList(mvcode, thcode);
		System.out.println(scDateList);
		Gson gson = new Gson();
		String scDateList_json = gson.toJson(scDateList);
		System.out.println(scDateList_json);
		return scDateList_json;
	}

	public String getScRoomTimeList(String mvcode, String thcode, String scdate) {
		System.out.println("MovieService.getScRoomTimeList() 호출");
		ArrayList<ScheduleDto> scRoomTimeList = mvdao.getScRoomTimeList(mvcode, thcode, scdate);
		System.out.println(scRoomTimeList);
		Gson gson = new Gson();
		String scRoomTimeList_json = gson.toJson(scRoomTimeList);
		System.out.println(scRoomTimeList_json);
		return scRoomTimeList_json;
	}

	public ModelAndView movieReservation(ReservationDto reservation, RedirectAttributes ra) {
		System.out.println("MovieService.movieReservation() 호출");
		String recode = "RE";
		String getMaxRecode = mvdao.getMaxReCode();
		if (getMaxRecode == null) {
			recode += "001";
		} else {
			int codeNum = Integer.parseInt(getMaxRecode.substring(2)) + 1;
			if (codeNum < 10) {
				recode += "00" + codeNum;
			} else if (codeNum < 100) {
				recode += "0" + codeNum;
			} else if (codeNum < 1000) {
				recode += codeNum;
			} else {
				System.out.println("예약범위 초과");
				return null;
			}
		}
		reservation.setRecode(recode);
		System.out.println(reservation);
		ModelAndView mav = new ModelAndView();

		try {
			// 성공
			mvdao.movieReservation(reservation);
			ReserveInfoDto reserveMsg = mvdao.selReserveInfo(recode);
			ra.addFlashAttribute("reserveMsg", reserveMsg);
			mav.setViewName("redirect:/movieMain");
		} catch (Exception e) {
			// 실패
			ra.addFlashAttribute("msg", "예약처리에 실패하였습니다.");
			mav.setViewName("redirect:/movieReservationPage");
		}

		return mav;
	}

	public ModelAndView movieReservationList(RedirectAttributes ra) {
		System.out.println("MovieService.movieReservationList() 호출");

		ModelAndView mav = new ModelAndView();

		String remid = (String) session.getAttribute("loginId");
		if (remid == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			mav.setViewName("redirect:/memberLoginForm");
		} else {
			// 1. 영화예매목록 조회
			// session에서 loginid조회
			ArrayList<ReserveInfoDto> reservationList = mvdao.reservationList(remid);

			System.out.println(reservationList);
			/*
			for(int i = 0; i < reservationList.size(); i++) {
				ReviewDto review = mvdao.selReview(reservationList.get(i).getRecode());
				System.out.println("review : " + review);
				String rvcomment = review.getRvcomment();
				rvcomment = rvcomment.replace(" ", "&nbsp");
				rvcomment = rvcomment.replace("\n", "");
				reservationList.get(i).setReview(review);
			}
			System.out.println(reservationList);
			*/
			mav.addObject("reservationList", reservationList);

			// 2. 영화예매목록페이지 이동
			mav.setViewName("movie/ReservationList");
		}
		return mav;
	}

	public ModelAndView cancelReservation(String recode, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		try {
			mvdao.cancelReservation(recode);
			ra.addFlashAttribute("msg", "예매 취소되었습니다.");
			mav.setViewName("redirect:/movieReservationList");
		} catch (Exception e) {
			ra.addFlashAttribute("msg", "예매 취소에 실패하였습니다.");
			mav.setViewName("redirect:/movieReservationList");
		}

		return mav;
	}

	public ModelAndView reviewWrite(ReviewDto reviewInfo, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		reviewInfo.setRvcomment(reviewInfo.getRvcomment().replace(" ", "&nbsp"));
		reviewInfo.setRvcomment(reviewInfo.getRvcomment().replace("\r\n", "<br>"));
		mvdao.insertReview(reviewInfo);
		mav.setViewName("redirect:/movieView?mvcode=" + reviewInfo.getRvmvcode());
		ra.addFlashAttribute("msg", "관람평이 작성 되었습니다.");
		return mav;
	}

	public String reviewView(String recode) {
		ReviewDto review = mvdao.reviewInfo(recode);
		System.out.println(review);
		Gson gson = new Gson();
		String review_json = gson.toJson(review);
		System.out.println(review_json);
		return review_json;
	}

	public String getMyReview(String rvmvcode, String rvmid) {
		System.out.println("MovieService.getMyReview() 호출");
		System.out.println("rvmvcode : " + rvmvcode + " | rvmid : " + rvmid);
		ArrayList<ReviewDto> myReview = mvdao.getMyReview(rvmvcode, rvmid);
		System.out.println(myReview);
		Gson gson = new Gson();
		String myReview_json = gson.toJson(myReview);
		System.out.println(myReview_json);
		return myReview_json;
	}

	public String myReviewView(String rvrecode) {
		System.out.println("MovieService.myReviewView() 호출");
		System.out.println("rvrecode : " + rvrecode);
		ReserveInfoDto myReviewView = mvdao.selReserveInfo(rvrecode);
		ReviewDto review = mvdao.reviewInfo(rvrecode);
		System.out.println(review);
		myReviewView.setReview(review);
		Gson gson = new Gson();
		String myReviewView_json = gson.toJson(myReviewView);
		return myReviewView_json;
	}

	public ModelAndView reviewModify(ReviewDto review) {
		System.out.println("MovieService.reviewModify() 호출");
		System.out.println(review.getRvcomment().substring(0,5));
		if(!review.getRvcomment().substring(0,5).equals("[수정됨]")) {
			review.setRvcomment("[수정됨]\n"+ review.getRvcomment());
			System.out.println("[수정됨] 작성");
		}
		System.out.println(review.getRvcomment());
		ModelAndView mav = new ModelAndView();
		mvdao.reviewModify(review);
		mav.setViewName("redirect:/movieView?mvcode=" + review.getRvmvcode());
		return mav;
	}

	public ModelAndView searchList(String searchWord) {
		System.out.println("MovieService.reviewModify() 호출");
		ModelAndView mav = new ModelAndView();
		
		searchWord = "%"+searchWord+"%";
		// 예매 가능한 영화목록에서 찾기
		ArrayList<MovieDto> searchScMvResult = mvdao.searchMovieList(searchWord, "schedule");
		System.out.println(searchScMvResult);
		// 전체 영화 목록에서 찾기
		ArrayList<MovieDto> searchMvResult = mvdao.searchMovieList(searchWord, "");
		System.out.println(searchMvResult);
		mav.addObject("searchScMvResult", searchScMvResult);
		mav.addObject("searchMvResult", searchMvResult);
		mav.setViewName("SearchPage");
		return mav;
	}

}
