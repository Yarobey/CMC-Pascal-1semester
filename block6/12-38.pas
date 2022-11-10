{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_38(input, output);
const
    n = 4;
type
    vector = array[1..n] of integer;
var
    A: vector;
    j, x: integer;

procedure generate(k: integer);
var
    i, r: integer;
begin
    if k = 1 then begin
        for i := 1 to n do
            write(A[i],' ');
        writeln;
    end
    else begin
        generate(k-1);
        for i := (k-1) downto 1 do begin
            r := A[k];
            A[k] := A[i];
            A[i] := r;
            generate(k-1);
            r := A[k];
            A[k] := A[i];
            A[i] := r;
        end;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_38');
    writeln;
    write('Please, set "n" natural numbers: ');
    for j := 1 to n do begin
        read(x);
        a[j] := x;
    end;
    generate(n);
    writeln;
end.