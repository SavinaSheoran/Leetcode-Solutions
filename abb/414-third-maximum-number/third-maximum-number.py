class Solution(object):
    def thirdMax(self, nums):
        first=second=third=-10**18
        for num in nums:
            if num==first or num==second or num==third:
                continue
            if num > first:
                third = second
                second = first
                first = num
            elif num > second:
                third = second
                second = num
            elif num > third:
                third = num
        if third == -10**18:
            return first
        return third