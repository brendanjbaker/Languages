const std = @import("std");

pub fn main() !u8 {
	var stdout_buffer: [4096]u8 = undefined;
	var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);

	const stdout = &stdout_writer.interface;

	const args = try std.process.argsAlloc(std.heap.page_allocator);

	defer std.process.argsFree(std.heap.page_allocator, args);

	if (args.len != 2) {
		return 1;
	}

	const input = args[1];

	if (input.len == 0 or input.len > 4) {
		return 2;
	}

	for (input) |c| {
		if (!std.ascii.isDigit(c)) {
			return 2;
		}
	}

	var fixed: [4]u8 = .{'0', '0', '0', '0'};
	std.mem.copyBackwards(u8, fixed[4 - input.len ..], input);

	const minutes = try std.fmt.parseInt(u8, fixed[0..2], 10);
	var seconds = try std.fmt.parseInt(u8, fixed[2..4], 10);

	var mins = minutes;

	if (seconds >= 60) {
		if (mins < 99) {
			mins += 1;
			seconds %= 60;
		}
	}

	try stdout.print("{d:0>2}:{d:0>2}\n", .{ mins, seconds });
	try stdout.flush();

	return 0;
}
