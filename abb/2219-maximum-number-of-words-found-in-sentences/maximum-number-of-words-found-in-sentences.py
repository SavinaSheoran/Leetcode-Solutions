class Solution(object):
    def mostWordsFound(self, sentences):
        max_words = 0
        for sentence in sentences:
            words = sentence.split(" ")
            count = len(words)
            if count > max_words:
                max_words = count
        return max_words