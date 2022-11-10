{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskBlock8Dop4(input, F1, F2, output);
uses heaptrc;
const
    n = 15;

type
    map = ^ways;
    ways = array[0..n] of map;{здесь храним пути из одного города в другой}
    list = ^node;
    node = record
        elem: 0..n;
        next: list;
    end;
    str = packed array[1..n] of char;

var
    F1, F2: text;
    path: ways;
    x1, x2, first, last, i, j: integer;

procedure RouteMaker(first, last, len1: integer);
var
    route: list;
    s: set of 0..n; {для просмотра пройденных городов}
    prevstr: str;   {для удаления повторяющихся маршрутов}

procedure destroy(var L: list);
var
    p: list;
begin
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
end;

function IsPath(L: list; last: integer): boolean;{проверка, того что пришли в заданный город}
begin
    while L^.next <> nil do
        L := L^.next;
    IsPath := L^.elem = last;
end;

procedure deletepath(var L: list);
var
    p: list;
begin
    p := L;
    if p^.next <> nil then begin
        while p^.next^.next <> nil do
            p := p^.next;
        dispose(p^.next);
        p^.next := nil;
    end
    else begin
        dispose(L);
        L := nil;
    end;
end;

procedure addpath(var L: list; city: integer);{добавление нового города в маршрут}
var
    p, q: list;
begin
    if L = nil then begin
        new(L);
        L^.elem := city;
        L^.next := nil;
    end
    else begin
        q := L;
        while q^.next <> nil do
            q := q^.next;
        new(p);
        p^.elem := city;
        p^.next := nil;
        q^.next := p;
    end;
end;

procedure printroute(L: list);  {печать в файл подходящих маршрутов}
var
    p: list;
    curstr: str;
    i: integer;
begin
    p := L;
    i := 0;
    while p <> nil do begin
        i := i + 1;
        curstr[i] := chr(p^.elem + ord('0'));
        p := p^.next;
    end;
    if prevstr <> curstr then begin
        {writeln(curstr);}
        while L <> nil do begin
            write(F2, L^.elem : 3);
            L := L^.next;
        end;
        writeln(F2);
        prevstr := curstr;
    end;
end;

procedure print(L: list); {для проверки}
begin
    while L <> nil do begin
        write(L^.elem);
        L := L^.next;
    end;
    writeln;
    {writeln('len = ', len1);}
end;

procedure RouteMaker1(cur, len: integer);
var
    i: integer;
begin
    if (len = 0) and IsPath(route, last) then begin
        printroute(route);
        {writeln('len = ',len1);}
    end
    else if (len > 0) then begin
        for i := 1 to n do          {ищем всевозможные пути из заданного}
            if (path[cur]^[i] <> nil) and not (cur in s) then begin
                s := s + [cur];
                addpath(route, cur);
                {print(route);}
                RouteMaker1(i, len - 1);
                s := s - [cur];
                deletepath(route);
            end;
    end;
end;
begin
    s := [];
    prevstr := ' ';
    route := nil;
    RouteMaker1(first, len1);
    destroy(route);
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskBlock8Dop4');
    writeln;
    assign(F1, 'roads.txt');
    assign(F2, 'results.txt');
    reset(F1);
    rewrite(F2);
    for i := 1 to n do begin
        new(path[i]);
        for j := 1 to n do
            path[i]^[j] := nil;
    end;
    read(f1, x1, x2);
    while x1 <> 0 do begin      {строим дороги}
        path[x1]^[x2] := path[x2];
        path[x2]^[x1] := path[x1];
        read(f1, x1, x2);
    end;
    writeln('Please, set numbers of the first city and the last city of your journey: ');
    read(first, last);
    for i := 1 to n do
        RouteMaker(first, last, i);
    close(F1);
    close(F2);
    writeln;
    writeln('done...');
    for i := 1 to n do
        dispose(path[i]);
    writeln;
end.