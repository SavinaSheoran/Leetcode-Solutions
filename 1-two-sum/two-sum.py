class Solution(object):
    def twoSum(self, nums, target):
        n = {}
        for i, num in enumerate(nums):
            cal = target - num
            if cal in n:
                return [n[cal], i]
            n[num] = i
        return []