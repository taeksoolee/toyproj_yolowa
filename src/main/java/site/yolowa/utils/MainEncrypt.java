package site.yolowa.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//프로그램 작성에 필요한 기능을 제공하는 클래스
public class MainEncrypt {	
	//문자열을 전달받아 암호화 알고리즘을 이용하여 암호화 변환하여 반환하는 메소드
	public static String encrypt(String source) {
		//암호화된 문자열을 저장하기 위한 변수
		String password="";
		
		try {
			//MessageDigest : 암호화 알고리즘을 이용하여 암호화 처리하는 기능을 제공하는 클래스
			//MessageDigest.getInstance(String algorithm) : 암호화 알고리즘을
			//전달받아 MessageDigest 인스턴스를 반환하는 메소드
			// => NoSuchAlgorithmException 예외 발생 - 예외처리
			//암호화 알고리즘(단방향) : MD5, SHA-1, SHA-256(권장), SHA-512 등 
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			
			//MessageDigest.update(byte[] input) : MessageDigest 인스턴스에
			//암호화 하고자 문자열을 byte 배열로 전달하여 저장하는 메소드
			//String.getBytes() : 문자열을 byte 배열로 변환하여 반환하는 메소드
			md.update(source.getBytes());
			
			//MessageDigest.digest() : MessageDigest 인스턴스에 저장된 byte
			//배열을 암호화 알고리즘을 이용하여 암호화 처리 후 byte 배열로
			//반환하는 메소드
			byte[] digest=md.digest();
			
			//byte 배열의 요소값을 문자열(String 인스턴스)로 변환하여 저장
			// => byte 배열의 요소값에서 불필요한 값 제거 후 16진수의 문자열로 변환하여 저장
			for(int i=0;i<digest.length;i++) {
				password+=Integer.toHexString(digest[i]&0xff);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("[에러]잘못된 암호화 알고리즘을 사용 하였습니다.");
		}
		
		return password;
	}
	
	
}






