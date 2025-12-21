const std = @import("std");

pub fn main() !void {
	var i: u32 = 1;
	var sum: u32 = 0;

	while (i <= 100) : (i += 1) {
		sum += @as(u32, i);
	}

	var stdout_buffer: [4096]u8 = undefined;
	var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);

	const stdout = &stdout_writer.interface;

	try stdout.print("{}\n", .{sum});
	try stdout.flush();
}
