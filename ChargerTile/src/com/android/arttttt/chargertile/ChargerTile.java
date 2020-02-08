/*
 * Copyright (C) 2018 arttttt <artem-bambalov@yandex.ru>
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
 
package com.android.arttttt.chargertile;

import com.android.arttttt.chargertile.Constants;
import com.android.arttttt.chargertile.utils.PreferencesUtils;

import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;

import org.lineageos.internal.util.FileUtils;

public class ChargerTile extends TileService {

    private int mChargingDisabledByUser;
    private PreferencesUtils mPreferencesUtils;

    @Override
    public void onStartListening() {
        super.onStartListening();
        
        mPreferencesUtils = PreferencesUtils.getInstance(getApplicationContext());
        mChargingDisabledByUser = mPreferencesUtils.getInt(Constants.PREF_CHARGING_DISABLED_KEY);
        
        updateTile();
    }
    
    @Override
    public void onClick() {
        super.onClick();
        
        mChargingDisabledByUser = mChargingDisabledByUser == 1 ? 0 : 1;
        mPreferencesUtils.putInt(Constants.PREF_CHARGING_DISABLED_KEY, mChargingDisabledByUser);
        FileUtils.writeLine(Constants.PROCFS_PROP_PATH, String.valueOf(mChargingDisabledByUser));
        
        updateTile();
    }
    
    private void updateTile() {
	if (mChargingDisabledByUser == 1) {
	    getQsTile().setLabel(getString(R.string.charger_tile_state, getString(R.string.charger_state_disabled)));
	    getQsTile().setState(Tile.STATE_INACTIVE);
	} else {
	    getQsTile().setLabel(getString(R.string.charger_tile_state, getString(R.string.charger_state_enabled)));
	    getQsTile().setState(Tile.STATE_ACTIVE);
	}
	getQsTile().updateTile();
    }
}
