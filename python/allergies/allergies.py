class Allergies(object):
    allergies_scores = {
        "eggs": 1,
        "peanuts": 2,
        "shellfish": 4,
        "strawberries": 8,
        "tomatoes": 16,
        "chocolate": 32,
        "pollen": 64,
        "cats": 128
    }

    def __init__(self, score):
        self.score = score
        self.list_allergies()

    def is_allergic_to(self, item):
        try:
            return item in self.lst
        except:
            raise Exception(item + " is not a valid allergy")

    def list_allergies(self):
        self.lst = []
        for allergy, score in Allergies.allergies_scores.items():
            if score & self.score != 0:
                self.lst.append(allergy)
