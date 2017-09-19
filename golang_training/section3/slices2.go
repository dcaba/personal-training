package main

import "fmt"

func main() {
	slice := []int{1,2,3,4,5}
	fmt.Println(slice, len(slice), cap(slice))
	fmt.Println(slice[1:4][2])

	extendedSlice := append(slice,2,3)
	fmt.Println(extendedSlice, len(extendedSlice), cap(extendedSlice))
	fmt.Println("pos [5]:",extendedSlice[5])
	fmt.Println("pos [6]:",extendedSlice[6])
	fmt.Println("picking the first 8 elements (one extra!):",extendedSlice[:8])
	fmt.Println("picking the first 3 elements of a 2 element slice (one extra!):",extendedSlice[0:2][0:3])

	fmt.Println("Copying first 4 elements of the extended slice")
	copiedSlice := make([]int, 5)
	n := copy (copiedSlice, extendedSlice[:4])
	fmt.Println("Copied:", n)
	fmt.Println("Resulting slice:", copiedSlice)
	fmt.Println("Capacity:", cap(copiedSlice))
	fmt.Println("Length:", len(copiedSlice))

	fmt.Println("Append test:", append(extendedSlice[:4], copiedSlice...))


}
