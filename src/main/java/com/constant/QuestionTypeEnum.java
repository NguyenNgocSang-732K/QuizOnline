package com.constant;

public enum QuestionTypeEnum {
	NORMAL(1) {
		@Override
		public String toString() {
			return "Câu hỏi bình thường";
		}
	},

	TABLE_LINK(2) {
		@Override
		public String toString() {
			return "Câu hỏi dạng nối bảng";
		}
	};

	private final int value;

	QuestionTypeEnum(int value) {
		this.value = value;
	}

	public static QuestionTypeEnum getValue(int value) {
		for (QuestionTypeEnum e : QuestionTypeEnum.values()) {
			if (e.value == value) {
				return e;
			}
		}
		return null;
	}
}