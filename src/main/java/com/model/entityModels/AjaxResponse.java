package com.model.entityModels;

public class AjaxResponse {
    private int status;
    private Object dataResponse;

    public AjaxResponse() {
    }

    public AjaxResponse(int status, Object dataResponse) {
        this.status = status;
        this.dataResponse = dataResponse;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Object getDataResponse() {
        return dataResponse;
    }

    public void setDataResponse(Object dataResponse) {
        this.dataResponse = dataResponse;
    }
}
