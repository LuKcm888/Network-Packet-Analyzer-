#networkscan any variable which system may be using

# clear the screen
clear

unset tecreset os architecture kernelrelease who internalip externaip nameservers 

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e "Internet: $tecreset\E[32m Connected\E[m" || echo -e '\E[30m'"Internet:\E[m $tecreset\E[31m Disconnected\E[m"

# Check OS Type
os=$(uname -o)
echo -e "Operating System Type :" $tecreset '\E[32m'$os '\E[m'

# Check Architecture
architecture=$(uname -m)
echo -e "Architecture :" $tecreset '\E[32m'$architecture '\E[m'

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e "Kernel Release :" $tecreset '\E[32m' $kernelrelease '\E[m'

# Check hostname
hostname=$(hostname -d)
echo -e "Hostname :" $tecreset '\E[32m' $hostname '\E[m'

# Check Internal IP
internalip=$(hostname -I)
echo -e "Internal IP :" $tecreset '\E[32m' $internalip '\E[m'

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e "External IP : $tecreset "'\E[32m' $externalip '\E[m'

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e "Name Servers :" $tecreset '\E[32m' $nameservers '\E[m'

# Check Logged In Users
who> /tmp/who
echo -e "Logged In users" $tecreset && cat /tmp/who  

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver

# Remove Temporary Files
rm  /tmp/who 

shift $(($OPTIND -1))
