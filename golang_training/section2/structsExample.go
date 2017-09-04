package main

import "fmt"

type game struct {
	name string
	gtype gameType
	players int
}

type gameType struct {
	name        string
	description string
}

func printGames(games []game)  {
	for _, eachGame:= range games {
		fmt.Println("name: ", eachGame.name)
		fmt.Println("type: ", eachGame.gtype)
		fmt.Println("players: ", eachGame.players)
	}
	return

}

func main()  {
	var gametype1 gameType
	gametype1.name = "BallGame"
	gametype1.description = "Ball based games"

	game1 := game{
		name:	"Tenis",
		gtype:	gametype1,
		players:	2,
	}

	parms := []game{game1}
	printGames(parms)

	fmt.Println("bye!")

}
