import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class IsogramChecker {

    public boolean isIsogram(String phrase) {
        String[] letters = phrase.replaceAll("\\W", "").toLowerCase().split("");

        Map<String, Long> freq =
                Stream.of(letters).collect(Collectors.groupingBy(Function.identity(),
                        Collectors.counting()));

        for (Map.Entry<String, Long> entry : freq.entrySet()) {
            if (entry.getValue() > 1) return false;
        }
        return true;
    }
}
