package br.brunocarvalhs.friends_secrets

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.friends_secrets.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var viewBinding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewBinding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(viewBinding.root)
    }
}