{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
// ---------------------------------------------------------------------
// ДОП_ЗАДАЧА  (выход-6 от 04.12.2021)        ///   30 очков   ///
// ---------------------------------------------------------------------
(*
Программа. 
Реализовать кольцевой буфер, запоминающий последние n (n=10) значений.
 
По запросу "p" и поданному с клавиатуры числу, 
буфер должен запоминать поданное с клавиатуры число.

По запросу "g" и поданному с клавиатуры номеру, 
буфер должен возвращать элемент, номер которого равен поданному ранее,
начиная отсчет от последнего поданного числа в обратную сторону. 
Если поданный номер является некорректным, буфер должн возвращать -1.
 
По запросу "q" программа должна завершать работу.

Пример работы (см. в конце более развёрнутый пример работы программы):
p 17
g 1 -> 17
p 18
g 1 -> 18
g 2 -> 17
g 3 -> -1
p 19
g 1 -> 19
g 2 -> 18
g 3 -> 17
g 4 -> -1

q
 
*)
{
ТРЕБОВАНИЕ. Использовать описания и заготовки, приведённые в программе. 
Фактически остаётся реализовать процедуру push_back(a, val) и 
функцию get_latest(a, idx). Все остальные действия уже представлены.
СДАВАТЬ ОЧНО, ЧЕРЕЗ ДИСКОРД
}

program cycle_buf(input, output);
const
    n = 4;

type
    arr = array [1..n] of integer;
    cycle_array = record
        buf: arr;        {хранилище элементов}
        cur: integer;    {очередная свободная позиция для записи в буфер}
        size: integer;   {текущее количество элементов в буфере}
    end;
var
    i: integer;
    c: char;
    a: cycle_array;      {циклический буфер}
    
procedure push_back(var a: cycle_array; val: integer);

begin
    with a do begin
        if cur > n then begin
            buf[1] := val;
            cur := 2;
        end
        else begin
            buf[cur] := val;
            cur := cur + 1;
            if size < n then
                size := size + 1;
        end;
    end;
{здесь расположить ваше описание данной процедуры}

end;

function get_latest(var a: cycle_array; idx: integer): integer;

{здесь расположить ваше описание данной функции}
begin
    with a do begin
        if (idx > size) or (idx < 1) then
            get_latest := -1
        else begin
            if (cur - idx) <= 0 then
                get_latest := buf[n+cur-idx]
            else
                get_latest := buf[cur-idx];
        end;
    end;
end;

procedure output_buf(var buf: arr);
var
    i: integer;
begin
    writeln('Current buffer:');
    for i := 1 to n do
        write(buf[i], ' ');
    writeln;
end;

begin
    {инициализация буфера:}
    with a do begin
        for i := 1 to n do
            buf[i] := 0;
        cur := 1;
        size := 0;
    end;
    {по желанию, можно уменьшить количество выводимого текста на экране}
    write('Input the action ');
    write('(p: push back, g: get latest, q: quit): ');
    readln(c);
    while c <> 'q' do begin
        if c = 'p' then begin
            write('Input a pushing number: ');
            readln(i);
            push_back(a, i);
            output_buf(a.buf); {контрольная печать содержимого буфера}
        end else if c = 'g' then begin
            write('Input an index: ');
            readln(i);
            writeln(get_latest(a, i));
        end else
            writeln('Wrong input!');
        write('Input the action ');
        write('(p: push back, g: get latest, q: quit): ');
        readln(c);
    end;
end.
(*
Пример работы программы (при выводе можно минимизировать длину сообщений):
*)
========================================================================
Пусть сейчас буфер заполнен наполовину (cur=6, size=5) и имеет вид:
17 18 19 20 21 0 0 0 0 0
========================================================================
Input the action (p: push back, g: get latest, q: quit): p
Input a pushing number: 22
Current buffer:
17 18 19 20 21 22 0 0 0 0
Input the action (p: push back, g: get latest, q: quit): p
Input a pushing number: 23
Current buffer:
17 18 19 20 21 22 23 0 0 0
Input the action (p: push back, g: get latest, q: quit): p
Input a pushing number: 24
Current buffer:
17 18 19 20 21 22 23 24 0 0
Input the action (p: push back, g: get latest, q: quit): p
Input a pushing number: 25
Current buffer:
17 18 19 20 21 22 23 24 25 0
Input the action (p: push back, g: get latest, q: quit): p
Input a pushing number: 26
Current buffer:
17 18 19 20 21 22 23 24 25 26
Input the action (p: push back, g: get latest, q: quit): g
Input an index: 1
26
Input the action (p: push back, g: get latest, q: quit): p
Input a pushing number: 27
Current buffer:
27 18 19 20 21 22 23 24 25 26
Input the action (p: push back, g: get latest, q: quit): g
Input an index: 1
27
Input the action (p: push back, g: get latest, q: quit): g
Input an index: 2
26
Input the action (p: push back, g: get latest, q: quit): g
Input an index: 10
18
Input the action (p: push back, g: get latest, q: quit): g
Input an index: 11
-1
Input the action (p: push back, g: get latest, q: quit): g
Input an index: 9
19
Input the action (p: push back, g: get latest, q: quit): q
