package com.gjsyoung.eiaproject.config;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author cairuojin
 * @create 2019-01-25 21:43
 * 全局日期转换
 */
@Component
public class StringToDateConverter implements Converter<String, Date> {

    private static final String dateFormat = "yyyy-MM-dd";

    @Override
    public Date convert(String value) {
        SimpleDateFormat formatter = new SimpleDateFormat(dateFormat);
        try {
            return formatter.parse(value);
        } catch (Exception e) {
            throw new RuntimeException(String.format("parser %s to Date fail", value));
        }
    }
}