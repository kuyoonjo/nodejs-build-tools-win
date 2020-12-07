FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["cmd", "/S", "/C"]

ADD chocolatey.install.ps1 C:/TEMP/chocolatey.install.ps1
RUN powershell -ExecutionPolicy bypass -File C:\TEMP\chocolatey.install.ps1

RUN choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'
RUN choco install -y git.install --params "/GitAndUnixToolsOnPath /NoGuiHereIntegration /NoGitLfs /NoAutoCrlf"
RUN choco install -y python2
RUN choco install -y nodejs-lts --version=12.16.0
RUN npm i -g cmake-js
RUN cmake-js || true
RUN set ELECTRON_MIRROR=http://npm.taobao.org/mirrors/atom-shell && cmake-js --runtime=electron --runtime-version=5.0.10 || true

ADD https://aka.ms/vs/16/release/vs_community.exe C:/TEMP/vs_community.exe
RUN C:\TEMP\vs_community.exe --quiet --wait --norestart --nocache --noUpdateInstaller --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended || IF "%ERRORLEVEL%"=="3010" EXIT 0

ENV ELECTRON_MIRROR http://npm.taobao.org/mirrors/atom-shell
RUN cmake-js || true
RUN cmake-js --runtime=electron --runtime-version=5.0.10 || true