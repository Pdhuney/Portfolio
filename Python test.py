#Hertentamen
#Padma Dhuney
#----------------------------------------------------------------------------------------------------------------------
# Opdracht: <Compressie>

def compression(zin: str, max_len: int) -> str:
    """
    De code zorgt ervoor dat woorden die meer daan 11 karakters bevatten worden gecomprimeerd.
    >>> compression('internationalization', 11)
    'i18n'
    >>> compression('accessibility', 11)
    'a11y'
    >>> compression('globalization', 11)
    'g11n'
    """
    woorden = zin.split() 
    resultaat = [] #empty string
    for word in woorden:
        if len(word) > max_len:
            short = str(len(word) - 2)
            lastLetter = word[-1]
            inkorten = word[0] + short + lastLetter
            resultaat.append(inkorten)
        else:
            resultaat.append(word)
    return ' '.join(resultaat)

#----------------------------------------------------------------------------------------------------------------------
# Opdracht:Tekstanalyse
def hoofdletter_words(word :str)-> bool:
    """
    >>> hoofdletter_words('Ik Ben Moe')
    True
    >>> hoofdletter_words('Ik ben Moe')
    False
    >>> hoofdletter_words('Ik Wil Naar Huis')
    True
    >>> hoofdletter_words('Ik ga Nog niet Naar huis')
    False
    """
    words = word.split()
    for word in words:
        if word[0].islower():
            return False
    return True


def aantal_hoofdletters(word :str)->int:
    """
    >>> aantal_hoofdletters('IK Ben Moe')
    1
    >>> aantal_hoofdletters('Ik BEN MOE')
    2
    >>> aantal_hoofdletters('MIJN CODE WILT NOG NIET WERKEN')
    6
    >>> aantal_hoofdletters('hij doet het eindelijk')
    0
    """
    words = word.split()
    count = 0
    for word in words:
        if word.isupper():
            count += 1
    return count

def first_int_value(word :str)->int:
    """
    >>> first_int_value('baa123k')
    123
    >>> first_int_value('Ha11o')
    11
    >>> first_int_value('p3p3rn0t3n')
    3
    """
    for letter in word:
        if letter.isdigit():
            start = word.index(letter)
            for i in range(start, len(word)):
                if not word[i].isdigit():
                    end = i
                    break
            else:
                end = len(word)
            return int(word[start:end])
    return int(word[start:end])

#----------------------------------------------------------------------------------------------------------------------
# Opdracht:Uitzendbureau
#----------------------------------------------------------------------------------------------------------------------
# Opdracht: <B&B>
"""
De codes moet een reserveringssysteem voorstellen die de reserveringen van een B&B bijhouden.
"""

def reservations_list(aantal_dagen:int)->list[int]:
    """
    >>> reservations_list(4)
    [0, 0, 0, 0]
    """
    
    return [0 for i in range(aantal_dagen)]

def maak_reservatie(reservationslist: list[int], dag: int, aantal_gasten:int)->bool:
    """
    >>> maak_reservatie([0, 0, 0, 0], 2, 2)
    True
    >>> maak_reservatie([0, 0, 1, 0], 2, 2)
    False
    """

    if reservationslist[dag] == 0:
        reservationslist[dag] = aantal_gasten
        return True
    else:
        return False

def boek_vakantie(reservationslist: list[int], start_dag: int, eind_dag : int)->None:
    for i in range(start_dag, eind_dag+1):
        reservationslist[i] = -1
        


def gemiddelde_bezet(reservationslist: list[int],start_dag: int, eind_dag : int)->float:
    """
    >>> gemiddelde_bezet([0, 1, 1, 0, 3], 0, 2)
    1.0
    """
    bezet_dagen = 0.0
    aantal_gasten = 0.0
    for i in range(start_dag, eind_dag+1):
        if reservationslist[i] > 0:
            bezet_dagen += 1
            aantal_gasten += reservationslist[i]
    return aantal_gasten/bezet_dagen if bezet_dagen != 0 else 0

def cancel_reservation(reservationslist: list[int], dag:int)->bool:
    """
    >>> cancel_reservation([0, 1, 1, 0, 3], 1)
    True
    >>> cancel_reservation([0, 1, 1, 0, 3], 0)
    False
    """
    if reservationslist[dag] > 0:
        reservationslist[dag] = 0
        return True
    return False


