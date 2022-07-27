/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author ACER
 */
public class FileProcessor {

    public String getFolderImage(HttpServletRequest request, String folder) {
        return request.getServletContext().getRealPath("view/dist/images").replace("build\\", "").concat("\\" + folder).trim();
    }
    
    public String getFolderTxt(HttpServletRequest request, String folder) {
        return request.getServletContext().getRealPath("view/dist/").replace("build\\", "").concat("\\" + folder).trim();
    }

    /**
     *
     * @param part
     * @param folder
     * @return
     * @throws IOException
     */
    public String uploadFile(Part part, String folder) throws IOException {
        String[] filename = Paths.get(part.getSubmittedFileName()).getFileName().toString().split("\\.");
        Random random = new Random();
        String file = "Course-" + random.nextInt(1000000000) + "." + filename[filename.length - 1];
        Path path = Paths.get(folder);
        if (!Files.exists(path)) {
            Files.createDirectory(path);
        }
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            File outputFilePath = new File(Paths.get(path.toString(), file).toString());
            while (outputFilePath.exists()) {
                file = random.nextInt(1000000000) + "-" + file.replaceAll("\\s+", "-");
                outputFilePath = new File(Paths.get(path.toString(), file).toString());
            }
            inputStream = part.getInputStream();
            outputStream = new FileOutputStream(outputFilePath);
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        } catch (IOException e) {
            System.out.println(e);
        } finally {
            if (outputStream != null) {
                outputStream.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
        return file;
    }

    /**
     *
     * @param fileName
     * @param folder
     * @throws IOException
     */
    public void delete(String fileName, String folder) throws IOException {
        Path path = Paths.get(folder);
        try {
            File file = new File(Paths.get(path.toString(), fileName).toString());
            file.delete();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
