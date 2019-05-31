import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Anagram {
    String matcher;

    Anagram(String str) {
        matcher = str;
    }

    // Method to sort a string alphabetically
    public String sortString(String inputString) {
        // convert input string to char array
        char tempArray[] = inputString.toLowerCase().toCharArray();

        // sort tempArray
        Arrays.sort(tempArray);

        // return new sorted string
        return new String(tempArray);
    }

    public List<String> match(List<String> list) {
        List<String> matches = new ArrayList<String>();
        String sorted_matcher = sortString(matcher);
        for (int i = 0; i < list.size(); i++) {
            if ((!matcher.equalsIgnoreCase(list.get(i)))
                    && (sorted_matcher.equals(sortString(list.get(i)))))
                matches.add(list.get(i));
        }
        return matches;
    }
}
