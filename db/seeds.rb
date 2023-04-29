User.create({

    email: "prueba123@gmail.com",
    firstname: "Prueba",
    lastname: "Rodriguez",
    password: "12345090",
    #confirmpassword: ""

})

User.create({

    email: "hola@gmail.com",
    firstname: "hola",
    lastname: "adios",
    password: "123",
    #confirmpassword: ""

})

user = User.create(email: "pruebahola@gmail.com", firstname: "hola", lastname: "adios", password: "123")

Note.create({
    title: "Mi primera nota",
    content: "Este es el contenido de mi primera nota",
    user_id: "",
    is_shared: false
})

Note.create({
    title: "Hola que tal",
    content: "Soy el usuario 1",
    user_id: "1",
    is_shared: false
})