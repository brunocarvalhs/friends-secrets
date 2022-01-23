package br.brunocarvalhs.friends_secrets.ui.home.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.brunocarvalhs.friends_secrets.ui.home.interfaces.OnItemClickListener
import br.brunocarvalhs.friends_secrets.databinding.GroupTodoBinding
import br.brunocarvalhs.friends_secrets.core.data.models.Group

class ListGroupsAdapter(private val groups: List<Group?>) :
    RecyclerView.Adapter<ListGroupsAdapter.GroupViewHolder>() {

    private lateinit var viewBinding: GroupTodoBinding
    private var onItemClickListener: OnItemClickListener? = null

    override fun getItemCount() = groups.size

    override fun onCreateViewHolder(viewGroup: ViewGroup, viewType: Int): GroupViewHolder {
        viewBinding = GroupTodoBinding
            .inflate(LayoutInflater.from(viewGroup.context), viewGroup, false)
        return GroupViewHolder(viewBinding, onItemClickListener)
    }

    override fun onBindViewHolder(viewHolder: GroupViewHolder, position: Int) {
        viewHolder.title.text = groups[position]?.name
        viewHolder.describe.text = groups[position]?.describle
        viewHolder.subtitle.text = groups[position]?.date
        viewHolder.count.text = "100"
    }

    fun setOnItemClickListener(listener: OnItemClickListener) {
        this.onItemClickListener = listener
    }

    class GroupViewHolder(
        view: GroupTodoBinding,
        onItemClickListener: OnItemClickListener?
    ) : RecyclerView.ViewHolder(view.root) {
        val title = view.title
        val describe = view.describle
        val subtitle = view.subtitle
        val count = view.count

        init {
            view.root.setOnClickListener { onItemClickListener?.onItemClick() }
        }
    }
}