# Zilliqa_switcher
[English version](https://github.com/mitagmio/Zilliqa_switcher/blob/master/READMEENG.md)
# *Огромная просьба поддержать небольшим пожертвованием - это поможет развивать направление скриптописания и оставлять исходные коды открытыми.*

А теперь к делу, скрипт решил написать по причине не стабильной работы майнера zilliqa на чисто красном риге c параметрами старта и остановки на win10.\
Скрипт использует две утилиты для своей работы cURL и JQ\
<https://stedolan.github.io/jq/download/>\
<https://curl.haxx.se/windows/>

# Краткое описание работы скрипта:
1) на 98 блоке будет останавливаться основной майнинг и запускаться майнер зилики (номер блока выбран с запасом можно изменить настройки под себя)\
2) по окончанию майнинга на 01 блоке майнер зилики закрывается (номер блока выбран с запасом можно будет изменить настройки под себя)\
3) открывается основной майнер\
4) скрипт продолжает работать в фоне обращаясь к API zilliqa проводя проверку номера блока каждые 20 секунд (20 секунд только потому что новый TX блок не ровно каждую минуту появляется)

# Описание параметров внутри BAT файла:
SET StartSec=5 # Время до начала работы скрипта идет обратный отсчет для полной загрузки винды

SET TimeOutSec=20 # Время между повторными проверками информации в блокчейне по API Zilliqa\
SET StartBlock=98 # Блок с которого включается майнинг Zilliqa\
SET EndBlock=01 # Блок с которого выключается майнинг Zilliqa

SET killProcMiner1=PhoenixMiner.exe # Процесс майнера\
SET killProcMiner2=calc.exe # второй процесс майнера (Для теста указан калькулятор)\
 два процесса сделано для использования NiceHashLegaсyMiner и\
 отключение конкретного майнера чаще всего которым майнит найсхеш

SET killProcZillMiner=notepad.exe #Процесс зилики (Для теста указан блокнот)

SET StartFileMiner=%windir%\system32\calc.exe # Путь к файлу запуска основного майнера (Для теста указан калькулятор)

SET StartFileZillMiner=%windir%\system32\notepad.exe #Путь к файлу запуска ZillMiner (Для теста указан калькулятор)

# В планах:
1) Имплементация на Ubuntu и HIVE OS
2) Есть возможность Zilliqa switcher расширить программным WatchDog для отслеживания загруженности карт и проверкой доступности интернет.\
(Есть наработки как по красным так и по зеленым под win 7\10)\
и еще много интересных идей может возникнуть у вас.

Обсуждение: <https://mininghub.cc/resources/32/>

--------------------------------------------------------------\
Заинтересовашихся прошу обращаться в телеграмм [@mitagmio](https://mininghub.cc/members/1889/)
# Донат:
BTC: 12yDg5uYrcHqN2HoeVp1tR1eanXAJxHsDb\
LTC: LhAxQLTHacm8WoWQ9mHSZmfbqFGCphHqgg\
ETH: 0xb48f60b5e69bcbd95b00b5bd2dd76d8eec524894\
ETC: 0xb48f60b5e69bcbd95b00b5bd2dd76d8eec524894\
CALLISTO: 0x66aefd45d0d7da104dd140f0bd7917967a122a3b

QIWI: 79155009589\
Сбербанк: 79155009589
