class Twofer {
    public String twofer(String name) {
        if (name == null || name.trim().length() == 0)
            name = "you";
        return "One for " + name.trim() + ", one for me.";
    }
}
