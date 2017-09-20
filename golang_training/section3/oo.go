package main

import "fmt"

type node interface {
	setValue(v int)
	getValue() (int)
}

type SLLNode struct {
	next *SLLNode
	data int
}

func (node *SLLNode) setValue(value int) {
	node.data = value
	return
}

func (node *SLLNode) getValue() (value int) {
	value = node.data
	return
}

func newSLLNode() (*SLLNode) {
	return new(SLLNode)
}

func main() {
	sllNode := new(SLLNode)
	sllNode.setValue(3)
	fmt.Println(sllNode.getValue())
}
