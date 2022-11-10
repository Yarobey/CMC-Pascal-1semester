{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop2_1(input, output);

var
    c, d, k: char;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop2_1');
    writeln;
    for c := '0' to '9' do begin
        for d := c to '9' do
            write(d);
        for k := '0' to pred(c) do
            write(k);
        writeln;
    end;
    writeln;
end.
