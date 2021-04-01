package com.constant;

public enum ExamEnum {
	EXAM_THEME(1) {
		@Override
		public String toString() {
			return "Chủ đề thi";
		}
	},

	EXAM_NAME(2) {
		@Override
		public String toString() {
			return "Tên bài thi";
		}
	};

	private final int value;

	ExamEnum(int value) {
		this.value = value;
	}

	public static ExamEnum getValue(int value) {
		for (ExamEnum e : ExamEnum.values()) {
			if (e.value == value) {
				return e;
			}
		}
		return null;
	}
}