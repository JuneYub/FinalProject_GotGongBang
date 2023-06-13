package com.spring.gotgongbang.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private String authNumber; 
	// 난수 발생
	
	public void generateVerificationCode() {
		
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int length = 6;

        Random random = new Random();
        StringBuilder code = new StringBuilder();

        
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            code.append(characters.charAt(index));
        }
        System.out.println("인증번호 : " + code);
        authNumber = code.toString();
	}
	
	
	//회원가입 이메일 보낼 양식! 
	public String joinEmail(String email) {
		generateVerificationCode();
		String setFrom = "skeosek3@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[GOTGONGBANG] 회원가입 인증번호 이메일 입니다."; // 이메일 제목 
		String content = 
				
				"<table width='650' border='0' cellspacing='0' cellpadding='0' bgcolor='#f6f5fa' style='font-family:'NanumSquareR', 'NanumSquare', 'Noto Sans KR', 'Apple SD Gothic Neo', '나눔고딕', NanumGothic, '맑은 고딕', 'Malgun Gothic', '돋움', dotum, sans-serif;'>"+
						"<tbody>"+
							"<tr><td style='padding:24px 24px 0 24px;'>"+
								"<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
									"<tbody><tr><td valign='top' style='padding:40px 0 0 20px; font-size:0;'><img src='http://127.0.0.1:9090/gotgongbang/resources/img/main_got.png' alt='GOTGONGBANG' loading='lazy'></td></tr>"+
									"</tbody>"+
								"</table></td></tr>"+
							"<tr><td style='padding: 0 24px;'>"+
								"<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff' style='padding:0px 20px 50px;'>"+
									"<tbody><tr><td style='padding-top: 39px; font-size: 26px; font-family: NanumSquare, sans-serif; font-weight: 700; line-height: 26px;'>회원가입 인증번호</td></tr>"+
									"<tr><td style='padding: 19px 0px 50px; font-family: NanumSquare, sans-serif; font-size: 17px; color: #999; '>회원가입 화면에서 아래 인증번호를 입력 해 주세요.</td></tr>"+
									"<tr><td height='1' bgcolor='#000'></td></tr>"+
									"<tr><td height='65'>"+
										"<table width='100%' height='65' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
											"<tbody><tr><td width='148' style='font-family: NanumSquare, sans-serif; font-size: 16px;text-align: center; line-height: 65px;'>인증번호</td>"+
												"<td width='1' height='23' style='opacity: 0.2;'>"+
													"<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
														"<tbody><tr><td height='3' bgcolor='#fff'></td></tr>"+
															"<tr><td height='17' bgcolor='#000'></td></tr>"+
															"<tr><td height='3' bgcolor='#fff'></td></tr>"+
														"</tbody>"+
													"</table>"+
												"</td>"+
												"<td style='padding-left:57px; font-family: NanumSquare, sans-serif; font-size: 16px; line-height: 65px;'>" + authNumber + "</td>"+
											"</tr></tbody>"+
										"</table>"+
									"</td></tr>"+
									"<tr><td height='1' bgcolor='#000'></td></tr>"+
								"</tbody></table>"+
							"</td></tr>"+
							"<tr><td style='padding: 24px 24px 48px 24px;'>"+
								"<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
								"</table>"+
							"</td></tr>"+
				"</tbody></table>";
				
				
		mailSend(setFrom, toMail, title, content);
		return authNumber;
	}
	
	//아이디찾기 이메일 보낼 양식! 
		public String joinIdEmail(String email) {
			generateVerificationCode();
			String setFrom = "skeosek3@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "[GOTGONGBANG] 아이디찾기 인증번호 이메일 입니다."; // 이메일 제목 
			String content = 
					
					"<table width='650' border='0' cellspacing='0' cellpadding='0' bgcolor='#f6f5fa' style='font-family:'NanumSquareR', 'NanumSquare', 'Noto Sans KR', 'Apple SD Gothic Neo', '나눔고딕', NanumGothic, '맑은 고딕', 'Malgun Gothic', '돋움', dotum, sans-serif;'>"+
							"<tbody>"+
								"<tr><td style='padding:24px 24px 0 24px;'>"+
									"<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
										"<tbody><tr><td valign='top' style='padding:40px 0 0 20px; font-size:0;'><img src='http://127.0.0.1:9090/gotgongbang/resources/img/main_got.png' alt='GOTGONGBANG' loading='lazy'></td></tr>"+
										"</tbody>"+
									"</table></td></tr>"+
								"<tr><td style='padding: 0 24px;'>"+
									"<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff' style='padding:0px 20px 50px;'>"+
										"<tbody><tr><td style='padding-top: 39px; font-size: 26px; font-family: NanumSquare, sans-serif; font-weight: 700; line-height: 26px;'>아이디찾기 인증번호</td></tr>"+
										"<tr><td style='padding: 19px 0px 50px; font-family: NanumSquare, sans-serif; font-size: 17px; color: #999; '>아이디찾기 화면에서 아래 인증번호를 입력 해 주세요.</td></tr>"+
										"<tr><td height='1' bgcolor='#000'></td></tr>"+
										"<tr><td height='65'>"+
											"<table width='100%' height='65' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
												"<tbody><tr><td width='148' style='font-family: NanumSquare, sans-serif; font-size: 16px;text-align: center; line-height: 65px;'>인증번호</td>"+
													"<td width='1' height='23' style='opacity: 0.2;'>"+
														"<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
															"<tbody><tr><td height='3' bgcolor='#fff'></td></tr>"+
																"<tr><td height='17' bgcolor='#000'></td></tr>"+
																"<tr><td height='3' bgcolor='#fff'></td></tr>"+
															"</tbody>"+
														"</table>"+
													"</td>"+
													"<td style='padding-left:57px; font-family: NanumSquare, sans-serif; font-size: 16px; line-height: 65px;'>" + authNumber + "</td>"+
												"</tr></tbody>"+
											"</table>"+
										"</td></tr>"+
										"<tr><td height='1' bgcolor='#000'></td></tr>"+
									"</tbody></table>"+
								"</td></tr>"+
								"<tr><td style='padding: 24px 24px 48px 24px;'>"+
									"<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
									"</table>"+
								"</td></tr>"+
					"</tbody></table>";
					
					
			mailSend(setFrom, toMail, title, content);
			return authNumber;
		}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
