package main

import (
	"fmt"
	"reflect"
	"strings"
	"section3/sllnode"
)


func nodeValueSetter(node sllnode.Node)  {
	node.SetValue(3)
}

func nodeValuePrinter(node sllnode.Node)  {
	fmt.Println(strings.Repeat("#", 10))
	fmt.Println("Node type:", reflect.TypeOf(node))
	fmt.Println("Value:", node.GetValue())
	fmt.Println(strings.Repeat("#", 10))
}

func main() {
	var node sllnode.Node
	node = sllnode.NewSLLNode()
	nodeValueSetter(node)
	nodeValuePrinter(node)

	node = sllnode.NewPowerNode()
	nodeValueSetter(node)
	nodeValuePrinter(node)
	if pnode, ok := node.(*sllnode.PowerNode); ok {
		fmt.Println("INFO: powerNode does allow me to get a random value,", pnode.GetRandomValue())
	}


}
