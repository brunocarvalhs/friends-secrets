package br.brunocarvalhs.friends_secrets.core.data.repositories

import android.content.Context
import android.widget.Toast
import br.brunocarvalhs.friends_secrets.core.data.network.requests.AuthRequest
import br.brunocarvalhs.friends_secrets.core.data.network.responses.AuthResponse
import br.brunocarvalhs.aurh.domain.model.User
import br.brunocarvalhs.friends_secrets.core.data.network.ApiClient
import br.brunocarvalhs.friends_secrets.utils.SessionManager
import com.google.android.gms.auth.api.signin.GoogleSignInAccount
import com.google.gson.Gson
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class AuthRepository(
    private val context: Context,
) {

    private val apiService by lazy { ApiClient.getApiService(context) }
    val sessionManager = SessionManager(context)

    fun login(account: GoogleSignInAccount?): br.brunocarvalhs.aurh.domain.model.User? {
        var user: br.brunocarvalhs.aurh.domain.model.User? = null

        val body: RequestBody = Gson().toJson(
            AuthRequest(
                email = account?.email,
                googleAuth = account?.id,
                name = account?.displayName,
                phone = null,
                photoURL = account?.photoUrl?.host
            )
        ).toRequestBody("application/json; charset=UTF-8".toMediaType())

        apiService.login(body).enqueue(object : Callback<ResponseBody> {
            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    val message: String? = response.body()!!.string()
                    val res: AuthResponse = Gson().fromJson(message, AuthResponse::class.java)
                    sessionManager.saveAuthToken(res.token)
                    user = res.user
                } else {
                    val message: String? = response.errorBody()?.toString()
                    Toast.makeText(context, message, Toast.LENGTH_SHORT)
                }
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                Toast.makeText(context, t.message, Toast.LENGTH_SHORT)
            }
        })
        return user
    }
}