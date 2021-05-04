package com.constant;

public enum ResponseStatusEnum {
    SUCCESS(200, "OK"), FAIL(400, "Bad Request");

    private int key;
    private String value;

    ResponseStatusEnum(int key, String value) {
        this.key = key;
        this.value = value;
    }

    public int getKey() {
        return key;
    }

    public void setKey(int key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
