package com.constant;

public enum StatusEnum {
	VISIBLE(1, "Valid"), INVISIBLE(2, "InValid"),
	ACTIVE(3, "Active"), INACTIVE(4, "InActive");

	private int key;
	private String value;


	StatusEnum(int key, String value) {
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

	public static StatusEnum getKey(int key) {
		for (StatusEnum e : StatusEnum.values()) {
			if (e.key == key) {
				return e;
			}
		}
		return null;
	}

	public static StatusEnum getValue(String value) {
		for (StatusEnum e : StatusEnum.values()) {
			if (e.value.equalsIgnoreCase(value)) {
				return e;
			}
		}
		return null;
	}
}