package br.brunocarvalhs.friends_secrets.core.data.models

import com.google.gson.annotations.SerializedName

data class Type (

	@SerializedName("uuid") val uuid : String,
	@SerializedName("name") val name : String,
	@SerializedName("describle") val describle : String,
	@SerializedName("is_draw_name") val is_draw_name : Boolean,
	@SerializedName("created_at") val created_at : String,
	@SerializedName("updated_at") val updated_at : String
)