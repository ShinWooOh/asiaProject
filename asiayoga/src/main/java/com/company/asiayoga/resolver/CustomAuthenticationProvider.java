package com.company.asiayoga.resolver;

import java.util.Collection;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.company.asiayoga.user.domain.CustomUserDetail;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Inject
	private UserDetailsService userDetailsService;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String name = (String) authentication.getPrincipal();
        String passwd = (String) authentication.getCredentials();
        
        CustomUserDetail user = (CustomUserDetail) userDetailsService.loadUserByUsername(name);
        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)user.getAuthorities();
        
        if(!matchPasswd(passwd, user.getPassword())) {
            throw new BadCredentialsException(name);
        }
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(name);
        }

		return new UsernamePasswordAuthenticationToken(name, passwd, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	private boolean matchPasswd(String loginPasswd, String passwd) {
		return loginPasswd.equals(passwd);
	}

}
