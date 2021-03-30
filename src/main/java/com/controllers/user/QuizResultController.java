package com.controllers.user;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({ "quizResult" })
public class QuizResultController {
	
	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index() throws IOException {
		return "user/student-quiz-result/index";
	}
}
