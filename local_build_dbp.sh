rm data.zip gamedata.sqfs
mksquashfs gamedata gamedata.sqfs -comp xz
cd assets; zip -r ../data.zip *; cd ..
cat gamedata.sqfs data.zip > corsixth_0.68_maquis196.dbp
