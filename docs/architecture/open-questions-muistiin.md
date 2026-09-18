> **Status:** readable copy, **questions unanswered** (R-38, ND-10). Transcoded 2026-09-19 (Librarian s7) from `docs/brainstorm/api-visualisatium/prompts/muistiin'.txt` (10,798 bytes, sha256 `54ca9979841e015851319395aafd0c837773f7be89174a6e72fe88e983f0bfc2`), which stays untouched in `docs/brainstorm/`. Measured encoding: **Windows-1252** — the file has four 0x80 bytes, which are `€` in Windows-1252 and control characters in Latin-1, and every one sits after a price ("50 €"); not UTF-8 (0xF6 at byte 3 is invalid UTF-8). The decode round-trips to the original bytes exactly. Only change: CRLF → LF. The text is the owner's Finnish notes-to-self ("myöhemmin kysyttäviä" = questions to ask later); answers are for the owner or the Architect, recorded as `D-n`, not here.

myöhemmin kysyttäviä

tech stack:
-onko hyvä hajauttaa user tietokanta ja tuotetietokanta turvallisuus syistä?
-Sama, onko hyvä olla erikseen se missä salasanat ja muut tiedot -> tällöin User management on Supabasessa, siinä missä autentikointi Clrkissä.

- asikaaan video suoraan youtubeen hänen omalle kanavalleen, mitä vaatii?

onko jokin tooli prompien valmisteluun sopiva?

-Lisää actioneihin kuvakulman muutos

-Muuta tuotelistaa: imagen alaosa valkova tai piirros tai maalaus

-Niin että vii valita useamman jutun kerralla samalle tuotteelle
-Ja että tehdäänkö jokaisesta välivaiheesta omansa (maksa lisää)


-jotkin tuotteet vaativat selityksen osakseen. Niihin merkintä siitä

-Hinnat tarkistettava digitalisointiin ja tulsotukseen.

-Statuks muutokset, eli fyysiset tuotteet ei kierrä kauttamme paitsi poikkeustapauksissa. 
-Jos kiertävät, sille oma status.


--

Create new milestone, this time separated to few different files. using data based on previous questions:



- Change Tech Stack description so that it outlines new structure to make it more secure: Clerk for Authentication, Supabase Database for main database, Supabase Storage for internal file storage and Couldflare R2 as content storage for customer files (originals and generated).



--

Digitointi:
Hankinta kauttamme: kiinteä hinta: 50 €, ja välitämme tiedot lähimmästä sopivasta kumppanista. Itse digitoinnin voi hoitaa suoraan kumppanin kanssa.
Hintaesimerkit näkee taulustamme. Vaihtoehtoisesti voi itse etsiä digitointipaikan. Tämä muutetaan myöhemmin kun olemme solmineen yhteistyökumppanisopimuksia.

Jos automaattinen, niin kaksi automaattista lisäkorjausta sisältyyn hintaan, jos sitä vaaditaan.
Lisäkorjaukset ja säädöt? Muutetaanko kokonaan credit pohjaiseksi?
Manuaalinen tekeminen sitten maksaa per tunti, minimi 1 h?

Tällöin "ei haittaa" jos ai mainitaan. Teemme vain valmiita polkuja ja työkaluja sen hyödyntämiseen. Helpotamme tietä alusta loppuun.


Maksu joko crediteillä tai rahalla tai kk-maksulla
1 credit = 1 kuvamuokkaus = 10 €
1 video muokkaus = 5 creditiä = 50 €


Prosessin Moodit:
Automated, Manmade, Both (=käyttäjä voi valita)

Käyttäjä saa päättää käytetäänkö automaattiproessia = heti valmis, vai että henkilö tekee sen (= hinta per käytetty minuutti, 
nimimi 10 min)
Tuntihinta 70 é. 
Jos manmade, hinta minimissään puli tuntia = 25 € (se veloitetaan heti).


Free text = describe the details you want

Voi selata: kuva / video -> aihe, tai aihe -> kuva / video

automaattiset prosessit: uusi kuva tai video joka päivä / viikko. Määritä aikataulu. Joko itse ohjeistettu tai automatisoitu. Voi itse muokata koska tahansa.

"jos meiltä puuttuu jokin juttu, pyydä lisäämään se!"













--

Firebase Storage, Alibaba general with links to different kind of sotrages, 2 of them added as separate link-sources for example (Elastic Block Storage and File Storage NAS), Digital Ocean, Rabata, Upcloud, Scaleway, OVH Cloud, Storj, Telnyx, idrive

--

I changed the pricing model and reorganized products. Please define new pricing schema with these new rules:

Customer pays either by virtual credits, or by transaction: credit card, invoice, bank transer
Customer can purchase credit packs. The larger the credit pack, the larger the dsicount.
Cusromer can purhcase monthly membership-plan, which includes certain amount of credits.
There are 3 tiers in memberships.

Prices are calculated in the attached excel.

The credist do are not equal to typical AI credits, so they are not comperable. 

Free items in both credit packs and montly memberships might be announced from time to time.
There migh be periodial discounts for the prices.

If product is to be invoiced, separate invoice is sent to customer for bank transfer. Same invoice is placed to customer dashboard for online payment with i.e. credit card or credits already purchased. If customer pays all with credits, the invoice is deleted (not needed for accounting). If customer pays partly with credits, the invoice is replaced with new one indicating amount left to pay with transaction.

If customer purchases repetitive task, the whole process is automated: at predefined times, payment is made by customer credits (of there is enough of them), and the result is made automatically by predefined rules.

All invoiced products include manual work as manhours. Thus to start the process, first minimum amount is charged. This includes the creation of the actual invoice. In the created invoice the already purchased hour is takin into concern. This means that even invoiced prodcts start with purchase by credits or transaction.
However, with those products customer has ability to ask for details and negociate before the purchase of first manhour. In such case, it is up to worker to decide when and how much time is spent on the subject before invoice is sent. The purpose is not leave customer unanswered, but to take into concern possibly of high demand compared to that uncertainty of getting work invoiced if customer rejects the order. Thus by paying the first hour, customer makes sure that the workhour for preparation and calculation for desired their special case is underway.


--

Product listat valmiina (kuvat, video, collections, specials)
Procut kuvausket valmiina (ProductsSold, Product Outline)
Hinattiedot valmiina (Pricing System)
Sivun tarkoitus lyhyesti valmiina (Description and purpose of website)
Database listat, valmiina (Lists-In-database)
Contet Creator Agent valmiina (Content Creator Agent)



Tee:
Uusi kuvaus sivuston tarkoituksesta
-Uusi states -kuvaus
Uusi Admin dashboard
Uusi User Dashboard

Website architecture
Uusi Database structure
Uusi File structure

Database listat, tehty mutta voi ehkä parannella

--

Poistetaan kompleksisiuutta. 


To remove complexity in invoices, I changed ... ow invoices cannot be split. Except when paying partly with current credits, then there will be invoices: one that was paid with credits, and one that remains to be paid with trqansaction.
Proct tyoe added to product properties


-

Add "Partner" as one type of loggers (such as "User", "CCA", "Super Admin")
Super Admin should have all accesses, including those of accountant and support, and also to log in as accountant or support -persons, in order to find prolemss in those. Might also help if there is one default user of each category, that admin uses when needed



Apply all of the proposed improvements mentioned in AdminDashboard_v0.3 and make next version of AdminDashboad, again ussing all contents of source "tempPrompt" as instructive prompt. I have also attached new source "StripeSummary" as Stripe is likely to be used as payment system. Also take into concen that superadmin might many times be the same peson who handles support and accounting, at least until the usage of the site and profit from the site has grown enough to include more people. That means that either super admin should be able to handle all tasks without limitations, or that he could easily switch his user level to be Accountant or Support person. Also, Partners might need own user level, so that they can join the chats condidering for example digitalisation or printing. Other type or partners might arise in future too. 


--
multilingual, customers likely starting from finland
partner might also be a user, like CCA. Ability to change role should be available for certain users. That means, all persons aquiring for CCA or partner status (or even both), starts as normal user. When logged in, they may apply for CCA priviledges, or to be included as Partner. 


Apply all of the proposed improvements mentioned in AdminDashboard_v0.4 and make next version of AdminDashboad, again using all contents of source "tempPrompt" as instructive prompt. Combine also following information: The site should be multilingual as mentioned in end of updated source document "Description and purpose of the website". Also combine following: Partner might also be a user with same email, like CCA. For this reason. ability to change role should be available for certain users. That means, all persons aquiring for CCA or Partner representative status (or even both), starts as normal user. When logged in, they may apply for CCA priviledges, or to be included as Partner Representative. Also good to note is that certain Partner might have more than one representatives handing their companys issues on this site. 


I have also attached new source "StripeSummary" as Stripe is likely to be used as payment system. Also take into concern that super admin might many times be the same person who handles support and accounting, at least until the usage of the site and profit from the site has grown enough to include more people. That means that either super admin should be able to handle all tasks without limitations, or that he could easily switch his user level to be Accountant or Support person. Also, Partners might need own user level, so that they can join the chats considering for example digitization or printing. Other type or partners might arise in future too.



Apply all of the proposed improvements mentioned in AdminDashboard_v0.5 and make next version of AdminDashboad, again using all contents of source "tempPrompt" as instructive prompt.
Consider if using tool such as "react-i18next" is helpful and if it should be included. Also propose any other framework or tools. While they are not included in sources, use internet or common knowledge to make improvent suggestions on tools that would improve this project. 
Also take followint into account: to apply to be a Partner, the user should be the one that later handles that company's representatives. That first user is kind of asking for their company to become a Partner company (as such, at least at that point there is no Parner organisation to selec from). If company (creator of this whole website) negotiates partnership outside this website, he also should have the ability to add such first representative for certain company, in order to help them to join. In such case, an email should be sent to given email address (of Partner company) with information on where to login and with which details (email already on the system, possbilry premade password too)

--
Apply all of the proposed improvements mentioned in AdminDashboard_v0.6 and make next version of AdminDashboad, again using all contents of source "tempPrompt" as instructive prompt.
Add some improvement suggestion about automated translating tool to help admin make translations.


--

siellä nty sekaisi prisma ja muita juttuja, tarttee lopuksi siivota kun päätetty millä mennään