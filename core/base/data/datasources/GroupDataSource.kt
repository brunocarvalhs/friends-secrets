package br.brunocarvalhs.friends_secrets.core.data.datasources

import android.content.Context
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import br.brunocarvalhs.friends_secrets.core.data.network.responses.AuthResponse
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import okhttp3.RequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class GroupDataSource(private val context: Context) {

    private val apiService by lazy { ApiClient.getApiService(context) }

    fun groupAll(onResponse: (List<Group>?, Throwable?) -> Unit) {
        apiService.groupAll().enqueue(object : Callback<ResponseBody> {

            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    val message: String? = response.body()!!.string()
                    val listType = object : TypeToken<List<Group?>?>() {}.type
                    val res: List<Group> = Gson().fromJson(message, listType)
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

    fun groupStore(requestBody: RequestBody, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun groupShow(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun groupUpdate(
        group: String,
        requestBody: RequestBody, onResponse: (AuthResponse?, Throwable?) -> Unit
    ) {

    }

    fun groupDelete(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }

    fun groupSortition(group: String, onResponse: (AuthResponse?, Throwable?) -> Unit) {

    }
}