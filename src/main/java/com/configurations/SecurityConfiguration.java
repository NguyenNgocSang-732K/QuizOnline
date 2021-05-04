package com.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors().and().csrf().disable();
		http.authorizeRequests()
				.antMatchers("/admin/**").permitAll()
				.antMatchers("/student/**").access("hasRole('ROLE_Student')")
				.and()
				.formLogin()
				.loginPage("/login")
				.usernameParameter("username")
			    .passwordParameter("password")
				.loginProcessingUrl("/securitylogin")
				.defaultSuccessUrl("/dashboard")
				.failureUrl("/login?error=401")
				.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/login?logout=success").and()
				.exceptionHandling();
	}

	@Bean
	public BCryptPasswordEncoder Encoder() {
		return new BCryptPasswordEncoder();
	}

}
