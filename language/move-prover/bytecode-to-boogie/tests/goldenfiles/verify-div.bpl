

// ** structs of module TestSpecs



// ** functions of module TestSpecs

procedure {:inline 1} TestSpecs_div (x: Value, y: Value) returns (ret0: Value)
requires ExistsTxnSenderAccount(m, txn);
ensures old(b#Boolean(Boolean(i#Integer(y) > i#Integer(Integer(0))))) ==> !abort_flag;
{
    // declare local variables
    var t2: Value; // IntegerType()
    var t3: Value; // IntegerType()
    var t4: Value; // IntegerType()
    var t5: Value; // IntegerType()
    var t6: Value; // IntegerType()

    var tmp: Value;
    var old_size: int;

    var saved_m: Memory;
    assume !abort_flag;
    saved_m := m;

    // assume arguments are of correct types
    assume IsValidInteger(x);
    assume IsValidInteger(y);

    old_size := local_counter;
    local_counter := local_counter + 7;
    m := UpdateLocal(m, old_size + 0, x);
    m := UpdateLocal(m, old_size + 1, y);

    // bytecode translation starts here
    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 0));
    m := UpdateLocal(m, old_size + 3, tmp);

    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 1));
    m := UpdateLocal(m, old_size + 4, tmp);

    call tmp := Div(GetLocal(m, old_size + 3), GetLocal(m, old_size + 4));
    if (abort_flag) { goto Label_Abort; }
    m := UpdateLocal(m, old_size + 5, tmp);

    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 5));
    m := UpdateLocal(m, old_size + 2, tmp);

    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 2));
    m := UpdateLocal(m, old_size + 6, tmp);

    ret0 := GetLocal(m, old_size + 6);
    return;

Label_Abort:
    abort_flag := true;
    m := saved_m;
    ret0 := DefaultValue;
}

procedure TestSpecs_div_verify (x: Value, y: Value) returns (ret0: Value)
{
    assume ExistsTxnSenderAccount(m, txn);
    call ret0 := TestSpecs_div(x, y);
}

procedure {:inline 1} TestSpecs_div_by_zero_detected (x: Value, y: Value) returns (ret0: Value)
requires ExistsTxnSenderAccount(m, txn);
ensures old(b#Boolean(Boolean(true))) ==> !abort_flag;
{
    // declare local variables
    var t2: Value; // IntegerType()
    var t3: Value; // IntegerType()
    var t4: Value; // IntegerType()
    var t5: Value; // IntegerType()
    var t6: Value; // IntegerType()

    var tmp: Value;
    var old_size: int;

    var saved_m: Memory;
    assume !abort_flag;
    saved_m := m;

    // assume arguments are of correct types
    assume IsValidInteger(x);
    assume IsValidInteger(y);

    old_size := local_counter;
    local_counter := local_counter + 7;
    m := UpdateLocal(m, old_size + 0, x);
    m := UpdateLocal(m, old_size + 1, y);

    // bytecode translation starts here
    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 0));
    m := UpdateLocal(m, old_size + 3, tmp);

    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 1));
    m := UpdateLocal(m, old_size + 4, tmp);

    call tmp := Div(GetLocal(m, old_size + 3), GetLocal(m, old_size + 4));
    if (abort_flag) { goto Label_Abort; }
    m := UpdateLocal(m, old_size + 5, tmp);

    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 5));
    m := UpdateLocal(m, old_size + 2, tmp);

    call tmp := CopyOrMoveValue(GetLocal(m, old_size + 2));
    m := UpdateLocal(m, old_size + 6, tmp);

    ret0 := GetLocal(m, old_size + 6);
    return;

Label_Abort:
    abort_flag := true;
    m := saved_m;
    ret0 := DefaultValue;
}

procedure TestSpecs_div_by_zero_detected_verify (x: Value, y: Value) returns (ret0: Value)
{
    assume ExistsTxnSenderAccount(m, txn);
    call ret0 := TestSpecs_div_by_zero_detected(x, y);
}
