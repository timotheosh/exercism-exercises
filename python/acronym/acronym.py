import re

def abbreviate(words):
    return ''.join([x[:1].upper() for x in re.split("\s+|-", words)])
