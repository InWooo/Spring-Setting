package org.conan.sample;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class restaurant {
	@Setter(onMethod_ = @Autowired)
	private chef chef;
}
