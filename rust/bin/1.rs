fn main() {
    let answer: i32 = (1..1000).filter(|num| predicate(num)).fold(0, |a, b| a + b);
    println!("{}", answer);
}

fn predicate(num: &i32) -> bool {
    num % 3 == 0 || num % 5 == 0
}
