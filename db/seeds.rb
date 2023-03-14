User.create({

    email: "prueba123@gmail.com",
    firstname: "Prueba",
    lastname: "Rodriguez",
    password: "12345090",
    confirmpassword: ""

})


Note.create({
    title: "Mi primera nota",
    content: "Este es el contenido de mi primera nota",
    user_id: "",
    is_shared: false
})