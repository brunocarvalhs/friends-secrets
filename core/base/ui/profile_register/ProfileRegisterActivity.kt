package br.brunocarvalhs.friends_secrets.ui.profile_register

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.brunocarvalhs.friends_secrets.databinding.ActivityProfileRegisterBinding
import br.brunocarvalhs.friends_secrets.ui.home.HomeActivity
import com.google.android.material.chip.Chip

class ProfileRegisterActivity : AppCompatActivity() {

    private lateinit var viewBinding: ActivityProfileRegisterBinding

    private val list: List<String> = arrayListOf("Abajur", "Abraçadeira", "Abre-latas", "Acordeão", "Açucareiro", "Adaga", "Adaptador", "Aerofólio", "Afoxé", "Agenda", "Agogô", "Agulha", "Agulheiro", "Alarme", "Álbum", "Alfinete", "Algema", "Algodão", "Alicate", "Almofada", "Alto-falante", "Amortecedor", "Ampulheta", "Amuleto", "Âncora", "Andador", "Andaime", "Antena", "Anzol", "Apagador", "Aparador", "Apito", "Apontador de Lápis", "Aquário", "Aquecedor", "Arco", "Armadilha", "Armadura", "Armário", "Arpão", "Asa-delta", "Aspirador", "Assadeira", "Azulejo", "Bafômetro", "Bagageiro", "Baioneta", "Baixo", "Balaio", "Balança", "Balão", "Balsa", "Bambolê", "Banco", "Bandana", "Bandeira", "Bandolim", "Banjo", "Banqueta", "Baqueta", "Barbante", "Barraca", "Barril", "Base", "Bastão", "Bata", "Batedeira", "Bateria", "Batina", "Batom", "Baú", "Bazuca", "Beca", "Beliche", "Bengala", "Berço", "Berimbau", "Betoneira", "Bíblia", "Bicama", "Bicho de pelúcia", "Bidê", "Bigorna", "Binóculo", "Biruta", "Bisturi", "Boia", "Boneca", "Bongô", "Botão", "Botina", "Brinco", "Broca", "Broche", "Bucha", "Bule", "Bumerangue", "Buzina")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewBinding = ActivityProfileRegisterBinding.inflate(layoutInflater)
        setContentView(viewBinding.root)

        setupLikes()
        setupButton()
    }



    private fun setupButton() {
        viewBinding.button.setOnClickListener {
            redirect()
        }
    }

    private fun redirect() {
        val intent = Intent(this, HomeActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        startActivity(intent)
    }
}