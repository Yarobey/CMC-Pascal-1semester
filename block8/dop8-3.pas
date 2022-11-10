{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskBlock8Dop3(F, output);
uses heaptrc;

const
    n = 15;
type
    word = packed array[1..n] of char;
    list1 = ^node1;
    node1 = record
        elem: word;
        next: list1;
    end;
    list = ^node;
    node = record
        elem: list1;
        next: list;
    end;

var
    F: text;
    L: list;

procedure destroy(var L: list1);
var
    p: list1;
begin
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
end;

function longestwords(var F: text): list;
var
    L: list;
    L1, p: list1;
    max, i, j: integer;
    a: word;
    c: char;

{procedure destroy(var L: list1);
var
    p: list1;
begin
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end
    else
        dispose(L);
end;}

begin
    reset(F);
    max := 0;
    new(L);
    L^.next := nil;
    while not eof(F) do begin
        i := 0;
        while not eoln(F) do begin
            read(f,c);
            i := i + 1;
            a[i] := c;
        end;
        j := i + 1;
        while j <= n do begin
            a[j] := ' ';
            j := j + 1;
        end;
        {writeln(a);}
        if i > max then begin
            if max <> 0 then
                destroy(L1);
            new(L1);
            L1^.elem := a;
            L1^.next := nil;
            L^.elem := L1;
            max := i;
        end
        else if i = max then begin
            new(p);
            p^.elem := a;
            p^.next := nil;
            L1^.next := p;
            L1 := p;
        end;
        readln(f);
    end;
    {writeln(max);}
    longestwords := L;
end;

procedure PrintHierarchyList(L: list);
var
    L1: list1;
begin
    L1 := L^.elem;
    while L <> nil do begin
        while L1 <> nil do begin
            writeln(L1^.elem);
            L1 := L1^.next;
        end;
        L := L^.next;
    end;
end;

procedure DestroyHierarchyList(var L: list);
var
    q: list;
    L1: list1;
begin
    while L <> nil do begin
        L1 := L^.elem;
        {while L1 <> nil do begin
            p := L1;
            L1 := L1^.next;
            L^.elem := L1;
            dispose(p);
        end;}
        destroy(L1);
        q := L;
        L := L^.next;
        dispose(q);
        {DestroyHierarchyList(L^.next);}
    end;
end;


begin
    writeln;
    writeln('Gikalo Egor 110 TaskBlock8Dop3');
    writeln;
    assign(F, 'words.txt');
    writeln;
    L := longestwords(F);
    PrintHierarchyList(L);
    DestroyHierarchyList(L);
    close(F);
    writeln;
end.