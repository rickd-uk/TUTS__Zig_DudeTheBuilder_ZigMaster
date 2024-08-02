const std = @import("std");

pub fn main() !void {
    const x: u8 = 42;
    var y: u8 = 13;
    var z: u8 = 99;
    const a: u8 = 0;

    // const pointer to const value
    const cpcx: *const u8 = &x;
    // cpcx.* += 1;  // can't do this!
    // cpcx = &y;    // nor this!

    std.debug.print("cpcx: {}\tcpcx.*: {}\ttype: {}\n", .{
        cpcx,
        cpcx.*,
        @TypeOf(cpcx),
    });

    // const pointer to non-const value
    const cpvy: *u8 = &y;
    cpvy.* += 1;
    // cpvy = 8y;  // can't :w

    std.debug.print("cpvy: {}\tcpvy.*: {}\ttype: {}\n", .{
        cpvy,
        cpvy.*,
        @TypeOf(cpvy),
    });

    // non-constant pointer to const value
    var vpcx: *const u8 = &x;
    // vpcx.* += 1;   // can't do this

    std.debug.print("vpcx: {}\tvpcx.*: {}\ttype: {}\n", .{
        vpcx,
        vpcx.*,
        @TypeOf(vpcx),
    });

    vpcx = &a;

    std.debug.print("vpcx: {}\tvpcx.*: {}\ttype: {}\n", .{
        vpcx,
        vpcx.*,
        @TypeOf(vpcx),
    });

    // non-const pointer to non-const value
    var vpvy: *u8 = &y;
    vpvy.* += 1;

    std.debug.print("vpvy: {}\tvpvy.*: {}\ttype: {}\n", .{
        vpvy,
        vpvy.*,
        @TypeOf(vpvy),
    });

    vpvy = &z;

    std.debug.print("vpvy: {}\tvpvy.*: {}\ttype: {}\n", .{
        vpvy,
        vpvy.*,
        @TypeOf(vpvy),
    });
}
