# Homebrew Formulae related to modm

`brew tap modm-ext/modm`

Homebrew only loads formulae from taps you trust, so either trust the whole tap with `brew trust --tap modm-ext/modm` or only the formulae you install with `brew trust --formula modm-ext/modm/<formula>`.

## DoxyPress

`brew install doxypress`

## Arm GNU Toolchain (Arm binary distribution)

`brew install arm-gcc-bin@15`

Also available as `arm-gcc-bin@8` to `@14`. They are keg-only, so add `$(brew --prefix arm-gcc-bin@15)/bin` to your `PATH` or run `brew link --force arm-gcc-bin@15`.

## GNU Arm Embedded GCC Toolchain (xPack binary distribution)

`brew install arm-gcc-xpack@15`

Also available as `arm-gcc-xpack@10` to `@14`. Each includes `arm-none-eabi-gdb-py3` with Python 3 support. They are keg-only, so add `$(brew --prefix arm-gcc-xpack@15)/bin` to your `PATH`.

## STMicro fork of OpenOCD

`brew install openocd-stmicro`
