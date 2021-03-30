package com.model.constant;

public enum StatusEnum {
	VISIBLE(1) {
		@Override
		public String toString() {
			return "Valid";
		}
	},

	INVISIBLE(2) {
		@Override
		public String toString() {
			return "UnValid";
		}
	};

	private final int value;

	StatusEnum(int value) {
		this.value = value;
	}

	public static StatusEnum getValue(int value) {
		for (StatusEnum e : StatusEnum.values()) {
			if (e.value == value) {
				return e;
			}
		}
		return null;
	}
}