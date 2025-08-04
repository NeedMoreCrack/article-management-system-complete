#!/bin/bash

set -e  # 一旦出錯就退出

# 檢查是否為 root
if [ `whoami` = "root" ];then
	while true; do
	  echo "============================"
	  echo "請選擇操作："
	  echo "0. 安裝 Docker 相關工具"
	  echo "1. 下載專案檔案"
	  echo "2. 啟動專案"
	  echo "3. 關閉專案"
	  echo "4. 離開"
	  echo "============================"
	  read -p "請輸入選項 [0-4]：" choice

	  case "$choice" in
	    "0")
	      echo "[0] 安裝 Docker 工具中..."
	      apt update
	      apt install -y \
		docker.io \
		docker-compose-v2 \
		docker-buildx \
		megatools

	      if command -v systemctl >/dev/null 2>&1; then
		echo "啟用並啟動 Docker 服務..."
		systemctl enable --now docker
	      else
		echo "未找到 systemctl，跳過服務啟動..."
	      fi

	      echo "拉取必要的映像檔..."
	      docker pull nginx:1.28.0
	      docker pull mysql:8
	      docker pull redis
	      echo "工具與映像檔安裝完成。"
	      ;;
	    "1")
	      echo "[1] 開始下載專案檔案..."
	      echo "下載 JDK17..."
	      megatools dl 'https://mega.nz/file/F4gGmBjC#TJqBitRWbdWubIB7fRTsCzLQoe0XxkYWWWCKXXc-Be4'

	      echo "下載 articleManagementSystem.jar..."
	      megatools dl 'https://mega.nz/file/h5JyQL6Y#plLNKqQu7008ycIZyJ-Zktx1j9OZVdbaDyh7-j4UehI'

	      echo "檔案下載完成。"
	      ;;
	    "2")
	      echo "[2] 啟動專案..."
	      docker compose up -d
	      echo "專案已啟動。"
	      ;;
	    "3")
	      echo "[3] 關閉專案..."
	      docker compose down
	      echo "專案已關閉。"
	      ;;
	    "4")
	      echo "離開腳本，Bye~"
	      exit 0
	      ;;
	    *)
	      echo "無效選項，請重新輸入。"
	      ;;
	  esac
	done
else
    echo "請以ROOT身分運行此腳本"
    exit
fi
