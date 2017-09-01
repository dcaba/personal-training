package main

import (
	"fmt"
	"strconv"
	"os"
)

func recursiveSearch(array []int, valueWeAreLooking int) (position int){
	fmt.Print("DEBUG: Current array is ")
	fmt.Println(array)

	arrayLength := len(array)
	fmt.Println("DEBUG: Arraysize is " + strconv.Itoa(arrayLength))

	if arrayLength < 1 {
		return -1
	}

	midPos := int(arrayLength /2)
	fmt.Println("DEBUG: Mid position is " + strconv.Itoa(midPos))

	midValue := array[midPos]
	fmt.Println("DEBUG: Mid value " + strconv.Itoa(midValue))

	switch {
	case valueWeAreLooking == midValue:
		return midPos
	case valueWeAreLooking > midValue:
		splitArray := array[midPos+1:]
		fmt.Println("DEBUG: Mid position is smaller! Breaking array to: ")
		fmt.Println(splitArray)
		return midPos + 1 + recursiveSearch(splitArray, valueWeAreLooking)
	case valueWeAreLooking < midValue:
		splitArray := array[:midPos]
		fmt.Print("DEBUG: Mid position is bigger! Breaking array to: ")
		fmt.Println(splitArray)
		return recursiveSearch(splitArray, valueWeAreLooking)
	}

	return -1

}

func main() {
	array := []int{1,2,5,7,8,9,10}
	lookingFor := 0
	humanReadablePosition := recursiveSearch(array, lookingFor) + 1
	if humanReadablePosition < 0 || humanReadablePosition > len(array){
		fmt.Printf("Number %v not found in the array %v.", lookingFor, array)
		// This still doesnt work if the number is higher than the max
		os.Exit(-1)
	}
	fmt.Printf("%v is in the postition %v of the array %v.", lookingFor, humanReadablePosition, array)
}
