validator = $('form').validate (
  errorElement: "span"
  errorClass: "input-error"
  success: (error, element) ->
    $(element).removeClass 'input-error'
  errorPlacement: (error, element) ->
    error.addClass("red-text small").insertAfter $(element)
  rules:
    "user[email]":
      required: true
      email: true
      maxlength: 255
    "user[password]":
      minlength: 8
      maxlength: 100
    "user[password_confirmation]":
      minlength: 8
      maxlength: 100
      equalTo: "#user_password"
    "user[name]":
      minlength: 2
      maxlength: 255
    "user[location]":
      minlength: 2
      maxlength: 255
    "user[website]":
      url: true
    "contact_message[author]":
      required: true
      maxlength: 255
      minlength: 2
    "contact_message[title]":
      required: true
      minlength: 3
      maxlength: 50
    "contact_message[text]":
      required: true
      minlength: 10
      maxlength: 1000

  messages:
    "user[email]":
      required: "Veuillez saisir votre adresse email"
      email: "Veuillez saisir une adresse email valide"
      maxlength: "Une adresse mail ne peut dépasser les 255 caractères !"
    "user[password]":
      required: "Veuillez saisir votre mot de passe"
      minlength: $.validator.format "Votre mot de passe doit faire au moins {0} caractères"
      maxlength: $.validator.format "Votre mot de passe doit faire moins de {0} caractères"
    "user[password_confirmation]":
      required: "Veuillez saisir votre mot de passe une seconde fois"
      minlength: $.validator.format "Votre mot de passe doit faire au moins {0} caractères"
      maxlength: $.validator.format "Votre mot de passe doit faire moins de {0} caractères"
      equalTo: "N'est pas égal au mot de passe choisi"
    "user[name]":
      minlength: $.validator.format "Veuillez saisir au moins {0} caractères"
      maxlength: $.validator.format "Veuillez saisir moins de {0} caractères"
    "user[location]":
      minlength: $.validator.format "Veuillez saisir au moins {0} caractères"
      maxlength: $.validator.format "Veuillez saisir moins de {0} caractères"
    "user[website]":
      url: "Veuillez saisir une adresse web valide"
    "contact_message[author]":
      required: "Veuillez saisir un nom ou une adresse email"
      minlength: $.validator.format "Veuillez saisir au moins {0} caractères"
      maxlength: $.validator.format "Veuillez saisir moins de {0} caractères"
    "contact_message[title]":
      required: "Veuillez saisir un sujet"
      minlength: $.validator.format "Veuillez saisir au moins {0} caractères"
      maxlength: $.validator.format "Veuillez saisir moins de {0} caractères"
    "contact_message[text]":
      required: "Veuillez saisir votre message"
      minlength: $.validator.format "Veuillez saisir au moins {0} caractères"
      maxlength: $.validator.format "Veuillez saisir moins de {0} caractères"
  )
