FROM kuyoonjo/vs

SHELL ["cmd", "/S", "/C"]

ADD chocolatey.install.ps1 C:/TEMP/chocolatey.install.ps1
RUN powershell -ExecutionPolicy bypass -File C:\TEMP\chocolatey.install.ps1

RUN choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'
RUN choco install -y git --params "/GitAndUnixToolsOnPath /NoGuiHereIntegration /NoGitLfs /NoAutoCrlf"
RUN choco install -y python2
RUN choco install -y nodejs-lts --version=12.16.0

RUN npm i -g cmake-js
RUN cmake-js || true

ADD https://aka.ms/vs/16/release/vs_community.exe C:/TEMP/vs_community.exe
RUN C:\TEMP\vs_community.exe --quiet --wait --norestart --nocache --noUpdateInstaller --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended || IF "%ERRORLEVEL%"=="3010" EXIT 0