// Sistema de cooldown
if (attack_cooldown > 0) {attack_cooldown--;}

// Escolher ataque de acordo com HP
if (attack_state == "idle" && attack_cooldown <= 0) {
    if (hp >= 70) {
        iniciar_ataque("atacando1", 60, oMaoL);
    }
    else if (hp < 70 && hp >= 40) {
        var escolha = irandom(1);

        switch (escolha) {
            case 0: iniciar_ataque("atacando2L", 80, oMaoL); break;
            case 1: iniciar_ataque("atacando2R", 80, oMaoR); break;
            //case 2: iniciar_ataque_duplo("atacando2LR", 100, oMaoL, oMaoR); break;
        }
    }
    else if (hp > 0) {
        iniciar_ataque("atacando3", 100, oMaoCima);
    }
}


// Executar ataque atual
switch (attack_state) {
    case "atacando1": executar_ataque1(); break;
    case "atacando2L": executar_ataque2L(); break;
    case "atacando2R": executar_ataque2R(); break;
    // "atacando2LR": executar_ataque2LR(); break;
    //case "atacando3": executar_ataque3(); break;
}

