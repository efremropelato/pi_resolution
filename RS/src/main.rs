use rand::Rng;
use std::time::Instant;
use std::env;

fn main() {
    let points_number = env::var("PI_SIMULATIONS").expect("REASON").parse().unwrap();
    let mut inside_circle = 0;

    let start = Instant::now();
    let mut rng = rand::thread_rng();

    for _ in 0..points_number {
        let x: f64 = rng.gen();
        let y: f64 = rng.gen();

        if x * x + y * y < 1.0 {
            inside_circle += 1;
        }
    }

    let duration = start.elapsed().as_secs_f64();

    println!(
        "\nRust = {} seconds for => inside_circle: {}",
        duration, inside_circle
    );

    let pi = 4.0 * inside_circle as f64 / points_number as f64;
    println!("Rust = PI value with {} => {}", points_number, pi);
    println!("-------------------------------------------------");
}