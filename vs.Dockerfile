FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["cmd", "/S", "/C"]

ADD https://aka.ms/vs/16/release/vs_community.exe C:/TEMP/vs_community.exe
RUN C:\TEMP\vs_community.exe --quiet --wait --norestart --nocache --noUpdateInstaller --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended || IF "%ERRORLEVEL%"=="3010" EXIT 0
