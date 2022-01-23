package br.brunocarvalhs.auth.ui.validation

import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import br.brunocarvalhs.auth.R
import br.brunocarvalhs.auth.databinding.RegisterFragmentBinding
import br.brunocarvalhs.auth.databinding.ValidationFragmentBinding

class ValidationFragment : Fragment() {

    companion object {
        fun newInstance() = ValidationFragment()
    }

    private lateinit var viewModel: ValidationViewModel
    private lateinit var binding: ValidationFragmentBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = ValidationFragmentBinding.inflate(layoutInflater, container, false)
        return binding.root
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel = ViewModelProvider(this).get(ValidationViewModel::class.java)
        // TODO: Use the ViewModel
    }

}