{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
program Stack_Operations(input,output);
(**********************************************************************
*********************    Описание СТЕКА   *****************************
**********************************************************************)
type
    TE = integer;     {тип элемента зависит от решаемой задачи}
    list = ^node;  {список}
    node = record  {звено списка}
        elem: TE;  {элемент}
        next: list {ссылка на следующее звено}
    end;
    stack = list;
var 
    S: stack; {стек}
    i, j: TE;
    c: char;
(**********************************************************************
***************      Операции для работы со СТЕКОМ    *****************
**********************************************************************)
{Создание пустого стека S:}
procedure ClearStack(var S: stack); 
{Задачник: ОЧИСТЕК(S)}
begin
    S := nil;
end;

{Проверка, является ли стек S пустым?}
function EmptyStack(S: stack): boolean;
{Задачник: ПУСТЕК(S)}
begin
    EmptyStack := S = nil
end;

{Добавить (затолкнуть) новый элемент Х в стек S:}
procedure Push(var S: stack; X: TE); 
{Задачник: ВСТЕК(S, Х)}
var 
    p: list;
begin
    {порождаем звено списка под новый элемент:}
    new(p);
    p^.elem := X;
    p^.next := S;
    S := p
    {новое звено стало вершиной стека S}
 end;
 
{Удалить (вытолкнуть) из стека S элемент, присвоив его параметру X:}
procedure Pop(var S: stack; var X: TE); 
{Задачник: ИЗСТЕКА(S, Х)}
var 
    p: list;
begin
    {считаем, что стек S - не пуст (проверили с помощью EmptyStack):}
    X := S^.elem;
    p := S; {адрес ненужного звена}
    S := S^.next;
    dispose(p);
 end;
begin
    {здесь следует разместить решение задачи с использованием стека}
    writeln;
    writeln('Gikalo Egor 110 TaskDop9_1');
    writeln;
    writeln('Plese, set a sequence that ends with a ".":');
    ClearStack(s);
    i := 1;
    repeat
        read(c); 
        if c = '(' then
            Push(s, i);
        if c = ')' then begin
            Pop(s, j);
            writeln(j,' ',i);
        end;
        i := i + 1;
    until (c = '.');
    writeln;
end.
{(((()))).
4 5
3 6
2 7
1 8}
{A+(45-F(X)*(B-C)).
 8 10
 12 16
 3 17}