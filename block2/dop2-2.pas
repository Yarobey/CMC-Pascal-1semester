{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop2_2(input, output);

var
    c: char;
    sum, sum1, sum2: integer;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop2_2');
    writeln;
    writeln('Please, set a sequence of numbers with "+" or "-" between them: ');
    read(c);
    sum := 0;
    repeat
        sum := sum * 10 + (ord(c) - ord('0'));
        read(c);
    until (c = '-') or (c = '+') or (c = '.');
    repeat
        sum1 := 0;
        sum2 := 0;
        if (c = '+') then begin
            read(c);
            repeat
                sum1 := sum1 * 10 + (ord(c) - ord('0'));
                read(c);
            until (c = '-') or (c = '+') or (c = '.');
        end;
        if (c = '-') then begin
            read(c);
            repeat
                sum2 := sum2 * 10 + (ord(c) - ord('0'));
                read(c);
            until (c = '-') or (c = '+') or (c = '.');
        end;
        sum := sum + sum1 - sum2;
    until c = '.';
    writeln;
    writeln('The sum = ', sum);
    writeln;
end.