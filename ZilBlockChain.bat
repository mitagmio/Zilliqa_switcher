SET StartSec=5
@echo off
mode con cols=45 lines=7
cls
:begin
FOR /L %%A IN (%StartSec%,-1,0) DO (
  cls
  echo Timeout [92;1m%%A[0m seconds...
  timeout /t 1 >nul
)
:start
SET TimeOutSec=20
SET StartBlock=98
SET EndBlock=01

SET killProcMiner1=PhoenixMiner.exe
SET killProcMiner2=NiceHashMinerLegacy.exe

SET killProcZillMiner=zilminer.exe

SET StartFileMiner=C:\NHML-1.9.0.11\NiceHashMinerLegacy.exe

SET StartFileZillMiner=C:\zilminer-0.1.25\start_zil.bat

cls
echo Loading API ...
curl -s https://api.zilliqa.com/ --data-binary "{\"id\": \"1\",\"jsonrpc\": \"2.0\",\"method\": \"GetBlockchainInfo\",\"params\": [\"\"]}" -H "Content-Type: application/json" > tmpFile
set /p myvar= < tmpFile 
del tmpFile  
echo %myvar% | jq --raw-output .result.NumTxBlocks > tmpFile
set /p MYTX= < tmpFile
del tmpFile
echo %myvar% | jq --raw-output .result.CurrentDSEpoch > tmpFile
set /p MYDS= < tmpFile
del tmpFile
set "MY=%MYTX:~-2%"

cls
echo ------------- Zilliqa API info -------------
echo Current DSEpoch: %MYDS%
echo Current TxBlock: %MYTX%
echo .    
if %MY% GTR %StartBlock% (
	echo Mining ZIL is runing %MY% ^> %StartBlock%
	echo Rechecking Zilliqa API, timeout %TimeOutSec% sec...
	timeout /t %TimeOutSec% >nul
	goto :StartPowZill
)

if %MY% LEQ %StartBlock% (
	if %MY% GEQ %EndBlock% (
		echo Mining ZIL is stoping %EndBlock% ^< %MY% ^<^= %StartBlock%
		echo Rechecking Zilliqa API, timeout %TimeOutSec% sec...
		timeout /t %TimeOutSec% >nul
		goto :StopPowZill
	)
	if %MY% LSS %EndBlock% (
		echo Mining ZIL is runing %MY% ^< %EndBlock%
		echo Rechecking Zilliqa API, timeout %TimeOutSec% sec...
		timeout /t %TimeOutSec% >nul
		goto :StartPowZill
	)
)
goto :end

:FOUND_MINER
	taskkill /f /im %killProcMiner1% >nul
	taskkill /f /im %killProcMiner2% >nul
	timeout /t 2 >nul
	taskkill /f /im %killProcMiner1% >nul
	taskkill /f /im %killProcMiner2% >nul
goto :checkZill



:StartPowZill
	FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %killProcMiner2%"') DO IF %%x == %killProcMiner2% goto :FOUND_MINER
		
	:checkZill
		FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %killProcZillMiner%"') DO IF %%x == %killProcZillMiner% goto :measure

		:start_poc_zill
			start %StartFileZillMiner%

:measure		
goto :start



:FOUND_MINER_ZILL
	taskkill /f /im %killProcZillMiner% >nul
	taskkill /f /im %killProcZillMiner% >nul
	timeout /t 2 >nul
	taskkill /f /im %killProcZillMiner% >nul
	taskkill /f /im %killProcZillMiner% >nul
goto :checkMiner



:StopPowZill
	FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %killProcZillMiner%"') DO IF %%x == %killProcZillMiner% goto :FOUND_MINER_ZILL
		
	:checkMiner
		FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %killProcMiner2%"') DO IF %%x == %killProcMiner2% goto :continue

		:start_poc_miner
			start %StartFileMiner%

:continue		
goto :start
pause
