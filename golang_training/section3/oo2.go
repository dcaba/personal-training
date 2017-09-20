package main

import "fmt"

type person interface {
	getCondition() (string)
	promote() (error)
	isAlive() (bool)
	kill() (error)
}

type schEmployee struct {
	position string
	alive bool
}

var schJL = []string{
	"engineer",
	"staff",
	"principal",
	"fellow",
}

func newSchEmployee() (schEmployee) {
	//return new(schEmployee)
	return schEmployee{
		position:schJL[0],
		alive:true,
	}
}

func (sche schEmployee) getPosition() (string) {
	return string(sche.position)
}

func (sche schEmployee) isAlive() (bool)  {
	return sche.alive
}

func (sche *schEmployee) kill() (error) {
	sche.alive = false
	return nil
}

func (sche *schEmployee) promote() (error) {
	if !sche.isAlive() {
		return fmt.Errorf("You cannot promote ghosts, yet")
	}
	var pos int
	var stype string
	for pos, stype = range schJL {
		if stype == sche.position {
			break
		}
	}

	if pos + 1 >= len(schJL) {
		return fmt.Errorf("You cannot promote him anymore")
	}

	sche.position = schJL[pos + 1]
	return nil
}

var civTypes = []string{
	"alone",
	"with friends",
	"serial killer",
}

func makeSchEmplKingOfTheNorth(emp *schEmployee)  {
	var err error
	for err == nil {
		originalCondition := emp.getPosition()
		err = emp.promote()
		if err != nil {
			break
		}
		fmt.Println("INFO: Employee upgraded from", originalCondition, "to", emp.getPosition())
	}
	fmt.Println("ERROR:", err)
	return
}

func main() {
	schemployee := newSchEmployee()
	schemployee2 := newSchEmployee()
	schemployee.kill()
	makeSchEmplKingOfTheNorth(&schemployee)
	makeSchEmplKingOfTheNorth(&schemployee2)
}
