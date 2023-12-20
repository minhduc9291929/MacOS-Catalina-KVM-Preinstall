echo "đang kiểm tra xem máy có bật vt chưa...."
vtx=$(egrep -i '^flags.*(vmx|svm)' /proc/cpuinfo | wc -l)
if [ $vtx = 0 ] ; then echo "[Lỗi] Máy tính của bạn chưa bật VT-x / AMD-v. bấm Ctrl+C để thoát và vào bios bật vt như trong hướng dẫn trên google"&& sleep 2711
fi
echo "đang cài đặt phần mềm"
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
echo "Đang tải về Mac OS Catalina Disk..." 
sudo wget -q --show-progress --no-check-certificate -O /tmp/MyDisk.qcow2 https://tinyurl.com/3s87mjea
cpus=$(lscpu | grep CPU\(s\) | head -1 | cut -f2 -d":" | awk '{$1=$1;print}')
availableRAMcommand="free -m | tail -2 | head -1 | awk '{print \$7}'"
availableRAM=$(echo $availableRAMcommand | bash)
echo HEADLESS=1 MEM=10"G" CPUS=3 SYSTEM_DISK=/tmp/MyDisk.qcow2 ./headless.sh > silence.sh
chmod +x silence.sh
nohup ./silence.sh &>/dev/null &
echo "tất cả sẵn sàng !!! Máy ảo macOS của bạn sẵn sàng hoạt động !!!"
echo "Mở VNC Viewer và kết nối với ip theo hướng dẫn"
echo "Cấu hình của bạn: 10GB Ram / 3core CPU
echo "tên: Catalina-User"
echo "mật khẩu: 123456"
echo "ae vào trang này https://dashboard.ngrok.com/cloud-edge/endpoints để lấy ip vnc"
