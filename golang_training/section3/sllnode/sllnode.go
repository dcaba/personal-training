package sllnode

import (
	"math/rand"
	"time"
)

// Interface
type Node interface {
	SetValue(v int)
	GetValue() (int)
}

// Implementation1
type SLLNode struct {
	next *SLLNode
	data int
}

func NewSLLNode() (*SLLNode) {
	return new(SLLNode)
}

func (node *SLLNode) SetValue(value int) {
	node.data = value
	return
}

func (node *SLLNode) GetValue() (int) {
	return node.data

}

// Implementation2
type PowerNode struct {
	next *PowerNode
	data int
}

func NewPowerNode() (*PowerNode)  {
	return new(PowerNode)
}

func (node *PowerNode) SetValue(value int) {
	node.data = value * 10
}

func (node PowerNode) GetValue() (int)  {
	return node.data
}

func (node PowerNode) GetRandomValue() (int)  {
	return rand.New(rand.NewSource(time.Now().UnixNano())).Int()
}


