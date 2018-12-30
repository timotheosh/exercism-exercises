
class HighScores(object):
    def __init__(self, scores):
        self.scores = scores
        self.sorted_scores = scores.copy()
        self.sorted_scores.sort()
        self.sorted_scores.reverse()

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return self.sorted_scores[0]

    def personal_top(self):
        return self.sorted_scores[:3]

    def report(self):
        diff = self.personal_best() - self.latest()
        if diff == 0:
            return "Your latest score was {}. That's your personal best!".format(self.personal_best())
        else:
            return "Your latest score was {}. That's {} short of your personal best!".format(
                self.latest(), diff)
