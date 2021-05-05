package com.constant;

public enum AccountTypeEnum {
	ADMINISTRATOR(1, "ROLE_Admin"), STUDENT(2, "ROLE_Student");

	private int key;
	private String value;

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

	private AccountTypeEnum() {
	}

	private AccountTypeEnum(int key, String value) {
		this.key = key;
		this.value = value;
	}

	public static AccountTypeEnum getKey(int key) {
		for (AccountTypeEnum e : AccountTypeEnum.values()) {
			if (e.key == key) {
				return e;
			}
		}
		return null;
	}

	public static AccountTypeEnum getValue(String value) {
		for (AccountTypeEnum e : AccountTypeEnum.values()) {
			if (e.value.equalsIgnoreCase(value)) {
				return e;
			}
		}
		return null;
	}

}