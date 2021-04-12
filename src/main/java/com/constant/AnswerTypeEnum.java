package com.constant;

public enum AnswerTypeEnum {

    CHECKBOX(1, "Chọn nhiều câu trả lời"), RADIO(2, "Chọn 1 câu trả lời");

	private int key;
    private String value;

	AnswerTypeEnum(int key, String value) {
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

	public static AnswerTypeEnum getValue(String value) {
        for (AnswerTypeEnum e : AnswerTypeEnum.values()) {
            if (e.value.equalsIgnoreCase(value)) {
                return e;
            }
        }
        return null;
    }

	public static AnswerTypeEnum getKey(int key) {
		for (AnswerTypeEnum e : AnswerTypeEnum.values()) {
			if (e.key == key) {
				return e;
			}
		}
		return null;
	}
}