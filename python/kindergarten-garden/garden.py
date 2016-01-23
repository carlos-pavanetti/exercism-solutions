class Garden(object):
    default_students = "Alice Bob Charlie David Eve Fred \
        Ginny Harriet Ileana Joseph Kincaid Larry".split()

    def __init__(self, garden, students=default_students):
        rows = garden.splitlines()
        if students != Garden.default_students:
            students.sort()
        self.students = students

        self.cups = {}
        cups = self.proccess_rows(rows)

        for kid in students:
            self.cups[kid] = [Garden.inittialToPlant(i) for i in cups[kid]]

    def plants(self, kid):
        if kid in self.students:
            return self.cups[kid]

    initMap = {'V': 'Violets', 'R': 'Radishes', 'G': 'Grass', 'C': 'Clover'}

    def inittialToPlant(char):
        if char in Garden.initMap:
            return Garden.initMap[char]

    def proccess_rows(self, rows):
        cups = {kid: [] for kid in self.students}

        for row in rows:
            plants = iter(row)
            for kid in self.students:
                try:
                    cups[kid].append(next(plants))
                    cups[kid].append(next(plants))
                except:
                    break
        return cups
