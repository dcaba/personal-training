#!/usr/bin/python3.4

def testfunc():
    print("test")

print("Hello World")
age = 14
print(age)
age += 1
print(age)
age,name = 19.1,"maria"
print (age, name, sep=',')

second_var,third_var = "casa2","casa3"
print(second_var,third_var)

wtf = what_the_fuck = "WTF!"
twice_wtf = wtf + what_the_fuck
print(wtf,what_the_fuck,twice_wtf)
testfunc()

numbers = []
strings = []

seq = ["a","dani",10,"bye","2","S2"]

for i in seq:
    if isinstance(i,int):
        numbers.append(i)
    elif isinstance(i,str):
        strings.append(i)
    else:
        print("unkown type")

print("numbers: ",numbers)
print("strings: ",strings)

