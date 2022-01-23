package br.brunocarvalhs.friends_secrets.core.data.datasources

import android.content.Context
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import br.brunocarvalhs.friends_secrets.core.data.network.responses.AuthResponse
import okhttp3.RequestBody

class ProfileDataSource(private val context: Context) {

    private val apiService by lazy { ApiClient.getApiService(context) }

    fun profileAll(onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun profileStore(requestBody: RequestBody, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun profileShow(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun profileUpdate(
        group: String,
        requestBody: RequestBody, onResponse: (AuthResponse?, Throwable?) -> Unit
    ) {

    }

    fun profileDelete(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }
}