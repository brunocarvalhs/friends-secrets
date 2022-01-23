package br.brunocarvalhs.home

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.home.databinding.HomeActivityBinding
import br.brunocarvalhs.home.ui.HomeFragment

class HomeActivity : AppCompatActivity() {

    private lateinit var binding: HomeActivityBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = HomeActivityBinding.inflate(layoutInflater)
        setContentView(binding.root)
        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(binding.container.id, HomeFragment.newInstance())
                .commitNow()
        }
    }
}