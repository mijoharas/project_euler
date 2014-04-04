fn main() {
    let mut count = 0;
    let mut number = 1;

    while (number < 1000) {
        if (number % 3 == 0 || number % 5 == 0) {
            count += number;
        }
        number += 1;
    }
    println!("{}", count);
}

// get used to control_flow in c like languages first, then encapsulate things in functions,
// ugly to use main for everything.
