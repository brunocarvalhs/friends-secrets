package br.brunocarvalhs.profile.ui.profileregister

import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import br.brunocarvalhs.profile.R
import br.brunocarvalhs.profile.databinding.ProfileRegisterFragmentBinding
import com.google.android.material.chip.Chip

class ProfileRegisterFragment : Fragment() {

    companion object {
        fun newInstance() = ProfileRegisterFragment()
    }

    private lateinit var viewModel: ProfileRegisterViewModel
    private lateinit var binding: ProfileRegisterFragmentBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = ProfileRegisterFragmentBinding.inflate(layoutInflater, container, false)
        return binding.root
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel = ViewModelProvider(this).get(ProfileRegisterViewModel::class.java)
    }

    private fun setupLikes() {
        viewModel.list.forEach { item ->
            val chip = Chip(context)
            chip.text = item
            chip.setOnCheckedChangeListener { compoundButton, b ->
                compoundButton.isChecked = b
            }
            binding.likersGroup.addView(chip)
        }
    }

}