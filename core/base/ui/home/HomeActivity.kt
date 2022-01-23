package br.brunocarvalhs.friends_secrets.ui.home

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import br.brunocarvalhs.friends_secrets.FriendsApplication
import br.brunocarvalhs.friends_secrets.databinding.ActivityHomeBinding
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import br.brunocarvalhs.friends_secrets.ui.home.adapter.ListGroupsAdapter
import br.brunocarvalhs.friends_secrets.ui.home.interfaces.OnItemClickListener
import br.brunocarvalhs.friends_secrets.ui.form_group.FormGroupActivity
import com.bumptech.glide.Glide
import com.bumptech.glide.load.engine.DiskCacheStrategy

class HomeActivity : AppCompatActivity() {

    private lateinit var adapter: ListGroupsAdapter
    private lateinit var viewBinding: ActivityHomeBinding
    private val viewModel: HomeViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewBinding = ActivityHomeBinding.inflate(layoutInflater)
        setContentView(viewBinding.root)
        setupToolbar()

        viewModel.groups.observe( this, Observer<List<Group?>> { list ->
            setupRecycleView(list)
        })

        viewModel.getGroups(this)
    }

    private fun setupToolbar() {
        val user = FriendsApplication.user

        user?.name?.split(" ")?.get(0)?.let {
            viewBinding.name.text = it
        }

        user?.photoUrl?.let {
            Glide.with(applicationContext).load(it)
                .thumbnail(0.5f)
                .diskCacheStrategy(DiskCacheStrategy.ALL)
                .into(viewBinding.avatar)
        }

        setupButton()
    }

    private fun setupButton() {
        viewBinding.buttonSearch.setOnClickListener {
            redirect()
        }
    }

    private fun redirect() {
        val intent = Intent(this, FormGroupActivity::class.java)
        startActivity(intent)
    }

    private fun setupRecycleView(groups: List<Group?>) {
        adapter = ListGroupsAdapter(groups)
        viewBinding.list.adapter = adapter
        adapter.setOnItemClickListener(object : OnItemClickListener {
            override fun onItemClick() {

            }
        })
        setupLinearLayoutManager()
    }

    private fun setupLinearLayoutManager() {
        viewBinding.list.layoutManager = LinearLayoutManager(this)
    }
}