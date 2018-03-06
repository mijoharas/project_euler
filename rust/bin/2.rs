fn main() {
    let answer: u64 = iterative_fibonacci().take_while(|num| *num < 4000000)
        .filter(|num| num % 2 == 0)
        .sum();
    println!("{}", answer);
}

pub struct Fibonacci {
    curr: u64,
    next: u64
}

impl Iterator for Fibonacci {
    type Item = u64;
    fn next(&mut self) -> Option<u64> {
        let new_next = self.curr + self.next;

        self.curr = self.next;
        self.next = new_next;

        Some(self.curr)
    }
}

fn iterative_fibonacci() -> Fibonacci {
    Fibonacci {curr: 1, next: 1}
}

