{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_48(input, output);

var
    n, n1, len, maxlen, counter: integer;
    
begin
    counter := 0; {можно и 1, но тогда в цикле 'while' counter <= n}
    writeln;
    writeln('Gikalo Egor 110 Task5_48');
    writeln;
    writeln('Please, set n');
    read(n);
    writeln;
    writeln('Please, set the sequence');
    len := 0;
    maxlen := 0;
    while counter < n do begin
        read(n1);
        if n1 = 0 then
            len := len + 1
        else 
            len := 0;
        if maxlen < len then
            maxlen := len;
        counter := counter + 1;
    end;
    writeln;
    writeln('Maximum amount of "0" = ', maxlen);
    writeln;
end.
