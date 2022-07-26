package tiger.api.test.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

		@Karate.Test
		public Karate runTest() {
			//classpath is the location
			return Karate.run("classpath:features")
//			.tags("Smoke");
			.tags("Security");
		}
}
