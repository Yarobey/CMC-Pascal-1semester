{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_33(input, output); 

var
    n: integer;

procedure Move(n: integer; A,B,C: char);
begin
    if n = 1 then
        writeln('move plate from ', A, ' to ', C)
    else begin
        Move(n-1, A, C, B);
        Move(1, A, B, C);
        Move(n-1, B, A, C);
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_33');
    writeln;
    write('Please, set "n": ');
    read(n);
    writeln;
    writeln('These are moves that you need to make if you want to transfer hanoi tower from pin "A" to pin "C": ');
    Move(n, 'A', 'B', 'C');
    writeln;
end.