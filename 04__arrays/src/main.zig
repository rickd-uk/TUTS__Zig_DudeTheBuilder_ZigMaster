const std = @import("std");

pub fn main() !void {
    // const arr: [3]u8 = .{ 1, 2, 3 };

    var arr: [3]u8 = undefined;

    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 3;

    arr[0], arr[1], arr[2] = .{ 1, 2, 3 };

    std.debug.print("{any}\n", .{arr});

    std.debug.print("array.len: {}\n", .{arr.len});

    const a, const b, const c = arr;
    std.debug.print("a: {} b: {} c: {}\n", .{ a, b, c });

    const grid3x3 = [_][3]u8{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    };
    std.debug.print("grid3x3[2][1]: {}\n", .{grid3x3[2][1]});

    // Sentinel terminated array
    const with_sentinel = [_:0]u8{ 1, 0, 0, 4 };
    std.debug.print("sentinel: {}\n", .{with_sentinel[with_sentinel.len]});

    const str = "Hello";
    std.debug.print("type of str: {}\n", .{@TypeOf(str)});

    const bytes: []const u8 = str;
    std.debug.print("type of bytes: {}\n", .{@TypeOf(bytes)});

    var cpy = arr;
    cpy[2] = 42;
    std.debug.print("array: {any}\n", .{arr});
    std.debug.print("copy: {any}\n", .{cpy});
}
