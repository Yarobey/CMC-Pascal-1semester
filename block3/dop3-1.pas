{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_59(input, output);

var
    L: array['a'..'z'] of 0..MaxInt;
    W: array['a'..'z'] of boolean;
    max: integer;
    c, t: char;

    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_59');
    writeln('Please, write a text that ends with a "." and has "," between words:');
    max := 0;
    for t := 'a' to 'z' do begin
        W[t] := false;
        L[t] := 0;
    end;
    repeat
        read(c);
        repeat
            if not W[c] then begin
                L[c] := L[c] + 1;
                W[c] := true;
            end;
            read(c);
        until (c = ',') or (c = '.');
        for t := 'a' to 'z' do
            W[t] := false;
    until (c = '.');
    for t := 'a' to 'z' do
        if L[t] >= max then
            max := L[t];
    write('Letters most often found in words: ');
    for t := 'a' to 'z' do
        if L[t] = max then
            write(t, ' ');
    writeln;
end.
    
