from collections import Counter
from re import split as regex_split

# Handle quoted words
def unquote(word):
    if word.startswith("'") and word.endswith("'"):
        return word[1:-1]
    return word

def word_count(phrase):
    wordlist = [x for x in filter(lambda x: len(x) > 0, regex_split(r'[^a-zA-Z|\'|0-9]', phrase.lower()))]
    return Counter(map(unquote, wordlist))
