{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_12(input, output);

var
    x, s, c: real;
    
begin
    x := 0.0000;
    writeln;
    writeln('Gikalo Egor 110 Task5_12');
    writeln;
    writeln('   x   sin(x)  cos(x) ');
    writeln('----------------------');
    while x <= 1 do begin
        s := sin(x);
        c := cos(x);
        writeln(x : 6 : 4, s : 7 : 4, c : 8 : 4);
        x := x + 0.1
        end;
    writeln;
end.
