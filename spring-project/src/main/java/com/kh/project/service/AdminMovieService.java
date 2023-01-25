package com.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.dao.AdminMovieDao;
import com.kh.project.vo.MovieVo;
import com.kh.project.vo.UserVo;

@Service
public class AdminMovieService {
	
	@Autowired
	private AdminMovieDao dao;
	
	public List<MovieVo> getMovieList() {
		return dao.getMovieList();
	}
	
	public List<MovieVo> getTitleList() {
		return dao.getTitleList();
	}
	
	public MovieVo getMovieDetail(int movie_no) {
		return dao.getMovieDetail(movie_no);
	}

	public boolean insertMovie(MovieVo movieVo) {
		return dao.insertMovie(movieVo);
	}
	
	public boolean updateMovie(MovieVo movieVo) {
		return dao.updateMovie(movieVo);
	}
	
	public boolean deleteMovie(int movie_no) {
		return dao.deleteMovie(movie_no);
	}
	
	// 상영관 관리
	public List<String> getCinemaList() {
		return dao.getCinemaList();
		
	}
	
	public boolean insertCinemaName(String cinema_name) {
		return dao.insertCinemaName(cinema_name);
	}
	
	// 유저 관리
	public List<UserVo> getUser() {
		return dao.getUser();
	}
	
	public UserVo getUserByNo(int user_no) {
		return dao.getUserByNo(user_no);
	}
	
	public boolean updatePoint(int user_no, int point) {
		return dao.updatePoint(user_no, point);
	}
}
