datatype Planeta = Mercurio | Venus | Terra | Marte | Jupiter | Saturno | Urano | Netuno;

fun planetAge n Mercurio = floor(real(n) * 88.0 / 12.0)
    | planetAge n Venus = floor(real(n) * 225.0 / 12.0)
    | planetAge n Terra = floor(real(n) * 365.0 / 12.0)
    | planetAge n Marte = floor(real(n) * 687.0 / 12.0)
    | planetAge n Jupiter = floor(real(n) * 4332.0 / 12.0)
    | planetAge n Saturno = floor(real(n) * 10760.0 / 12.0)
    | planetAge n Urano = floor(real(n) * 30681.0 / 12.0)
    | planetAge n Netuno = floor(real(n) * 60190.0 / 12.0);