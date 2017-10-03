package main

import (
	"section3/singlelinkedlist"
	"fmt"
)

func main()  {
	sll := singlelinkedlist.NewSingleLinkedList()
	sll.Add(3)
	fmt.Println(sll.Retrieve())
	sll.Add(5)
	fmt.Println(sll.Retrieve())
	sll.Add(7)
	fmt.Println(sll.Retrieve())
	sll.Add(11)
	fmt.Println(sll.Retrieve())
}
