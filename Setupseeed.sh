
{
    mkdir /home/ovos
    mkdir /home/ovos/seeed-voicecard
    cd /home/ovos/seeed-voicecard
    if [ ! -f Makefile.bk ]; then
        cp Makefile Makefile.bk
    else
        rm Makefile;
        cp Makefile.bk Makefile
    fi
    current_kernel=$1;
    sed -i "s|\$(shell uname -r)|$current_kernel|" Makefile
    sed -i "s|depmod -a|depmod $current_kernel -a|" Makefile
#     mod=$2
#     ver=$3

    make
    make install
    rm *.mod *.ko Module.symvers modules.order
#     dkms build -k ${current_kernel} -m $mod -v $ver && {
#             dkms install --force -k ${current_kernel} -m $mod -v $ver
#             }
    cd /home/ovos
}
