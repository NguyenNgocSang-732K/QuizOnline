package com.model.entityModels;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.model.entities.Account;

public class AccountModel extends Account {
	public MultipartFile file_upload;

	public MultipartFile getFile_upload() {
		return file_upload;
	}

	public void setFile_upload(MultipartFile file_upload) {
		this.file_upload = file_upload;
	}

}
