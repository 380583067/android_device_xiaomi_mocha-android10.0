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
 
package com.android.arttttt.chargertile.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;

public class PreferencesUtils {
    private static PreferencesUtils sPreferenceUtils = null;
    
    private static SharedPreferences sPreferences;
    
    public static PreferencesUtils getInstance(Context context) {
        if (sPreferences == null) {
            sPreferenceUtils = new PreferencesUtils(context);
        }
        
        return sPreferenceUtils;
    }
    
    private PreferencesUtils(Context context) {
        sPreferences = PreferenceManager.getDefaultSharedPreferences(context);
    }
    
    public int getInt(String prefKey) {
        return sPreferences.getInt(prefKey, 0);
    }
    
    public void putInt(String prefKey, int value) {
        Editor editor = sPreferences.edit();
        editor.putInt(prefKey, value);
        editor.apply();
    }
}
