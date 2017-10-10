package singlelinkedlist

import (
	"section3/sllnode"
	"fmt"
	"strconv"
)

type SingleLinkedList struct {
	head sllnode.Node
	next *SingleLinkedList
}

func NewSingleLinkedList() (*SingleLinkedList) {
	return new(SingleLinkedList)
}

func (sll *SingleLinkedList) Add(value int) {
	if sll.head == nil {
		node := sllnode.NewSLLNode()
		node.SetValue(value)
		sll.head = node
	} else {
		if sll.next == nil {
			sll.next = NewSingleLinkedList()
		}
		sll.next.Add(value)
	}
	return
}

func (sll *SingleLinkedList) String() (returnString string){
	sliceOfValues := sll.toSlice()
	if len(sliceOfValues) < 1 {
		return ""
	}
	for _, elem := range sliceOfValues[:len(sliceOfValues)-1] {
		returnString = returnString + fmt.Sprintf("%d - ", elem)
	}
	return returnString + strconv.Itoa(sliceOfValues[len(sliceOfValues)-1])
}

func (sll *SingleLinkedList) toSlice() (returnSlice []int){
	returnSlice = []int{}
	if sll.head != nil {
		returnSlice = append(returnSlice, sll.head.GetValue())
		if sll.next != nil {
			returnSlice = append(returnSlice, sll.next.toSlice()...)
		}
	}
	return returnSlice
}
