package singlelinkedlist

import (
	"section3/sllnode"
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

func (sll *SingleLinkedList) Retrieve() (returnSlice []int){
	returnSlice = []int{}
	if sll.head != nil {
		returnSlice = append(returnSlice, sll.head.GetValue())
		if sll.next != nil {
			returnSlice = append(returnSlice, sll.next.Retrieve()...)
		}
	}
	return returnSlice
}
