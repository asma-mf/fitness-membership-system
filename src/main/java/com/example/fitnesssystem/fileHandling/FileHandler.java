package com.example.fitnesssystem.fileHandling;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class FileHandler {
    public static boolean isFileExist(String fileName){
        File file = new File(fileName);
        return file.exists();
    }

    public static void createFile(String fileName){
        File file = new File(fileName);
        try{
            file.createNewFile();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void writeToFile(String fileName,boolean append, String data){
        if(!isFileExist(fileName)){
            createFile(fileName);
        }
        try{
            FileWriter fileWriter=new FileWriter(fileName,append);
            fileWriter.write(data);
            fileWriter.close();


        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    public static String[] readFile(String filename) {
        if (!isFileExist(filename)) {
            return new String[0];
        }
        String data = "";
        try {
            FileReader fileReader = new FileReader(filename);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line = "";
            while (true){
                line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                else{
                    data = data + line + "\n";
                }
            }
            bufferedReader.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if(data.isEmpty()){
            return new String[0];
        }
        return data.split("\n");
    }

}

