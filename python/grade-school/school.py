class School(object):
    def __init__(self, name=""):
        self.db = {}
        self.name = name

    def add(self, student, grade):
        if grade not in self.db:
            self.db[grade] = {student}
        else:
            self.db[grade].update({student})

    def grade(self, grade):
        try:
            return self.db[grade]
        except:
            return set()

    def sort(self):
        school = []
        for grade, students in self.db.items():
            try:
                students = list(students)
                students.sort()
                school.append((grade, tuple(students)))
            except:
                print(students)

        return school
