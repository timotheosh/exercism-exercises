import java.util.stream.IntStream;

class Hamming {

    String lStrand;
    String rStrand;

    Hamming(String leftStrand, String rightStrand) {
        if (leftStrand.length() != rightStrand.length()) {
            throw new IllegalArgumentException("leftStrand and rightStrand must be of equal length.");
        }
        lStrand = leftStrand;
        rStrand = rightStrand;
    }

    int getHammingDistance() {
        return IntStream.range(0, lStrand.length())
                .map(i -> lStrand.charAt(i) != rStrand.charAt(i) ? 1: 0)
                .sum();
    }

}
