{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_59(input, output);

const
    n = 10;
var
    lett: array['a'..'z'] of 0..MaxInt;
    ifin: array['a'..'z'] of boolean;
    c, k: char;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_59');
    writeln;
    writeln('Please, write a text that ends with a "." and has a "," between words:');
    for c := 'a' to 'z' do
        lett[c] := 0;
    read(c);
    while c <> '.' do begin
        read(c);
        while (c <> ',') or (c <> '.') do begin
            
