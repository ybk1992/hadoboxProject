package com.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.book.BookListCommand;
import com.command.book.BookListDescCommand;
import com.command.book.BookSelectCommand;
import com.command.book.BookUpdateCommand;
import com.command.book.BookViewCommand;
import com.command.book.BookWriteCommand;
import com.command.member.FindIdPwCommand;
import com.command.member.IdCheckCommand;
import com.command.member.JoinCommand;
import com.command.member.LoginCommand;
import com.command.member.MailCheckCommand;
import com.command.member.MailCommand;
import com.command.member.UpdateInfoCommand;
import com.command.member.UpdateMyInfoCommand;
import com.command.write.Command;
import com.command.write.DeleteCommand;
import com.command.write.FileUploadCommand;
import com.command.write.ListCommand;
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
		      case "/main.do":
		    	 command = new BookListDescCommand();
				 command.execute(request, response);
		         viewPage = "main/main.jsp";
		         break;	
		         
		      case "/join.do":
		         viewPage = "main/join.jsp";
		         break;
		         
		      case "/joinOk.do":
		         command = new JoinCommand();
		         command.execute(request, response);
		         viewPage = "main/joinOk.jsp";
		         break;
		         
		      case "/idOk.do":
		         command = new IdCheckCommand();
		         command.execute(request, response);
		         viewPage = "main/idOk.jsp";
		         break;
		         
		      case "/mailOk.do":
		    	  command = new MailCheckCommand();
		    	  command.execute(request, response);
		    	  viewPage = "main/mailOk.jsp";
		    	  break;
		    	  
		      case "/login.do":
		         viewPage = "main/login.jsp";
		         break;
		         
		      case "/loginOk.do":
		         command = new LoginCommand();
		         command.execute(request, response);
		         viewPage = "main/loginOk.jsp";
		         break;
		         	      
		      case "/logout.do":
			     viewPage = "main/logout.jsp";
			     break;
			   

		      case "/findPassword.do":  
		    	  viewPage = "main/findPassword.jsp";   
		    	  break;
			           
		      case "/sendIdPw.do":   
		    	  command = new FindIdPwCommand();   
		    	  command.execute(request, response);   
		    	  viewPage = "main/findPassword2.jsp";   
		    	  break;
		    	  
		      case "/sendMail.do":
			         command = new MailCommand();
			         command.execute(request, response);
			         viewPage = "main/sendMail.jsp";
			         break;
		    	  

		      case "/myPage.do":   
		    	  command = new UpdateMyInfoCommand();   
		    	  command.execute(request, response);   
		    	  viewPage = "main/myPage.jsp";   
		    	  break;
		    	  
		      case "/myPageOk.do":   
		    	  command = new UpdateInfoCommand();   
		    	  command.execute(request, response);   
		    	  viewPage = "main/myPageOk.jsp";   
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
			command = new BookWriteCommand();
			command.execute(request, response);
			viewPage = "book/writeOk.jsp";
			break;
		case "/view.do":
			command = new BookViewCommand();
			command.execute(request, response);
			viewPage = "book/view.jsp";
			break;
		case "/update.do":
			command = new BookSelectCommand();
			command.execute(request, response);
			viewPage = "book/update.jsp";
			break;
		case "/updateOk.do":
			command = new BookUpdateCommand();
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

		case "/book_List.do":
			command = new BookListCommand();
			command.execute(request, response);
			viewPage = "book/book_List.jsp";
			break;

		case "/book_Read.do":
			command = new BookViewCommand();
			command.execute(request, response);
			viewPage = "book/book_Read.jsp";
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

