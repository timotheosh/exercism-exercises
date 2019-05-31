
class RaindropConverter {

    // Returns true if number is divisible by divisor, otherwise, returns false.
    private boolean isDivisible(int number, int divisor) {
        return number % divisor == 0;
    }

    public String convert(int number) {

        String response = "";

        if (isDivisible(number, 3)) response += "Pling";
        if (isDivisible(number, 5)) response += "Plang";
        if (isDivisible(number, 7)) response += "Plong";
        if (response.isEmpty()) response = Integer.toString(number);
        return response;
    }
}
