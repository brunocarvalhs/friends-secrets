package br.brunocarvalhs.friends_secrets.core.data.models

import com.google.gson.annotations.SerializedName

data class Group (
    @SerializedName("uuid") val uuid : String,
    @SerializedName("types_id") val types_id : Int,
    @SerializedName("name") val name : String,
    @SerializedName("describle") val describle : String,
    @SerializedName("date") val date : String,
    @SerializedName("price_min") val price_min : String,
    @SerializedName("price_max") val price_max : Double,
    @SerializedName("created_at") val created_at : String,
    @SerializedName("updated_at") val updated_at : String,
    @SerializedName("members") val members : Members,
    @SerializedName("users") val users: List<br.brunocarvalhs.aurh.domain.model.User>,
    @SerializedName("type") val type : Type
)