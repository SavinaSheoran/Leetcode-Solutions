class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        ans = int(str(abs(x))[::-1]) * (-1 if x < 0 else 1)
        return ans if -2**31 <= ans < 2**31 else 0