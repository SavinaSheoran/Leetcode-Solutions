class Solution:
    def nextGreaterElements(self, nums: List[int]) -> List[int]:
        n = len(nums)
        output = [-1] * n
        for i in range(n):
            current_element = nums[i]
            greater_element_found = False
            for j in range(i+1, len(nums)):
                element_to_compare = nums[j]
                if element_to_compare > current_element:
                    output[i] = element_to_compare
                    greater_element_found = True
                    break 
            if greater_element_found:
                continue
            for j in range(i):
                element_to_compare = nums[j]
                if element_to_compare > current_element:
                    output[i] = element_to_compare
                    break
        return output