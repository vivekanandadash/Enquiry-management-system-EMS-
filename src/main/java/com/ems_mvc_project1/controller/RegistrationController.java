package com.ems_mvc_project1.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ems_mvc_project1.model.DBServiceImplModel;

@WebServlet("/registration")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registration.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession(false);
			session.setMaxInactiveInterval(10);
			
			if(session.getAttribute("email")!=null) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String number = request.getParameter("number");
			String course = request.getParameter("course");
			
			
//			validating the user registration and check that user put the right mobile number

			if (name == null || name.trim().equals("") || email == null || email.trim().equals("") || number == null
					|| number.trim().equals("") || course == null || course.trim().equals("")) {
				request.setAttribute("result", "Invalid Submission! first fill all the input details then Submit!");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registration.jsp");
				rd.forward(request, response);
			} else if (number.length() < 10) {
				request.setAttribute("result",
						"This number " + number + " is Lesser than 10 digit,Please Re-fill the form !");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registration.jsp");
				rd.forward(request, response);
			} else if (number.length() > 10) {
				request.setAttribute("result",
						"This number " + number + " is Greter than 10 digit,Please Re-fill the form !");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registration.jsp");
				rd.forward(request, response);
			} else {
				
//				connect to database to store the user data if all the form is correct 

				DBServiceImplModel service = new DBServiceImplModel();
				service.connectDb();
				service.saveRegistration(name, email, number, course);

				request.setAttribute("result", "Your Data is saved in the DataBase! Thank You!");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registration.jsp");
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
