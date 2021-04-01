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
		String prefix_admin = "/account/admin/";
		String prefix_user = "/account/user/";
		http.authorizeRequests().antMatchers(prefix_admin+"login").anonymous()
				.antMatchers("/admin/**").permitAll()
				.and()
				.formLogin()
				.loginPage(prefix_admin+"login")
				.usernameParameter("username")
			    .passwordParameter("password")
				.loginProcessingUrl("/securitylogin")
				.defaultSuccessUrl("/admin/setAuthentication")
				.failureUrl("/admin/login?error=401")
				.and()
				.logout()
				.logoutUrl(prefix_admin+"logout")
				.logoutSuccessUrl(prefix_admin+"login?logout").and()
				.exceptionHandling().accessDeniedPage(prefix_admin+"accessdenied");
	}

	@Bean
	public BCryptPasswordEncoder Encoder() {
		return new BCryptPasswordEncoder();
	}

}
