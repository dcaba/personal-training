package Utility

import "fmt"

func SayHello() {
	fmt.Println("Hello world")
}

func Say(s string, i int) {
	fmt.Println(s, i)
}

func addSubstractMultiply(a, b int) (addition, subtraction, multiplication int) {
	addition = a+b
	subtraction = a-b
	multiplication = a*b
	return
}