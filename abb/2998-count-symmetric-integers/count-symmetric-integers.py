class Solution(object):
    def countSymmetricIntegers(self, low, high):
        count = 0
        for num in range(low, high + 1):
            digits = str(num)
            if len(digits) % 2 != 0:
                continue
            n = len(digits) // 2
            left = digits[:n]
            right = digits[n:]
            left_sum = 0
            for d in left:
                left_sum += int(d)

            right_sum = 0
            for d in right:
                right_sum += int(d)

            if left_sum == right_sum:
                count += 1

        return count



