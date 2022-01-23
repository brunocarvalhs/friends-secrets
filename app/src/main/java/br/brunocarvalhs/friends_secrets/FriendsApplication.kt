package br.brunocarvalhs.friends_secrets

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin


class FriendsApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin{
            androidContext(this@FriendsApplication)
            modules()
        }
    }
}