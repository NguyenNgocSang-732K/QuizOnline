package com.constant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ValidatorObject {

    private @Autowired
    MessageSource messageSource;

    protected List<ObjectError> listError;

    private Map<String, String> SetMessageErrors(){
        Map<String, String> messages = new HashMap<String, String>();

        this.listError.forEach(p -> {
            String message = messageSource.getMessage(p, null);
            messages.put(((FieldError)p).getField(), message);
        });

        return messages;
    }

    public Map<String, String> MessageErrors() {
        return SetMessageErrors();
    }
}
