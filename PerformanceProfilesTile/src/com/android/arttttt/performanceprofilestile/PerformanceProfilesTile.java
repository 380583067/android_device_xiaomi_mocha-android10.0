/*
 * Copyright (C) 2017 arttttt
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
package com.android.arttttt.performanceprofilestile;

import android.graphics.drawable.Icon;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import android.util.Log;
import android.content.SharedPreferences;

import java.util.List;
import java.util.ArrayList;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PerformanceProfilesTile extends TileService {

    private int mCurrentProfile;

    @Override
    public void onStartListening() {
        super.onStartListening();

        mCurrentProfile = getProfileProperty();
        if (mCurrentProfile < 0 || mCurrentProfile > 3) {
            mCurrentProfile = 3;
        }
        updateTile();
    }

    @Override
    public void onClick() {
        super.onClick();

        mCurrentProfile = getProfileProperty();
        switch(mCurrentProfile) {
            case 0:
                mCurrentProfile = 3;
                break;
            case 1:
                mCurrentProfile = 2;
                break;
            case 2:
                mCurrentProfile = 0;
                break;
            case 3:
                mCurrentProfile = 1;
                break;
            default:
                mCurrentProfile = 3;
                break;
        }
        mCurrentProfile = setProfileProperty(mCurrentProfile);
        if (mCurrentProfile < 0 || mCurrentProfile > 3) {
            mCurrentProfile = 3;
        }
        savePref(mCurrentProfile);
        updateTile();
    }

    private void savePref(int value) {
        SharedPreferences settings = getApplicationContext().getSharedPreferences(Constants.PREF_FILE, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt(Constants.PREF_PROFILE_KEY, value);
        editor.apply();
    }

    private void updateTile() {
	Tile tile = getQsTile();
        mCurrentProfile = getProfileProperty();
        if (mCurrentProfile < 0 || mCurrentProfile > 3) {
            mCurrentProfile = 3;
        }
        switch(mCurrentProfile) {
            case 0:
                tile.setIcon(Icon.createWithResource(this, R.drawable.ic_profile_power_save));
                tile.setLabel(getString(R.string.power_save_profile_text));
                break;
            case 1:
                tile.setIcon(Icon.createWithResource(this, R.drawable.ic_profile_balanced));
                tile.setLabel(getString(R.string.balanced_profile_text));
                break;
            case 2:
                tile.setIcon(Icon.createWithResource(this, R.drawable.ic_notification_profile_high));
                tile.setLabel(getString(R.string.high_performance_profile_text));
                break;
            case 3:
                tile.setIcon(Icon.createWithResource(this, R.drawable.ic_profile_bias_power_save));
                tile.setLabel(getString(R.string.bias_power_save_profile_text));
            break;
        }
	tile.setState(Tile.STATE_ACTIVE);
        tile.updateTile();
    }

    private int getProfileProperty() {
        String line;

        try {
            Process p = Runtime.getRuntime().exec("getprop sys.perf.profile");
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            line = input.readLine();
            input.close();
            if (line != null) {
                return Integer.parseInt(line.trim());
            }
        } catch (Exception err) {
            Log.d(Constants.TAG, "execute failed");
            err.printStackTrace();
        }
        Log.d(Constants.TAG, "can't get sys.perf.profile value, return -1");
        return -1;
    }

    private int setProfileProperty(int value) {
        try {
            Log.d(Constants.TAG, "setProfileProperty(" + Integer.toString(value) + ")");
            Runtime.getRuntime().exec("setprop sys.perf.profile " + Integer.toString(value));
        } catch (Exception err) {
            Log.d(Constants.TAG, "execute failed");
            err.printStackTrace();
        }
        return getProfileProperty();
    }
}
