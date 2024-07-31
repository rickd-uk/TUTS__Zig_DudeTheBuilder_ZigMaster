const std = @import("std");
const global_const: f32 = 3.142;
var global_var: usize = 2112;

pub fn main() !void {
    std.debug.print("global const: {x}  global var: {x}\n\n", .{
        @intFromPtr(&global_const),
        @intFromPtr(&global_var),
    });
}
