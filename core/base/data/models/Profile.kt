package br.brunocarvalhs.friends_secrets.core.data.models

import com.google.gson.annotations.SerializedName

data class Profile (

	@SerializedName("uuid") val uuid : String,
	@SerializedName("created_at") val created_at : String,
	@SerializedName("updated_at") val updated_at : String
)