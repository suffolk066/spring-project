package com.kh.project.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class MovieShuffle {

	public static String shuffle() {
		String[] movies = {"OJH2XIUs0bU", "7Q70_m-59O8", 
				"-ZwcFccjGwQ", "SA2-nvS_Vlo"};
		List<String> list = Arrays.asList(movies);
		Collections.shuffle(list);
		String playList = "";
		for (String str : list) {
			playList += str + ",";
		}
		playList = playList.substring(0, playList.length()-1);
		return playList;
	}
}
