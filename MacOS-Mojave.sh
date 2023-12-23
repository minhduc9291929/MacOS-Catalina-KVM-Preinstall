echo "dang kiem tra xem may co bat vt chua...."
vtx=$(egrep -i '^flags.*(vmx|svm)' /proc/cpuinfo | wc -l)
if [ $vtx = 0 ] ; then echo "[Loi] May tinh cua ban chua bat VT-x / AMD-v. bam Ctrl+C đe thoat va vao bios bat vt nhu trong hưong dan tren google"&& sleep 2711
fi
echo "dang cai dat phan mem"
sudo apt update -y
sudo apt install wget git qemu-system qemu-utils python3 python3-pip -y 
git clone https://github.com/foxlet/macOS-Simple-KVM.git
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 --region ap &>/dev/null &
sudo chmod 666 /dev/kvm
cd macOS-Simple-KVM
sudo python3  -m pip install click
./jumpstart.sh --catalina
echo "Dang tai ve Mac OS Catalina Disk..." 
sudo wget -q --show-progress --no-check-certificate -O /tmp/MyDisk.qcow2 https://tinyurl.com/3s87mjea
cpus=$(lscpu | grep CPU\(s\) | head -1 | cut -f2 -d":" | awk '{$1=$1;print}')
availableRAMcommand="free -m | tail -2 | head -1 | awk '{print \$7}'"
availableRAM=$(echo $availableRAMcommand | bash)
echo HEADLESS=1 MEM=12"G" CPUS=3 SYSTEM_DISK=/tmp/MyDisk.qcow2 ./headless.sh > silence.sh
chmod +x silence.sh
nohup ./silence.sh &>/dev/null &
echo "tat ca san sang !!! May ao macOS cua ban san sang hoat đong !!!"
echo "Mo VNC Viewer va ket noi voi ip theo hưong dan"
echo "Cau hình cua ban: 12GB Ram / 3core CPU
echo "ten: Catalina-User"
echo "mat khau: 123456"
echo "ae vao trang nay https://dashboard.ngrok.com/cloud-edge/endpoints đe lay ip vnc"
