package com.kh.project.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.dao.AdminMovieDao;
import com.kh.project.dao.CinemaDao;
import com.kh.project.dao.SampleDao;
import com.kh.project.vo.CinemaVo;
import com.kh.project.vo.SampleVo;
import com.kh.project.vo.SeatDto;

@Service
public class CinemaService {
	
	@Autowired
	private CinemaDao dao;
	
	@Autowired
	private AdminMovieDao adminDao;
	
	public List<String> getMovieList() {
		return dao.getMovieList();
	}

	public List<String> getCinemaList() {
		return dao.getCinemaList();
	}

	public List<Date> getTimeList() {
		return dao.getTimeList();
	}

	public List<Date> getDateList() {
		return dao.getDateList();
	}
	
	public List<String> getCinemaList(int cinema_movie) {
		return dao.getCinemaList(cinema_movie);
	}

	public List<Timestamp> getDateList(String cinema_name, int cinema_movie_no) {
		System.out.println("timestamp : " + dao.getDateList(cinema_name, cinema_movie_no));
		return dao.getDateList(cinema_name, cinema_movie_no);
	}

	public List<Date> getTimeList(String cinema_name, int cinema_movie_no, String day) {
		return dao.getTimeList(cinema_name, cinema_movie_no, day);
	}

	public int getSeatCol(String cinema_name, int cinema_movie_no, String cinema_time) {
		return dao.getSeatCol(cinema_name, cinema_movie_no, cinema_time);
	}

	public List<CinemaVo> getSeatAll(String cinema_name, int cinema_movie_no, String cinema_time) {
		return dao.getSeatAll(cinema_name, cinema_movie_no, cinema_time);
	}

	public int getSeatsLeft(String cinema_name, int cinema_movie_no, String cinema_time) {
		return dao.getSeatsLeft(cinema_name, cinema_movie_no, cinema_time);
	}

	@Transactional
	public boolean addCinema(CinemaVo vo, List<SeatDto> list) {
		System.out.println("list : " + list);
		System.out.println();
		System.out.println("vo.getCinema_name() : " + vo.getCinema_name());
		List<String> cinemaList = adminDao.getCinemaList();
		boolean isExist = false;
		for (String str : cinemaList) {
			if (str.equals(vo.getCinema_name())) {
				isExist = true;
				break;
			}
		}
		if (isExist == false) {
			adminDao.insertCinemaName(vo.getCinema_name());
		}
		boolean result2 = false;
		for(SeatDto dto : list) {
			result2 = dao.addCinema(vo, dto);
		}
		if (result2 == true) {
			return true;
		}
		return false;
	}
}
