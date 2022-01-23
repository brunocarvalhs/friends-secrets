package br.brunocarvalhs.friends_secrets.core.data.network.requests

import com.google.gson.annotations.SerializedName

data class AuthRequest(
    @SerializedName("email") val email: String?,
    @SerializedName("google_auth") val googleAuth: String?,
    @SerializedName("name") val name: String?,
    @SerializedName("phone") val phone: String?,
    @SerializedName("photoURL") val photoURL: String?
)
