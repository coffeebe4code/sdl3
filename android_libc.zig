const std = @import("std");

pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const output = &stdout_writer.interface;

    var args = std.process.args();
    _ = args.next();
    while (args.next()) |arg| {
        try output.writeAll(arg);
        try output.writeAll("\n");
    }
}
