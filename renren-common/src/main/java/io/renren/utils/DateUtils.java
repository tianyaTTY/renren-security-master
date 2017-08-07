package io.renren.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期处理
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月5日 下午6:43:36
 */
public class DateUtils {
	/** 时间格式(yyyy-MM-dd) */
	public final static String DATE_PATTERN = "yyyy-MM-dd";
	/** 时间格式(yyyy-MM-dd HH:mm:ss) */
	public final static String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	public static String format(Date date) {
        return format(date, DATE_PATTERN);
    }

    public static String format(Date date, String pattern) {
        if(date != null){
            SimpleDateFormat df = new SimpleDateFormat(pattern);
            return df.format(date);
        }
        return null;
    }

    public static Date strToDate(String dateStr){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 格式yyyy-MM-dd HH:mm:ss
     * @return 系统时间
     */
    public static String getSysTime(){
        return format(new Date(),"yyyy-MM-dd HH:mm:ss");
    }

    public static void main(String[] args) {
        Timestamp time = new Timestamp(new Date().getTime());
        System.out.println(time);
//        Date date = strToDate("2017-7-9");
//        System.out.println(strToDate("2017-7-9"));
        String timeStr = format(new Date(),"yyyy-MM-dd HH:mm:ss");
        System.out.println(timeStr);
    }
}
