class Garden(object):
    default_students = "Alice Bob Charlie David Eve Fred \
        Ginny Harriet Ileana Joseph Kincaid Larry".split()

    def __init__(self, garden, students=default_students):
        rows = garden.splitlines()
        if students != Garden.default_students:
            students.sort()

        self.cups = {}

        for row in rows:
            plants = iter(row)
            for student in students:
                try:
                    if student not in self.cups:
                        self.cups[student] = []
                    self.cups[student].append(next(plants))
                    self.cups[student].append(next(plants))
                except:
                    pass
        for student in students:
            cups = map(Garden.charToPlant, self.cups[student])
            self.cups[student] = list(cups)

    def plants(self, kid):
        return self.cups[kid]

    def charToPlant(char):
        if char == 'V':
            return 'Violets'
        if char == 'R':
            return 'Radishes'
        if char == 'G':
            return 'Grass'
        if char == 'C':
            return 'Clover'
