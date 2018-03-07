extern crate num_bigint;
extern crate num;
use self::num_bigint::{ToBigUint};

pub fn solve() {
    let num = 100;
    let answer = square_of_sums(num) - sum_of_squares(num);
    println!("{}", answer);
}

pub fn sum_of_squares(num: u64) -> num_bigint::BigUint {
    (1..num+1).map(
        |i| num::pow(i.to_biguint().unwrap(), 2)
    // fold required because sum isn't implemented for BigUint yet
    ).fold(
        (0 as i64).to_biguint().unwrap(),
        |a,b| a + b)
}

pub fn square_of_sums(num: u64) -> u64 {
    (1..num+1).sum::<u64>().pow(2)
}

