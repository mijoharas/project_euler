pub fn solve() {
    let mut pythagorean_triplets: Vec<(u64,u64,u64)> = vec![];
    for num1 in 1..1001 {
        for num2 in 1..(1001 - num1) {
            for num3 in 1..(1001 - num1 - num2) {
                if num1 + num2 + num3 == 1_000 && (num1 as u64).pow(2) + (num2 as u64).pow(2) == (num3 as u64).pow(2) {
                    pythagorean_triplets.push((num1,num2,num3))
                }
            }
        }
    }
    pythagorean_triplets.first().map(|&(a,b,c)|
                                     {
                                         println!("{}", a * b * c);
                                     }
    );
}
