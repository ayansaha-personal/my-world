package com.myworld.ui

import android.app.Application
import android.content.Context
import androidx.multidex.MultiDex

class MyWorldApp: Application() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
}