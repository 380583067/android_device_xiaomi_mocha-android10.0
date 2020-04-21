
/*
 * Copyright (C) 2017-2018 Artyom Bambalov <artem-bambalov@yandex.ru>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cutils/log.h>
#include <cutils/properties.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

#define TAG "conn_init"
#define MAC_PARTITION1 "/dev/block/platform/sdhci-tegra.3/by-name/BKB"
#define MAC_PARTITION2 "/dev/block/platform/700b0600.sdhci/by-name/BKB"
#define AID_BLUETOOTH 1002
#define BT_MAC_PROP "ro.bt.bdaddr_path"
#define BT_MAC_PROP1 "persist.service.bdroid.bdaddr"
#define BT_MAC_PROP2 "ro.boot.btmacaddr"
#define WIFI_MAC_FILE "/data/mocha_macaddr.txt"
#define BT_MAC_FILE "/data/mocha_btmacaddr.txt"
#define BT_MAC_TAG "XIAOMIBT!"
#define WIFI_MAC_TAG "XIAOMIWF!"

void set_bt_mac(FILE *fp) {
	char buf[30];
	char addr[18];
	char cmd[256];
	FILE *bmfp;

	fseek(fp, 0, SEEK_SET);
	fread(buf, sizeof(char), 22, fp);

	if (strncmp(buf, BT_MAC_TAG, 9) != 0) {
		ALOGE("%s: buffer does not contain %s tag. exit", TAG, BT_MAC_TAG);
		goto exit;
	} else {
		ALOGI("%s: %s was found", TAG, BT_MAC_TAG);
	}
	
	sprintf(addr, "%02x:%02x:%02x:%02x:%02x:%02x",
		(unsigned char)buf[14],
		(unsigned char)buf[13],
		(unsigned char)buf[12],
		(unsigned char)buf[11],
		(unsigned char)buf[10],
		(unsigned char)buf[9]);
	ALOGI("%s: BT mac address: %s", TAG, addr);
		
	bmfp = fopen(BT_MAC_FILE, "w");
	if (bmfp == NULL) {
		ALOGE("%s: Can't open %s error: %d", TAG, BT_MAC_FILE, errno);
		goto exit;
	}
	fprintf(bmfp, "%s", addr);
	fclose(bmfp);
	
	property_set(BT_MAC_PROP, BT_MAC_FILE);
	property_set(BT_MAC_PROP1, addr);
	property_set(BT_MAC_PROP2, addr);
	chown(BT_MAC_FILE, AID_BLUETOOTH, AID_BLUETOOTH);
	chmod(BT_MAC_FILE, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);
	
exit:
	return;
}

void set_wifi_mac(FILE *fp)
{
	char buf[30];
	char addr[18];
	
	fseek(fp, sizeof(char) * 22, SEEK_SET);
	fread(buf, sizeof(char), 22, fp);

	if (strncmp(buf, WIFI_MAC_TAG, 9) != 0) {
		ALOGE("%s: buffer does not contain %s tag. exit", TAG, WIFI_MAC_TAG);
		goto exit;
	} else {
		ALOGI("%s: %s was found", TAG, WIFI_MAC_TAG);
	}

	sprintf(addr, "%02x:%02x:%02x:%02x:%02x:%02x",
		(unsigned char)buf[14],
		(unsigned char)buf[13],
		(unsigned char)buf[12],
		(unsigned char)buf[11],
		(unsigned char)buf[10],
		(unsigned char)buf[9]);
	ALOGI("%s: WIFI mac address: %s", TAG, addr);

	FILE *wfp = fopen(WIFI_MAC_FILE, "w");
	if (wfp == NULL) {
		ALOGE("%s: Can't open %s error: %d", TAG, WIFI_MAC_FILE, errno);
		goto exit;
	}
	fprintf(wfp, "%s", addr);
	fclose(wfp);
	chmod(WIFI_MAC_FILE, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);
	
exit:
	return;
}

int main(void)
{
	FILE *fp;
	int bt_mac_exist = 0;
	int wifi_mac_exist = 0;

        fp = fopen(BT_MAC_FILE, "r");
	if (fp != NULL) {
		char addr[18];
		bt_mac_exist = 1;
		fseek(fp, 0, SEEK_SET);
		fread(addr, sizeof(char), 17, fp);
		addr[17] = '\0';
		fclose(fp);
		property_set(BT_MAC_PROP, BT_MAC_FILE);
		property_set(BT_MAC_PROP1, addr);
		property_set(BT_MAC_PROP2, addr);
	}
        fp = fopen(WIFI_MAC_FILE, "r");
	if (fp != NULL) {
		wifi_mac_exist = 1;
		fclose(fp);
	}
	if (bt_mac_exist == 1 && wifi_mac_exist == 1) {
		ALOGI("%s: skip, file already exist", TAG);
		goto exit;
	}
	fp = fopen(MAC_PARTITION1, "r");
	if (fp == NULL) {
		ALOGE("%s: Can't open %s error: %d", TAG, MAC_PARTITION1, errno);
		fp = fopen(MAC_PARTITION2, "r");
		if (fp == NULL) {
			ALOGE("%s: Can't open %s error: %d", TAG, MAC_PARTITION2, errno);
			goto exit;
		}
	}
	if (wifi_mac_exist == 0)
		set_wifi_mac(fp);
	if (bt_mac_exist == 0)
		set_bt_mac(fp);
	fclose(fp);

exit:
	return 0;
}
