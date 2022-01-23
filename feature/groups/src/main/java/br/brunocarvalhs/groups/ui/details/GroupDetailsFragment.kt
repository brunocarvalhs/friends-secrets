package br.brunocarvalhs.groups.ui.details

import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import br.brunocarvalhs.groups.R
import br.brunocarvalhs.groups.databinding.GroupDetailsFragmentBinding

class GroupDetailsFragment : Fragment() {

    companion object {
        fun newInstance() = GroupDetailsFragment()
    }

    private lateinit var viewModel: GroupDetailsViewModel
    private lateinit var binding: GroupDetailsFragmentBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = GroupDetailsFragmentBinding.inflate(layoutInflater, container, false)
        return binding.root
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel = ViewModelProvider(this).get(GroupDetailsViewModel::class.java)
        // TODO: Use the ViewModel
    }

}