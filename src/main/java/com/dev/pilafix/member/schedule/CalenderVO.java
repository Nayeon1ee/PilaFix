package com.dev.pilafix.member.schedule;

public class CalenderVO {
	// full calender event에서 쓰려고 생성
		private String title;
		private String start;
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStart() {
			return start;
		}
		public void setStart(String start) {
			this.start = start;
		}
		@Override
		public String toString() {
			return "CalenderVO [title=" + title + ", start=" + start + "]";
		}
		
		

}
