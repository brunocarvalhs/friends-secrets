package br.brunocarvalhs.profile

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.profile.databinding.ProfileActivityBinding
import br.brunocarvalhs.profile.ui.profileregister.ProfileRegisterFragment

class ProfileActivity : AppCompatActivity() {

    private lateinit var binding: ProfileActivityBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ProfileActivityBinding.inflate(layoutInflater)
        setContentView(binding.root)
        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(binding.container.id, ProfileRegisterFragment.newInstance())
                .commitNow()
        }
    }
}