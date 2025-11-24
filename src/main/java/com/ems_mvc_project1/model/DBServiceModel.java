package com.ems_mvc_project1.model;

import java.sql.ResultSet;

public interface DBServiceModel {
  public void connectDb();
  public boolean dataValidation(String email,String password);
  public void saveRegistration(String name,String email,String number,String course);
  public ResultSet getRegistrationList();
  public void deleteRegistration(String DeleteRow);
  public boolean updateValidation(String email, String number);
}
