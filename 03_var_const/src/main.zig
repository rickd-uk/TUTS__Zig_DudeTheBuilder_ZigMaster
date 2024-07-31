const std = @import("std");
const debug = std.debug;
const assert = debug.assert;

pub fn main() !void {
    var x: u8 = undefined;
    // const arr = [_]u8{ 1, 2, 3 };
    // const y, x, var z: u8 = arr;

    // const vec = @Vector(3, u8){ 1, 2, 3 };
    // const y, x, var z: u8 = vec;

    const tup = .{ 1, 2, 3 };
    const y, x, var z: u8 = tup;
    x += 1;
    z += 1;
    std.debug.print("{} {} {}\n", .{ x, y, z });
}
