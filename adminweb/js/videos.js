var firebaseConfig = {
    apiKey: "AIzaSyAUZCfPFrc29G3XBxeP5CV0NuPvj0r3nic",
    authDomain: "icj-live.firebaseapp.com",
    databaseURL: "https://icj-live-default-rtdb.firebaseio.com",
    projectId: "icj-live",
    storageBucket: "icj-live.appspot.com",
    messagingSenderId: "849611754898",
    appId: "1:849611754898:web:9711eb7ad7719746be854b",
    measurementId: "G-V93GS9TGFC"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();

var db = firebase.firestore();

function crear() {


    try {
        var nombre = document.getElementById('nombre').value;
        var link = document.getElementById('enlace').value;
        var categoria = document.getElementById('categoria').value;
        var fecha = document.getElementById('fecha').value;
        var titulo = document.getElementById('titulo').value;

        db.collection('videos').add({
            autor: nombre,
            categoria: categoria,
            fecha: fecha,
            link: link,
            titulo: titulo
        })

        limpiar();
    } catch (err) {
        console.log(err);
    }

}



function limpiar() {

    document.getElementById('nombre').value = "";
    document.getElementById('enlace').value = "";
    document.getElementById('categoria').value = "";
    document.getElementById('fecha').value = "";
    document.getElementById('titulo').value = "";




}



// leer datos
function leerv() {


    var tabla = document.getElementById('tablavideo');
    db.collection("videos").onSnapshot((querySnapshot) => {
        tabla.innerHTML = '';
        querySnapshot.forEach((doc) => {


            tabla.innerHTML += `<tr>
            <td>${doc.id}</td>
            <td>${doc.data().autor}</td>
            <td>${doc.data().titulo}</td>
            <td>${doc.data().link}</td>
            <td>${doc.data().fecha}</td>
            <td>${doc.data().categoria}</td>
            <td><button class="btn btn-warning">Editar</button>
            <button class="btn btn-danger" onclick="borrar('${doc.id}')">Eliminar</button></td>

        </tr>`



        });


        $('#tablavideos').DataTable({



        });

    });


}


function borrar(id) {
    db.collection("videos").doc(id).delete().then(() => {
        console.log("Document successfully deleted!");
    }).catch((error) => {
        console.error("Error removing document: ", error);
    });
}
$.fn.dataTable.ext.errMode = 'none';
$('#tablavideos').on('error.dt', function(e, settings, techNote, message) { console.log('An error occurred: ', message); });