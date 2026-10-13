@echo off
chcp 65001 >nul
title Nebula Core - 3D 粒子光球手势交互环境启动器
echo =================================================================
echo        Nebula Core - 3D 粒子光球手势交互系统启动器
echo =================================================================
echo.
echo [1/2] 正在检测本地环境并配置安全上下文 (启用浏览器摄像头权限)...
echo.

cd /d "%~dp0"

where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [✓] 检测到 Python，正在启动本地极速 HTTP 服务 (端口 8899)...
    start "" /b python -m http.server 8899 --bind 127.0.0.1
    timeout /t 1 >nul
    echo [✓] 正在打开默认浏览器...
    start http://127.0.0.1:8899/index.html
    goto success
)

echo [i] 未检测到 Python，正在尝试通过 Microsoft Edge 硬件权限模式启动...
start msedge --allow-file-access-from-files --enable-media-stream "%~dp0index.html"
if %errorlevel% equ 0 (
    echo [✓] 已通过 Edge 权限模式拉起页面！
    goto success
)

echo [i] 正在使用系统默认浏览器直接打开 (支持全套鼠标/触控交互)...
start "" "%~dp0index.html"

:success
echo.
echo =================================================================
echo [✓] 启动完成！
echo.
echo 💡 使用与操作指南:
echo  1. 如果浏览器弹出授权申请，请点击【允许使用摄像头】；
echo  2. 面对摄像头伸手，粒子光球将立即锁定手掌并在 3D 空间跟随；
echo  3. 张开五指扩散暴胀，握拳向心聚拢微颤，食指与大拇指捏合触发能量辉光；
echo  4. 如果没有摄像头，也可以直接晃动鼠标、滚动滚轮或在触屏上滑动把玩；
echo  5. 体验过程中请勿关闭此窗口（如需退出系统，直接关闭此窗口即可）。
echo =================================================================
echo.
pause
