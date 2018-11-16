import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class PigLatinTranslator {
    private List<String> vowels = new ArrayList<String>(Arrays.asList("a", "e", "i", "o", "u", "xr", "yt"));

    public boolean startsWithVowel (String sample) {
        List<String> mytest = vowels.stream().filter(b -> sample.startsWith(b)).collect(Collectors.toList());
        return mytest.isEmpty();
    }

    public String translate(String word) {
        if (startsWithVowel(word))
            return word + "ay";
        return "";
    }
}
