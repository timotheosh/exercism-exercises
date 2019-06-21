import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;
import java.util.stream.Collectors;

public class PigLatinTranslator {
    public List<String> vowels = new ArrayList<String>(Arrays.asList("a", "e", "i", "o", "u"));
    public List<String> vowelLikes = new ArrayList<String>(Arrays.asList("xr", "yt"));


    public boolean startsWithVowel (String sample) {
        List<String> mytest = Stream.concat(vowels.stream(), vowelLikes.stream())
            .filter(b -> sample.startsWith(b))
            .collect(Collectors.toList());
        return mytest.isEmpty();
    }

    public String translate(String word) {
        if (startsWithVowel(word))
            return word + "ay";
        return "";
    }
}
