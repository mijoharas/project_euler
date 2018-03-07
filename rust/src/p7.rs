extern crate primes;
use self::primes::PrimeSet;

pub fn solve() {
    let mut pset = PrimeSet::new();
    let vector: Vec<u64> = pset.iter().skip(10_000).take(1).collect();
    let answer: &u64 = vector.first().unwrap();
    println!("{:?}", answer);
}
