package ru.job4j.dream.servlet;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.junit.Test;

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
}