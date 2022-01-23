package br.brunocarvalhs.network

import br.brunocarvalhs.constants.Constants
import com.google.gson.GsonBuilder
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

class NetworkService {

    private val retrofit = Retrofit.Builder()
        .baseUrl(Constants.BASE_URL + Constants.API_VERSION)
        .client(okhttpClient())
        .addConverterFactory(GsonConverterFactory.create(GsonBuilder().create()))
        .build()

    fun <API> createService(apiClass: Class<API>): API = retrofit.create(apiClass)

    private fun logInterceptor() =
        HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY)

    private fun okhttpClient(): OkHttpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(10, TimeUnit.SECONDS)
        .addInterceptor(logInterceptor())
        .build()
}