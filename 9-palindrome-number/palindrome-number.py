class Solution(object):
    def isPalindrome(self, x):
        if x < 0:
            return False
        x = str(x)

        i = 0
        while i < len(x) - 1:
            if x[i] == x[len(x) - 1 - i]:
                i += 1
            else:
                return False
        return True