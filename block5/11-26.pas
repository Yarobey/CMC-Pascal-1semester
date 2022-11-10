{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task11_26(input, output); 
const 
    n = 4;
type
    vector = array[1..n] of real;
var
    x, y, z: vector;
    max: real;
    t: array[1..3] of real;
    i,imax: integer;

procedure ReadVect(var v:vector);
var
    i: integer;
begin
    for i := 1 to n do
        read(v[i]);
end;

function MinElement(var v:vector): real; {если я правильно понимаю, то параметр по ссылке здесь оптимальнее,}
                                     {так как значение мы не меняем, и бонусом не создаем копию параметра}
var
    i: integer;
    min: real;
begin
    min := MaxInt;
    for i := 1 to n do
        if v[i] < min then
            min := v[i];
    MinElement := min;
end;

function DotProduct(var a,b:vector): real;
var 
    i: integer;
    summ: real;
begin
    summ := 0;
    for i := 1 to n do
        summ := summ + a[i]*b[i];
    DotProduct := summ;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task11_26');
    writeln;
    writeln('Please, set vector "x","y","z":');
    max := (-1) * MaxInt;
    ReadVect(x);
    ReadVect(z);
    ReadVect(y);
    t[1] := MinElement(x);
    t[2] := MinElement(y);
    t[3] := MinElement(z);
    for i := 1 to 3 do
        if t[i] > max then begin
            max := t[i];
            imax := i;
        end;
    write('(a,a)-(b,c) = ');
    case imax of
        1: writeln((DotProduct(x,x) - DotProduct(y,z)):2:2);
        2: writeln((DotProduct(y,y) - DotProduct(x,z)):2:2);
        3: writeln((DotProduct(z,z) - DotProduct(x,y)):2:2);
    end;
    writeln;
end.
{1 2 3 4
2 3 4 5
3 4 5 6 = 46}