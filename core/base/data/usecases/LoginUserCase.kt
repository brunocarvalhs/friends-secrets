package br.brunocarvalhs.friends_secrets.core.data.usecases

import android.content.Context
import br.brunocarvalhs.aurh.domain.model.User
import br.brunocarvalhs.friends_secrets.core.data.repositories.AuthRepository
import com.google.android.gms.auth.api.signin.GoogleSignInAccount

class LoginUserCase(
    private val context: Context,
    private val account: GoogleSignInAccount?,
    private val callback: (user: br.brunocarvalhs.aurh.domain.model.User) -> Unit
) : Async<Unit, Unit, br.brunocarvalhs.aurh.domain.model.User>() {

    private val repository: AuthRepository by lazy { AuthRepository(context) }


    override fun doInBackground(vararg p0: Unit?): br.brunocarvalhs.aurh.domain.model.User? {
        return repository.login(account)
    }

    override fun onPostExecute(resultado: br.brunocarvalhs.aurh.domain.model.User?) {
        resultado?.let {
            callback(it)
        }
    }
}