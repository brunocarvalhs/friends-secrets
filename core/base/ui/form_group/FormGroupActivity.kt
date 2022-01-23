package br.brunocarvalhs.friends_secrets.ui.form_group

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.friends_secrets.databinding.ActivityFormGroupBinding

class FormGroupActivity : AppCompatActivity() {

    private lateinit var viewBinding: ActivityFormGroupBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewBinding = ActivityFormGroupBinding.inflate(layoutInflater)
        setContentView(viewBinding.root)
    }
}