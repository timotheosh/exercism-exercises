class Matrix():
    def __init__(self, matrix_string):
        self.matrix = []
        for x in matrix_string.split('\n'):
            self.matrix.append([int(y) for y in x.split()])

    def row(self, index):
        return self.matrix[index - 1]

    def column(self, index):
        return [x[index - 1] for x in self.matrix]
