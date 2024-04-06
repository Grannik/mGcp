#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 27);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=27;fi
 if [[ $aa -gt 27 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=27;fi
 if [[ $j1 -gt 27 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 27 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=41; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** gcp ***\e[0m                              \e[2m Advanced command-line file copier\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[13;3H\e[36m OPTIONS\e[0m                                                               ОПЦИИ\e[0m";
 echo -en "\e[14;3H\e[2m Эти программы следуют обычному синтаксису командной строки GNU с длинными\e[0m";
 echo -en "\e[15;3H\e[2m параметрами, начинающимися с двух тире\e[32m \`-'\e[0m\e[2m Описание вариантов приведено ниже.\e[0m";
 echo -en "\e[16;3H\e[32m General options\e[0m                                             Общие параметры\e[0m";
 echo -en "\e[19;3H\e[32m cp-like options\e[0m                                           cp-подобные опции\e[0m";
 echo -en "\e[27;3H\e[32m gcp-specific options\e[0m                          специфичные для gcp параметры\e[0m";
 echo -en "\e[31;3H\e[32m Sources saving\e[0m                                        Сохранение источников\e[0m";
 echo -en "\e[39;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[42;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[5;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[6;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[7;3H Описание                                                       \e[32m DESCRIPTION \e[0m";}
  E3(){ echo -en "\e[8;3H Автор                                                               \e[32m AUTHOR \e[0m";}
  E4(){ echo -en "\e[9;3H Смотрите также                                                    \e[32m SEE ALSO \e[0m";}
  E5(){ echo -en "\e[10;3H Примечание по NTFS                                            \e[32m NOTE ON NTFS \e[0m";}
  E6(){ echo -en "\e[11;3H Ограничения                                                    \e[32m LIMITATIONS \e[0m";}
  E7(){ echo -en "\e[12;3H Статус выхода                                                  \e[32m EXIT STATUS \e[0m";}
  E8(){ echo -en "\e[17;3H Show summary of options                                         \e[32m -h, --help \e[0m";}
  E9(){ echo -en "\e[18;3H Show program version and copyright information and exit      \e[32m -V, --version \e[0m";}
 E10(){ echo -en "\e[20;3H Overwrite existing files                                       \e[32m -f, --force \e[0m";}
 E11(){ echo -en "\e[21;3H Всегда переходите по символическим ссылкам в источниках  \e[32m -L, --dereference \e[0m";}
 E12(){ echo -en "\e[22;3H Никогда не переходите по символическим ссылкам        \e[32m -P, --no-dereference \e[0m";}
 E13(){ echo -en "\e[23;3H Такая же как --preserve=mode,ownership,timestamps                       \e[32m -p \e[0m";}
 E14(){ echo -en "\e[24;3H Сохранять указанные атрибуты                       \e[32m --preserve=<attributes> \e[0m";}
 E15(){ echo -en "\e[25;3H Copy directories recursively                           \e[32m -r, -R, --recursive \e[0m";}
 E16(){ echo -en "\e[26;3H Показать, что делается                                       \e[32m -v, --verbose \e[0m";}
 E17(){ echo -en "\e[28;3H gcp имеет возможность изменить имя файла  \e[32m  --fix-filenames=<force|auto|no> \e[0m";}
 E18(){ echo -en "\e[29;3H Такая же как --fix-filenames=no                   \e[32m --no-fs-fix (DEPRECATED) \e[0m";}
 E19(){ echo -en "\e[30;3H Disable progress bar                                         \e[32m --no-progress \e[0m";}
 E20(){ echo -en "\e[32;3H Сохраните список исходных файлов в списке с именем  \e[32m --sources-save=SOURCES \e[0m";}
 E21(){ echo -en "\e[33;3H Сохраните список исходных файлов                 \e[32m --sources-replace=SOURCES \e[0m";}
 E22(){ echo -en "\e[34;3H Используйте список исходных файлов с именем SOURCES \e[32m --sources-load=SOURCES \e[0m";}
 E23(){ echo -en "\e[35;3H Удалить список исходных файлов с именем SOURCES      \e[32m --sources-del=SOURCES \e[0m";}
 E24(){ echo -en "\e[36;3H Перечислите имена списков исходных файлов                   \e[32m --sources-list \e[0m";}
 E25(){ echo -en "\e[37;3H Перечислите имена списков исходных файлов              \e[32m --sources-full-list \e[0m";}
 E26(){ echo -en "\e[38;3H                                                                        \e[36m Git \e[0m";}
 E27(){ echo -en "\e[40;3H                                                                        Exit ";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo apt install gcp\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
       gcp [OPTIONS] FILE DEST
       gcp [OPTIONS] FILE1 [FILE2...] DEST-DIR
\e[0m
 Порядок копирования:\e[32m gcp file.txt /home/usr/file.txt\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 gcp — это копировщик файлов, во многом вдохновленный cp,
 но с такими высокоуровневыми функциями, как:
 • индикация хода передачи
 • непрерывное копирование при возникновении проблемы:
   проблемный файл пропускается и продолжается
 • ведение журнала статуса копирования:
   какие файлы были эффективно скопированы
 • изменение имен для устранения ограничений целевой файловой системы
   (например, удаление несовместимых символов,
   таких как «?» или «*» в файловых системах FAT)
 • принудительная сериализация копирования:
   новые файлы для копирования добавляются в глобальную очередь,
   чтобы избежать поиска головки жесткого диска.
 • управление списком передачи:
   gcp может сохранить список файлов для копирования
   и повторного использования позже.
 • приблизительная совместимость опций с cp
   (приблизительная, поскольку поведение не совсем такое, см. ниже).
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 gcp был написан Jérôme Poisson:                                \e[36m goffi@goffi.org\e[0m
 В настоящее время его поддерживает Matteo Cypriani             \e[36m mcy@lm7.fr\e[0m
 Эта страница руководства изначально была написана Thomas Preud:\e[36m robotux@celest.fr\e[0m
 для проекта Debian (и может использоваться другими).
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 cp
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 NTFS не применяет те же ограничения на имена файлов, что и FAT, но файлы, которые
 не принимаются файловой системой FAT, по-прежнему будут вызывать проблемы в Windows
 Следовательно, рекомендуется использовать\e[32m --fix-filenames=force\e[0m при копировании
 в NTFS (в любом случае, если требуется совместимость с Windows).
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохранение временных меток с помощью опции --preserve ограничено модулем os Python
 в системах POSIX. В настоящее время Python возвращает временные метки только
 в формате с плавающей запятой, что имеет меньшую точность, чем то,
 что обеспечивает POSIX. Прогресс в решении этой проблемы можно увидеть по адресу
\e[36m http://bugs.python.org/issue11457\e[0m
 Опцию --preserve в настоящее время нельзя использовать без списка атрибутов
 (gcp --preserve foo bar будет вести себя как gcp --preserveu003dfoo bar).
 Вместо этого используйте ключ -p.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Статус выхода может быть:
\e[32m 0\e[0m если файлы были скопированы правильно или если другой экземпляр gcp уже запущен и выполнит копирование.
\e[32m 1\e[0m если хотя бы один файл не был скопирован или что-то пошло не так.
\e[32m 2\e[0m если все файлы были скопированы, но с некоторыми проблемами
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Show summary of options:
\e[32m gcp -h\e[0m
\e[32m gcp --help\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Show program version and copyright information and exit:
\e[32m gcp -V\e[0m
\e[32m gcp --version\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Никогда не переходите по символическим ссылкам в источниках.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохранять указанные атрибуты.
 Атрибутами могут быть режим, право собственности и временные метки.
 Если передается несколько атрибутов, их необходимо разделить запятыми.
 Обратите внимание, что сохранение временных меток имеет некоторые ограничения,
 см. раздел ОГРАНИЧЕНИЯ.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[47;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[47;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 gcp имеет возможность изменить имя файла назначения, если целевая файловая система
 не принимает исходное имя файла. Оскорбительные символы будут заменены похожими.
 Эта опция принимает следующие значения:
\e[32m auto (default)\e[0m gcp попытается действовать умно, т. е.
                обнаружить несовместимости и исправить их по мере необходимости.
\e[32m force         \e[0m Всегда исправляйте имена файлов, которые могут вызвать проблемы
                в любой известной файловой системе или ОС.
                Это полезно, например. с NTFS, см. ПРИМЕЧАНИЕ ПО NTFS ниже.
\e[32m no            \e[0m Переименование отключено полностью.
 В настоящее время gcp знает только о несовместимости FAT:
\e[32m ´\\´, ´:´, ´*´, ´?´, ´\"´, ´<´, ´>´, ´|´\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[47;30m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Такая же как --fix-filenames=no
 Эта опция будет удалена в будущем выпуске.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[47;30m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[47;30m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохраните список исходных файлов в списке с именем SOURCES
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[47;30m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохраните список исходных файлов в списке с именем SOURCES
 Файл перезаписан, он уже существует.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[47;30m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[47;30m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[47;30m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[47;30m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перечислите имена списков исходных файлов, включая их содержимое.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[47;30m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mGcp Описание утилиты gcp. Advanced command-line file copier
 asciinema:  \e[36m https://asciinema.org/a/651233\e[0m
 codeberg:   \e[36m https://codeberg.org/Grannik/mGcp\e[0m
 github:     \e[36m \e[0m
 gitlab:     \e[36m \e[0m
 sourceforge:\e[36m \e[0m
 notabug:    \e[36m \e[0m
 bitbucket:  \e[36m \e[0m
 gitea:      \e[36m \e[0m
 gogs:       \e[36m \e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[47;30m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
