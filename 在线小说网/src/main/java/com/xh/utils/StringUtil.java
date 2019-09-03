package com.xh.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


public class StringUtil {


    /**
     * 获取文件名后缀的方法
     * aa.a.jpg
     * @param fileName : 文件名
     * @return
     */
    public static String getExt(String fileName){
        // 总体思路就是 利用 . 来截取字符串
        if(fileName == null || fileName.isEmpty()){
            return null;
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }


    /**
     * 获取唯一的文件名
     * @return
     */
    public static String getUniqueFileName(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-","");
    }


    /**
     * 获取当前日期的一个路径
     * 2019/07/08
     * @return
     */
    public static String datePath(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        return format.format(new Date());
    }

    public static String getUniqueName(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-","");
    }


}
