package com.controllers.api;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model.entities.Account;
import com.model.models.ApiAccountModel;
import com.model.models.ApiReturnResult;
import com.model.models.ApiToken;
import com.services.apiService.IApiAccountService;

@RestController
public class AccountRestController extends ApiBaseController {

	private @Autowired IApiAccountService iApiAccountService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "/account/checkLogin", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> checkLogin(@RequestBody Account account) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			Account account2 = new Account();
			if (account.getUsername() != null) {
				if (account.getPassword() != null) {
					account2 = iApiAccountService.getUserCheckLogin(account.getUsername());
					if (account2 != null) {
						BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
						Boolean check = encoder.matches(account.getPassword(), account2.getPassword());
						if (check == true) {
							String originalInput = account2.getId().toString();
							String encodedString = Base64.getEncoder().encodeToString(originalInput.getBytes());

//							byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
//							String decodedString = new String(decodedBytes);

							List<ApiToken> list = new ArrayList<ApiToken>();
							list.add(new ApiToken(encodedString));
							apiReturnResult.setStatucCode(0);
							apiReturnResult.setStatusMessage("success");
							apiReturnResult.setData(list);
							return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
						} else {
							apiReturnResult.setStatucCode(1);
							apiReturnResult.setStatusMessage("lỗi không thể đăng nhập");
							apiReturnResult.setData(new ArrayList<Object>(0));
							return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
						}
					} else {
						apiReturnResult.setStatucCode(1);
						apiReturnResult.setStatusMessage("lỗi không thể đăng nhập");
						apiReturnResult.setData(new ArrayList<Object>(0));
						return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
					}
				} else {
					apiReturnResult.setStatucCode(1);
					apiReturnResult.setStatusMessage("lỗi không thể đăng nhập");
					apiReturnResult.setData(new ArrayList<Object>(0));
					return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
				}
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("lỗi không thể đăng nhập");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không thể đăng nhập");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/getAccount/byId", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> getAccount(@RequestHeader String token) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();

			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));
			if (checkAccount > 0) {
				ApiAccountModel account = iApiAccountService.getAccountInfo(Integer.parseInt(decodedString));
				List<ApiAccountModel> accounts = new ArrayList<ApiAccountModel>();
				accounts.add(account);

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(accounts);

				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("Tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không lấy được thông tin người dùng");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/changePassword/checkUsername", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> checkUsername(@RequestHeader String token, @RequestBody Account account) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			int result = iApiAccountService.checkUsername(account.getUsername());
			if (result > 0) {
				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("Usernam không hợp lệ");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("Username không hợp lệ");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> changePassword(@RequestHeader String token,
			@RequestBody ApiAccountModel account) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));

			if (checkAccount > 0) {
				int id = Integer.parseInt(decodedString);
				String newPassword = "";
				

				// tim account theo id truoc
				ApiAccountModel account3 = iApiAccountService.getAccountInfo(Integer.parseInt(decodedString));
				
				if(account.getPassword() != null) {
					newPassword = bCryptPasswordEncoder.encode(account.getPassword());
				}else {
					newPassword = account3.getPassword();
				}
				
				if (account3 != null) {
					// tao ra roi moi add
					Account account2 = new Account();
					account2.setId(id);
					account2.setPassword(newPassword);
					
					if (account.getUsername() != null) {
						account2.setUsername(account.getUsername());
					} else {
						account2.setUsername(account3.getUsername());
					}
					if (account.getFullname() != null) {
						account2.setFullname(account.getFullname());
					} else {
						account2.setFullname(account3.getFullname());
					}
					if (account.getEmail() != null) {
						account2.setEmail(account.getEmail());
					} else {
						account2.setEmail(account3.getEmail());
					}
					if (account.getPhone() != null) {
						account2.setPhone(account3.getPhone());
					} else {
						account2.setPhone(account3.getPhone());
					}
					account2.setIsActive(account3.getIsActive());
					account2.setAccountType(account3.getAccountType());
					account2.setCreatedDate(new Date());
					account2.setCreatedBy(account3.getCreatedBy());
					account2.setStatus(account3.getStatus());
					Account result = iApiAccountService.changPassword(account2);

//					ApiAccountModel accountModel = new ApiAccountModel();
//					accountModel.setId(result.getId());
//					accountModel.setUsername(result.getUsername());
//					accountModel.setFullname(result.getFullname());
//					accountModel.setPhoto(result.getPhoto());
//					accountModel.setEmail(result.getEmail());
//					accountModel.setPhone(result.getPhone());
//					accountModel.setAddress(result.getAddress());
					
//					List<ApiAccountModel> accounts = new ArrayList<ApiAccountModel>();
//					
//					accounts.add(accountModel);
					
					if (result != null) {
						apiReturnResult.setStatucCode(0);
						apiReturnResult.setStatusMessage("success");
						apiReturnResult.setData(new ArrayList<Object>(0));
						return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
					} else {
						apiReturnResult.setStatucCode(1);
						apiReturnResult.setStatusMessage("Không đổi được Password");
						apiReturnResult.setData(new ArrayList<Object>(0));
						return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
					}
				} else {
					apiReturnResult.setStatucCode(1);
					apiReturnResult.setStatusMessage("Không đổi được Password");
					apiReturnResult.setData(new ArrayList<Object>(0));
					return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
				}
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("Tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("Không đổi được Password");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> resgiter(@RequestBody ApiAccountModel apiAccount) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();

			Account account = new Account();
			account.setUsername(apiAccount.getUsername());
			account.setPassword(bCryptPasswordEncoder.encode(apiAccount.getPassword()));
			account.setFullname(apiAccount.getFullname());
			account.setPhoto(apiAccount.getPhoto());
			account.setEmail(apiAccount.getEmail());
			account.setPhone(apiAccount.getPhone());
			account.setAddress(apiAccount.getAddress());
			account.setIsActive(1);
			account.setOtp("abc xyz");
			account.setAccountType(1);
			account.setCreatedDate(new Date());
			account.setStatus(1);

			Account result = iApiAccountService.register(account);
			List<Account> list = new ArrayList<Account>();
			list.add(result);

			if (result != null) {
				Account account2 = new Account();
				account2.setId(result.getId());
				account2.setCreatedBy(result.getId());

				account2.setUsername(apiAccount.getUsername());
				account2.setPassword(bCryptPasswordEncoder.encode(apiAccount.getPassword()));
				account2.setFullname(apiAccount.getFullname());
				account2.setPhoto(apiAccount.getPhoto());
				account2.setEmail(apiAccount.getEmail());
				account2.setPhone(apiAccount.getPhone());
				account2.setAddress(apiAccount.getAddress());
				account2.setIsActive(1);
				account2.setOtp("abc xyz");
				account2.setAccountType(1);
				account2.setCreatedDate(new Date());
				account2.setStatus(1);

				iApiAccountService.register(account2);

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(list);
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("lỗi không tạo được tài khoản");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không tạo được tài khoản");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	
	
}
