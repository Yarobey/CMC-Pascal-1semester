{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_39(input, output);

const
    n = 10;

var
    v: array[1..n] of integer;
    out, a, b, i, j, k, p: integer;
    flag: boolean;

    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_39');
    writeln;
    write('Please, set a number in range of [1..11] that will be out of vector:');
    read(out);
    writeln('These are all numbers from vector without the setted one:');
    a := 1;
    b := n;
    j := 1;
    flag := false;
    if out = 11 then begin
        for i := 1 to n do
            v[i] := i;
    end
    else begin
        for i := 1 to n do begin
            if i = out then begin
                j := j + 2;
                v[i] := i + 1;
            end
            else begin
                v[i] := j;
                j := j + 1;
            end;
        end;
    end;
    for i := 1 to n do
        writeln(v[i]);
    p := 0;
    repeat
        p := p + 1;
        a := 1;
        b := n;
        flag := false;
        repeat
            k := (a + b) div 2;
            if p = v[k] then
                flag := true
            else if p > v[k] then
                a := k + 1
            else
                b := k - 1
        until flag or (a > b);
    until not flag;
    writeln('Missed number: ', out, ' ', p);
    writeln;
end.
    