package br.brunocarvalhs.friends_secrets.ui.types_group

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import br.brunocarvalhs.friends_secrets.databinding.ActivityTypesGroupBinding

class TypesGroupActivity : AppCompatActivity() {

    private lateinit var viewBinding: ActivityTypesGroupBinding
    private val viewModel: TypesGroupViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewBinding = ActivityTypesGroupBinding.inflate(layoutInflater)
        setContentView(viewBinding.root)
    }
}