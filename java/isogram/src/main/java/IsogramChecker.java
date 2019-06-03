import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

class IsogramChecker {

    private boolean validCharacter(String character) {
        return (!character.equals("-") &&
                !character.equals(" "));
    }

    public boolean isIsogram(String phrase) {
        Map<String, Long> freq =
                phrase.toLowerCase()
                        .chars()
                        .mapToObj(c -> String.valueOf((char) c))
                        .filter(c -> validCharacter(c))
                        .collect(Collectors.groupingBy(Function.identity(),
                        Collectors.counting()));

        for (Map.Entry<String, Long> entry : freq.entrySet()) {
            if (entry.getValue() > 1) return false;
        }
        return true;
    }
}
