package com.helper;

import org.jsoup.Jsoup;

public class ParseHtmlTag {
    public static String Parse(String html){
        return Jsoup.parse(html).text();
    }
}
