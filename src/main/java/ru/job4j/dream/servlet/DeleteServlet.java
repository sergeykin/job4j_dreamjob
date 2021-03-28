package ru.job4j.dream.servlet;

import org.apache.commons.fileupload.FileItem;
import ru.job4j.dream.model.Candidate;
import ru.job4j.dream.store.PsqlStore;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String image = req.getParameter("image");
        File folder = new File("c:\\images\\");
        File file = new File(folder + File.separator + image);
        file.delete();
        PsqlStore.instOf().deleteCandidate(Integer.valueOf(id));
        resp.sendRedirect(req.getContextPath() + "/candidates.do");
    }
}