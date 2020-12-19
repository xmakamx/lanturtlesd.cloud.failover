#!/bin/bash

   # Checking Hak c2 cloud server for alive connection
   $(wget https://1st-C2.fqdn:2022 -o /tmp/c2server --tries=2 --connect-timeout=5)
   /bin/sleep 5
         echo "[+]	Check:					Hak 5 Cloud C2 Server: Primary"
   if grep -q '2022... connected.' /tmp/c2server; 
   then
         echo "[+]	Connected to:				Hak 5 Cloud C2 Server: Primary"
      if cmp -s /etc/primaryserver.device.config /etc/device.config
	  then
         echo "[+]	Active Connection:			Hak 5 Cloud C2 Server: Primary:		Connected"
		exit 0
      else
	     echo "[+]	Establishing connection:		Hak 5 Cloud C2 Server: Primary:		Rebooting"
         cp -f /etc/primaryserver.device.config /etc/device.config 
		 echo "" > /tmp/c2server
	     reboot
	  fi
   else
	     echo "[-]	Offline  Next Server:			Hak 5 Cloud C2 Server: Secondary"
   echo "" > /tmp/c2server
   $(wget https://2nd-C2.fqdn:2022 -o /tmp/c2server --tries=2 --connect-timeout=5)
   /bin/sleep 5   
         echo "[+]	Check:					Hak 5 Cloud C2 Server: Secondary"
   if grep -q '2022... connected.' /tmp/c2server;
      then
         echo "[+]	Connected to:				Hak 5 Cloud C2 Server: Secondary"
      if cmp -s /etc/secondaryserver.device.config /etc/device.config
	    then
         echo "[+]	Active Connection:			Hak 5 Cloud C2 Server: Secondary:	Connected"
		exit 0
      else
	     echo "[+]	Establishing connection:		Hak 5 Cloud C2 Server: Secondary:	Rebooting"
         cp -f /etc/secondaryserver.device.config /etc/device.config 
		 echo "" > /tmp/c2server
	     reboot
	  fi
   else
	     echo "[-]	Offline  Next Server:			Hak 5 Cloud C2 Server: Tertiary"
   echo "" > /tmp/c2server
   $(wget https://3rd-C2.fqdn:2022 -o /tmp/c2server --tries=2 --connect-timeout=5)
   /bin/sleep 5
         echo "[+]	Check:					Hak 5 Cloud C2 Server: Tertiary"
   if grep -q '2022... connected.' /tmp/c2server; 
      then
         echo "[+]	Connected to:				Hak 5 Cloud C2 Server: Tertiary"
      if cmp -s /etc/tertiaryserver.device.config /etc/device.config
	  then
         echo "[+]	Active Connection:			Hak 5 Cloud C2 Server: Tertiary:	Connected"
		exit 0
      else
	     echo "[+]	Establishing connection:		Hak 5 Cloud C2 Server: Tertiary:	Rebooting"
         cp -f /etc/tertiaryserver.device.config /etc/device.config 
		 echo "" > /tmp/c2server
	     reboot
	  fi
   else
	     echo "[-]	Offline  Next Server:			Hak 5 Cloud C2 Server: Fourthly"
   echo "" > /tmp/c2server
   $(wget https://4th-C2.fqdn:2022 -o /tmp/c2server --tries=2 --connect-timeout=5)
   /bin/sleep 5

   if grep -q '2022... connected.' /tmp/c2server; 
   then
         echo "[+]	Check:					Hak 5 Cloud C2 Server: Fourthly"
      if cmp -s /etc/fourthlyserver.device.config /etc/device.config
	  then
         echo "[+]	Active Connection:			Hak 5 Cloud C2 Server: Fourthly:	Connected"
		exit 0
      else
	     echo "[+]	Establishing connection:		Hak 5 Cloud C2 Server: Fourthly:	Rebooting"
         cp -f /etc/fourthlyserverfile.device.config /etc/device.config 
		 echo "" > /tmp/c2server
	     reboot
	  fi
   else
   echo "" > /tmp/c2server
         echo "[-]	Offline  No Servers:			Hak 5 Cloud C2 Server: End"
	  exit 0
   fi 
  fi   
 fi
fi