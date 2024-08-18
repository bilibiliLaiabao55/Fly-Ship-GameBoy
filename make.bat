lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o main.o main.c
lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o FlyShip.gb main.o
G:\bgb\bgb.exe FlyShip.gb