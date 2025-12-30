use std::env;
use std::process;

fn main() {
	let args: Vec<String> = env::args().collect();

	if args.len() != 2 {
		process::exit(1);
	}

	let input = &args[1];

	if input.is_empty() || input.len() > 4 {
		process::exit(2);
	}

	if !input.chars().all(|c| c.is_ascii_digit()) {
		process::exit(2);
	}

	let input_fixed = format!("{:0>4}", input);

	let minutes: u8 = input_fixed[0..2].parse().unwrap();
	let mut seconds: u8 = input_fixed[2..4].parse().unwrap();

	let mut mins = minutes;

	if seconds >= 60 {
		if mins < 99 {
			mins += 1;
			seconds %= 60;
		}
	}

	print!("{:02}:{:02}\n", mins, seconds);
}
