extern crate primes;
use self::primes::PrimeSet;

pub fn solve() {
    let mut pset = PrimeSet::new();
    let answer: u64 = pset.iter().take_while(|n| n < &2_000_000).sum();
    println!("{:?}", answer);
}
