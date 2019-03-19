package io.renren.utils;

/**
 * Created by LiuLiHao on 2019/3/19 0019 上午 09:30
 * @author : LiuLiHao
 * 描述：
 */
public class TestShortUrl {

    public static void main(String[] args) {
        String url = shortenCodeUrl("13565792565", 6);
        System.out.println(url);
    }

    public static String shortenCodeUrl(String longUrl, int urlLength) {
        if (urlLength < 4 ) {
            urlLength = 8;// defalut length
        }
        StringBuilder sbBuilder = new StringBuilder(urlLength + 2);
        String md5Hex = "";
        int nLen = 0;
        while (nLen < urlLength) {
            // 这个方法是先 md5 再 base64编码 参见
            // https://github.com/ndxt/centit-commons/blob/master/centit-utils/src/main/java/com/centit/support/security/Md5Encoder.java
            md5Hex = Md5Encoder.encodeBase64(md5Hex + longUrl);
            for(int i=0;i<md5Hex.length();i++){
                char c = md5Hex.charAt(i);
                if(c != '/' && c != '+'){
                    sbBuilder.append(c);
                    nLen ++;
                }
                if(nLen == urlLength){
                    break;
                }
            }
        }
        return sbBuilder.toString();
    }

}
