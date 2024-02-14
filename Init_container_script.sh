Name1="chaithanya1"
Name2="chaithnay2"
Name3="ooooo"
Name4="geetha"
for i in Name1 Name2 Name3 Name4
do
        var=\$$i
        if [ -z `eval echo $var` ];then
                echo "$i - zero"
                exit 1
        else
                echo "$i - not-zero"
        fi
done
