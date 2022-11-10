{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop2_4(input, output);

var
    c, c1: char;
    flag, flag1: boolean;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop2_4');
    writeln;
    writeln('Please, set a sequence of numbers and symbols that ends with ".": ');
    flag := true;
    flag1 := false;
    repeat
        read(c);
        if (c >= '0') and (c <= '9') then begin
            flag1 := true;
            read(c1);
            while (c1 <> '.') and flag do begin
                if (succ(c) <> c1) then
                    flag := false
                else
                    c := c1;
                read(c1);
            end;
            c := c1;
        end;
    until (c = '.') or not flag;
    if not flag1 then
        flag := false;
    writeln;
    writeln('This sequence of numbers in setted sequence is in "0123456789": ', flag);
    writeln;
end.