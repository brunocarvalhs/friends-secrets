package br.brunocarvalhs.friends_secrets.data

import android.content.Context
import android.util.Log
import br.com.douglasmotta.naivagtioncomponentappmirror.data.Repository
import javax.inject.Inject

class DefaultRepository @Inject constructor(val context: Context) : Repository {

    init {
        Log.d("DefaultRepository", context.toString())
    }

    override fun doLogin() {
        Log.d("DefaultRepository", "Login done")
    }
}