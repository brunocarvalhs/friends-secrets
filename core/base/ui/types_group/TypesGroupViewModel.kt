package br.brunocarvalhs.friends_secrets.ui.types_group

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.brunocarvalhs.friends_secrets.core.data.models.Group
import com.google.gson.Gson
import kotlinx.coroutines.launch

class TypesGroupViewModel : ViewModel() {

    private val _types = MutableLiveData<List<Group>>()
    val types = _types as LiveData<List<Group>>

    fun getTypes() {
        viewModelScope.launch {
            _types.value = Gson().fromJson(getTypesUseCase(), Array<Group>::class.java).toList()
        }
    }

    private fun getTypesUseCase() : String = """
        [
            {
                "uuid": "32c5b7fe-33f5-45dc-9a8a-6be5d5a0010c",
                "name": "Amigo Secreto",
                "describle": "A particularidade do Amigo Secreto é que quem participa jamais deve contar ou saber quem tirou seu nome, no sorteio, até o momento da entrega dos presentes; essa regra, que é a principal da brincadeira, geralmente não é seguida à risca por todos, o que gera o inevitável “disse que me disse” sobre quem tirou quem.",
                "is_draw_name": true,
                "created_at": "2022-01-12T01:44:04.000000Z",
                "updated_at": "2022-01-12T01:44:04.000000Z",
                "groups": []
            },
            {
                "uuid": "6ce5c9f5-6848-41de-bfbb-62892d163238",
                "name": "Amigo roubado",
                "describle": "Todos os participantes compram um presente que gostariam de ganhar. Mas atenção: os presentes devem ser embrulhados de modo que ninguém descubra o que tem em cada pacote. Através de um sorteio, cada participante recebe um número. Começando pelo numero um, cada participante escolhe um presente ou rouba de quem já escolheu. Quando todos os participantes estiverem com um presente em mãos, é hora de desembrulhar os pacotes.",
                "is_draw_name": false,
                "created_at": "2022-01-12T01:44:04.000000Z",
                "updated_at": "2022-01-12T01:44:04.000000Z",
                "groups": []
            },
            {
                "uuid": "1363a682-83fe-4785-9788-c602310d6cd9",
                "name": "Amigo da onça",
                "describle": "A ideia da brincadeira é presentear o amigo com aquele acessório que ele não gosta ou com um objeto engraçado. Nessas horas é preciso deixar a criatividade falar mais alto para inovar no presentinho.",
                "is_draw_name": true,
                "created_at": "2022-01-12T01:44:04.000000Z",
                "updated_at": "2022-01-12T01:44:04.000000Z",
                "groups": []
            },
            {
                "uuid": "5e3fe7ba-b588-4a18-8d03-9f3ef69e51de",
                "name": "Amigo ao contrário",
                "describle": "Ao invés do amigo secreto dar dicas para as pessoas adivinharem quem ele tirou, a pessoa sorteada que terá que adivinhar quem que tirou ela. Para isso, ela fecha os olhos enquanto seu amigo-secreto levanta a mão para todos o identificarem. Em seguida, a pessoa faz perguntas eliminatórias até acertar quem o tirou. O ideal é que o grupo combine a quantidade de perguntas por rodada. Assim, se a pessoa não acertar, ela paga uma prenda (também combinada com antecedência).",
                "is_draw_name": true,
                "created_at": "2022-01-12T01:44:04.000000Z",
                "updated_at": "2022-01-12T01:44:04.000000Z",
                "groups": []
            },
            {
                "uuid": "eac2c4de-e69b-416d-89a7-b5f23dd4def4",
                "name": "Amigo artesanal",
                "describle": "Se todo mundo é da pegada “faça você mesmo”, é legal fazer um amigo secreto em que só se possa presentear com algo que fez. Não vale comprar. Vocês economizam uma grana e ainda têm um presente único!",
                "is_draw_name": true,
                "created_at": "2022-01-12T01:44:04.000000Z",
                "updated_at": "2022-01-12T01:44:04.000000Z",
                "groups": []
            },
            {
                "uuid": "c230cf30-58e0-4964-bd77-ad4a177e3251",
                "name": "Amigo Temático",
                "describle": "Aqui a ideia é segmentar as coisas. Pode ser amigo CD, DVD, livro, havaianas, chocolate, guarda-chuva, panettone... Enfim, é só combinar o presente e sortear os nomes. E claro, combinar o valor – pelo menos uma faixa de preço.",
                "is_draw_name": true,
                "created_at": "2022-01-12T01:44:04.000000Z",
                "updated_at": "2022-01-12T01:44:04.000000Z",
                "groups": []
            }
        ]
    """.trimIndent()

}