package br.brunocarvalhs.friends_secrets.core.data.models

import com.google.gson.annotations.SerializedName

data class Sortition (

	@SerializedName("uuid") val uuid : String,
	@SerializedName("member_uuid") val member_uuid : String,
	@SerializedName("member") val member : String,
	@SerializedName("created_at") val created_at : String,
	@SerializedName("updated_at") val updated_at : String,
	@SerializedName("members") val members : Members
)