class Solution(object):
    def twoSum(self, nums, target):
        dict = {}
        for i, num in enumerate(nums):
            cal = target - num
            if cal in dict:
                return(dict[cal], i)
            dict[num] = i
        return i, num