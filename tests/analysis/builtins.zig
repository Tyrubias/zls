const some_float: f32 = undefined;
const some_vector: @Vector(4, f32) = undefined;

const float_builtin_00 = @sqrt(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_01 = @sin(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_02 = @cos(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_03 = @tan(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_04 = @exp(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_05 = @exp2(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_06 = @log(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_07 = @log2(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_08 = @log10(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_09 = @abs(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_10 = @floor(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_11 = @ceil(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_12 = @trunc(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()
const float_builtin_13 = @round(some_float);
//    ^^^^^^^^^^^^^^^^ (f32)()

const vector_builtin_00 = @sqrt(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_01 = @sin(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_02 = @cos(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_03 = @tan(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_04 = @exp(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_05 = @exp2(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_06 = @log(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_07 = @log2(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_08 = @log10(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_09 = @abs(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_10 = @floor(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_11 = @ceil(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_12 = @trunc(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()
const vector_builtin_13 = @round(some_vector);
//    ^^^^^^^^^^^^^^^^^ (@Vector(4,f32))()

const invalid_builtin_00 = @sqrt(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_01 = @sin(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_02 = @cos(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_03 = @tan(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_04 = @exp(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_05 = @exp2(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_06 = @log(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_07 = @log2(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_08 = @log10(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_09 = @abs(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_10 = @floor(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_11 = @ceil(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_12 = @trunc(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()
const invalid_builtin_13 = @round(null);
//    ^^^^^^^^^^^^^^^^^^ (unknown)()

const abs_i32 = @abs(@as(i32, undefined));
//    ^^^^^^^ (u32)()
const abs_u32 = @abs(@as(u32, undefined));
//    ^^^^^^^ (u32)()
const abs_i33 = @abs(@as(i33, undefined));
//    ^^^^^^^ (u33)()
const abs_u33 = @abs(@as(u33, undefined));
//    ^^^^^^^ (u33)()
// TODO: type of @abs with isize depends on target; see https://github.com/ziglang/zig/pull/23587
// const abs_isize = @abs(@as(isize, undefined));
// //    ^^^^^^^^^ (usize)()
const abs_usize = @abs(@as(usize, undefined));
//    ^^^^^^^^^ (usize)()
// TODO: type of @abs with c_int depends on target; see https://github.com/ziglang/zig/pull/23587
// const abs_c_int = @abs(@as(c_int, undefined));
// //    ^^^^^^^^^ (c_uint)()
const abs_c_uint = @abs(@as(c_uint, undefined));
//    ^^^^^^^^^^ (c_uint)()
const abs_vector_i8 = @abs(@as(@Vector(4, i8), undefined));
//    ^^^^^^^^^^^^^ (@Vector(4,u8))()
const abs_vector_u8 = @abs(@as(@Vector(4, u8), undefined));
//    ^^^^^^^^^^^^^ (@Vector(4,u8))()

const panic = @panic("foo");
//    ^^^^^ (noreturn)()
const trap = @trap();
//    ^^^^ (noreturn)()

const type_type: @Type(.type) = i32;
//    ^^^^^^^^^ (type)()
const type_void: @Type(.void) = {};
//    ^^^^^^^^^ (void)()
const type_bool: @Type(.bool) = false;
//    ^^^^^^^^^ (bool)()
const type_noreturn: @Type(.noreturn) = @panic("foo");
//    ^^^^^^^^^^^^^ (noreturn)()
const type_comptime_float: @Type(.comptime_float) = 3.14;
//    ^^^^^^^^^^^^^^^^^^^ (comptime_float)()
const type_comptime_int: @Type(.comptime_int) = 42;
//    ^^^^^^^^^^^^^^^^^ (comptime_int)()
const type_undefined: @Type(.undefined) = undefined;
//    ^^^^^^^^^^^^^^ (@TypeOf(undefined))()
const type_null: @Type(.null) = null;
//    ^^^^^^^^^ (@TypeOf(null))()
const type_enum_literal: @Type(.enum_literal) = .foo;
//    ^^^^^^^^^^^^^^^^^ (@Type(.enum_literal))()

const type_info = @typeInfo(u8);
//    ^^^^^^^^^ (Type)()

comptime {
    // Use @compileLog to verify the expected type with the compiler
    // @compileLog(vector_builtin_13);
}

fn builtin_calls() void {
    @branchHint(.none);
    //          ^^^^^ (BranchHint)()
    @atomicLoad(undefined, undefined, .unordered);
    //                                ^^^^^^^^^^ (AtomicOrder)()
    @atomicRmw(undefined, undefined, .Xchg, undefined, .unordered);
    //                               ^^^^^ (AtomicRmwOp)()
    //                                                 ^^^^^^^^^^ (AtomicOrder)()
    @atomicStore(undefined, undefined, undefined, .unordered);
    //                                            ^^^^^^^^^^ (AtomicOrder)()
    @cmpxchgStrong(undefined, undefined, undefined, undefined, .unordered, .unordered);
    //                                                         ^^^^^^^^^^ (AtomicOrder)()
    //                                                                     ^^^^^^^^^^ (AtomicOrder)()
    @cmpxchgWeak(undefined, undefined, undefined, undefined, .unordered, .unordered);
    //                                                       ^^^^^^^^^^ (AtomicOrder)()
    //                                                                   ^^^^^^^^^^ (AtomicOrder)()
    @call(.always_inline, undefined, undefined);
    //    ^^^^^^^^^^^^^^ (CallModifier)()
    @export(undefined, .{ .name = undefined });
    //                    ^^^^^ ([]const u8)()
    @extern(undefined, .{ .name = undefined });
    //                    ^^^^^ ([]const u8)()
    @prefetch(undefined, .{ .locality = 3 });
    //                      ^^^^^^^^^ (u2)()
    @reduce(.And, undefined);
    //      ^^^^ (ReduceOp)()
    @setFloatMode(.strict);
    //            ^^^^^^^ (FloatMode)()
    @Type(.type);
    //    ^^^^^ (void)()

    const src = @src();
    //    ^^^ (SourceLocation)()
    _ = src;
}
