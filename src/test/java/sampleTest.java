import com.intuit.karate.junit5.Karate;

    class SampleTest {

        @Karate.Test
        Karate testSample() {
            return Karate.run("sample.feature").relativeTo(getClass());
        }
    }


