{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskBlock8Dop3(F, output);
uses heaptrc;

type
    list1 = ^node1;
    node1 = record
        elem: char;
        next: list1;
    end;
    list = ^node;
    node = record
        elem: list1;
        next: list;
    end;

var
    F: text;

procedure longestwords(var F: text);
var
    L, b, t: list;
    L1, p, q: list1;
    max, i: integer;
    c: char;

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

procedure DestroyHierarchyList(var L: list);
begin
    if L <> nil then begin
        if L^.next <> nil then
            DestroyHierarchyList(L^.next);
        destroy(L^.elem);
        dispose(L);
    end;
end;

procedure print(L: list1);
begin
    if L <> nil then begin
        write(L^.elem);
        print(L^.next);
    end;
end;

begin
    reset(F);
    max := 0;
    L := nil;
    while not eof(F) do begin
        i := 1;
        new(L1);
        read(f, L1^.elem);
        p := L1;
        while not eoln(F) do begin
            read(f,c);
            i := i + 1;
            new(q);
            q^.elem := c;
            p^.next := q;
            p := q;
        end;
        p^.next := nil;
        if i > max then begin
            DestroyHierarchyList(L);
            new(L);
            L^.elem := L1;
            L^.next := nil;
            max := i;
            t := L;
        end
        else if i = max then begin
            new(b);
            b^.elem := L1;
            b^.next := nil;
            t^.next := b;
            t := t^.next;
        end
        else
            destroy(L1);
        readln(f);
    end;
    b := L;
    while b <> nil do begin
        print(b^.elem);
        writeln;
        b := b^.next;
    end;
    DestroyHierarchyList(L);
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskBlock8Dop3');
    assign(F, 'words.txt');
    writeln;
    writeln('These are longest words:');
    longestwords(F);
    close(F);
    writeln;
end.