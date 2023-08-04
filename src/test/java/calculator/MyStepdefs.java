package calculator;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;

public class MyStepdefs {
    private Calculator calculator;
    private int value1;
    private int value2;
    private char operation;
    private int result;
    private boolean isDividedByZero;

    @Before
    public void before() {
        calculator = new Calculator();
    }

    @Given("^Two input values, (-?\\d+) and (-?\\d+), and operation ([/^*])$")
    public void twoInputValuesAndAndOperation(int arg0, int arg1, char arg2) {
        value1 = arg0;
        value2 = arg1;
        operation = arg2;
    }

    @When("^I perform the operation$")
    public void iPerformTheOperation() {
        if (operation == '*') {
            result = calculator.multiply(value1, value2);
        }
    }

    @Then("^I expect the result (-?\\d+)$")
    public void iExpectTheResult(int arg0) {
        Assert.assertEquals(arg0, result);

    }
}