# MacOS-Catalina-KVM-Preinstall

Mac OS chạy trên KVM (cài sẵn 35GB)

-Note: cài trên github codespace giữ nguyên còn máy thật chỉnh dung lượng ram phù hợp.

-Cách thức hoạt động: Cài sẵn QCOW2 (128 GB ổ cứng trống), kết nối với VNC qua ip ngrok (nếu cài máy thật kết nối với 127.0.0.1:5900) 

![image](https://user-images.githubusercontent.com/58414694/146778934-7585dc2c-561e-4b1a-9753-a3e39eaf90c6.png)

![image](https://user-images.githubusercontent.com/58414694/146779668-419cab37-cb83-4e2c-86da-125631c1f72d.png)

![image](https://user-images.githubusercontent.com/58414694/146779809-557fa907-b431-42d2-abed-9d7977505f4b.png)

![image](https://user-images.githubusercontent.com/58414694/146780058-54dee3a1-157d-43a0-94c4-6b59e8361788.png)



Để tải xuống:
```console 
curl -skLo MacOS-Catalina.sh https://raw.githubusercontent.com/ubuntu2310fake/MacOS-Catalina-KVM-Preinstall/main/MacOS-Mojave.sh && chmod +x MacOS-Catalina.sh
```

Sử dụng: 
- Cài đặt và sử dụng:
```console 
bash MacOS-Catalina.sh 
```
- Chạy macos trong nền:

(Theo mặc định macOS đã bật sẵn sau khi chạy lệnh đầu, sử dụng khi máy ảo đã tắt tránh tràn ram gây đơ máy)
```console 
nohup ./silence.sh &>/dev/null &
```

