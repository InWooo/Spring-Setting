package org.conan.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class SampleServiceImple implements SampleService {

	@Override
	public Integer doAdd(String str1, String str2) throws Exception {
		// TODO Auto-generated method stub
		
		return Integer.parseInt(str1)+Integer.parseInt(str2);
	}

}
