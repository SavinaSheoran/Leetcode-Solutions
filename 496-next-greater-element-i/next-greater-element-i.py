class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        x = len(nums1)
        output = [-1]*x
        for i in range(x):
            current_element = nums1[i]
            for j in range(nums2.index(current_element)+1, len(nums2)):
                element_to_compare = nums2[j]
                if element_to_compare > current_element:
                    output[i] = element_to_compare
                    break   
        return output