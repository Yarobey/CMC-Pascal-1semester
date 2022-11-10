{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_41b(input, output);

var
    c: char;
    summ, summ7: integer;
    p, p0: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_41b');
    writeln;
    writeln('Please, set a sequence that ends with a "."');
    writeln;
    summ7 := 0;
    summ := 0;
    repeat
        read(c);
        if (c >= '0') and (c <= '9') then begin
            summ := summ * 10 + (ord(c) - ord('0'));
        end
        else if c <> '.' then
            p0 := true;
    until c = '.';
    while summ <> 0 do begin
        summ7 := summ7 + (summ mod 7);
        summ := summ div 7;
    end;
    if (summ7 mod 2) = 0 then 
        p := true;
    if p0 then
        p := false;
    writeln;
    writeln('This number is even in septenary numeral system: ', p);
    writeln;
end.
            
            
            
            
            
            
            
        
        
