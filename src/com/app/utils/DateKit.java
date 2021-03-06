package com.app.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateKit{
    /**
                    时间段的比较处理 , 如果包含了传来的 时段 了, 就说明 时间冲突了 
    * @return 
    */
    public static boolean isContain(Date[] a, Date[] b) {
      
        long astatr = a[0].getTime();
        long aend   = a[1].getTime();
          
        long bstatr = b[0].getTime();
        long bend   = b[1].getTime();
          
        // a0 包在了 b0 ~ b1 之间
        if( astatr>=bstatr && astatr<=bend ) return true;
          
        // b0 包在了 a0 ~ a1 之间
        if( astatr<=bstatr && aend>=bstatr ) return true;
          
        return false;
    }
      
    /**
                时间段的比较处理 , 如果包含了传来的 时段 了, 就说明 时间冲突了 , (允许首尾相等而不包含的情况)
    * @return 
    */
    public static boolean isContainEnd(Date[] a, Date[] b) {
      
        long astatr = a[0].getTime();
        long aend   = a[1].getTime();
          
        long bstatr = b[0].getTime();
        long bend   = b[1].getTime();
          
        // a0 包在了 b0 ~ b1 之间
        if( astatr>=bstatr && astatr<bend ) return true;
          
        // b0 包在了 a0 ~ a1 之间
        if( astatr<=bstatr && aend>bstatr ) return true;
          
        // 相等
        if( astatr==bstatr && aend==bend )  return true;
          
        return false;
    }
      
    // 功能 工具 扩展
      
        public static boolean isContain(String astatr,String aend, String bstatr,String bend) {
            return isContain(new String[]{astatr , aend}, new String[]{bstatr , bend});
        }
          
        public static boolean isContain(String[] aStr, String[] bStr) {
            return isContain(aStr, bStr, "yyyy-MM-dd HH:mm:ss");
        }
          
        public static boolean isContain(String[] aStr, String[] bStr, String pattern) {
            final SimpleDateFormat SF = new SimpleDateFormat(pattern);
            try {
                return isContain(new Date[]{SF.parse(aStr[0]), SF.parse(aStr[1])} , new Date[]{SF.parse(bStr[0]), SF.parse(bStr[1])});
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }
          
        public static boolean isContainEnd(String astatr,String aend, String bstatr,String bend) {
            return isContainEnd(new String[]{astatr , aend}, new String[]{bstatr , bend});
        }
          
        public static boolean isContainEnd(String[] aStr, String[] bStr) {
            return isContainEnd(aStr, bStr, "yyyy-MM-dd HH:mm:ss");
        }
          
        public static boolean isContainEnd(String[] aStr, String[] bStr, String pattern) {
            final SimpleDateFormat SF = new SimpleDateFormat(pattern);
            try {
                return isContainEnd(new Date[]{SF.parse(aStr[0]), SF.parse(aStr[1])} , new Date[]{SF.parse(bStr[0]), SF.parse(bStr[1])});
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }
      
}