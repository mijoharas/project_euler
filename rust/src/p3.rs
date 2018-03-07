pub fn solve() {
    let number: i64 = 600851475143;
    let root: i64 = nearest_integer_root(number);
    let prime_factors: i64 = (1..root)
        .filter(|num| is_factor(num, &number) && is_prime(num))
        .max()
        .unwrap();
    println!("{:?}", prime_factors);
}

fn is_prime(number: &i64) -> bool {
    let root = nearest_integer_root(*number);
    (2..root).all(|num| number % num != 0)
}

fn nearest_integer_root(num: i64) -> i64 {
    (num as f64).sqrt().floor() as i64
}

fn is_factor(factor: &i64, number: &i64) -> bool {
    number % factor == 0
}
