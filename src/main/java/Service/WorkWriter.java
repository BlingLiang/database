package Service;

import POJO.Work;
import POJO.Work_details;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

@Service
public class WorkWriter {
    File file;
    FileOutputStream out;
    ObjectOutputStream stream;

    public void writeWork(String pathname, Work_details obj){
        try {
            file = new File(pathname);
            out = new FileOutputStream(file);
            stream = new ObjectOutputStream(out);
            stream.writeObject(obj);
            stream.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
        }
    }
}
