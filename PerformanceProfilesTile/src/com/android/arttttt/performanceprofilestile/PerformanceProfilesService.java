/*
 * Copyright (C) 2018 twu2
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

import android.app.IntentService;
import android.content.Intent;
import android.os.IBinder;

import android.util.Log;
import android.content.SharedPreferences;

import java.util.List;
import java.util.ArrayList;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PerformanceProfilesService extends IntentService {

    public PerformanceProfilesService() {
        super("PerformanceProfilesService");
    }

    @Override
    public void onCreate() {
        super.onCreate();

        SharedPreferences settings = getApplicationContext().getSharedPreferences(Constants.PREF_FILE, 0);
        int profile = settings.getInt(Constants.PREF_PROFILE_KEY, 3);
        Log.d(Constants.TAG, "saved profile = " + Integer.toString(profile));
        if (profile < 0 || profile > 3) {
            profile = 3;
        }
        setProfileProperty(profile);
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        return;
    }

    private void setProfileProperty(int value) {
        try {
            Log.d(Constants.TAG, "setProfileProperty(" + Integer.toString(value) + ")");
            Runtime.getRuntime().exec("setprop sys.perf.profile " + Integer.toString(value));
        } catch (Exception err) {
            Log.d(Constants.TAG, "execute failed");
            err.printStackTrace();
        }
        return;
    }
}

