package com.ems_mvc_project1.controller;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;

import com.ems_mvc_project1.model.DBServiceImplModel;


@WebServlet("/UpdateRegistration")
public class UpdateRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String email = request.getParameter("email");
	  String number = request.getParameter("number");
	  
	  request.setAttribute("email", email);
	  request.setAttribute("number", number);
	  
	  RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/updateRegistration.jsp");
	  rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//get data from view
			String email = request.getParameter("email");
			String number = request.getParameter("number");
			
			HttpSession session = request.getSession(false);
			session.setMaxInactiveInterval(1800);
			if(session.getAttribute("email")!=null) {
			
			if(number.length()!=10) {
				request.setAttribute("result", "Your Number must be exactly 10-Digit! your number:"+number+
			   "<br>Go to<a href='registrationList'> Registration list <a/> and try again");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/updateRegistration.jsp");
				rd.forward(request, response);
				return;
			}
			
			DBServiceImplModel service = new DBServiceImplModel();
			service.connectDb();
			boolean status  = service.updateValidation(email,number);
			
			
			if(status) {
				ResultSet result = service.getRegistrationList();
				request.setAttribute("result", result);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/RegistrationList.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("result", "Please re-Evalute your Email :"+email+
				"<br>Go to<a href='registrationList'> Registration list <a/> and try again");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/updateRegistration.jsp");
				rd.forward(request, response);
			}
			
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
}

}
