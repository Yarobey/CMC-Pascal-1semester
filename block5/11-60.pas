{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task11_60(input, output); 
const 
    n = 5;
    m = 4;
type
    matrix = array[1..n,1..m] of integer;
    vector = array['a'..'c'] of integer;
var
    A, B, C: matrix;
    max: integer;
    q: vector;
    j, jmax: char;

procedure ReadMatrix(var a:matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to m do
            read(a[i,j]);
end;

function All0Row(var a: matrix): integer;
var
    i, j, sum, fin: integer;
begin
    fin := 0;
    for i := 1 to n do begin
        sum := 0;
        for j := 1 to m do 
            sum := sum + a[i,j];
        if sum = 0 then
            fin := fin + 1;
    end;
    All0Row := fin;
end;

procedure PrintMatrix(var a: matrix);
var 
    i, j: integer;
begin
    for i := 1 to n do begin
        for j := 1 to m do
            write(a[i,j]:3);
        writeln;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task11_60');
    writeln;
    writeln('Please, set a "n x m" matrix "A":'); 
    ReadMatrix(A);
    writeln;
    writeln('Please, set a "n x m" matrix "B":'); 
    ReadMatrix(B);
    writeln;
    writeln('Please, set a "n x m" matrix "C":'); 
    ReadMatrix(C);
    max := 0;
    q['a'] := All0Row(A);
    q['b'] := All0Row(B);
    q['c'] := All0Row(C);
    for j := 'a' to 'c' do
        if q[j] > max then begin
            max := q[j];
            jmax := j;
        end;
    writeln;
    writeln('This is matrix with the least "all 0 rows":');
    case jmax of
        'a': PrintMatrix(A);
        'b': PrintMatrix(B);
        'c': PrintMatrix(C);
    end;
    for j := 'a' to 'c' do
        if (q[jmax] = q[j]) and (jmax <> j) then begin
            writeln;
            writeln('And another one with the same amount of "all 0 rows":');
            case j of
                'a': PrintMatrix(A);
                'b': PrintMatrix(B);
                'c': PrintMatrix(C);
            end;
        end;
    writeln;
end.
{0 0 0 0
1 1 1 1
0 0 0 0
1 1 1 1
0 0 0 0}
{1 1 1 1
0 0 0 0
1 1 1 1
0 0 0 0
1 1 1 1}
{0 0 0 0
1 1 1 1
1 1 1 1
1 1 1 1
1 1 1 1}
{1 2 3 4
0 0 0 0
0 0 0 0
0 0 0 0
1 2 3 4}





