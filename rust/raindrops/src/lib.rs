pub fn raindrops(number: u32) -> String {
    let mut response = String::from("");
    let is_divisible_by = |y: u32| -> bool {
        number % y == 0
    };
    if is_divisible_by(3) {
        response.push_str("Pling");
    }
    if is_divisible_by(5) {
        response.push_str("Plang");
    }
    if is_divisible_by(7) {
        response.push_str("Plong");
    }
    if response.chars().count() == 0 {
        response = number.to_string();
    }
    return response;
}
