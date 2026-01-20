class Solution(object):
    def findNumbers(self, nums):
        count = 0
        for num in range(len(nums)):
            if len(str(nums[num])) % 2 == 0:
                count += 1
        return count