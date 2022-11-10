{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task10_14(input, output); 

type
    roman = array[1..9] of packed array [1..4] of char;
var
    a: roman;
    n, d, i, j: integer;

begin
    writeln;
    writeln('Gikalo Egor 110 Task10_14');
    writeln;
    write('Please, enter "n" which is less than 40: ');
    read(n);
    writeln;
    d := n div 10;
    n := n mod 10;
    {не уверен какое именно решение требуется, поэтому оставил часть старого, как комментарий}
    {for i := 1 to 3 do
        for j := 1 to i do
            a[i][j] := 'I';}
    a[1] := 'I   ';
    a[2] := 'II  ';
    a[3] := 'III ';
    a[4] := 'IV  ';
    a[5] := 'V   ';
    {for i := 6 to 8 do begin
        for j := 2 to (i - 4) do begin
            a[i][1] := 'V';
            a[i][j] := 'I';
        end;
    end;}
    a[6] := 'VI  ';
    a[7] := 'VII ';
    a[8] := 'VIII';
    a[9] := 'IX  ';
    write('This is number "n" in roman numerals: ');
    for i := 1 to d do
        write('X');
    if n <> 0 then
        write(a[n]);
    writeln;
end.



    