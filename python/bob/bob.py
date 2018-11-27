
def is_question(phrase):
    return phrase.endswith("?")

def is_shouting(phrase):
    return phrase.isupper()

def is_silent(phrase):
    return len(phrase.strip()) == 0


def hey(phrase):
    ret = "Whatever."
    p = phrase.strip()
    if is_question(p) and is_shouting(p):
        ret = "Calm down, I know what I'm doing!"
    elif is_question(p):
        ret = "Sure."
    elif is_shouting(p):
        ret = "Whoa, chill out!"
    elif is_silent(p):
        ret = "Fine. Be that way!"
    return ret
