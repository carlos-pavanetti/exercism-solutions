from collections import defaultdict
from copy import deepcopy


class School(object):
    def __init__(self, name=""):
        self.db = defaultdict(set)
        self.name = ""

    def add(self, student, grade):
        self.db[grade].add(student)

    def grade(self, grade):
        return deepcopy(self.db[grade])

    def sort(self):
        school = []
        for grade, students in self.db.items():
            students = sorted(students)
            school.append((grade, tuple(students)))

        return school
