
class RaindropConverter {

    public String convert(int number) {

        String response = "";

        for (int i = 1; i <= number; i++) {
            if (number % i == 0) {
                switch(i) {
                    case 3: response += "Pling";
                        break;
                    case 5: response += "Plang";
                        break;
                    case 7: response += "Plong";
                        break;
                }
            }
        }
        if (response.length() == 0)
            response = String.valueOf(number);
        return response;
    }
}
