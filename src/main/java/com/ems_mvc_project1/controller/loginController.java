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


@WebServlet("/logins")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		DBServiceImplModel service = new DBServiceImplModel();
		service.connectDb();
		boolean status = service.dataValidation(email,password);
		if(status) {
			HttpSession session = request.getSession(true);
			session.setAttribute("email", email);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registration.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("result", "Please validate your email id and password!");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			
		}
	}

}
