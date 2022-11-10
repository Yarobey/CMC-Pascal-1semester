{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_48(input, output);

var
    n, n1, n2, len, maxlen, counter: integer;
    
begin
counter := 3;
writeln();
writeln('Gikalo Egor 110 Task5_48');
writeln();
writeln('Please, set n');
read(n);
writeln();
writeln('Please, set the sequence');
read(n1, n2);
len := 1;
maxlen := 0;
while counter <> n do begin
    if (n1 and n2) = 0 then
            len := len + 1
    else if maxlen < len then begin
        maxlen := len;
        len := 0;
    end;
n1 := n2;
read(n2);
counter := counter + 1;
end;
writeln(len);
writeln(maxlen);
writeln();

end.
