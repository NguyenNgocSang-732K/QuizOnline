package com.constant;

public enum AnswerTypeEnum {
	CHECKBOX(1) {
		@Override
		public String toString() {
			return "Chọn nhiều câu trả lời";
		}
	},

	RADIO(2) {
		@Override
		public String toString() {
			return "Chọn 1 câu trả lời";
		}
	};

	private final int value;

	AnswerTypeEnum(int value) {
		this.value = value;
	}
	
	public static AnswerTypeEnum getValue(int value) {
		for (AnswerTypeEnum e : AnswerTypeEnum.values()) {
			if (e.value == value) {
				return e;
			}
		}
		return null;
	}
}