package main

import (
	"fmt"
	"log"
	"time"
)

func helloWord(c chan string, end chan bool) {
	log.Println("Child thread recovering the value")
	fmt.Println("Hello", <-c)
	log.Println("Child sleeping a bit... we had lot of things to do!")
	time.Sleep(500 * time.Millisecond)
	log.Println("Child thread informing it finished!")
	end <- true
}

func main() {
	c := make(chan string)
	end := make(chan bool)
	go helloWord(c, end)
	log.Println("Main thread sending the value")
	c <- "world"
	log.Println("Main thread waiting for completion")
	if <- end {
		log.Println("Main got finishing signal. Done")
	}
}
