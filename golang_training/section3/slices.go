package main

import "fmt"

func testEq(a, b []int) bool {

	fmt.Println("Checking slices...")
	if a == nil && b == nil {
		return true;
	}

	if a == nil || b == nil {
		return false;
	}

	if len(a) != len(b) {
		return false
	}

	fmt.Println("Obvious checks completed with no findings. Checking value per value...")

	for i := range a {
		if a[i] != b[i] {
			fmt.Println("Difference found")
			return false
		}
	}

	fmt.Println("No differences found")
	return true
}

func playWithMemory(a, b []int)  {
	fmt.Printf("Mem address a: %p\n", &a)
	fmt.Printf("Mem address b: %p\n", &b)

	for i, _ := range a {
		a[i] = 1
	}

	for i, _ := range b {
		a[i] = 2
	}
}

func main() {
	var sliceNotAllocated []int
	fmt.Println("Not not allocated:", sliceNotAllocated)

	sliceAllocated := make([]int, 100)
	fmt.Println("Not allocated:", sliceAllocated)

	for i := 0; i < 100; i++ {
		sliceNotAllocated = append(sliceNotAllocated, 3)
	}

	fmt.Println("Not not initially allocated, with values:", sliceNotAllocated)

	if testEq(sliceNotAllocated, sliceAllocated) {
		fmt.Println("Both slices look equal")
	} else {
		fmt.Println("Slices do differ")
	}

	playWithMemory(sliceAllocated, sliceNotAllocated)

	fmt.Println("Not not allocated:", sliceNotAllocated)
	fmt.Println("Not allocated:", sliceAllocated)

	sliceNotAllocated = nil
	sliceAllocated = nil

	sliceAllocated = make([]int, 100)
	sliceNotAllocated = make([]int, 100)

	fmt.Println("Not not allocated:", sliceNotAllocated)
	fmt.Println("Not allocated:", sliceAllocated)


}
