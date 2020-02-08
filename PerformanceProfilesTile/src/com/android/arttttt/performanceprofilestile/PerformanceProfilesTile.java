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

import java.util.List;
import java.util.ArrayList;

import lineageos.power.PerformanceManager;
import lineageos.power.PerformanceProfile;

public class PerformanceProfilesTile extends TileService {

    private final String TAG = "PerformanceProfilesTile";

    private PerformanceManager mPerf;
    private List<PerformanceProfile> mProfiles;
    private int mCurrentProfile;

    @Override
    public void onStartListening() {
        super.onStartListening();

	mPerf = PerformanceManager.getInstance(this);
	mProfiles = new ArrayList<>(mPerf.getPowerProfiles());
	mCurrentProfile = mPerf.getActivePowerProfile().getId();
	getQsTile().setState(Tile.STATE_ACTIVE);
	updateTile();
    }

    @Override
    public void onClick() {
        super.onClick();

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
	}

	updateTile();
	mPerf.setPowerProfile(mCurrentProfile);
    }

    private void updateTile() {
	switch(mCurrentProfile) {
	    case 0:
		getQsTile().setIcon(Icon.createWithResource(this, R.drawable.ic_profile_power_save));
		getQsTile().setLabel(getString(R.string.power_save_profile_text));
		break;
	    case 1:
		getQsTile().setIcon(Icon.createWithResource(this, R.drawable.ic_profile_balanced));
		getQsTile().setLabel(getString(R.string.balanced_profile_text));
		break;
	    case 2:
		getQsTile().setIcon(Icon.createWithResource(this, R.drawable.ic_notification_profile_high));
		getQsTile().setLabel(getString(R.string.high_performance_profile_text));
		break;
	    case 3:
		getQsTile().setIcon(Icon.createWithResource(this, R.drawable.ic_profile_bias_power_save));
		getQsTile().setLabel(getString(R.string.bias_power_save_profile_text));
		break;
	}
	getQsTile().updateTile();
    }
}
