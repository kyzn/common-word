English description follows.

# Ortak Kelime

Bu betik bir bulmaca çözücüdür. Aşağıda alıntılanan tarzdaki problemleri çözmeye yarar.

    Öyle bir anlamlı sözcük bulun ki,
    aşağıda verilen dört anlamlı sözcüğün
    her biriyle harfleri bir araya getirildiğinde
    yeni anlamlı sözcükler oluşsun.
    
    Dolma, Beyinli, Kılıç, Devirmek.

## Kullanım

Türkçe kelime listesi edinmeniz gerekmektedir. Bunu [maidis/mythes-tr](https://github.com/maidis/mythes-tr/tree/master/veriler) gibi projelerde bulabilirsiniz. Lütfen adresi verilen bu projeyi kullanmadan önce lisansını okuduğunuzdan emin olun.

Komut satırına argüman olarak kelime listesi dosyasının konumunu ve peş peşe bulmaca kelimelerini girmelisiniz.

    perl common-word.pl kelime-listesi.txt dolma beyinli kılıç devirmek

Bu aşağıdaki gibi bir sonuç çıkaracaktır.

    Answer: çağa
    dolma + çağa = doğaçlama
    beyinli + çağa = yabançileği
    kılıç + çağa = ağaççılık
    devirmek + çağa = çavdarekmeği

Bu örnek sorunun çözümü "çağa veya ağaç" olarak belirlenebilir.

## Lisans

Bu betik MIT lisansı ile lisanslanmıştır. Lisansın İngilizce orijinal metnini [buradan](/LICENSE), gayrıresmi Türkçe çevirisini [buradan](http://ozgurlisanslar.org.tr/mit/) okuyabilirsiniz.

## Yazar

Kıvanç Yazan `<kyzn at cpan.org>`

------

# Common Word

This script is a riddle solver. It comes up with solutions for riddles like below.

    Find a meaningful word such that,
    when combined with each word below,
    letters can be rearranged into a new
    meaningful word.
    
    Beer, Trash, Perish, Bored.

## Running

You will need a word list. If you are on Debian/Ubuntu based system, you can install one by running following command.

    sudo apt-get install wamerican

This will install a word list to `/usr/share/dict`. To see what other languages are available, use following command.

    sudo apt-cache search "dictionary words"

In arguments, you should first put path to your word list. Then give riddle words.

    perl common-word.pl /usr/share/dict/american-english beer trash perish bored

This will print following output.

    Answer: find
    beer + find = befriend
    trash + find = firsthand
    perish + find = friendship
    bored + find = forbidden

The only solution here is "find".

## License

[MIT](/LICENSE).

## Author

Kivanc Yazan `<kyzn at cpan.org>`
