// https://ru.wikipedia.org/wiki/Кодирование_длин_серий

example(of: "Пример 1 (из лекции)") {
    let string = "AAAAAABBBCAAAAADEFFGHHHHH"
    let rleResult = rle(for: Array(string))
    print("Размер до:", string.count, "Размер после:", size(of: rleResult), "\n")
    print("Результирующая последовательность:")
    print("----------------------------------")
    printRLEResult(rleResult)
}

example(of: "Пример 2 (строка подлиннее с эджкейсами на переполнение байта со знаком)") {
    let string = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBCAAAAADEFFGHHHHH_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe_deadbeafcafe"
    let rleResult = rle(for: Array(string))
    print("Размер до:", string.count, "Размер после:", size(of: rleResult), "\n")
    print("Результирующая последовательность:")
    print("----------------------------------")
    printRLEResult(rleResult)
}
