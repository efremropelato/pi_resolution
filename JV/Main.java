import java.util.Random;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        int pointsNumber = Integer.parseInt(System.getenv("PI_SIMULATIONS"));

        int insideCircle = 0;
        long start = System.nanoTime();

        Random rand = new Random();
        for (int i = 0; i < pointsNumber; i++) {
            double x = rand.nextDouble();
            double y = rand.nextDouble();

            if (x * x + y * y < 1) {
                insideCircle++;
            }
            // Clear console (not directly supported in Java)
            // System.out.printf("\033[H\033[2J"); // Clear console
            // System.out.printf("Countdown %d\n", pointsNumber - i);
        }
        // Clear console (not directly supported in Java)
        long finish = System.nanoTime();
        System.out.printf("Java = %f seconds for => insideCircle: %d\n",
                          (finish - start) / 1_000_000_000.0, insideCircle);

        double pi = 4.0 * insideCircle / pointsNumber;
        System.out.printf("Java = PI value with %d => %f\n", pointsNumber, pi);
        System.out.print("-------------------------------------------------");
    }
}

