package br.brunocarvalhs.friends_secrets.core.data.datasources

import android.content.Context
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import br.brunocarvalhs.friends_secrets.core.data.network.requests.AuthRequest
import br.brunocarvalhs.friends_secrets.core.data.network.responses.AuthResponse
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import com.google.gson.Gson
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import com.google.gson.reflect.TypeToken

class TypeDataSource(private val context: Context) {

    private val apiService by lazy { ApiClient.getApiService(context) }

    fun typeAll(onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun typeStore(requestBody: RequestBody, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun typeShow(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun typeUpdate(
        group: String,
        requestBody: RequestBody,
        onResponse: (AuthResponse?, Throwable?) -> Unit
    ) {

    }

    fun typeDelete(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }
}