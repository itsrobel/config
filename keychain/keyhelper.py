import csv
import os


class KeyTable:
    def __init__(self, name, directory="tables"):
        self.name = name
        self.directory = directory
        self.fieldnames = ["name", "key", "salt"]

    def create_table(self):
        table = open(f"%s/%s.csv" % (self.directory, self.name), "x")
        table = csv.DictWriter(table, fieldnames=self.fieldnames)
        table.writeheader()
        print(f"Table %s created" % self.name)

    def is_table(self):
        try:
            open(f"%s/%s.csv" % (self.directory, self.name), "r")
            print(f"Table %s exists" % self.name)
            return True

        except FileNotFoundError:
            print(f"Table %s does not exist" % self.name)
            return False

    def read_table(self):

        table = open(f"%s/%s.csv" % (self.directory, self.name), "r")
        table = csv.DictReader(table)
        return table
        # for row in reader:
        #     print(row["name"], row["key"], row["salt"])

    def write_table(self, name, key, salt):
        table = open(f"%s/%s.csv" % (self.directory, self.name), "a")
        # fieldnames = ["name", "key", "salt"]
        table = csv.DictWriter(table, fieldnames=self.fieldnames)
        wrote = table.writerow({"name": name, "key": key, "salt": salt})
        print(f"%s \n Table write was successful" % wrote)

    def get_row(self, name):
        table = open(f"%s/%s.csv" % (self.directory, self.name), "r")
        table = csv.DictReader(table)
        for row in table:
            if row["name"] == name:
                return row
        return {"name": "not found", "key": "not found", "salt": "not found"}


def check_directory(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)
    return directory
