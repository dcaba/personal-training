package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

type theySaidSoResponse struct {
	success  string
	contents string
}

func main() {
	response, err := http.Get("http://api.theysaidso.com/qod.json")
	if err != nil {
		fmt.Println("Error while fetching contents from the API: " + err.Error())
		return
	}
	defer response.Body.Close()
	contents, err := ioutil.ReadAll(response.Body)
	if err != nil {
		fmt.Println("Error reading response:" + err.Error())
		return
	}

	var jsonResponse theySaidSoResponse
	json.Unmarshal(contents, jsonResponse)

	fmt.Println(jsonResponse.contents)

	fmt.Println("Program successfuly terminated")
}
