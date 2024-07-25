@echo off
setlocal enabledelayedexpansion

set "input_file=result.csv"
set "output_file=sel_ip.txt"
set "target_directory=myV2IP"
set "line_number=0"

if exist "%output_file%" del "%output_file%"
:: 检查目标目录是否存在，如果不存在则创建它
if not exist "%target_directory%" (
    mkdir "%target_directory%"
)


for /f "tokens=1 delims=," %%A in ('type "%input_file%"') do (
    set /a line_number+=1
    if !line_number! gtr 1 (
        echo %%A >> "%output_file%"
		
    )
)
:: 复制文件到目标目录
copy "%output_file%" "%target_directory%\"
echo First column from the second row has been extracted to %output_file%



cd myV2IP

git add .

git commit -m "ip修改"
git push origin master


pasue