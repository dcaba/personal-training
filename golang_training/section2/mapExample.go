package main

import "fmt"

func main()  {
	//var mapSample map[string]int
	mapSample := make(map[string]int)
	mapSample["testKey"] = 10

	mapSample2 := map[string]int {
		"testKey2": 2,
	}
	fmt.Println(mapSample, mapSample2)

	v, ok := mapSample["testKey"]
	v2, ok2 := mapSample2["testKey"]
	fmt.Println(v, ok, v2, ok2)

	var mapList []map[string]int
	mapList = []map[string]int{
		mapSample,
		mapSample2,
	}
	for k, v := range mapList {
		fmt.Println("Key: ", k, "Value:", v)
	}

}
