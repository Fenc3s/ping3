tell application "Terminal"
	activate
	
	set gateway to do shell script "route get default | awk '/gateway/{print $2}'"
	--set gateway to do shell script "route get default | egrep 'gateway' | awk '{print $2}'"
	--log (gateway)
	set SSID to do shell script "/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk  '/ SSID/{print $2}'"
	--log (SSID)
	
	if SSID is equal to "WeWorkCorp" then
		set dns to "8.8.8.8"
		set domain to "www.google.com"
	else
		set dns to "223.5.5.5"
		set domain to "www.baidu.com"
	end if
	--log (dns)
	--log (domain)
	
	do script "ping -c 5000 " & gateway
	do script "ping -c 5000 " & dns
	do script "ping -c 5000 " & domain
end tell
