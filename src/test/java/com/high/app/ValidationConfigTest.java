package com.high.app;

import org.junit.Test;
import org.springframework.test.AbstractDependencyInjectionSpringContextTests;


public class ValidationConfigTest extends AbstractDependencyInjectionSpringContextTests {
    protected String[] getConfigLocations() {
        return new String[] { "classpath:validation.xml" };
    }

    @Test
    public void test() throws Exception {
		// just check that the config is valid (currently may increase in the future).
	}
}

