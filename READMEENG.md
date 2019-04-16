# A huge request to support a small donation - this will help develop the direction of scripting and keep the source code open.

And now to the point, the script decided to write due to the unstable work of the miner zilliqa on a pure red riga with start and stop parameters on win10. \
The script uses two utilities for its work cURL and JQ \
<https://stedolan.github.io/jq/download/> \
<https://curl.haxx.se/windows/>

A brief description of the script:
1) on the 99 block, the main mining will stop and the miner of the Zilika will start (the block number is selected with a margin, you can change the settings for yourself) 
2) at the end of mining on block 01, the miner of zilika closes (the block number is selected with a margin, you can change the settings for yourself) 
3) the main miner opens
4) the script continues to work in the background by accessing the zilliqa API by checking the block number every 20 seconds (20 seconds only because the new TX block does not appear exactly every minute)

# Description of parameters inside the BAT file:
SET StartSec = 5 # The time before the script starts running counts down to fully load Windows

SET TimeOutSec = 20 # Time between repeated checks of information in the blockchain by API Zilliqa
SET StartBlock = 98 # Block from which mining Zilliqa \ is activated
SET EndBlock = 01 # Block from which mining Zilliqa is turned off

SET killProcMiner1 = PhoenixMiner.exe #Mayner process 
SET killProcMiner2 = calc.exe # second miner process (Calculator specified for test) 
 Two processes are made to use NiceHashLegaсyMiner and 
 Turning off a particular miner most often by minit nayshesh

SET killProcZillMiner = notepad.exe #Zilika process (Notepad is specified for the test)

SET StartFileMiner =% windir% \ system32 \ calc.exe # Path to the main miner's startup file (Calculator specified for the test)

SET StartFileZillMiner =% windir% \ system32 \ notepad.exe # Path to the ZillMiner launch file (Calculator specified for the test)

# In the plans:
1) It is possible to expand the Zilliqa switcher with software WatchDog to track the workload of the maps and check the availability of the Internet. 
(There are developments both in red and in green under win 7 \ 10) 
and many more interesting ideas may arise from you.

Discussion: <https://mininghub.cc/threads/298/>

-------------------------------------------------- ------------ 
Interested please contact the telegram [@mitagmio] (https://mininghub.cc/members/1889/)\
Donat:\
BTC: 12yDg5uYrcHqN2HoeVp1tR1eanXAJxHsDb\
LTC: LhAxQLTHacm8WoWQ9mHSZmfbqFGCphHqgg\
ETH: 0xb48f60b5e69bcbd95b00b5bd2dd76d8eec524894\
ETC: 0xb48f60b5e69bcbd95b00b5bd2dd76d8eec524894\
CALLISTO: 0x66aefd45d0d7da104dd140f0bd7917967a122a3b
\
QIWI: 79155009589\
Sberbank: 79155009589
