class Solution(object):
    def numJewelsInStones(self, jewels, stones):
        count = 0
        for i in range(0, len(stones)):
            if stones[i] in jewels:
                count += 1
        return count