{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_56(input, output);

var
    lett: array['a'..'z'] of 0..MaxInt;
    c, k: char;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_56');
    writeln;
    writeln('Please, write a text that ends with a "." :');
    for c := 'a' to 'z' do
        lett[c] := 0;
    read(c);
    while c <> '.' do begin
        lett[c] := lett[c] + 1;
        read(c);
    end;
    writeln;
    writeln('These are all letters found in the text in alphabetical order: ');
    for k := 'a' to 'z' do begin
        if lett[k] > 0 then
            write(k);
    end;
    writeln;
    writeln;
end.
        
