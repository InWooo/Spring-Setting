package org.conan.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.ToString;

@Component
@ToString
@Getter
@AllArgsConstructor
public class hotel {
	@NonNull
	private chef chef;
	/*
	 * public hotel(chef chef) { this.chef = chef; }
	 */
}
