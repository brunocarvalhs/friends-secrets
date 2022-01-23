package br.brunocarvalhs.friends_secrets.core.data.datasources

import android.content.Context
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import br.brunocarvalhs.friends_secrets.core.data.network.responses.AuthResponse
import okhttp3.RequestBody

class UserDataSource(private val context: Context) {

    private val apiService by lazy { ApiClient.getApiService(context) }

    fun userShow(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun userUpdate(
        group: String,
        requestBody: RequestBody,
        onResponse: (AuthResponse?, Throwable?) -> Unit
    ) {

    }

    fun userDelete(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }
}