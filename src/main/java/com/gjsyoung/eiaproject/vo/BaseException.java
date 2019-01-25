package com.gjsyoung.eiaproject.vo;

import java.util.Map;

/**
 *  base Response响应
 */
public class BaseException extends Throwable {
    private Integer resultCode;//状态码 200为成功 其它都应为失败
    private String message;//出错时的提示
    private Map data;      //出错数据

    //成功响应
    public static final BaseException SUCCESS(){
        return SUCCESS(null);
    }

    public static final BaseException SUCCESS(Map data) {
        BaseException baseResp=new BaseException();
        baseResp.setResultCode(200);
        baseResp.setMessage("OK");
        baseResp.setData(data);
        return baseResp;
    }

    //失败响应
    public static final BaseException FAILED(Integer resultCode,String message){
        return FAILED(resultCode,message , null);
    }

    public static final BaseException FAILED(Integer resultCode,String message, Map data){
        BaseException baseResp = new BaseException();
        baseResp.setMessage(message);
        baseResp.setData(data);
        baseResp.setResultCode(resultCode);
        return baseResp;
    }

    public Integer getResultCode() {
        return resultCode;
    }

    public void setResultCode(Integer resultCode) {
        this.resultCode = resultCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map getData() {
        return data;
    }

    public void setData(Map data) {
        this.data = data;
    }
}
