{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_35(input, output); 

const
    n = 10;
type
    matrix = array[1..n,1..n] of boolean;
var
    roads: matrix;
    x, y, fir, ls: integer;

function IsPathT(var roads: matrix; first, last: integer): boolean;

var
    visited: array[1..n] of boolean;
    way: array [1..n] of 1..n ;
    i, len: integer;

function IsPathT1(t1, t2: integer): boolean;
var
    ok, s: boolean;
    t: integer;
begin
    if t1 = t2 then
        IsPathT1 := true
    else begin
        ok := false;
        t := 0;
        repeat
            t := t + 1;
            if (roads[t1,t] = true) and not visited[t] then begin
                visited[t] := true;
                len := len + 1;
                way[len] := t;
                s := IsPathT1(t,t2);
                if s then
                    ok := true
                else
                    len := len - 1;
            end;
        until ok or (t = n);
        IsPathT1 := ok;
    end;
end;

begin
    for i := 1 to n do
        visited[i] := false;
    visited[first] := true;
    way[1] := first;
    len := 1;
    if IsPathT1(first, last) then begin
        IsPathT := true;
        for i := 1 to len do
            writeln(way[i]);
    end
    else
        IsPathT := false; 
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_35');
    writeln;
    writeln('Please, set all pairs of cities that have roads to each other: ');
    for x := 1 to n do
        for y := 1 to n do
            roads[x,y] := false;
    read(x,y);
    repeat
        roads[x,y] := true;
        roads[y,x] := true;
        read(x, y);
    until (x = 0) and (y = 0);
    writeln('Please, set 2 cities that you want to know that there is a road from the first to the second: ');
    read(fir, ls);
    writeln(IsPathT(roads, fir, ls));
    writeln;
end.
{1 5
1 6
6 7
6 9
3 9
2 3
3 4
3 8
4 8
4 10
8 10
0 0}

{1 2
1 4
2 3
3 4
4 5
4 6
6 7
6 9
6 8
8 10
0 0}