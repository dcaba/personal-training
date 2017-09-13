package main

import (
	"fmt"
)

type game struct {
	name string
	gtype gameType
	players int
}

func (g game) print()  {
	fmt.Println("name: ", g.name)
	fmt.Println("type: ", g.gtype)
	fmt.Println("players: ", g.players)

}

type gameType struct {
	name        string
	description string
}

func printGames(games []game)  {
	fmt.Println("Printing game statistics")
	for _, eachGame:= range games {
		fmt.Printf("mem address: %p \n", &eachGame)
		eachGame.print()
	}
	return

}

func main()  {
	var gametype1 gameType
	gametype1.name = "BallGame"
	gametype1.description = "Ball based games"

	game1 := game{
		name:		"Tenis",
		gtype:		gametype1,
		players:	2,
	}

	game2 := game1

	game3 := &game1
	game3.players = 10

	parms := []game{
		game1,
		game2,
		*game3,
	}
	printGames(parms)

	fmt.Println("bye!")

}
