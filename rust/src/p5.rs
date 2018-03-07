#![feature(iterator_step_by)]

pub fn solve() {
    let answer = (20..).step_by(20).skip_while(|num| {
        !is_divisible_by_one_to_twenty(num)
    }).take(1).collect::<Vec<u64>>();
    println!("{:?}", answer.first().unwrap());
}

fn is_divisible_by_one_to_twenty(num: &u64) -> bool {
    (2..20).all(|i| num % i == 0)
}
