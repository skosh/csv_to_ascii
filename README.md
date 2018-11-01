# csv_to_ascii
### Задача
Разработать конвертор из CSV файла в таблицу из ASCII символов.
Первая строка файла задает типы столбцов.
Следующие строки - сами данные ( разделитель - точка с запятой ).

### Типы:
int - целое число ( выравнивание вправо )

string - строка, строковые данные бьются на слова и выводятся в столбик.

money - денежная единица, форматирование 2 занака после запятой и
разделитель разрядов - пробел.

### Исходные данные ( как пример ):
```
int;string;money
1;aaa bbb ccc;1000.33
5;aaaa bbb;0.001
13;aa bbbb;10000.00
```
### На выходе скрипта:
```
+-----------------+
| 1|aaa | 1 000,33|
|  |bbb |         |
|  |ccc |         |
+--+----+---------+
| 5|aaaa|     0,01|
|  |bbb |         |
+--+----+---------+
|13|aa  |10 000,00|
|  |bbbb|         |
+--+----+---------+
```
### Критерии оценки:
1. Читабельность кода
2. Готовность к production использованию


### Usage:
```
require 'ascii_converter'

AsciiConverter.new(file: 'test_file.csv', parser: :csv)
```
