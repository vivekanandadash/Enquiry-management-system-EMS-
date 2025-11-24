package com.ems_mvc_project1.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

import com.ems_mvc_project1.model.DBServiceImplModel;


@WebServlet("/DeleteRegistration")
public class DeleteRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String DeleteRow = request.getParameter("email");
	    DBServiceImplModel service = new DBServiceImplModel();
	    service.connectDb();
	    service.deleteRegistration(DeleteRow);
	    ResultSet result = service.getRegistrationList();
	    
	    request.setAttribute("result", result);
	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/RegistrationList.jsp");
	    rd.forward(request, response);
	    
	    
	  
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
