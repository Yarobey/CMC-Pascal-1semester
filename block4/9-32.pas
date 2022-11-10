{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task9_32(input, output); 

type
    pairs = array['a'..'z', 'a'..'z'] of 0..MaxInt;
var
    a: pairs;
    max: integer;
    flag: boolean;
    c, c1, c2, i, j, maxi, maxj: char;
begin
    writeln;
    writeln('Gikalo Egor 110 Task9_32');
    writeln;
    writeln('Please, write a text that ends with a "." and has "," between words');
    writeln;
    max := 0;
    for i := 'a' to 'z' do
        for j := 'a' to 'z' do
            a[i,j] := 0;
    repeat 
        read(c);
        c1 := c;
        repeat
            c2 := c;
            read(c);
        until (c = ',') or (c = '.');
        a[c1,c2] := a[c1,c2] + 1;
    until c = '.';
    for i := 'a' to 'z' do
        for j := 'a' to 'z' do
            if a[i,j] >= max then begin
                max := a[i,j];
                maxi := i;
                maxj := j;
            end;
    writeln;
    write('The most used pair: ', maxi, ' ', maxj);
    writeln;
end.

