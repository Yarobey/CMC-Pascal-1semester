{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop2_3(input, output);

var
    x, x1: real;
    st, i, remainder, counter, counter1, ans: integer;
    c, c1, c2: char;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop2_3');
    writeln;
    write('Please, set a real number with "+" or "-" in front of it and press "space" and "enter" after: ');
    counter := 0;
    x := 0;
    x1 := 0;
    st := 0;
    read(c);{ввод вещественного числа с фиксированной точкой}
    if c = '-' then begin
        c2 := c;
        read(c);
    end;
    repeat{нахождение целой части}
        x := x * 10 + (ord(c) - ord('0'));
        read(c);
    until (c = '.') or (c = 'E');
    if (c <> 'E') then begin
        read(c);
        counter1 := 0;
        repeat 
            x1 := x1 * 10 + (ord(c) - ord('0'));{нахождение дробной части}
            counter1 := counter1 + 1;{нахождение кол-ва цифр в дробной части}
            read(c);
        until (c = ' ') or (c = 'E');
    end;
    if c = 'E' then begin{ввод вещественного числа с плавающей точкой}
        read(c1);
        if c1 <> '0' then begin
            read(c);
            repeat
                st :=  st * 10 + (ord(c) - ord('0'));
                read(c);
            until (c = ' ');
        end;
    end;
    while x1 >= 1 do{прибавление дробной части к целой}
        x1 := x1 / 10;
    x := x + x1;
    if c1 = '-' then{если число с плавающей точкой, то смотрим знак степени 10}
        for i := 1 to st do
            x := x / 10
    else if c1 = '+' then
        for i := 1 to st do
            x := x * 10;
    while x >= 1 do begin           {нахождение кол-ва цифр в целой части}
        x := x / 10;
        counter := counter + 1;
    end;
    st := counter;              {степень десятки определяется кол-вом цифр в целой части}
    counter := counter + counter1;  {кол-во цифр в числе}
    writeln;
    writeln('Your number with floating-point: ');
    if c2 = '-' then
        write(c2,'0','.')          {начинаем символьную запись с плавающей точкой}
    else
        write('+','0','.'); 
    if counter < 16 then            {смотрим сколько позиций может не хватать}
        remainder := 16 - counter;
    while counter > 0 do begin      {печатаем дробную часть числа до E}
        ans := (trunc(x * 10)) mod 10;
        write(chr(ans + 48));
        x := x * 10;
        counter := counter - 1;
    end;
    while (remainder > 0) do begin  {незаполненные позиции заполняем нулями}
        write('0');
        remainder := remainder - 1;
    end;
    write('E','+');                 {печатаем степень 10, рассматривая 3 случая}
    if st < 10 then
        write('0', '0' ,chr(st + 48))
    else if st < 100 then begin
        write('0');
        write(chr(st div 10 + 48));
        write(chr(st mod 10 + 48));
    end
    else begin
        write(chr(st div 100 + 48));
        write(chr((st div 10) mod 10 + 48));
        write(chr(st mod 10 + 48));
    end;
    writeln;
end.