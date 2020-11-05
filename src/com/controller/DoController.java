package com.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.member.IdCheckCommand;
import com.command.member.JoinCommand;
import com.command.member.LoginCommand;
import com.command.write.Command;
import com.command.write.DeleteCommand;
import com.command.write.FileUploadCommand;
import com.command.write.ListCommand;
import com.command.write.SelectCommand;
import com.command.write.UpdateCommand;
import com.command.write.ViewCommand;
import com.command.write.WriteCommand;

@WebServlet("*.do")
public class DoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		
		// URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		// 컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null;  // 어떠한 로직을 수행할지 결정
		String viewPage =  null;  //  어떠한 페이지(뷰)를 보여줄지 결정
		
		// 컨트롤러는 커맨드에 따라 로직 수행
		// 결과를 보낼 view 를 결정
		switch(com) {
		case "/main/join.do":
			viewPage = "join.jsp";
			break;
			
		case "/main/joinOk.do":
			command = new JoinCommand();
			command.execute(request, response);
			viewPage = "joinOk.jsp";
			break;
			
		case "/main/login.do":
			viewPage = "login.jsp";
			break;
			
		case "/main/loginOk.do":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;
			
		case "/main/idOk.do":
			command = new IdCheckCommand();
			command.execute(request, response);
			viewPage = "idOk.jsp";
			break;
			
		case "/list.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "book/list.jsp";
			break;
			
		case "/write.do":
			viewPage = "book/write.jsp";
			break;
			
		case "/writeOk.do":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "book/writeOk.jsp";
			break;
		case "/view.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "book/view.jsp";
			break;
		case "/update.do":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "book/update.jsp";
			break;
		case "/updateOk.do":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "book/updateOk.jsp";
			break;
			
		case "/deleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "book/deleteOk.jsp";
			break;
			
		// 웹에디터용 파일 업로드 처리
		case "/fileUpload.do":
			new FileUploadCommand().execute(request, response);
			break;
		}	
		
		// 위에서 결정된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	} // end actionDo()
	

}

