#!/usr/bin/python3.4

def print_sequence(type, seq):
    i = 1
    for item in seq:
        print("%s #%s is %s" % (type,i,item))
        i = i + 1

numbers = []
strings = []

seq = ["a","dani",10,"bye","2","S2",3]

for i in seq:
    if isinstance(i,int):
        numbers.append(i)
    elif isinstance(i,str):
        strings.append(i)
    else:
        print("unknown type")

print("numbers: ",numbers)
print("strings: ",strings)

print_sequence("Number",numbers)
print_sequence("String",strings)

