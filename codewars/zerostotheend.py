def zero_mgmt(array):
# returns number of actual 0s and a list without zeros
    res = []
    zeros = 0
    for el in array:
        if el == 0 and el is not False:
            zeros += 1
        else:
            res.append(el)
    return zeros, res


def move_zeros(array):
    print "Array is: {}".format(array)
    zeros, array = zero_mgmt(array)
    print "Array after removal: {}".format(array)
    array.extend([0]*zeros)
    print "Extended array: {}".format(array)
    return array

print move_zeros([3, "a", 0, 0, 0, False, "", 1, "seq", 0, 0, 3])
print move_zeros([0]*4)
