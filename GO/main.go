package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	pointsNumber := 1000000

	insideCircle := 0
	start := time.Now()

	for i := 0; i < pointsNumber; i++ {
		x := rand.Float64()
		y := rand.Float64()

		if x*x+y*y < 1 {
			insideCircle++
		}
		// fmt.Printf("\033[H\033[2J") // Clear console
		// fmt.Printf("Countdown %d\n", pointsNumber-i)
	}
	//fmt.Printf("\033[H\033[2J") // Clear console
	finish := time.Now()
	fmt.Printf("GO = %f seconds for => insideCircle: %d\n", finish.Sub(start).Seconds(), insideCircle)

	pi := 4.0 * float64(insideCircle) / float64(pointsNumber)
	fmt.Printf("GO = PI value with %d => %f\n", pointsNumber, pi)
	fmt.Print("-------------------------------------------------")
}
