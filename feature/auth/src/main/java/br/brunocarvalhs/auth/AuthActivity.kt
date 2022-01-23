package br.brunocarvalhs.auth

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.auth.databinding.AuthActivityBinding
import br.brunocarvalhs.auth.ui.login.LoginFragment

class AuthActivity : AppCompatActivity() {

    private lateinit var binding: AuthActivityBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = AuthActivityBinding.inflate(layoutInflater)
        setContentView(binding.root)
        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(binding.container.id, LoginFragment.newInstance())
                .commitNow()
        }
    }
}