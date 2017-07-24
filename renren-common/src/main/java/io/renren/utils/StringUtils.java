package io.renren.utils;

/**
 * Created by 3c on 2017/7/24.
 */
public class StringUtils {
    public static String parseString(Object obj){
        if (obj==null){
            return "";
        }
        return obj.toString();
    }

    public static Integer parseInteger(Object obj){
        if (obj==null){
            return null;
        }
        return Integer.parseInt(parseString(obj));
    }
}
