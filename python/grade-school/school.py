from collections import defaultdict


class School(object):
    def __init__(self, name=""):
        self.db = defaultdict(set)
        self.name = ""

    def add(self, student, grade):
        self.db[grade].update({student})

    def grade(self, grade):
        return self.db[grade]

    def sort(self):
        school = []
        for grade, students in self.db.items():
            students = list(students)
            students.sort()
            school.append((grade, tuple(students)))

        return school
