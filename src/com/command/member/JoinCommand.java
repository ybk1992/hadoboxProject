package com.command.member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import com.command.write.Command;
import com.lec.beans.MemberDAO;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		
		//---------------------------------------
		// 1. MultipartRequest 객체 생성 --> 파일 업로드 됨.
		ServletContext context = request.getServletContext();
		// 서블릿 상의 upload 폴더 경로 가져오기
		String saveDirectory = context.getRealPath("upload");
		System.out.println("업로드 경로: " + saveDirectory);
		
		int maxPostSize = 5 * 1024 * 1024;  // 최대 5M
		String encoding = "utf-8";  // 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy();  // 중복파일명에 대한 rename 정책
		MultipartRequest multi = null;
		
		// MultipartRequest 생성 단계에서 이미 파일은 저장됨.
		try {
			multi = new MultipartRequest(
					request,
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
		} catch(IOException e1) {
			e1.printStackTrace();
		}		
		
		//----------------------------------------
		// 2. 업로드된 파일의 '원본이름(들)' 과 '저장된 이름(들)' 받아오기
		List<String> originalFileNames = new ArrayList<String>();
		List<String> fileSystemNames = new ArrayList<String>();
		String fileSystemName ="";
		Enumeration names = multi.getFileNames();  // type='file' 요소 name 들 추출
		while(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			String originalFileName = multi.getOriginalFileName(name);
			fileSystemName = multi.getFilesystemName(name);
			System.out.println("첨부파일: " + originalFileName + "->" + fileSystemName);
			
			if(originalFileName != null && fileSystemName != null) {
				originalFileNames.add(originalFileName);
				fileSystemNames.add(fileSystemName);
			}
		} // end while
		
		//----------------------------------------
		// 3.  게시글 및 첨부파일 -> DB 저장
		// 입력한 값(parameter) 받아오기
		String mem_userid = multi.getParameter("mem_userid");
		String mem_password = multi.getParameter("mem_password");
		String mem_username = multi.getParameter("mem_username");
		String mem_phone = multi.getParameter("mem_phone");
		String mem_email = multi.getParameter("mem_email");
		String mem_zipcode = multi.getParameter("mem_zipcode");
		String mem_address1 = multi.getParameter("mem_address1");
		String mem_address2 = multi.getParameter("mem_address2");
		String mem_image = saveDirectory+"\\"+fileSystemName;

		

		
		// 유효성 체크
		if(mem_userid != null && mem_password != null && mem_username != null && mem_email != null &&
				mem_userid.trim().length() > 0 && mem_password.trim().length() > 0 && mem_username.trim().length() > 0 && mem_email.trim().length() > 0) {
		try {
				// ★ 첨부파일 정보도 같이 INSERT
				//cnt = dao.insert(subject, content, name, originalFileNames, fileSystemNames);
				
				cnt = dao.insert(mem_userid, mem_email, mem_password, mem_username, mem_phone, mem_zipcode, mem_address1, mem_address2, mem_image);

			} catch(SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		
		request.setAttribute("result", cnt);
	}

}

