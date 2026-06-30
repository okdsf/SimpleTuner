@echo off
REM 渲染所有 PlantUML 架构图为 PNG
REM
REM 关键: PLANTUML_LIMIT_SIZE 控制最大画布尺寸(像素)
REM 默认值是 4096, 长图会被截断
REM 设为 16384 可容纳大多数架构图
REM
REM 用法:
REM   1. 确保已安装 Java 和 plantuml.jar
REM   2. 双击本脚本, 或在命令行运行: render_all.bat
REM   3. 如果图仍被截断, 增大 PLANTUML_LIMIT_SIZE 的值

set PLANTUML_LIMIT_SIZE=16384

REM 如果 plantuml.jar 不在 PATH 中, 修改这里:
set PLANTUML_JAR=plantuml.jar

echo ================================================
echo  渲染 SimpleTuner 架构图
echo  画布上限: %PLANTUML_LIMIT_SIZE% 像素
echo ================================================
echo.

for %%f in (*.puml) do (
    echo 渲染: %%f ...
    java -DPLANTUML_LIMIT_SIZE=%PLANTUML_LIMIT_SIZE% -jar %PLANTUML_JAR% -charset UTF-8 -tpng "%%f"
    if errorlevel 1 (
        echo   [失败] %%f
    ) else (
        echo   [完成] %%~nf.png
    )
)

echo.
echo ================================================
echo  全部完成!
echo  如果图片仍被截断, 请增大 PLANTUML_LIMIT_SIZE
echo  当前值: %PLANTUML_LIMIT_SIZE%
echo ================================================
pause
