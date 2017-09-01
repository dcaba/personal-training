package main

import "fmt"
import "runtime"
import "strings"

func assess_os()(string) {
	switch os:= runtime.GOOS; os {
		case "linux":
			return "You are a great man"
		case "windows":
			return "Are you running this from a game console?"
		case "darwin":
			return "Preppy bastard"
		default:
			if strings.Contains(os, "bsd") {
				return "You are a respectable man"
			}
			return "You suck anyway"
	}
}

func main() {
	defer fmt.Println("But it doesnt matter... in any case, it smells")
	fmt.Println(assess_os())
	
}