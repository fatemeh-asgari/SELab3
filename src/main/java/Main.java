public class Main {
    public static void main(String[] args) {
        int dividend = 10;
        int divisor = 3;

        float result = divideWithFloat(dividend, divisor);
        System.out.println("Result: " + result);
    }

    public static float divideWithFloat(int dividend, int divisor) {
            return (float) dividend / divisor; // Float division, cast to float
    }
}