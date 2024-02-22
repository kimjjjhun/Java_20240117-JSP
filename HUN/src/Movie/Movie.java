package Movie;

import java.awt.print.Printable;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
@AllArgsConstructor
public class Movie {
	
	private long id;              //영화 고유번호
	private String title;         //영화 제목
	private String genre;         //영화 장르
	
	private static final File file = new File("src/Movie/movies.txt");   // 영화를 저장한 텍스트문서 file에 저장

}
public static ArrayList<Movie> findAll(){
	ArrayList<Movie> movies = new ArrayList<Movie>();
	BufferedReader br = null;
	String line = null;
	try {
	               br = new BufferedReader(new FileReader(file));
	               
	               while((line = br.readLine())!=null) {
	            	   String[] temp = line.split(",");
	            	   Movie m = new Movie(Long.parseLong(temp[0]),
	            			   temp[1],
	            			   temp[2]);
	}
	               br.close();  // 모두 불러왔으면 통로를 끊어준다.
}catch (FileNotFoundException e) {
	e.printStackTrace();
}catch (IOException e) {
	e.printStackTrace();
}
	return movies;
}
}
