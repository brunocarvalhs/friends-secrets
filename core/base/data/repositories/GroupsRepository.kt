package br.brunocarvalhs.friends_secrets.core.data.repositories

import android.content.Context
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class GroupsRepository(
    private val context: Context,
) {

    private val apiService by lazy { ApiClient.getApiService(context) }

    fun all(): List<Group>? {
        var groups: List<Group>? = listOf()
        apiService.groupAll().enqueue(object : Callback<ResponseBody> {

            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    val message: String? = response.body()!!.string()
                    val listType = object : TypeToken<List<Group?>?>() {}.type
                    val res: List<Group> = Gson().fromJson(message, listType)
                    groups = res
                } else {
                    val message: String? = response.errorBody()?.toString()
                }
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                groups = listOf()
            }
        })
        return groups
    }
}