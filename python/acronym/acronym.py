from re import split as regex_split

def abbreviate(words):
    return ''.join([x[:1].upper() for x in regex_split("\s+|-", words)])
