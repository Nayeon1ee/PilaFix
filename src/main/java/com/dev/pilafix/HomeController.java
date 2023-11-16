package com.dev.pilafix;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		System.out.println("인덱스 화면 호출");
		return "home";
	}
	// 수미

	@GetMapping("/ticket")
	public String ticket() {
		return "ticket";
	}

	// 나연

	@GetMapping("/myschedule")
	public String myschedule() {
		return "myschedule";
	}

	@GetMapping("/reservation_cancel")
	public String reservation_cancel() {
		return "reservation_cancel";
	}

	@GetMapping("/reservation_personal")
	public String reservation_personal() {
		return "reservation_personal";
	}

	@GetMapping("/reservation_group")
	public String reservation_group() {
		return "reservation_group";
	}

	// 하민

	@GetMapping("/privatedetailclass")
	public String privatedetailclass() {
		return "privatedetailclass";
	}

	@GetMapping("/groupdetailclass")
	public String groupdetailclass() {
		return "groupdetailclass";
	}

	@GetMapping("/classlist")
	public String classlist() {
		return "classlist";
	}

	// 영우

	@GetMapping("/centeraddress")
	public String centeraddress() {
		return "centeraddress";
	}

	@GetMapping("/register")
	public String register() {
		return "register";
	}

	@GetMapping("/memberA")
	public String memberA() {
		return "memberA";
	}

	@GetMapping("/emailfind")
	public String emailfind() {
		return "emailfind";
	}

	@GetMapping("/logincenter")
	public String logincenter() {
		return "logincenter";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// 은주

	@GetMapping("/paymentHistorydetail")
	public String paymentHistorydetail() {
		return "paymentHistorydetail";
	}

	@GetMapping("/paymentHistory")
	public String paymentHistory() {
		return "paymentHistory";
	}

	@GetMapping("/inquiryForm")
	public String inquiryForm() {
		return "inquiryForm";
	}

	@GetMapping("/manager_inquiry")
	public String manager_inquiry() {
		return "manager_inquiry";
	}

	@GetMapping("/center_inquiry")
	public String center_inquiry() {
		return "center_inquiry";
	}

	@GetMapping("/FAQ")
	public String FAQ() {
		return "FAQ";
	}

	@GetMapping("/passwordchange")
	public String passwordchange() {
		return "passwordchange";
	}

	@GetMapping("/myinfo")
	public String myinfo() {
		return "myinfo";
	}

	@GetMapping("/membernotice")
	public String membernotice() {
		return "membernotice";
	}

	@GetMapping("/memberpage")
	public String memberpage() {
		return "memberpage";
	}

	// 관리자

	// 관리자 메인(임시)
	
	@RequestMapping("/admin_common.do")
	public String admin_common() {
		return "admin_common.jsp";
	}


	@RequestMapping("/admin_baned_comment")
	public String admin_baned_comment() {
		return "admin_baned_comment";
	}

	@RequestMapping("/admin_baned_comment_detail")
	public String admin_baned_comment_detail() {
		return "admin_baned_comment_detail";
	}

	@RequestMapping("/admin_FAQ")
	public String admin_FAQ() {
		return "admin_FAQ";
	}

	@RequestMapping("/admin_FAQ_detail")
	public String admin_FAQ_detail() {
		return "admin_FAQ_detail";
	}

	@RequestMapping("/admin_FAQ_register")
	public String admin_FAQ_register() {
		return "admin_FAQ_register";
	}

	@RequestMapping("/admin_FAQ_edit")
	public String admin_FAQ_edit() {
		return "admin_FAQ_edit";
	}

	@RequestMapping("/admin_community")
	public String admin_community() {
		return "admin_community";
	}

	@RequestMapping("/admin_community_detail")
	public String admin_community_detail() {
		return "admin_community_detail";
	}

	@RequestMapping("/admin_terms")
	public String admin_terms() {
		return "admin_terms";
	}

	@RequestMapping("/admin_terms_detail")
	public String admin_terms_detail() {
		return "admin_terms_detail";
	}

	@RequestMapping("/admin_terms_register")
	public String admin_terms_register() {
		return "admin_terms_register";
	}

	@RequestMapping("/admin_terms_edit")
	public String admin_terms_edit() {
		return "admin_terms_edit";
	}


// 예시
	@RequestMapping("/admin_info_boardlist.do")
	   public String admin_info_boardlist() {
	      return "admin_info_boardlist.jsp";
	   }

	@RequestMapping("/admin_info")
	public String admin_info() {
		return "admin_info";
	}

	@RequestMapping("/admin_info_getboard")
	public String admin_info_getboard() {
		return "admin_info_getboard";
	}

	@RequestMapping("/admin_CTS_management")
	public String admin_CTS_management() {
		return "admin_CTS_management";
	}

	@RequestMapping("/admin_CTS_info")
	public String admin_CTS_info() {
		return "admin_CTS_info";
	}

	@RequestMapping("/admin_notice_board_detail")
	public String admin_notice_board_detail() {
		return "admin_notice_board_detail";
	}

	@RequestMapping("/admin_notice_board_modify")
	public String admin_notice_board_modify() {
		return "admin_notice_board_modify";
	}

	@RequestMapping("/admin_notice_board_register")
	public String admin_notice_board_register() {
		return "admin_notice_board_register";
	}

	@RequestMapping("/admin_send_email_detail")
	public String admin_send_email_detail() {
		return "admin_send_email_detail";
	}

	@RequestMapping("/admin_send_email_list")
	public String admin_send_email_list() {
		return "admin_send_email_list";
	}

	@RequestMapping("/admin_send_sms_detail")
	public String admin_send_sms_detail() {
		return "admin_send_sms_detail";
	}

	@RequestMapping("/admin_send_sms_list")
	public String admin_send_sms_list() {
		return "admin_send_sms_list";
	}

	@RequestMapping("/admin_teacher_info")
	public String admin_teacher_info() {
		return "admin_teacher_info";
	}

	@RequestMapping("/admin_teacher_management")
	public String admin_teacher_management() {
		return "admin_teacher_management";
	}

	// 센터 네비

	@RequestMapping("/center_common")
	public String center_common() {
		return "center_common";
	}

	// 센터

	@RequestMapping("/center_question_board")
	public String center_question_board() {
		return "center_question_board";
	}

	@RequestMapping("/center_inquiries_answered")
	public String center_inquiries_answered() {
		return "center_inquiries_answered";
	}

	@RequestMapping("/center_inquiries_answered_edit")
	public String center_inquiries_answered_edit() {
		return "center_inquiries_answered_edit";
	}

	@RequestMapping("/center_CTS_info")
	public String center_CTS_info() {
		return "center_CTS_info";
	}

	@RequestMapping("/center_CTS_management")
	public String center_CTS_management() {
		return "center_CTS_management";
	}

	@RequestMapping("/center_detail_info")
	public String center_detail_info() {
		return "center_detail_info";
	}

	@RequestMapping("/center_notice_board_modify")
	public String center_notice_board_modify() {
		return "center_notice_board_modify";
	}

	@RequestMapping("/center_notice_board_detail")
	public String center_notice_board_detail() {
		return "center_notice_board_detail";
	}

	@RequestMapping("/center_notice_board_register")
	public String center_notice_board_register() {
		return "center_notice_board_register";
	}

	@RequestMapping("/center_notice_board")
	public String center_notice_board() {
		return "center_notice_board";
	}

	@RequestMapping("/center_send_notice_detail")
	public String center_send_notice_detail() {
		return "center_send_notice_detail";
	}

	@RequestMapping("/center_send_notice_list")
	public String center_send_notice_list() {
		return "center_send_notice_list";
	}

	@RequestMapping("/center_send_sms_detail")
	public String center_send_sms_detail() {
		return "center_send_sms_detail";
	}

	@RequestMapping("/center_send_sms_list")
	public String center_send_sms_list() {
		return "center_send_sms_list";
	}

	@RequestMapping("/center_teacher_info")
	public String center_teacher_info() {
		return "center_teacher_info";
	}

	@RequestMapping("/center_teacher_management")
	public String center_teacher_management() {
		return "center_teacher_management";
	}


	@RequestMapping("/center_class_management")
	public String center_class_management() {
		return "center_class_management";
	}

	@RequestMapping("/center_create_class")
	public String center_create_class() {
		return "center_create_class";
	}

	@RequestMapping("/center_detail_class")
	public String center_detail_class() {
		return "center_detail_class";
	}

	@RequestMapping("/center_ticket_management")
	public String center_ticket_management() {
		return "center_ticket_management";
	}

	@RequestMapping("/center_create_ticket")
	public String center_create_ticket() {
		return "center_create_ticket";
	}

	@RequestMapping("/center_detail_ticket")
	public String center_detail_ticket() {
		return "center_detail_ticket";
	}

}
