package ru.job4j.dream.servlet;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import ru.job4j.dream.model.Post;
import ru.job4j.dream.model.User;
import ru.job4j.dream.store.PsqlStore;

public class PostServletTest  {
    @Test
    public void testPostServlet() throws IOException,  ServletException {

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);

        when(request.getParameter("id")).thenReturn("9");
        when(request.getParameter("name")).thenReturn("post9");
        new PostServlet().doPost(request, response);

        verify(request, times(1)).getParameter("id");
        assertTrue(request.getParameter("name").equals("post9"));
    }

    @Test
    public void testGetServlet() throws IOException,  ServletException {

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);

        RequestDispatcher requestDispatcher = mock(RequestDispatcher.class);
        when(request.getRequestDispatcher("posts.jsp")).thenReturn(requestDispatcher);
        when(request.getSession()).thenReturn(session);
        PostServlet postServlet = new PostServlet();
        postServlet.doGet(request, response);
        verify(request).getRequestDispatcher("posts.jsp");
    }
}