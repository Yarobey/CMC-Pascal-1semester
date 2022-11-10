{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task2Block8(input, output);
uses heaptrc;
const
    n = 6;
type
    TE = packed array[1..n] of char;
    list = ^node;
    node = record
        count: integer;
        elem: TE;
        next: list;
    end;
    vector = array[1..n] of list;

var
    c: char;
    ans: vector;
    s: TE;
    i, j, k: integer;

procedure ins(var L: list; E: TE);
var
    p: list;
begin
    if L = nil then begin
        new(L);
        L^.count := 1;
        L^.elem := E;
        L^.next := nil;
    end
    else if E > L^.elem then
        ins(L^.next, E)
    else if E < L^.elem then begin
        new(p);
        p^.elem := E;
        p^.next := L;
        p^.count := 1;
        L := p;
    end
    else
        L^.count := L^.count + 1;

end;

procedure PrintList(L: list);
begin
    if L <> nil then begin
        write('number of words ', L^.elem, ' = ', L^.count);
        writeln;
        L := L^.next;
        PrintList(L);
    end;
end;

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

begin
    writeln;
    writeln('Gikalo Egor 110 Task2Block8');
    writeln;
    writeln('Please, set a sequence of words with max length of ', n, ' letters that has "," between words and "." at the end: ');
    repeat
        read(c);
        i := 1;
        repeat
            s[i] := c;
            read(c);
            i := i + 1;
            if ((c = ',') or (c = '.')) and (i <= n) then begin
                k := i - 1;
                for j := i to n do
                    s[j] := ' ';
            end
            else if (i = n) then
                k := i;
        until (c = ',') or (c = '.');
        ins(ans[k], s);
    until (c = '.');
    writeln;
    for i := 1 to n do begin
        writeln('Number of words with ', i, ' letter(s)');
        PrintList(ans[i]);
        destroy(ans[i]);
        writeln;
    end;
    writeln;
end.
{a,ab,abc,abcd,abcde,abcdef.}
{a,abc,qwe,bc,q,a,ac.}
{a,abc,qwe,bc,q,a,ac,ac,qwe,a,qwe.}