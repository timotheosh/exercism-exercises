class Allergies(object):

    ALLERGENS = ['eggs', 'peanuts', 'shellfish', 'strawberries',
                 'tomatoes', 'chocolate', 'pollen', 'cats']

    def __init__(self, score):
        self.lst = [item for (shift, item)
                    in enumerate(self.ALLERGENS) if score >> shift & 1]

    def is_allergic_to(self, item):
        return item in self.lst
