def recursion(number):
   if number == 0:
       return 1
   return number*recursion(number-1)  

def tailRecursion(number,a):
   if number == 0:
       return a
   return tailRecursion(number-1,number*a)


def iterative(number):
   result = 1
   if number == 0:
       return 1
   for i in xrange(2,number+1):
       result = result*i
   return result

def fact(number):
   return tailRecursion(number,1)

number = int(raw_input("Enter the number that you want to find the factorial of: "))
print "Factorial using recursion: ", recursion(number)
print "Factorial using tail-recursion: ", fact(number)
print "Factorial using iteration: ", iterative(number)