{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_41v(input, output);

var
    c: char;
    summ, summ3: integer;
    p, p1, p2, p3: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_41v');
    writeln;
    writeln('Please, set a sequence that ends with a "."');
    writeln;
    summ3 := 0;
    summ := 0;
    repeat
        read(c);
        if (c >= '0') and (c <= '9') then begin
            summ := summ * 10 + (ord(c) - ord('0'));
        end
        else if c <> '.' then
            p1 := true;
    until c = '.';
    if (summ mod 10) mod 2 = 0 then
        p2 := true;
    while summ <> 0 do begin
        summ3 := summ3 + (summ mod 10);
        summ := summ div 10;
    end;
    if (summ3 mod 3) = 0 then 
        p3 := true;
    if p2 and p3 then
        p := true;
    if p1 then
        p := false;
    writeln;
    writeln('This number can be divided by 6: ', p);
    writeln;
end.
