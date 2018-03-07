pub fn main() {
    let range = 100..999;
    let range2 = &range.clone();
    let numbers = range.flat_map(move |num1| range2.clone().map(move |num2| num1 * num2));
    let stringy_numbers = numbers.map(|num| num.to_string());
    let answer = stringy_numbers
        .filter(|string| is_palindrome(string))
        .map(|string| string.parse::<u32>().unwrap())
        .max();
    println!("{}", answer.unwrap());
}

fn is_palindrome(string: &str) -> bool {
    // could be more efficient, but fuck it, who cares that much.
    string == string.chars().rev().collect::<String>()
}
