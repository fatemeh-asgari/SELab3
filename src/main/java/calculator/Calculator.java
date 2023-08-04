package calculator;

public class Calculator {
/*
    public int add(int a, int b) {
        return a + b;
    }
*/
    public int multiply(int a, int b) {
        return a * b;
    }

    public int divide(int a, int b) {
        return a / b;
    }

    public int power(int a, int b) {
        if (b < 0 || (a == 0 && b == 0))
            throw new IllegalArgumentException();

        int result = 1;
        for (int i = 0; i < b; i++) {
            result *= a;
        }
        return result;
    }

}