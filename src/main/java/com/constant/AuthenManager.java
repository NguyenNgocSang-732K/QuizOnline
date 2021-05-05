package com.constant;

import com.model.entities.Account;
import com.model.entityModels.CurrentUserProfile;

public class AuthenManager {

	public static CurrentUserProfile Current_User = null;

	public static Account Current_Account = null;

	public static boolean IsStudent() {
		if (Current_Account == null)
			return false;
		return AccountTypeEnum.STUDENT == AccountTypeEnum.getKey(Current_Account.getAccountType());
	}

	public static boolean IsMod() {
		if (Current_Account == null)
			return false;
		return AccountTypeEnum.ADMINISTRATOR == AccountTypeEnum.getKey(Current_Account.getAccountType());
	}

}
