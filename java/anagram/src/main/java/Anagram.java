import java.util.List;
import java.util.stream.Collectors;

public class Anagram {
    private String matcher;
    private String sorted_matcher;

    Anagram(String string) {
        matcher = string;
        sorted_matcher = sortString(string);
    }

    // Method to sort a string alphabetically
    private String sortString(String inputString) {
        return inputString.toLowerCase()
                .codePoints()
                .sorted()
                .mapToObj(Character::toString)
                .collect(Collectors.joining());
    }

    private boolean isMatch(String string){
        if (matcher.equalsIgnoreCase(string)) return false;
        else return sorted_matcher.equals(sortString(string));
    }

    public List<String> match(List<String> list) {
        return list.stream()
                .filter(this::isMatch)
                .collect(Collectors.toList());
    }
}
