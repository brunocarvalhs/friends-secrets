package br.brunocarvalhs.groups

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.groups.databinding.GroupActivityBinding
import br.brunocarvalhs.groups.ui.main.GroupFragment

class GroupActivity : AppCompatActivity() {
    private lateinit var binding: GroupActivityBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = GroupActivityBinding.inflate(layoutInflater)
        setContentView(binding.root)
        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(binding.container.id, GroupFragment.newInstance())
                .commitNow()
        }
    }
}