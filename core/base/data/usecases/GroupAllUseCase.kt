package br.brunocarvalhs.friends_secrets.core.data.usecases

import android.content.Context
import android.os.AsyncTask
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import br.brunocarvalhs.friends_secrets.core.data.repositories.GroupsRepository

class GroupAllUseCase(
    private val context: Context,
    private val callback: (user: List<Group?>) -> Unit
) : AsyncTask<Unit, Unit, List<Group?>?>() {

    private val repository: GroupsRepository by lazy { GroupsRepository(context) }


    override fun doInBackground(vararg p0: Unit?): List<Group?>? {
        return repository.all()
    }

    override fun onPostExecute(result: List<Group?>?) {
        result?.let {
            callback(it)
        }
    }
}