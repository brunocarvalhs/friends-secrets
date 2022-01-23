package br.brunocarvalhs.friends_secrets.core.data.models

import com.google.gson.annotations.SerializedName

data class Members (

	@SerializedName("groups_id") val groups_id : String,
	@SerializedName("is_author") val is_author : Boolean,
	@SerializedName("created_at") val created_at : String,
	@SerializedName("updated_at") val updated_at : String
)