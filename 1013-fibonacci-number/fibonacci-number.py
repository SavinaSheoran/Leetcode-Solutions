class Solution(object):
    def fun(self,num):
        if num<=1:
            return num
        return self.fun(num-1) + self.fun(num-2)
    def fib(self, n):
        return self.fun(n)
    