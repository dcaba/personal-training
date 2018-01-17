import junit.framework.TestCase;

/**
 * Created by caba on 24/07/17.
 */
public class HelloWorldTest extends TestCase {
    public void testHelloReturnsExpectedMessage() throws Exception {
        assert HelloWorld.hello().equals(HelloWorld.message);
    }


}
