# dragonbox-corsixth
CorsixTH release repository for Pandora &amp; Pyra Handhelds

## Datafiles

You can purchase the GoG here https://www.gog.com/en/game/theme_hospital
once you have the file, you can do the following;

```
sudo apt install innoextract
mkdir -p /dragonbox/appdata/CorsixTH
cd /dragonbox/appdata/CorsixTH
```

## Running CorsixTH

# The binary needs some dependencies that can't be install automatically at this time

# Bookworm
sudo apt install liblua5.4-0 fluid-soundfont-gm lua-filesystem lua-lpeg libavformat59 libavdevice59 libavutil57 libavfilter8 libswscale6 libpostproc56 libswresample4 libavcodec59 timidity

# Buster
sudo apt liblua5.3 fluid-soundfont-gm lua-filesystem lua-lpeg libavformat58 libavresample4 libavdevice58 libavutil56 libavfilter7 libswscale5 libpostproc55 libswresample3 libavcodec58 ffmpeg timidity


**** TESTING ****

This is to get the ball rolling on having a public release repository for corsixTH based on upstream

## local build

run `local_build.dbp.sh`

## docker build

TODO

## pipeline docker build

TODO

https://pyra-handheld.com/repo/packages/CorsixTH_maquis196

NOTE: With thanks to Wally for original release I took plenty of notes from


# Pandora build

TODO
