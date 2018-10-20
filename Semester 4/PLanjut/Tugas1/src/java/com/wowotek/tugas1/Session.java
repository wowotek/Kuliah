package com.wowotek.tugas1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Session", urlPatterns = {"/Session"})
public class Session extends HttpServlet {
    public Kalkulator k;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserSession us = new UserSession((String)request.getParameter("input-nama"), (String)request.getParameter("input-nim"));
        this.k = new Kalkulator(Float.parseFloat((String)request.getParameter("input-angka1")), Float.parseFloat((String)request.getParameter("input-angka2")));
        HttpSession session = request.getSession(true);
        
        session.setAttribute("nama", us.getNama());
        session.setAttribute("nim", us.getNIM());
        session.setAttribute("hasil-tambah", k.tambah());
        session.setAttribute("hasil-kurang", k.kurang());
        session.setAttribute("hasil-kali", k.kali());
        session.setAttribute("hasil-bagi", k.bagi());
        
        response.sendRedirect("proses.jsp");
    }
}
