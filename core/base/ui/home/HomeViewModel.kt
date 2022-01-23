package br.brunocarvalhs.friends_secrets.ui.home

import android.content.Context
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import br.brunocarvalhs.friends_secrets.core.data.repositories.GroupsRepository
import br.brunocarvalhs.friends_secrets.core.data.usecases.GroupAllUseCase
import kotlinx.coroutines.launch

class HomeViewModel : ViewModel() {

    private val _groups = MutableLiveData<List<Group?>>()
    val groups = _groups as LiveData<List<Group?>>

    fun getGroups(context: Context) {
        GroupAllUseCase(context) { list ->
            viewModelScope.launch {
                _groups.value = list
            }
        }
    }
}