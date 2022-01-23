package br.brunocarvalhs.friends_secrets.core.data.network.responses

import br.brunocarvalhs.aurh.domain.model.User
import com.google.gson.annotations.SerializedName

data class GroupAllResponse (
    @SerializedName("token") val token : String,
    @SerializedName("user") val user : br.brunocarvalhs.aurh.domain.model.User
)