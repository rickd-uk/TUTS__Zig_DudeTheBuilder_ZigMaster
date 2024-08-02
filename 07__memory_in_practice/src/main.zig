const std = @import("std");

const global_const: f32 = 3.1415;
var global_var: usize = 2144;

fn printMem(
    param: *const u8,
    constant: *const u8,
    variable: *const u8,
) void {
    std.debug.print("param: {x} const: {x} var: {x}\n", .{
        @intFromPtr(param),
        @intFromPtr(constant),
        @intFromPtr(variable),
    });
}

fn a(p: u8) void {
    const lc: u8 = 42;
    var lv: u8 = 99;
    std.debug.print("a: ", .{});
    printMem(&p, &lc, &lv);
}

fn b(p: u8) void {
    const lc: u8 = 42;
    var lv: u8 = 99;
    std.debug.print("b: ", .{});
    printMem(&p, &lc, &lv);
}

fn c(p: u8) struct { *const u8, *u8 } {
    const lc: u8 = 3;
    var lv: u8 = 99;
    std.debug.print("c: ", .{});
    printMem(&p, &lc, &lv);

    b(0);

    return .{ &lc, &lv };
}

pub fn main() !void {
    std.debug.print("global_const: {x} global_var: {x}\n\n", .{
        @intFromPtr(&global_const),
        @intFromPtr(&global_var),
    });

    // Heap
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    const alloc2 = gpa.allocator();

    const heap_1 = try allocator.create(u8);
    defer allocator.destroy(heap_1);
    const heap_2 = try allocator.create(u8);
    defer allocator.destroy(heap_2);

    const heap_3 = try alloc2.create(u8);
    defer alloc2.destroy(heap_3);

    std.debug.print("heap_1: {x} heap_2: {x}  heap_3: {x}\n\n", .{
        @intFromPtr(heap_1),
        @intFromPtr(heap_2),
        @intFromPtr(heap_3),
    });

    // Function-level locals
    a(13);
    b(13);

    const ptr_to_const, const ptr_to_var = c(15);

    // Pointer to const & local var
    std.debug.print("\nptr_to_const: {x} = {} ptr_to_var: {x} = {}\n", .{
        @intFromPtr(ptr_to_const),
        ptr_to_const.*,
        @intFromPtr(ptr_to_var),
        ptr_to_var.*,
    });

    std.debug.print("\nptr_to_const: {x} = {} ptr_to_var: {x} = {}\n", .{
        @intFromPtr(ptr_to_const),
        ptr_to_const.*,
        @intFromPtr(ptr_to_var),
        ptr_to_var.*,
    });
}
