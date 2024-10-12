const std = @import("std");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}

const Builtin = enum {
    dup,
    drop,
    swap,
    over,
    rot,
    add,
    sub,
    mul,
    div,
    mod,
};

const Token = union(enum) {
    int_literal: i64,
    float_literal: f64,
    string_literal: []const u8,
    builtin: Builtin,
};

const Parser = struct {
    allocator: std.mem.Allocator,
    input: *[]const u8,

    pub fn init(alloc: std.mem.Allocator, input: *[]const u8) @This() {
        return @This(){
            .input = input,
            .allocator = alloc,
        };
    }

    pub fn parse(self: *@This()) !std.ArrayList(Token) {
        var toks = std.ArrayList(Token).init(self.allocator);
    }
};

test "simple test" {}
