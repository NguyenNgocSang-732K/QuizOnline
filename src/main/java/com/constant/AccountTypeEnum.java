package com.constant;

public enum AccountTypeEnum {
	ADMINISTRATOR(1) {
		@Override
		public String toString() {
			return "ROLE_Admin";
		}
	},

	STUDENT(2) {
		@Override
		public String toString() {
			return "ROLE_Student";
		}
	};

	private final int value;

	AccountTypeEnum(int value) {
		this.value = value;
	}

	public static AccountTypeEnum getValue(int value) {
		for (AccountTypeEnum e : AccountTypeEnum.values()) {
			if (e.value == value) {
				return e;
			}
		}
		return null;
	}
}