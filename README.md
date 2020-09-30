# How to use it

```
docker run --rm -it -v %cd%:c:/work kuyoonjo/nodejs-build-tools-win cmd /S /C "cd work && node -v"
```

Also, git bash is available.
```
docker run --rm -it -v %cd%:c:/work kuyoonjo/nodejs-build-tools-win bash -c "cd work && node -v"
```