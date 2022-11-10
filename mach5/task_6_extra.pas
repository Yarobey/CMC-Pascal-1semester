{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
//----------------------------------------------------------------------
//     Дополнительная задача на 30 очков (выход-5 от 19.11.2021)
//----------------------------------------------------------------------
(*
 Условие. Дана матрица А размером n x m, состоящая из символов "." и "#".
 Матрица А представляет собой карту, где "." является обозначением моря,
 а "#" является обозначнием суши.  Две клетки с сушей являются смежными, 
 если они соседствуют в матрице по горизонтали или по вертикали.
 Посчитать количество островов на карте и вывести карту,  в которой 
 части суши, принадлежащие одному острову, имеют одинаковое обозначение
 (см. ниже примеры возможных обозначений).
 Требования к решению.
 1) Ввод исходной матрицы и вывод изменённой матрицы следует оформить 
 в виде отдельных процедур (при символьном вводе проявлять осторожность, 
 т.к. нажатие на Enter приводит к занесению в буфер ввода управляющих 
 символов => после ввода символов очередной строки нужно выполнить
 readln для очистки от этих "мешающих" управляющих символов).
 2) Для подсчёта количества островов описать целочисленную функцию 
 painting(А), значением которой является искомое количество островов на
 карте А. Функция, в качестве побочного эффекта, в процессе своей работы 
 выявляет острова и обозначает их на карте (см. ниже примеры - станет 
 ясно).
 *)
 {
 -----------------------------------------------------------------------
 Примеры работы для матрицы размером 3 x 10:
 -----------------------------------------------------------------------
 Пример_1.
 Вход:
##..##...#
..####..#.
##....###.
 Выход:
 5
aa..bb...c
..bbbb..d.
ee....ddd.
 -----------------------------------------------------------------------
 Пример_2.
 Вход:
##..##...#
..####..#.
##...####.
 Выход:
 4
aa..bb...c
..bbbb..b.
dd...bbbb.
 -----------------------------------------------------------------------
 Пример_3
 Вход:
######..##
..####..#.
###..####.
 Выход:
 1
aaaaaa..aa
..aaaa..a.
aaa..aaaa.
-----------------------------------------------------------------------
 Пример_4
 Вход:
#.#.#.#.#.
.#.#.#.#.#
#.#.#.#.#.
 Выход:
 15
a.b.c.d.e.
.f.g.h.i.j
k.l.m.n.o.
}
(*
Сдавать программу ТОЛЬКО через ПРОВЕРКУ_БЛОКОВ. Для этого:
1) Оттранслировать её для значений n=3 и m=10 (n и m - константы)
2) Показать работу программы на каждом из четырёх приведённых тестов,
прикрепив соответствующие скриншоты с результатми прохождения этих тестов
3) Не забыть поместить в архив саму программу, в которой должны 
присутствовать комментарии с необходимыми пояснениями (как решали задачу)
*)

program islands(input, output);
const
    n = 3;
    m = 10;
type
    matrix = array [1..n, 1..m] of char;
var
    A: matrix;
    
{возможно, вам понадобится сделать дополнительные описания}

{здесь ваше описание функции painting:}
function painting(var A: matrix): integer;
var 
    i, j, counter: integer;
    c: char;
    flag: boolean;

procedure IsIsland(i,j: integer);{проверяем на остров}
begin
    if a[i,j] = '#' then begin
        a[i,j] := c;
        if i < n then
            IsIsland(i + 1, j);
        if j < m then
            IsIsland(i, j + 1);
        if i > 1 then
            IsIsland(i - 1, j);
        if j > 1 then
            IsIsland(i, j - 1);
        flag := true;
    end;
end;

begin {переписываем карту и считаем кол-во островов}
    c := 'a';
    counter := 0;
    for i := 1 to n do
        for j := 1 to m do begin
            flag := false;
            IsIsland(i, j);
            if flag then begin
                counter := counter + 1;
                c := succ(c);
            end;
        end;
    painting := counter;
end;

procedure input(var A: matrix);
var
    i, j: integer;
begin
    writeln('Input map with islands') ;
    for i := 1 to n do begin
        for j := 1 to m do
            read(A[i,j]);
        readln;
    end;
end;
    
procedure output(var A: matrix);
var
    i, j: integer;
begin
    writeln('Colored map:');
    for i := 1 to n do begin
        for j := 1 to m do
            write(A[i,j]);
        writeln;
    end;
end;
    
begin {в разделе операторов программы ничего не менять!}
    input(A);
    writeln('Number of islands: ', painting(A));
    output(A);
end.
