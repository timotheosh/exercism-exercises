import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class IsogramChecker {

    boolean isIsogram(String phrase) {
        boolean ret = true;
        List<String> mylist = new ArrayList<String>(Arrays.asList(phrase.toLowerCase().split("")));
        for (int i = 0; i < mylist.size(); i++) {
            if ((!mylist.get(i).equals(" ")) && (!mylist.get(i).equals("-")) &&
                    (mylist.indexOf(mylist.get(i)) != mylist.lastIndexOf(mylist.get(i))))
                ret = false;
        }
        return ret;
    }
}
