pub fn is_leap_year(year: u64) -> bool {
    let is_divisible_by = |y: u64| -> bool {
        year % y == 0
    };
    is_divisible_by(400) || (!is_divisible_by(100) && (is_divisible_by(4)))
}
