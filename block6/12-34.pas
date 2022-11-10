{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskMash5dop1(input, output); 
const
    n = 20;
type
    labirinth = array[1..n] of 0..1;
function IsPath(var L: labirinth; first, last: integer): boolean;
var
    visited: array[1..n] of boolean;
    i, len: integer;
    way: array[1..n] of 1..n;
function IsPath1(r1,r2:integer):boolean;
var
    ok: boolean;
    r: integer;
begin
    if r1 = r2 then
        IsPath1 := true
    else begin
        ok := false;
        r := 0;
        repeat
            r := r + 1;
            if (L[r1,r] = 1) and not visited[r] then begin
                visited[r] := true;
                len := len + 1;
                way[len] := r;
                if IsPath1(r,r2) then
                    ok := true
                else
                    len := len - 1;
            end;
        until ok or (r = n);
    IsPath1 := ok;
end;
begin
    for i := 1 to n do
        visited[i] := false;
    visited[first] := true;
    IsPath := IsPath1(first, last);
    way[1] := first;
    len := 1;
    if IsPath1(first, last) then begin
        IsPath := true;
        for i := 1 to len do
            write(way[i]);
    end
    else
        IsPath := false;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskMash5Dop1');
    writeln;
    writeln('Please, set a sequence of whole numbers that ends with a "0": ');
    print;
    writeln;
end.