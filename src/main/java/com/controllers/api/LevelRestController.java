package com.controllers.api;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model.entities.AccountExam;
import com.model.entities.Exam;
import com.model.entities.Level;
import com.model.entities.Subject;
import com.model.models.ApiExamModel;
import com.model.models.ApiLevelModel;
import com.model.models.ApiReturnResult;
import com.model.models.ApiSubjectModel;
import com.services.IApiAccountExamService;
import com.services.IApiAccountService;
import com.services.IApiExamService;
import com.services.IApiLevelService;
import com.services.IApiSubjectService;

@RestController
public class LevelRestController extends ApiBaseController {

	private @Autowired IApiLevelService iApiLevelService;
	private @Autowired IApiAccountService iApiAccountService;

	// search danh sách exam của môn học đó
	@RequestMapping(value = "/exam/search/bySubject", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> examSearchBySeach(@RequestHeader String token) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();

			// parse token
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);
			// lấy danh sách Exam

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));
			if (checkAccount > 0) {
				List<ApiLevelModel> levels = iApiLevelService.fetchLevel();

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(levels);
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("Tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(0);
			apiReturnResult.setStatusMessage("lối không lấy danh sách level");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

}
