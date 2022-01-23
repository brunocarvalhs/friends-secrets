package br.brunocarvalhs.friends_secrets.core.data.datasources

import android.content.Context
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import br.brunocarvalhs.friends_secrets.core.data.network.requests.AuthRequest
import br.brunocarvalhs.friends_secrets.core.data.network.responses.AuthResponse
import com.google.gson.Gson
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class AuthDataSource(private val context: Context) {

    private val apiService by lazy { ApiClient.getApiService(context) }

    fun login(request: AuthRequest, onResponse: (AuthResponse?, Throwable?) -> Unit) {
        val body: RequestBody = Gson().toJson(request)
            .toRequestBody("application/json; charset=UTF-8".toMediaType())

        apiService.login(body).enqueue(object : Callback<ResponseBody> {
            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    val message: String? = response.body()!!.string()
                    val res: AuthResponse = Gson().fromJson(message, AuthResponse::class.java)
                    onResponse(res, null)
                } else {
                    val message: String? = response.errorBody()?.toString()
                }
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                onResponse(null, t)
            }
        })
    }

    fun register(request: AuthRequest, onResponse: (AuthResponse?, Throwable?) -> Unit) {
        val body: RequestBody = Gson().toJson(request)
            .toRequestBody("application/json; charset=UTF-8".toMediaType())

        apiService.register(body).enqueue(object : Callback<ResponseBody> {
            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    val message: String? = response.body()!!.string()
                    val res: AuthResponse = Gson().fromJson(message, AuthResponse::class.java)
                    onResponse(res, null)
                } else {
                    val message: String? = response.errorBody()?.toString()
                }
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                onResponse(null, t)
            }
        })
    }

    // Private
    fun logout(onResponse: (Boolean?, Throwable?) -> Unit) {
        apiService.logout().enqueue(object : Callback<ResponseBody> {
            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                onResponse(response.isSuccessful, null)
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                onResponse(null, t)
            }
        })
    }
}