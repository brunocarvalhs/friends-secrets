package br.brunocarvalhs.auth.ui.login

import android.content.Context
import android.content.Intent
import androidx.core.app.ActivityCompat.startActivityForResult
import androidx.core.content.ContextCompat.startActivity
import androidx.lifecycle.ViewModel
import com.google.android.gms.auth.api.Auth
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.android.gms.common.api.GoogleApiClient

class LoginViewModel : ViewModel() {

    private val googleSignIn: GoogleSignInOptions by lazy {
        GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
            .requestEmail()
            .build()
    }

    fun signInGoogle(context: Context) {
        val intent: Intent = Auth.CredentialsApi.
//        startActivityForResult(intent)
    }

    private fun initFBGoogleSignIn() {
        val gso = GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
            .requestEmail()
            .build()

        val context: Context? = context
        mGoogleApiClient = GoogleApiClient.Builder(context)
            .enableAutoManage(
                activity!!
            ) { connectionResult -> mGoogleSignInTextView.setText(connectionResult.errorMessage) }
            .addApi(Auth.GOOGLE_SIGN_IN_API, gso).build()
    }

    private fun signInWithGoogleSignIn() {
        val signInIntent = Auth.GoogleSignInApi.getSignInIntent(mGoogleApiClient)
        startActivityForResult(signInIntent, GOOGLE_SIGN_IN_REQUEST_CODE)
    }

}