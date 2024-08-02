const std = @import("std");

pub fn main() !void {
    // mutable array
    var arr = [_]u8{ 0, 1, 2 };

    // pointer to mutable array
    const ptr = &arr;
    std.debug.print("\ntype of ptr: {}\n", .{@TypeOf(ptr)});

    // Normal dereferencing syntax
    ptr.*[0] = 9;
    std.debug.print("ptr.*[0]: {}, arr[0]: {}\n", .{ ptr.*[0], arr[0] });

    // convenient indexing syntax
    ptr[1] = 10;
    std.debug.print("ptr[1]: {}, arr[1]: {}\n", .{ ptr[1], arr[1] });

    // single item pointer to array element
    const item_ptr = &arr[0];
    item_ptr.* = 99;
    std.debug.print("\nType of item_ptr: {}\n", .{@TypeOf(item_ptr)});
    std.debug.print("item_ptr.*: {}, ptr[0]: {}, arr[0]: {}\n", .{
        item_ptr.*,
        ptr[0],
        arr[0],
    });

    // addresses are the same but the types differ
    std.debug.print("\n &array: {*} \n ptr: {*} \n item_ptr: {}\n", .{
        &arr,
        ptr,
        item_ptr,
    });

    // string literal is a pointer to a const sentinel
    // terminated (0) array in the static memorY block
    const hello = "Héllo";
    std.debug.print("\nType of hello: {}\n", .{@TypeOf(hello)});
    std.debug.print("hello[0]: {0} {0c}\n", .{hello[0]});
    std.debug.print("hello.*[0]: {0} {0c}\n", .{hello.*[0]});
    std.debug.print("hello[1]: {0} {0c}\n", .{hello[1]});
    // hello[1] = 'z';
}
