
let pointsNumber = 1000000;

let insideCircle = 0;
let outsideCircle = 0;
const start = new Date().getTime();

for (let i = 0; i < pointsNumber; i++) {
    const x = Math.random();
    const y = Math.random();

    if (x * x + y * y < 1) {
        insideCircle++;
    } else {
        outsideCircle++;
    }
    // console.clear()
    // console.log("Countdown", pointsNumber-i)
}
// console.clear()
const finish = new Date().getTime()
console.log("JS = ", (finish-start)/1000, "seconds for => insideCircle: ", insideCircle, " , outsideCircle: ", outsideCircle);

const pi = 4.0 * insideCircle / pointsNumber;
console.log("JS = PI value with ", pointsNumber, " => ", pi);
console.log("-------------------------------------------------")