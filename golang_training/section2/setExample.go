package main

import (
	"fmt"
	"strings"
	"strconv"
	"time"
)

type Set map[string]struct{}

func (toBeAppended Set) append(item string) (Set) {
	toBeAppended[item] = struct{}{}
	return toBeAppended
}

func (containing Set) getValues() (sliceOutput []string) {

	for k, _ := range containing {
		sliceOutput = append(sliceOutput, k)
	}

	return sliceOutput
}

func appendDemoItems(toBeAppended Set) {
	toBeAppended.append("item")
	toBeAppended.append("item2")
	toBeAppended.append("item")
	for i := 1; i <= 10; i++ {
		toBeAppended.append(strconv.Itoa(i))
	}
	for i := 1; i <= 10; i++ {
		toBeAppended.append(strconv.Itoa(i))
	}
	return
}

func printValues(values []string) {
	fmt.Println("INFO: Printing values...")
	for i, v := range values {
		fmt.Println("Item:", i, ", value:", v)
	}
}

func printHello() (startTime time.Time) {
	startTime = time.Now()
	fmt.Println(strings.Repeat("#", 10))
	fmt.Println("# Hello")
	fmt.Println(strings.Repeat("#", 10))
	return startTime
}

func printBye(startTime time.Time) {
	fmt.Println(strings.Repeat("#", 10))
	fmt.Println("# Bye")
	fmt.Println(strings.Repeat("#", 10))
	fmt.Println("INFO: Execution time: ", time.Since(startTime))
}

func main() {
	startTime := printHello()
	defer printBye(startTime)

	setSample := make(Set)
	appendDemoItems(setSample)
	printValues(setSample.getValues())
}
