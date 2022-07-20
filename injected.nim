{.passL: "-s -static-libgcc".}
import winim/com

proc mainThread(hModule: HINSTANCE) =
  AllocConsole()
  discard stdout.reopen("CONOUT$", fmWrite)
  while true:
    echo toHex(hModule)


proc NimMain() {.cdecl, importc.}

proc DllMain(hModule: HINSTANCE, reasonForCall: DWORD,
    lpReserved: LPVOID): WINBOOL {.exportc, dynlib, stdcall.} =
  case reasonForCall:
    of DLL_PROCESS_ATTACH:
      NimMain()
      CreateThread(nil, nil, cast[LPTHREAD_START_ROUTINE](mainThread), cast[
          LPVOID](hModule), nil, nil)
    of DLL_PROCESS_DETACH:
      discard
    of DLL_THREAD_ATTACH:
      discard
    of DLL_THREAD_DETACH:
      discard
    else:
      discard
  return TRUE
