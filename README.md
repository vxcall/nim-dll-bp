# nim-dll-bp
Base code for creating 32bit dll to be injected on Windows.
building nim into 32bit dll is troublesome, but after crowling around internet and read some forum posts about it I figured out
the best form of it.

# Build guide

First of all, run following on PowerShell to set environment variable.
Make sure you replace the path with your actual one.

```Shell
$env:MINGW_PATH = "path_to_mingw32/mingw32/bin"
```

I wrote the compiler options in `nim.cfg` beforehand, hence run following will build what you want automagically.

```Shell
nim c injected.nim
```

# DIE

Analysis by die

![die](https://user-images.githubusercontent.com/33578715/180053570-65671cbf-d7bf-41e3-b28f-458047415718.png)

# reference

Thanks geniuses :sob:

[https://guidedhacking.com/threads/nim-dll-not-injecting-not-sure-what-to-do-from-here.17231/#post-108478](https://guidedhacking.com/threads/nim-dll-not-injecting-not-sure-what-to-do-from-here.17231/#post-108478)

[https://forum.nim-lang.org/t/6583](https://forum.nim-lang.org/t/6583)
