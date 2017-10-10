package main

import (
	"fmt"
	"time"
)

func main() {
	word := "world"
	for i := 0; i < 1000; i += 1 {
		go func() {
			word2 := word + " - " + time.Now().String()
			fmt.Println("hello", word2, "!")
		}()
	}
	word = "fuck"
	time.Sleep(time.Second * 1)
}
