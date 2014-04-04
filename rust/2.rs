fn main() {
    let mut num = 1;
    let mut old = 1;
    let mut count = 0;
    while num < 4000000 {
        if num % 2 == 0 {
            count += num;
        }
        let tmp = old;
        old = num;
        num = fibonnacci(tmp, num);

    }
    println!("{}",count )
}

fn fibonnacci(x: int, y: int) -> int {
    x + y
}
