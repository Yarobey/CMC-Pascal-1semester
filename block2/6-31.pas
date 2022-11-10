{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_31(input, output);

var
    n, i, st3, j: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_31');
    writeln;
    writeln('Please, set a number "n"');
    read(n);
    writeln;
    writeln('Theese are numbers from "0" to "n" that are converted into ternary numeral system:');
    for i := 0 to n do begin
        st3 := 1;
        while i div st3 > 2 do
            st3 := st3 * 3;
        j := i;
        repeat
            write(chr(ord('0') + (j div st3))); 
            j := j mod st3;
            st3 := st3 div 3;
        until st3 = 0;
        write(' ');
    end;
    writeln;
end.
