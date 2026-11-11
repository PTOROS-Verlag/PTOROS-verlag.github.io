#import "@preview/hydra:0.5.1": hydra

#let textSize = 11pt
#let seriffont = "Junicode"
#let sfFont = "Alegreya Sans"
#let ttFont = "IBM Plex Mono"

#let sc(x) = text(tracking: 0.07em, smallcaps(lower(x)))
#show link: body => text(8pt, font: ttFont, body)

#let ednote(x) = footnote(text(font: sfFont, style: "italic", x))

#let praef = 0

#set page(
  margin: (
    inside: 0.8in,
    outside: 0.8in,
    top: 0.8in,
    bottom: 1.0in
  ),
  width: 12.5cm,
  height: 19cm,
  columns: 1,
)

#show heading: it => [
  #set align(center)
  #pagebreak()//(to: "odd")
  #set text(font: seriffont, weight: "regular")
  #block[
    #v(1em) \
    #if it.numbering != none {sc(counter(heading).display())} \
    #text(it.body) \
    #v(1em)
  ]
]
#set heading(numbering: "I")

#set text(
  font: seriffont,
  size: textSize,
  lang: "de"
)

#align(right, text[Julius Siber · Das Gastmahl der Schatten])

#pagebreak(to: "odd")

#align(center, text(13pt)[
  #v(1cm)

  #text(20pt)[Das Gastmahl der Schatten]

  #v(1.5cm)

  Roman \ von einer polnischen
  Allerseelennacht \ und
  Friedrich Chopin

  #v(1.5cm)

  von

  #text(16pt, tracking: 1mm)[Julius Siber]

  #v(1fr)

  #text(11pt, table(
    columns: 6,
    align: center,
    stroke: none,
    [P], [T], [O], [R], [O], [S],
    [V], [E], [R], [L], [A], [G],
    [B], [E], [R], [L], [I], [N],
  ))
])


#pagebreak()

Zuerst erschienen im Paul Scheiner Verlag, Würzburg, 1937,
mit der Widmung: "Dem einzigartigen Chopin-Interpreten _Raoul v. Koczalski_ zu eigen."

#align(bottom, text[
#text(tracking: 0.07em)[PTOROS] Verlag, Berlin, 2025 \
https://ptoros.de

Umschlag, Satz und Layout gestaltet vom Herausgeber \
Gesetzt aus der Garamond "Junicode"

Druck und Bindung: Neopubli GmbH, Berlin \
Printed in Germany \
#text(tracking: 0.07em)[ISBN] 978-3-565088-20-1
])

#set page(numbering: "1")
#set par(
  first-line-indent: 1em,
  spacing: 0.85em,
  leading: 0.85em,
  justify: true,
)
#show quote.where(block: true): set pad(x: 0.1in, top: -0.1in)
#show quote.where(block: true): set text(0.9em)

= Das Auge aus der Unterwelt

Schrankenlos hatte der Musik- und Theaterkritiker
Jules Janin in der Pariser Zeitung "Journal des
Débats" eine Diktatur des Schreckens aufgerichtet
für alle Künstler, die in Paris, der tausendseligen, betörenden Stadt, dem Weltmarkt aller Künste, dem
lauten Tummelplatz auch der Scharlatane, auf‌treten
wollten. Selbst Paganini, dieser phänomenalste aller
Geiger, der Satan des Konzertsaals, war einer Fehde
mit ihm ausgewichen und hatte eine Zeitlang Paris
gemieden, diese Stadt, die eben noch vor ihm wie vor
einem Götzenidol auf den Knien gelegen war.

Warum auch mußte dieser italienische Dämon, der
schon über eine Million sich mit seiner Geige erfiedelt
hatte, ihm, dem allmächtigen Kritiker, die Freikarte
für seine Mätresse verweigern? Ihm, vor dessen Diktat sich sogar die weltberühmte Tragödin Rachel Felix
beugte, dieses stolze, harte Mannweib, das es wagen
durfte, sogar dem russischen Zaren Nikolaus vorzuschreiben, wie die Petersburger Bühne zu ihrem
Empfang würdig herzurichten wäre!

Aber Jules Janin, der Alpdruck und das Pestentsetzen all dieser Unglücklichen, dieser Tantalusseelen,
welche die böse Schimäre mit ihren giftigen Fledermausflügeln durch phantastische Trugbilder von
Ruhm und Gold auf das heiße Konzertpodium lockte,
wagte bis jetzt nicht, mit einem Künstler den Kampf
aufzunehmen, der zwar auch schon weltberühmt war
wie Paganini, aber abhold lauter Reklame, in seine
Künstlerträume und den stillen Kreis seiner hochadeligen Schüler und Schülerinnen versponnen: mit
Friedrich Chopin, den seine polnischen Landsleute in
Paris die Nachtigall auf dem Sarkophag Polens nannten, den tröstenden Stern, der ihnen in dem fast hoffnungslosen Verzweiflungskampf mit dem russischen
Unterdrücker leuchtete.

Niemand wußte, warum Janin, der Goliath, diesem
kleinen, schmächtigen, zartnervigen Polen, den schon
ein fallendes Rosenblatt verstimmen konnte, auswich
und in die spärlichen Konzerte, wo Chopin in die
Öffentlichkeit trat, einen Stellvertreter sandte.

Es war sicher nicht Geringschätzung, eher vielleicht
etwas Irrationales, ein phantastischer Aberglaube, der
ihn mit heimlicher, haßerfüllter Abneigung gegen die
Polen überhaupt erfüllte. Auch Eifersucht auf den
Glückspilz Chopin erhob ihr züngelndes Haupt.

Fast gleichzeitig waren beide im Spätherbst 1831
nach Paris gekommen. Chopin, den Greueln des polnischen Aufstands gegen die Russen entronnen, wie
ein Schmetterling, den ein Sturmwind verweht, Jules
Janin aus Avignon, der sonnendurchglühten Papststadt des Mittelalters, um deren Zyklopenbau auf der
Anhöhe noch immer die Luft römischer Weltherrschaft wehte und Olivenbäume in der leidenschaftlichen Sonne auf‌loderten.

Beide wollten Paris erobern: der 22 jährige Chopin,
den schon Warschau und Wien gefeiert hatten, als
Pianist und Komponist; der 10 Jahre ältere Janin als
Dichter, von Phantomen des Ruhms geäfft und
von einem Ehrgeiz gequält, dessen Hölle Dante, der
Erhabene, der für jeden Schmerz einen weihevollen
Vers hatte, zu schildern vergaß. Beide tauchten unter
in den trostlosen, unermeßlichen Ozean Paris, in den
grauenhaften Malstrom der Kunst, der sie wie ein
Höllenkreis hinabzog zu den Verdammten, die gleich
ihnen sich den Lorbeerkranz des Dichters, des Künstlers mit zitternder Hand auf ihre Stirne flechten wollten, die vielleicht niemals vom Hauch des Genius geküßt worden war; zu diesen Unseligen, die voller
Sehnsucht ihre Hände nach dem fernen Ziel ausstreckten, die kämpften, schrien, beteten, fluchten,
mit den Zähnen knirschten – und weinend verzweifelten.

Fast zwei Jahre lang schmachtete Janin in diesem
Fegefeuer. Er hauste in einer der armseligsten Elendsgassen des Faubourg Saint-Marceau, in einer greulichen Mansarde, wo er auf die Schicksalsgenossen
herabschauen konnte, die unten in der Katakombenenge kläglich herumwimmelten und langsam verzweifelnd dem Straßenkot entgegenfaulten.

In der Ferne sah er die Kuppel des Pantheons und
die grauen Türme von Saint-Sulpice, die sich wie eine
geballte Faust aufreckten.

Armselig in seinem engen, verschwitzten Rock
huschte Janin von Redaktion zu Redaktion, die Augen seines Märtyrergesichts blinden Glanzes voll, wie
ausgelöscht in der Verzweiflung grauer Alltagsnot und
bleicher, fröstelnder Verzweiflung. Einmal, als er gerade in das armselige Restaurant Flicoteaux hineinschlüpfen wollte, wo man für 30 Sous speiste und
Brot nach Belieben nehmen konnte, fuhr die Equipage
der Marschallin Lannes vorbei: Chopin saß neben ihr,
ein kleiner, dünner Schattenriß neben einem prächtigen Rosenstrauch. Die Marschallin lachte, Chopin
bewegte die Finger seiner Hand auf dem Wagenschlag,
als wollte er eine flüchtige Melodie ergreifen und
festhalten, und auch er lächelte. Aber dieses Lächeln
war anders als das der Marschallin. Fast erschrak
Janin davor: dieses Lächeln konnte alles bedeuten:
Sympathie, Zustimmung, freundliche Ermunterung,
aber auch grenzenlose Verachtung und tiefsten Abscheu.

Lange sah Janin dem Wagen nach, dann verschwand er mehr in dem niederen, verräucherten Lokal, als daß er es betrat.

"Welch ein Glückspilz!" murmelte er. "Daß er hier
vorbeifahren muß! Zum Glück hat er mich nicht
gesehen –"

Selbstquälerisch malte Janin sich seine Erfolglosigkeit in den schwärzesten Farben und stellte ihr als
Kontrast die Laufbahn dieses polnischen Klavierspielers entgegen.

Längst hatten es ja seine polnischen Landsleute ausposaunt und ganz Paris war voll davon: Wohlhabende
Eltern unterstützen sein Musiktalent, die vornehmsten
polnischen Jungen sind seine Schulkameraden, der
Fürst Radziwill lädt ihn auf sein Landgut ein, der
russische Großfürst Konstantin will ihn hören, sein
Lehrer Elsner an der Warschauer Musikakademie
preist sich selig, daß er einen so begabten Schüler hat,
der auch _seinen_ Namen mit sich in die Unsterblichkeit nehmen wird. Wenn er den Namen dieses gottbegnadeten, gottgesandten Schülers ausspricht, faltet er
die Hände und hat Mühe, sich vor einem Kniefall zurückzuhalten. Kein Wunder, daß Chopin auch Paris
im Handumdrehen erobert.

Mehr noch! Janin hat oft schon Kompositionen von
Chopin gehört. Sogar auf Bällen spielt man seine Walzer. Die Polen prahlen, daß er schon so weltbekannt
ist, daß keine Stunde in die Unendlichkeit hinabfließt,
ohne daß irgendwo einer seiner leidvollen, in tiefste
Schönheit getauchten Tondichtungen erklungen wäre.
Chopin ist ihr Trost, ihr Abgott, die Nachtigall auf
dem Sarkophag Polens. Polen kann nicht untergehen,
so lange Chopin lebt und solange man seine Kompositionen spielt! – – –

Noch immer sitzt Janin in dem dunkel-verräucherten Lokal und denkt über das Märchenhafte der
Laufbahn dieses flaumbärtigen Jünglings nach.

Immer unheimlicher, hassenswerter, abscheulicher
kommt ihm dieses Lächeln des jungen Menschen vor!
Auch Galvanisierte lächeln so. Eine Novelle möchte
er darüber schreiben. Liegt nicht auch Verzweiflung
in diesem sphinxhaften Lächeln?

Verzweiflung vielleicht über das Schicksal Polens
und seiner Eltern, die in Warschau zurückgeblieben
sind?

Jeden Augenblick kann ein neuer polnischer Aufstand ausbrechen und diese Aufstände werden dann
alle blutig niedergeschlagen. Die Häuser werden straßenweise angezündet, die Einwohner dezimiert. Wie
zu Suworows Zeiten, der sogar die polnischen Haustiere abschlachten ließ. Die Axthiebe der Teilungen
haben das Land gevierteilt, der russische Geier reißt
die letzten Leichenfetzen weg. Polen liegt wie lebendig begraben in der Gruft. Das Tränenkrüglein des
polnischen Volkes zittert in der Hand Gottes, so voll
ist es. Die Peitschenschnüre der russischen Despotie
hängen von einem ehernen, erbarmungslosen Himmel
herab ...

Eine rätselhafte Fügung will es, daß ein Pole an
Janins Tisch Platz nimmt, daß Janin mit ihm ins Gespräch kommt, dabei Chopin, ohne daß er es will, in
den Himmel hebt und vom Tränenkrüglein des polnischen Volkes phantasiert –

Der Pole, entzückt über Janins Polenfreundschaft,
gibt ihm eine Empfehlung an seinen Zimmernachbarn, den kleinen Redakteur einer Zeitung dritten
Rangs. Janin faßt Fuß, klimmt empor. Die mächtige
Zeitung "Journal des Débats", das Leiborgan des Bürgerkönigs Louis-Philippe, das ihm täglich Hosiannah
singt, stellt ihn als Musik- und Theaterkritiker an.

Janin ist jetzt der gefürchtete Kritiker, der Traumschrecken aller Künstler, die sich auf dem heißen
Podium produzieren müssen. Er hat eine Mätresse,
für die er von Paganini eine Freikarte verlangt. Jetzt
will er auch den Glückspilz Chopin für sein Sphinxlächeln bestrafen.

Die polnische Nachtigall grüßt ihn zwar zuerst,
aber dabei kriecht auch dieses verfängliche Lächeln
über die Lippen. Und Chopin hat dieses unnachahmlich Aristokratische, das er von diesen hochadeligen
Damen des Faubourg Saint-Germain, die ihren
Stammbaum bis zu den Kreuzrittern und vielleicht
bis zur Arche Noah nachweisen können, abgelernt.

Es ist unerträglich. Janin ärgert sich jetzt sogar
darüber, daß er einen viereckigen Assyrerbart und
Spitzbauch hat. Hat ihn dieser Ästhet Chopin, dessen
Stimmung schon ein fallendes Rosenblatt verderben
kann, mit seinem Lächeln verhext? Das Lächeln allein
ist es nicht einmal. Sein ganzes Wesen ist ihm jetzt
unheimlich und befremdend, wie wenn er vom Mond
herabgefallen wäre, um ihn zu ärgern.

"Warum soll ich ihn scheuen? Welche Rücksicht
habe ich auf ihn zu nehmen? Oder auf die Polen?"

Janin will einen seiner Dolchstoß-Artikel gegen
Chopin schreiben.

Es ist 1846. Schon seit einiger Zeit zeigt der Bürgerkönig Louis-Philippe eine unverhohlene Abneigung gegen die Polen und ihre Agitation in Paris. Sein
Leibblatt "Journal des Débats" macht die Schwenkung
mit und in dem Maße, wie der Stern des Bürgerkönigs
sinkt, die Motten den königlichen Purpur zerfressen
und der Thron in den Tuilerien wankt, wird die Sprache dieser Zeitung gegen die Polen gehässiger.

Für alle Revolten, die Meutereien in den Kasernen,
die immer keckeren Pamphlete gegen den König, die
Spottverse auf seinen ganz unköniglichen Geiz, seine
skrupellose Profitgier und seine schmutzigen
Schachergeschäfte mit den Königmachern der hohen
Finanz, den Fould, Weill, Ephrussi, Péraire und
Rothschild, seinen Busenfreunden, für all dies macht
die Zeitung Janins die Polen verantwortlich.

Gerade in diesen Tagen ist an allen Straßenecken
eine besonders boshafte Karikatur des Königs zu
sehen: Ein seltsames Wesen, halb Birne halb Mensch
– es ist dies die seit Jahren und zum Überdruß
wiederholte Anspielung auf den spitz birnenförmig
zulaufenden Kopf des Königs – kauert am Fenster
einer engen Wechslerstube. Um das Haus herum, dessen Mauern von der Farbe geblichener Knochen sind
und vor dem sich halbdürre, schiefgewachsene Bäume zusammenkrümmen, als schämten sie sich dieser
Umgebung, schwärmen Wespen und Hornissen, die
deutlich die Züge der Hofbankiers tragen. In den König mit dem Birnkopf redet eine Riesenwespe, in der
man unschwer den allmächtigen Baron v. Rothschild
erkennt, wie in ein Hörrohr hinein. Zugleich läßt das
Untier Golddukaten in einen riesigen Geldsack fallen,
an dem ein Zettel angeklebt ist mit der Aufschrift:
die einzige Regierungssorge.

An der Türe des Bankhauses drängen sich abenteuerlich häßliche Mißgestalten: vom König geadelte
Neureiche mit Spruchbändern: Baron v. Börsenkurs,
Herzog vom Agio, Marquis v. Geldsack.

Ganz Paris lacht. In der Vorstadt Saint-Antoine,
wo schon von jeher Barrikadenluft weht und die Revolution vor jeder Haustür kauert, läuft das Gerücht
von Mund zu Mund, im Polnischen Klub hätten sie
einen Galgen für den Zaren Nikolaus aufgestellt und
oben am Querholz hänge eine große Birne herab.

Mit seinem Assyrerbart und dem Spitzbauch hastet
Janin auf seinen kurzen Beinchen der Redaktion seiner Zeitung zu. Er hält den richtigen Zeitpunkt für
seinen Angriff auf Chopin gekommen.

Schon am nächsten Tag erscheint sein skandalöser
Artikel mit der Überschrift: "Der Ewige Jude im
Faubourg Saint-Germain oder die Orchidee im elfenbeinernen Turm." Der kuriose Titel schon war, wie
alles aus der Feder Janins, raffiniert ausgeklügelt und
mußte Sensation erregen.

War nicht eben der Schauerroman Eugen Sues
"Der Ewige Jude" erschienen? Vor der Zeitung, die
ihn brachte, drängten sich die Menschenmassen, die
stundenlang warteten, um die Fortsetzung zu bekommen.

Was allerdings Ahasverus, der Ewige Jude, in dem
hochadeligen Faubourg Saint-Germain bei den kaduken, parfümierten Mumien aus dem 18. Jahrhundert zu tun hatte, die mit ihren welken Lippen verstaubte, hundertjährige Phrasen wiederholten, die
schon ihren Vätern und Großvätern im Schatten des
bourbonischen Lilienthrons geläufig waren, das war
phantastisch und fragwürdig genug; dafür mußte der
fast blasphemische Mißbrauch der Gebetsformel und
Anrufung aus der lauretanischen Marien-Litanei um
so aufreizender wirken.

Janin begann:

#quote(block: true)[Unseren Ahasverus kenne ich schon, seit er im
Oktober 1831 dem russischen Gemetzel in Warschau
entronnen, in Paris ankam, diesem Asyl für ehrenhafte
und nicht ehrenhafte Flüchtlinge der ganzen Welt.
Ich traf ihn im polnischen Zirkel, wo heute Galgen
für sehr hochstehende Persönlichkeiten aufgestellt
sein sollen. Zwar damals 1831 waren die Polen in der
Stadt, die ihnen Asyl bot, bescheidener und weniger
jakobinisch und revolutionär. Nur Hetzreden hielten
sie in der Rue de la Pépinière. Aber daß der österreichische Kanzler Metternich und Zar Nikolaus an
einem polnischen Galgen sich zu Tod zappeln würden, das wagten sie noch nicht zu hoffen.

Nur ein halb Geisteskranker vielleicht, der in klägliche Lumpen gehüllt war. Sein Vater war unter den
37000 Polen, die Suworow nach der Einnahme der
Warschauer Vorstadt Praga abschlachten ließ. Der
Sohn war im Keller unter Fässern versteckt und sah
ein Scheußliches Schauspiel: Während die Hingemetzelten Todesschreie ausstießen, saß der Barbar,
von seinen Kosaken umgeben, auf einem Branntweinfaß, trank den Soldaten zu, dann sprang er auf,
hüpfte unter dem wiehernden Gelächter seiner Horden auf einem Bein und krähte mit hoher Fistelstimme: Großer Gott, wir loben dich! Kein Wunder,
wenn bei solchen greulichen Szenen das arme Gehirn
des Polen einen Stoß erlitt. Wie ein Monomane
phantasierte er mir in seinem schleppenden, monotonen Tonfall seine fixe Idee vor: Vor tausend Jahren
sei dem bösen Kaiser Titus in Rom zur Strafe für
seine Freveltaten eine Fliege ins Gehirn gekrochen
und habe ihm solche Schmerzen verursacht, daß beständig hundert Schmiede ihren Amboß mit Hämmern schlagen mußten, um die Schmerzen zu betäuben. Dasselbe wünschte der Pole auch dem russischen Zaren und seinem Bruder Konstantin, dem
Statthalter und Gouverneur in Warschau.

Polel, so hieß dieser Unglückliche, schlief im Sommer unter einem Brückenbogen der Seine. Im Winter
verkroch er sich in einem Winkel der schauerlichen
Elends- und Hungergasse 'Zur alten Laterne', fischte
sich Heringsköpfe und schimmliges Brot aus den Kehrichtfässern, aber er ließ die Hoffnung nicht sinken:
Beständig hörte er in seinen Ohren das Summen der
polenfreundlichen und zarenmörderischen Fliege, die
sich demnächst in das Gehirn des Zaren Nikolaus
einnisten würde.

Oh! Welche Jammerexistenzen sah ich noch in
diesem polnischen Klub! Ich kannte damals ja das
bleiche Elend an mir selber, als ich in der scheußlichen Mansarde wohnte, als mein Leben mit seinen
ehrgeizigen Träumen wie ein dürrer, unter glühenden
Sonnenstrahlen und Geröll ausgetrockneter Bach in
trostloser Steppe zu versickern drohte. Und doch erschien ich mir wie ein vom Glück Begünstigter unter diesen Elendsgestalten, die selbst den von Gott mit
Aussatz geschlagenen, auf dem Misthaufen kauernden Hiob beneidet hätten!

In dieser kläglichen Umgebung sah ich damals im
polnischen Klub den jungen, eben in Paris angekommenen Friedrich Chopin, die Nachtigall auf dem Sarkophag Polens, wenn auch nicht zugleich die Fliege,
die dem Zaren und seinem Bruder ins Gehirn kriecht.
Ich sah ihn fast neben dem armen geisteskranken
Polel stehen: einen radschlagenden Pfau unter struppigen, verprügelten, halbverhungerten, herrenlosen
Hunden. Das kostbare Kostüm des stolzen Pfauen
werde ich zeitlebens nicht vergessen: Friedrich Chopin produzierte sich vor diesen armseligen Wrakmenschen und Hungergestalten in einem glockenförmigen Taillenrock mit aufgeschlagenem Revers, in
einer zartgeblümten Pikeeweste und einer zärtlich gefältelten Halsbinde aus Musselin. Als er ging, trug er
einen hohen Hut, Handschuhe und einen geknauften,
eleganten Stock.

Doch muß ich noch nachtragen, daß Chopin seinem Landsmann, der am liebsten selbst als Fliege
dem Zaren ins Gehirn gekrochen wär, ein reichliches
Almosen gab. Er ist nicht geizig, wie sein Kollege auf
der Geige Niccolò Paganini, ist dafür aber wohl noch
geschäftstüchtiger als dieser.

Auf jeden Fall gab Chopin reichlich. Aber ach!
Wenn ich daran denke, _wie_ er das Almosen gab,
wünschte ich, er hätte es nicht gegeben!

Diese gespitzten Finger! Dieser ganz unbeschreibliche Hochmut! Ich kenne eine Marquise im hochadeligen Faubourg Saint-Germain, die mit ihren zierlichen, ringgeschmückten Fingern dieselbe Fingersprache spricht. Als ich Chopin so vor diesem armen
Teufel stehen sah, glaubte ich eine vornehme, aus
irgend einem mittelalterlichen Sarkophag auferstandene Edeldame zu sehen, spitz, sauer, aigriert, wie
empört darüber, daß sie solche Gestalten sehen muß,
und nur darauf wartend, daß sie wieder in ihre hochadelige, kühle, steinerne Behausung zurückkehren
kann.

Chopin ging übrigens nach nur kurzem Verweilen.
Aber die Polen nahmen es ihm nicht übel. Sie waren
wie verliebt in ihn, sangen sein Lob in allen Tonarten: Seine Riesensprünge auf dem Klavier! Wer
macht sie ihm nach? Niemand. Selbst Franz Liszt
nicht! Und was er auf dem Klavier dichtet! Gibt
es etwas auf der ganzen Welt, das so originell, so
tief, so melancholisch, so phantastisch wäre?

Kaum 22 jährig, hat er schon jetzt Beethoven, Mozart und all die Klassiker erreicht, weil ihm Melodien
einfallen, die noch niemand bisher ersinnen konnte.
In einigen Jahren ist er soweit, daß alle anderen Pianisten ihre Flügel zuschließen dürfen – –

Beethoven in Ehren! Aber so originelle Eingebungen hat er nicht. Und wie oft himmelt er! Ein
Sterngucker ist er, ein moralisierender Klubredner,
der für Rousseau schwärmt! Mozart gar! Ein Zuckerbäcker, dem der Himmel voller Baßgeigen hängt! –

Da kam aus der dunklen Saalecke ein alter Mann
in der polnischen Zamarra auf mich zu. Ich kann
seine traurigen Augen nicht vergessen: alle Marter,
alle Verzweiflung hinter den russischen Gefängnisgittern in fürchterlichen, schlaflosen Nächten, lag darin. Diese Augen waren wie die Fensterstummel
dieser Kerker, an denen Blutflecken und dunkler Rost
und die Schreie der Gemarterten kleben ...

War es der Ewige Jude? Ein anderes Phantom?

Es war einer, den Suworow 1794 zu schlachten vergessen hatte. Lange lasteten seine trüben, steinernen
Augen auf mir, bis er mich anredete.

Nun ist er gegangen. Dieser Pfau mit seinem
pfauenäugigen Stolz. Indes, sind nicht alle Künstler
stolz? Etwas anderes ist es, das ihn mir unheimlich
macht. Ich habe viel über ihn nachgedacht. Ich lehrte
am Warschauer Lyzeum, wo auch Chopins Vater Unterricht gab, Psychologie und Philosophie.

Ich habe gesehen, wie man den kleinen Chopin in
die Kirche zur Taufe trug. An meinem Hause habe ich
ihn jeden Tag mit seinen Schulbüchern vorbeigehen
sehen. Unzählige Male habe ich in meinem Garten,
unter dem wildaufgeschossenen Gras hinter dem Gemäuer der alten Zisterne seinem Spiel gelauscht. Als
Mathematiker bin ich gewohnt, plastische Bilder zu
sehen. Ich sage Ihnen im Voraus: Chopin ist genial,
unermeßlich genial. Aber er ist unheimlich.

Auch Paganini nennt man unheimlich. Aber seine
Teufelei liegt glatt auf der Hand: Teufelspakt, den
im Mittelalter jede alte Frau an bestimmten Nächten
eingehen konnte, wenn sie sich mit der richtigen Salbe
einrieb; man fand Paganini riesig interessant, weil
er auch einmal einen Mord begangen haben sollte
und ein voltairianisches Grinsen hatte, wenn er seinen Hexentanz spielte.

Die Diablerie Chopins ist viel feiner, versteckter
und gefährlicher. Sie liegt nur in seinen Tondichtungen. Niemand vielleicht hat ihnen so oft gelauscht,
wie ich; niemand vielleicht auch so tief über seine
Tondichtungen nachgedacht.

Anfangs verzweifelte ich, den Schlüssel zu finden.
Dann kam mir meine Gabe, plastische Bilder zu
sehen, sehr zu statten. Ich sah stolze, einsame Tiere:
keusche Hermeline, träumende Drachen, Einhörner
mit verzweifelten Augen. Ich sah sie in einem träumenden italienischen Park. Eine Fontäne sprudelte.
Dann barst die Wassersäule auseinander und zeichnete groteske Figuren. Eine Pansmaske lächelte spöttisch, dann versteinerte sie wieder und Tränen flossen aus ihren Mamoraugen. Und plötzlich versank
alles in nächtliches Dunkel einer unendlichen, trostlos klagenden Steppe; es versank zwischen Nacht und
Tod. Der Nachtgeist zog seufzend durch die Lüfte,
Ein ferner, trostloser Gesang! Aufschreie! Polen, die
nach Sibirien verbannt sind, empören sich gegen ihre
Peiniger, die sie mit der Knute peitschen. Dann wird
alles still; der Wind heult wieder auf, jetzt verstummt er wieder. Da, ganz in der Ferne, am Ende
der Welt, steht unter einem Galgen eine jammernde
Flattergestalt. Nur ihre Augen sind lebendig, und
wenn der Nachtgeist seufzend an ihr vorbeistreift,
schlägt sie das Auge auf und schaut dem Zug der Polen nach – –

Jeden Tag, fast jede Stunde sehe ich das unauslöschlichste aller Bilder mit der süßesten, wonnevollsten Melancholie, die mich je in meinem armen,
gehetzten Leben überwältigte!

Ich durfte auch die zwei triumphalen Konzerte des
Wunderkinds Chopin in Warschau erleben: Waren
das die Kompositionen eines 16 jährigen? War dieses
kindliche Lächeln, diese knabenhafte, schüchterne
Unbeholfenheit nicht eine grauenhaft unheimliche
Dämonie?

Man erzählt, daß der hohe Geist Konfutse, den
die Chinesen fast göttlich verehren, kaum sechs
Wochen alt zu sprechen begann und den ehrfürchtig
erstarrten Eltern seine erste göttliche Eingebung mitteilte. Welche Eingebungen hatte damals im Warschauer Konzert der kaum den Knabenschuhen Entwachsene!

Welcher Geist flößte ihm diese trostlos schwelgende Melancholie, diese hochmütig resignierte
Trauer, diesen vieltausendjährigen Schmerz ein?

Einmal kam Schubert, der göttliche Singschwan,
in diese Region, die außer Chopin kein Sterblicher
betrat. Vielleicht streifte er auch nur hin. Es war
kaum drei Wochen vor seinem Tode, da starb er.
Wie der Jüngling, der vorwitzig hinter den Schleier
schaute, der das Bild von Sais verbarg.

Aber dieser junge Chopin stand mit diesen lemurischen Schatten, diesen giftigen Dämonien auf du
und du. Er liebkoste sie, streichelte sie wie ein Kind,
das ahnungslos mit einer schöngefleckten, schillernden Schlange spielt!

Welcher Geist war in Chopin? offenbarte sich zum
erstenmal in der europäischen Kunst?

Byron und die französischen Satanisten waren doch
nur knabenhaft-mutwillige Rebellen, die mit dem
Göttlichen einigen Schabernack trieben.

Chopin allein stieß in die letzten, trostlosesten
Regionen der verzweifelnden Empörung vor. Es war
jenseits von Hölle und Himmel, von Paradiesischem
und von Höllenruch. Ich sah deutlich bei seiner letzten Phantasie eine Szene im Hades, dem griechischheidnischen Fegefeuer. Da war die mondstarre Proserpina, der schweigende Pluto und Charon, der steinerne Fährmann. Sie lauschten hingegeben und tiefgesenkten Hauptes diesen kostbarsten aller Melodien,
die in der Farbe kranker Perlen dahinstarben wie ein
Stein, der von einem alten Gemäuer lautlos in das
schwarze Wasser versinkt. Ich sah Rosen unter dem
Samum dieser stolzen Trostlosigkeit sich entblättern,
wie wenn Asche auf sie gestreut worden wäre. Fast
schmerzhaft spürte ich den grauenhaften Ekel vor
Göttlichem und Menschlichem in diesen parfümierten, überfeinerten Tongebilden, diese Versunkenheit
in Traumweltgenüsse und in einer Vergangenheit, an
die der Schmutz und die Niedrigkeit des Lebens
nicht mehr herantastete, weil sie in zu ferner Verklärung lag.

Einmal – es ist mir unvergeßlich – da überwältigte dieser fremde, fast übermenschliche Geist ferner, aber übermächtiger Traumwelten diese zierliche, vornehme, peinlich gepflegte, aristokratische
Ephebengestalt, die bis jetzt in ihrer sanften Blässe
an Felix Mendelssohn erinnerte – und ich sah den
wirklichen Chopin: die Gestalt wuchs, die Züge wurden härter, fast tyrannisch. Aus dem verzärtelten,
parfümierten Mondkälbchen, das mit unschuldiger
Kindermiene Blasphemien spielte, ward der visionäre
Geistervogel, der gezackte Drache, der lächelnde Luzifer mit seiner fabelhaften Verführung, die aus diesen Tönen wie Flammenlohe schlug.

Nun wußte ich alles: Luzifer, der trostlose Gott
mit seiner mondblassen Schönheit, war in seinem Spiel
und schlug leise seine veilchenblauen, zwinkernden
Augen auf ... Ich sah, wie er Chopin zulächelte, so
leise, wie ein Schmetterling, der an einer kostbaren
Orchidee vorbeistreift ... Seit wieviel tausend Jahren kannten sich die beiden?

Vielleicht schon damals, als Luzifer den Schöpfer
zur Rede stellte, weil er sich nicht enthalten konnte,
die Welt zu erschaffen, diesen greulichen, mit Blut
und Kot, Irrwahn und Verzweiflung befleckten Erdstern –]

Das war mehr als ich ertragen konnte! Denn ich
bin wie meine verehrte Kollegin Madame George Sand
ein unerschütterlicher Optimist. Hinter den schwärzesten Gewitterwolken sehe ich immer noch ein kleines Fleckchen blauen Himmels.

"Ihre Phantasien über Luzifer sind ja ungeheuerlich!" rief ich. "Sie versündigen sich an Chopin. Auch
ich nehme an manchem Anstoß, was ich an Chopin
sehe, so an seinem unbeschreiblich hochmütigen und
rätselhaften Lächeln. Aber zum Glück ist er nicht so
dämonisch und so satanisch, wie Sie ihn darstellen.
Er ist mehr ein Mittelding zwischen Satan und einem
wehleidigen, verzogenen, parfümierten Mondkälbchen –"

"Das Eine ist sein Wesen, seine innerste Seele, das
Andere äußerer Schein. Ich bin mir darüber klar.
Könnte ich an eine Seelenwanderung glauben, dann
würde ich ihn zu einer Persönlichkeit des 18. Jahrhunderts in Beziehung setzen, zu einer der rätselhaftesten und unheimlichsten Gestalten dieses an
Schwärmern und Schwindlern, Phantasten, Besessenen
und Mystikern so reichen Jahrhunderts –"

Ich sann nach. Nein. Voltaire meinte er nicht. Obwohl Voltaire noch heute der einzige französische
Schriftsteller ist, den Chopin liest. Wer konnte es
sonst sein? Der Pole sah mich lächelnd an.

"Es war ein Mann, der dasselbe hochmütige,
sphinxhafte Lächeln hatte, wie Chopin, der ihm ein
wenig auch im Äußeren glich, wenngleich seine
dürre, schattenhafte Erscheinung mehr an Paganini
erinnerte. Indes. Ich gebe mehr auf das Seelenbild.
Dieser Mann hatte die Seele einer hochmütigen, spitznasigen, versauerten alten Jungfer aus dem Faubourg
Saint-Germain, die hinter ihren rotseidenen Vorhängen neben dem vergoldeten Vogelkäfig steht und
verärgert auf die Straße hinabsieht, wo eine Neureiche, deren Reichtum einen noch viel dunkleren
Ursprung hat als die sagenhaften Nilquellen, ihre
fabelhaft elegante Equipage geflissentlich langsam
vorüberrollen läßt, um diesen unnahbaren, mit dreifacher Glaswand von der übrigen Menschheit abgeschlossenen bourbonischen Lilienadel wenigstens ausgiebig zu ärgern – Derselbe rätselhafte Mann hatte
die überflüssige Marotte, sich den 'Ewigen Juden' zu
nennen – Es ist –" Gerade hier aber brach raffiniert
genug der Artikel ab, um die Leser auf die Fortsetzung gespannt zu machen.

Diese aber wurde von den Tausenden, die in Neugierde, Schadenfreude, Skandalsucht und auch empörter Parteinahme für Chopin und die Polen fieberhaft erregt waren, vergebens erwartet.

Was bis jetzt während der Regierung des Bürgerkönigs noch nicht dagewesen war, trat ein: der bourbonische Lilienadel, der Adel von Napoleon Bonapartes Gnaden mit der Marschallin Lannes an der Spitze
und der Adel der Neureichen unter Baron v. Rothschilds Führung fanden sich in gemeinsamer Entrüstung zusammen und protestierten gegen die Fortsetzung dieses Pamphlets.

Louis-Philippe hatte nur darauf gewartet, ließ die
Zeitung verwarnen und verbot die Fortsetzung des
Artikels bei Strafe der Konfiskation.

Eine Wallfahrt der Freunde und Anhänger, Schüler
und Schülerinnen in die stille Wohnung Chopins begann. Wahre Fluten von Veilchen (sie waren die Lieblingsblumen des Meisters) ergossen sich in die chinesischen Vasen, auf den karmoisinroten Samt der Decken, ja auf die gewirkten Teppiche, deren einer ein
Geschenk des Barons v. Rothschild war. Chopin zeigte
sich wieder als der vollendetste Diplomat: Nur
reden hören hatte er von diesem Artikel, der einige
schöne poetische Bilder enthalte. Still wie ein Götzenbild sog er den Weihrauch dieser Sühneprozession
ein.

Wie auch in Giftblumen Honig ist, barg dieses
Pamphlet ja auch Stoff genug zu Reklame. Der Berliner Kritiker Rellstab, sein bornierter Widersacher,
würde Gift und Galle speien bei der Lektüre. Und
Paris! Bald würde der Skandal sich legen im Feuerkreis dieser Stadt, die er liebte und nicht missen
konnte trotz der tiefen, stillen Ruhelosigkeit seines
Wesens und seiner hektischen Launenhaftigkeit. Bald
würden die Wellen sich wieder glätten und der Leviathan in den Wogen verschwinden.

Die Letzte der Sühneprozession schien jetzt überstanden:

Nach der Herzogin-Witwe de Luynes, der kostbaren Mumie und Säulenheiligen des Faubourg Saint-Germain, die mit einer leise belächelten, hartnäckigen
Pietät immer noch am Todestag Ludwig #sc[XVI]#ednote[König von Frankreich (1754 – 1793).] in
Trauerkleidern zur Sühnemesse ging, kam noch die
Herzogin Clara de Rauzan, die sapphische Oden dichtete, jakobinische Phrasen im Mund führte und einen
grünen Schleier trug. Chopin wollte aufatmen.

Da wurde die Frau Generalkonsul Marliani gemeldet. Das war der Taifun, der das Schiff knapp vor
der Einfahrt in den Hafen wieder in das Brausen der
wildesten Meereswogen zurückschleudert.

Ein kleines zartes Püppchen in pfauenblauer Seide
mit echten, alten Spitzen wirbelte herein, kreischte
entzückt auf, den Meister nach diesem Ärger so
frisch zu sehen, umarmte ihn vehement liebenswürdig und bedauerte, diesmal die Veilchen vergessen
zu haben.

"Die Rauzan war hier?" ächzte sie mit einem Ausdruck unbeschreiblicher Bosheit. "Sie wollte Winke
für die Börse von meinem Mann haben. Aus Mitleid
hat er ihr spanische Papiere angeraten; er fällt immer
auf Herzoginnen herein, namentlich auf zweideutige,
mein Mann, dieser Erzliberale! Ich habe es ihm sehr
übel genommen. Aber er ist glücklich, wenn er auf
Spanien zu sprechen kommt und sagen kann, daß der
spanische Finanzminister Mendizabal sein Freund
ist. –"

Chopin senkte den Kopf; der bläuliche Schatten
der gesenkten Wimpern fiel auf seine blassen Wangen.
Ein zorniges Flackern zuckte auf und verschwand.

Die Frau Generalkonsul beherrschte durch ihre
skandalsüchtige, zudringliche Neugier und den
Schrecken, den sie einflößte, die zehn großen Salons,
die damals die öffentliche Meinung in Paris bedeuteten. Dieses kleine, so harmlos flötende Wesen
verstand es, aus kleinem Wispern bedenkliche Gerüchte, aus Gerüchten dauernden Lärm zu machen
und den letzten Fetzen guten Rufs auf dem Scheiterhaufen des Skandals zu verbrennen.

"Sie haben diesem Schmierer Janin das Handwerk
gelegt," sprudelte sie hervor, atemlos, auf ihr Thema,
zu kommen. "Janin ist erledigt. Er wird nichts mehr
schreiben. Aber wissen Sie auch, Meister, daß ganz
Paris neugierig ist, wer denn dieser sonderbare
Mensch im 18. Jahrhundert ist, der Ihnen seelenverwandt ist? –"

Chopin machte eine Bewegung mit der Hand, die
von erlesener Feinheit war.

"Vielleicht möchte ich es selbst wissen –"

Die Marliani biß sich auf die Lippen.

"Da es doch Sie angeht, Meister, kann ich Ihnen
zu Diensten sein. Haben Sie von dem Wahrsager und
Hellseher Alexandre gehört? Noch nicht? Oh! ich wundere mich. Bis jetzt ging es ihm ja herzlich schlecht.
Er machte Hochzeits- und Leichencarmina, war Weinkoster, Auslaufer und Straßenredner. Wenn die Leute
seinen eisigen, verbitterten Blick sahen, hatten sie
ärgerliches Unbehagen und die Kellner wollten ihn
nicht mehr ins Café Royal hereinlassen, weil sein
grün verschossener Mantel, in dem wohl Katzen ihr
Wochenbett gehalten hatten, Anstoß erregte und weil
er mit seinen genagelten Schuhen das Mosaikpflaster
vertrat. Aber der Janin'sche Artikel hat Wunder bei
ihm gewirkt. In drei Tagen hat er das 18. Jahrhundert
studiert und nach Wundermännern abgesucht, die auf
Chopin passen könnten. Er hat ihn gefunden. Es ist
der portugiesische Abenteurer Graf Saint-Germain,
der Alchimist, Gaukler, Astrolog, Goldmacher –"

"Wie widerwärtig das ist," unterbrach Chopin.
"Wenn er gar der Ewige Jude war, wie in dem Artikel stehen soll, mag er viele Schuhsohlen durchgelaufen haben. Übrigens habe ich einmal gelesen, daß
dieser Graf Saint-Germain sehr kostbar gekleidet war
und ein großes Kästchen voll persischer Diamanten
hatte. – Ich selbst besitze keine persischen Diamanten – schon darin bin ich ihm unähnlich –"

Die Marliani runzelte die Stirne, bekam schmale
Eidechsenaugen.

"Spotten Sie nicht! Auch Saint-Germain (dieses
_auch_ betonte sie mit einem Ausdruck erlesener Bosheit) besaß den luziferianischen Hochmut, von dem
Janin schreibt. Alexandre hat gelesen, daß er sich
schämte, ein Mensch zu sein, nur drei Sorten Kaffee
trank und jeglichen vertraulichen Umgang mit Männern und Frauen mied –"

"Dann hatte er ja Talent zu einem Trappistenmönch," spottete Chopin. "Finden Sie es der Mühe
wert, über diesen ärgerlichen Sonderling sich den
Kopf zu zerbrechen?" –

"Er muß doch sehr interessant gewesen sein,"
schmollte die Marliani, die ihre Mission gescheitert
sah. Denn auch dieser Alexandre, ein noch jüngerer
Mann mit Apostelbart und einer dröhnenden Baßstimme, brannte darauf, von ihr Näheres über Chopin
zu erfahren und Marliani wollte ihm gern gefällig
sein.

"Darf Alexandre einmal den Meister besuchen?"
rief sie noch von der Treppe herauf.

Entsetzt zog Chopin hinter sich die Türe zu.

"Diese Person, wird mich noch aus Paris vertreiben," murmelte er. – Wieviel Leidvolles es doch
gab auf dieser elenden, steinernen grausamen Erde!

Frau Marliani war nämlich auch abwechselnd die
Busenfreundin und Todfeindin einer Frau, der Chopin
sich jetzt schon das neunte Jahr angeschlossen hatte,
einer Frau mit einem Mulattengesicht, wulstigen Lippen und matten Kuhaugen.

Vielleicht saßen sie jetzt schon im Café Caveau zusammen und tuschelten über ihn: die dicke, schwarze
klobige Frau mit den Wulstlippen und dem massiven
Hals einer Bäuerin und die zartflötende, leichtflatternde Sylphide Marliani: die schwarze, lauernde Eule
George Sand und das Giftschlänglein Marliani.



= Der träumende Drache

Eine Woche verging ruhig. Das Giftschlänglein
Marliani kroch nicht mehr zu Chopin, dem zarten
Sylphen, hinauf und die schwarze Lauer-Eule George
Sand zog sich immer mehr und auffälliger in ihr
eignes Nest zurück.

Die Eule dachte: Ich bin ein plebeischer Vogel und
passe nicht zu diesem aristokratischen Sylphen Chopin. Fast neun Jahre schleppt sich unser Verhältnis
hin. Oh! Damals, als er mich das erste Mal sah, zog
er die Nasenflügel hinauf: "Welch widerwärtige Person!" Ich war ihm zu plebeisch. Die Goldfasaninnen
und Paradiesvögel aus dem Faubourg gefielen ihm
besser. Ich aber war hartnäckig und fing den Sylphen
ein. Aber ach! Er schwebte wie alle Sylphen zwischen Himmel und Erde. Kaltes Blut war in seinen
Adern. Er war wie ein Marmorblock und ich bedeutete ihm nicht mehr als eine Fliege, die um ihn
herumsummte. Warum blieb der Sylphe bei mir? Ich
ertrug seine Launen, sein Klavierspiel, das oft die
ganze Nacht währte, und sein schleichendes Lungenübel. Bald bin ich nur noch seine Krankenpflegerin.
Aber ich werde Schluß machen mit ihm. Seine fixe
Idee ist: die schreckliche Aussicht, im Spital zu sterben und lebendig begraben zu werden! Darum bleibt
er bei mir. Aus keinem anderen Grunde. Oh, wenn ich
an diesen blaßblütigen, marmorkalten Sylphen denke
und an diesen Gaukler Alexandre, diesen stämmigen
Burschen, dem das Giftschlänglein Marliani nachkriecht!

Die böse schwarze Eule Sand machte aber noch
nicht ganz Schluß mit dem armen, zarten Sylphen
Chopin, der sich so sehr vor dem Sterben in Einsamkeit und unter fremden Händen fürchtete.

Ein neues Ereignis trat ein, das die böse schwarze
Eule ablenkte und sogar mit dem Giftschlänglein
Marliani wieder einmal entzweite.

Ein skandalöses Buch "Gastmahl der Schatten"
tauchte in Paris auf, ein Buch voll unerhörter Greuel,
Blasphemien und Teufeleien. Kein Autor war genannt, auch kein Drucker. Beide hätte die Polizei sofort verhaftet. Es war auch in keinem Buchladen zu
sehen, wo man es gleich hätte konfiszieren können.
Aber man fand es auf den Bänken der Anlagen, in den
Haustüren, in den Amtsgebäuden, ja selbst auf den
Bänken der Kirchen.

O welches Feld der Betätigung für die Marliani!
Ganz Paris wußte, daß der Hauptheld des Skandalbuchs kein anderer war als – Saint-Germain. Der
Name dieses Abenteurers, den bisher der graue Staub
der Vergangenheit bedeckt hatte, lebte neu auf. Man
erinnerte sich plötzlich, daß er in Paris ein Laboratorium gehabt hatte, und daß er ein Günstling Ludwig #sc[XV]#ednote[König von Frankreich (1710 – 1774).] gewesen war.

Davon handelte ja auch das Buch, dessen Hauptinhalt, wenn man das skandalöse Detail wegließ, war:
Ludwig #sc[XV] wird von dem Rosenkreuzer und Illuminaten Saint-Germain, der schon einen russischen
 Zaren beseitigen half, in einem Zustand völliger Willenlosigkeit versetzt, so daß er unfähig wird, irgend
eine ernstere und wichtigere Regierungshandlung vorzunehmen. Saint-Germain erreicht dieses Ziel durch
sein "Geistertheater". Er zitiert vor den Augen des
Königs mit der Laterna magica Verstorbene; eine
leise Musik ertönt dazu; geheimnisvolle Stimmen werden laut. Schwarze Harfen klingen von selbst, von der
Decke herab fallen häßliche Kröten und verschwinden
auf einen Wink des Magiers wieder. Dann setzt sich
Saint-Germain an das Spinett, sieht dem König starr
ins Auge und spielt eine seltsame, betörende, unerhörte Weise.

Der König wird dadurch gebannt, wie der Vogel
vom Anblick der funkelnden, lockenden Schlangenaugen.

"Du hörst mein Lied: 'Das Gastmahl der Schatten!'"
sagt Saint-Germain mit unheimlicher Stimme und der
König sinkt bei diesen Worten zusammen wie unter
dem Hauch eines Gottes.

Die graue tote Stimme Saint-Germains fährt unerbittlich fort: "'Das Gastmahl der Schatten' bedeutet,
daß alles, was dich umgibt, alles, was du verehrst,
nichts ist als wesenloser Schatten. Du hast die Macht
geliebt, den Kriegsruhm, die Gelehrten, die Frauen,
die Freuden der Tafel, die Jagd, die Bauten, wisse,
daß alles hohl und nichtig, daß es Mist auf dem
Düngerhaufen ist! Du sitzest an der Tafel mit deinen
Mätressen, deinen Philosophen, Generälen, Jägermeistern. Ihr wollt trinken: in den Bechern ist Asche.
Auf der Tafel stehen Blumen: ihre Kelche sind verwelkt –"

Der König hört es, aber er widersteht noch dem
dämonischen Zwange. Da spielt ihm der Magier das
verhängnisvoll-lockende Lied noch einmal vor, bis
Ludwig #sc[XV] mit stieren Augen lallt: "Du hast recht,
Graf Saint-Germain. Alles ist mir zum Ekel. Morgen
werde ich Paris anzünden lassen. Heute Nacht schon
will ich meine Minister erdrosseln lassen. Ich werde
ein Gastmahl geben und die Gäste unter Rosenblättern ersticken wie Nero. – Morgen mittag werden
wir, wenn es dir paßt, nach Gott mit Pfeilen schießen –"

Aber auch der Bürgerkönig Louis-Philippe wurde
in diesem unheimlichen Buche nicht geschont: der
scheußliche Skandal der Baronin v. Feuchère, die
früher Straßendirne und Nackttänzerin in London gewesen war, wurde hervorgezerrt, das Komplott dieser Abenteurerin mit dem König, um den millionenreichen Vetter des Königs, den Herzog v. Condé, aus
dem Weg zu räumen und zu beerben, schonungslos
enthüllt. Wie man einer Mumie Binde für Binde abnimmt, bis man den scheußlich vertrockneten Leib
sieht – –

Im Juli 1830 war die schreckliche Mordnacht im
Schlosse des Herzogs v. Condé gewesen: die Diener
hatten frühmorgens den alten Mann am Fensterkreuz
erhängt gefunden.

"Selbstmord!" schrie ihnen die Baronin v. Feuchère, die Favoritsultanin und Mörderin des Herzogs,
entgegen.

Die Diener nickten verstört. Es war, als wiche die
Luft aus der Nähe dieser Teufelin.

"Es ist Mord!" sagte ein Lakai etwas später zu der
Zofe, die mit ihm durchs Schlüsselloch gesehen hatte.
Beide fand man im See des Parks ertränkt. Der König
konnte den Thron verlieren, wenn dieser Skandal, der
die Halsbandaffäre noch überbot, nicht unterdrückt
wurde,

Und es gelang. Die Ministerien, die Polizei, die
Richter und Gutachten der Ärzte arbeiteten zusammen. Der Herzog war ein Selbstmörder, die Baronin
und der König unschuldig. Langsam schlief der Skandal ein. Und jetzt, nach 16 Jahren, kam das schlecht
verscharrte Aas wieder zum Vorschein! Jetzt, wo die
Popularität des Königs im Sinken war, die National-Garde sich unzuverlässig zeigte, die Abgeordneten-Kammer mit den Zähnen knirschte und selbst die
nächsten Paladine des Königs, die Pairs, hüstelnde
Solons, kniesteife, graue Schleicher, die bisher nur in
ihren Sitzungen erschienen, wenn ihre Gehaltsaufbesserungen und Dotationen beraten wurden, dem König
eine sauere Miene zeigten!

Louis-Philippe konferierte stundenlang mit dem
Polizeiminister, was mit der Baronin v. Feuchère, der
schrecklichen Mitwisserin, geschehen sollte. Das teuflische Weib besaß nämlich ein unvorsichtiges Briefchen des Königs, das seine Mitschuld klar bewies.
Einen Tag vor der Mordnacht hatte es der König geschrieben; die Stelle lautete:

"Sorgen Sie, daß er nicht abreist!"

Der Herzog v. Condé nämlich, der Mätresse überdrüssig, wollte nach London abreisen und dort das
alte Testament, das dem königlichen Vetter 28 Millionen, der Baronin Feuchère 7 Millionen zusprach,
in aller Form umstoßen.

Wenn auch noch dieser schreckliche Brief veröffentlicht würde! Es waren Indizien da, daß das fürchterliche Weib damit umging, ihn an die englische Regierung zu verkaufen!

Der Polizeiminister, zu einer abschließenden Beratung befohlen, erlebte einen der aufregendsten Tage
seiner ganzen Beamtenlaufbahn.

Warum hatte man dieses Schandgeschöpf, die
frühere Londoner Nackttänzerin, nicht längst zum
Schweigen gebracht? Warum lebte sie noch? Der Polizeiminister zuckte die Achseln und seufzte tief auf.

Eine neue Mordnacht? Es gab keine Oubliettes#ednote[Kerker.]
mehr wie zu Richelieus#ednote[Katholischer französischer Aristokrat, Kirchenfürst und Staatsmann (1585 – 1642).] Zeiten. Damals lockte man
solche Schandgeschöpfe in eines der königlichen
Schlösser in der Provinz. Dort war unter der Treppe
eine sinnreiche Vorrichtung angebracht, daß, wer auf
eine bestimmte Stufe trat, unfehlbar in eine kellertiefe Versenkung stürzte.

"Stellen wir die Affäre Feuchère auf morgen zurück!" entschied der König. "Aber was haben Sie getan, um den Pamphletschreiber zu ermitteln? Wenn
ein zweites Pasquill#ednote[Schmäh- oder Spottschrift, die verfasst wird, um eine bestimmte Person zu verleumden oder in ihrer Ehre zu verletzen.] erscheint, sind Sie Ihrer Stelle
enthoben."

"Ich habe vor allem den Polnischen Klub unter die
Lupe genommen, ferner ihr Lokal in der Rue du Rocher und Rue de Miromenil. Man hat einen Lehrer an
der polnischen Schule in Batignolles verhaftet. Es war
leider ein Fehlgriff. In dem Schandbuch ist die Rede
davon, daß man Läuse zu Millionen in einer großen
Kiste züchten und auf Paris loslassen und daß man
die Stadt von den Katakomben aus in die Luft
sprengen soll. Ich lasse die drei Ausgänge, besonders
den in der Ebene von Montsouris überwachen. Gegebenenfalls kann vom Montmartre aus eine wahre
Sündflut hinabgeleitet werden, daß man das Gesindel
dort unten wie Ratten ersäuft oder ans Tageslicht
herauf‌treibt."

"Der Schandschreiber muß Geld haben. Oder wenigstens sein Hintermann. Über tausend Exemplare
sind verteilt worden, wie Sie sagen. Haben Sie daran
gedacht?"

Der Polizeiminister stutzte. Daran hatte er noch
nicht gedacht. Der König besaß die ererbte Schlauheit
der Orléans und hatte in den langen Jahren seines
Wartens auf die heißersehnte Krone auf seiner Odyssee in ganz Europa und Nordamerika als republikanischer Freiwilliger, Geächteter, Schullehrer und Carbonaro noch um ein beträchtliches dazu gewonnen, bis
es ihm, dem schon stark Bejahrten, endlich gelungen
war, mit seinen kurzen Beinchen den Lilienthron seines Vetters zu erklettern, den er jahrelang wie eine
Katze den Vogel umlauert und mit den Pfeilen der
Zeitungsangriffe, der Verleumdung und der Hofkabale gespickt hatte.

"Ich habe daran gedacht," sagte der Polizeiminister
etwas kleinlaut. "Indes für solche Schandtaten
kratzen diese Revolutionäre gerade bei den Ärmsten
das Geld zusammen. Damals bei der Verschwörung
der Türme (von den Türmen der Notre-Dame flatterten am hellen Mittag tausende von Pamphleten auf
das Publikum herab) fand man die Druckerei in der
Rue Froidmanteau, einer kleinen, erbärmlichen
Gasse –"

Der König sah ihn an, ärgerlich und verfinstert;
der Minister antwortete durch ein verzerrtes, haltloses Lächeln.

Dann trat der Bürgerkönig ans Fenster, zu dem
ein  schattenhaftes Flüstern hereinkam. Der Wind
schüttelte die Bäume hin und her, diese Bäume, die
vielleicht schon zur Zeit Mazarins und der Fronde dastanden, und in diesem Hin- und Herwogen bildeten
sich Gestalten wie die Phantasien eines Traummalers.

Oh! Welche Pamphlete erschienen damals gegen
den allmächtigen Minister und Vormund des jungen
Sonnenkönigs! Gaukler, Wucherer, Enkel eines sizilianischen Halsabschneiders, das waren noch nicht die
schlimmsten Giftblüten dieser wütenden, versteckten
Angriffe.

Mazarin aber lachte darüber, ließ die Pamphlete
aufkaufen, wartete, bis fast kein Exemplar mehr zu
bekommen war. Zu Phantasiepreisen schlug er sie
dann los.

Von jeher hatte der Bürgerkönig viel übrig für diesen feinen geschäftstüchtigen Vorgänger, vielleicht
auch Verwandten. Denn ging nicht von jeher das
hartnäckige Gerücht, daß der Sizilianer Mazarin auch
der Vater des Sonnenkönigs war?

Andere Zeiten! Vielleicht dachte jetzt Louis-Philippe daran. Die Bäume im Park wogten im Winde,
dann tauchten sie wieder in das tiefe, graue Schweigen zurück, das sich über den Tuilerien ausbreitete.

Plötzlich, wie von einer Eingebung erfaßt, sah der
Minister auf den Papageienkäfig am Fenster. Er war
leer. Der König hatte das Tierchen an die Herzogin
v. Duras verschenkt, da er seinen beständigen Schrei:
Louis v. Orléans! nicht mehr ertragen konnte, seit
ein tragischer Unglücksfall ihm 1842 eben diesen
Louis v. Orléans, seinen Lieblingssohn und Thronfolger, entrissen hatte.

"Woran denken Sie? Haben Sie eine Idee? Es wäre
sehr zu begrüßen!"

"Ich wage es noch nicht auszusprechen. Es wäre
ja undenkbar, unerhört, mehr als teuflisch" – wich
der Minister aus.

"Reden Sie nur! Die scheußlichsten, undenkbarsten
Dinge sind oft die wirklichsten und wahrscheinlichsten" drängte der König.

"Ich kam darauf durch diesen Papageienkäfig.
Eben jetzt. Ew. Majestät ist der Name des Generals
Swerdlow, der früher in Warschau als Adjutant des
Großfürsten Konstantin und eifriger Verfolger der Polen General Ukrainzeff hieß, bekannt?"

"Wieder die Polen!" Der König machte eine Handbewegung als wollte er etwas Lästiges beiseite schieben. "Ja. Ich erinnere mich. Ich gab ihm Audienz, als
er vor einigen Jahren nach Paris kam. Ein dicker,
leberkranker Fleischberg. Ein Nerokopf. Ein Scheusal. Es fehlte ihm nur die Harfe, die Nero hatte, und
die Stadt Rom, um sie anzuzünden. Hatte Ringe an
den geschwollenen, parfümierten Fingern. Gräßlich
war er mir. Meine Schwestern erfuhren Greueltaten
von ihm, die er in Warschau und Petersburg verübte.
Er soll die Folter für die polnischen Gefangenen in
Warschau eingeführt haben –"

Der Polizeiminister senkte verlegen den Kopf.

"Trotzdem nahmen wir ihn in unsere Dienste. Er
hat unserer Polizei große Dienste geleistet. Er hat
ein Geheimmittel, polnische Verschwörer zu entdecken, dem selbst wir nicht auf die Spur gekommen
sind –"

"Dieses Scheusal arbeitet für Ihre Polizei?" rief
der König von dem Schauer einer edlen Aufwallung
gepackt.

"Ew. Majestät belieben zu bedenken, daß wir einen
Teufel durch den anderen Teufel austreiben müssen.
Er hat uns vier der schlimmsten polnischen Verschwörer angegeben, die wir an den russischen Galgen
liefern konnten –"

Der König erhob leise warnend den Finger und
sah mißtrauisch nach der Tapetentüre.

"Swerdlow spielt seine Rolle ausgezeichnet. Er
schmeichelt sich bei den Polen ein und heuchelt Bekehrung. Von der Millionenerbschaft seines Bruders,
die ihm jüngst zufiel, unterstützt er arme Polen. Er
hat sogar einen jungen polnischen Landstreicher, der
Klavier spielt und Verse schreibt, bei sich aufgenommen –"

"Klavier spielt? Verse schreibt? Fahren Sie fort!
– Das ist unser Fall! –" drängte der König. "Schnell!
Schnell! Ich sehe eine Spur. Sogar mehrere! Ein polnischer Klavierspieler, vielleicht ein Chopinspieler,
ein Verseschreiber, jedenfalls auch ein Pamphletschmierer –"

"Aber dann müßte dieser General Swerdlow, der
die Polen an die russischen Galgen liefert, auch uns
in schändlichster Weise verraten. Die Gemeinheit
wäre unausdenkbar, einfach unmöglich –"

Der König runzelte die Stirne.

"Sie sind sonderbar. Voltaire sagt, daß niemand
sich rühmen könne, die Tiefen der menschlichen
Dummheit und Bosheit ergründet zu haben. Glauben
Sie mir, es ist ein großes Glück, daß die Erde rund
ist und sich so schnell um ihre Achse dreht. So kann
sie wenigstens einen großen Teil der menschlichen
Gemeinheit, Erbärmlichkeit und Niedertracht von
sich abschütteln und ins Universum hinaussenden.
Wäre dies nicht der Fall, so würde dieser Schmutz
bis über die höchsten Berge hinauf sich anhäufen und
der Gestank bis zu den Mondbewohnern dringen.
Schnell also! Was haben Sie bei diesem russischen
Monstrum entdeckt?"

"Auch dieser Russe hat einen Papagei und dieser
Papagei hat, als ich vor 14 Tagen dort war, um wegen eines polnischen Verschwörers zu verhandeln,
zweimal: Saint-Germain! Dubarry! Chopin! geschrien. Diese drei Namen und schnell nacheinander!
Drei Namen, die himmelweit von einander entfernt
sind und die so leicht niemand nacheinander ausspricht, da sie gar keinen Zusammenhang haben –"

"Außer in dem Schandwerk," wollen Sie sagen.
"Das sind Felsblöcke von Beweisen. Warum kamen
Sie nicht gleich darauf? Ah! Wegen der guten Meinung, die Sie von den Menschen haben. Ah! Sie sind
noch ein Anhänger Rousseaus: 'Der Mensch ist dumm
und gut.' Ich halte es schon mehr mit Voltaire. Der
sagt: 'Der Mensch ist gewitzt und böse.' – Übrigens
kommt auch die Dubarry in diesem Schmutzwerk
vor? Die Beweiskette wäre dann geschlossen –"

Der Polizeiminister zog ein Exemplar dieser Schrift
hervor und blätterte darin.

"Hier steht von ihr!"

"Lesen Sie vor!" gebot der König.

Der Polizeiminister las langsam:

#quote(block: true)[Diese raffgierige Schmeißfliege, die mit ihrem
enormen Saugrüssel die Millionen des Staatsschatzes,
Schlösser, Ländereien, Diamanten, Gemälde fraß, war
jetzt durch dieses sonderbare Lied Saint-Germains
auf einige Zeit kaltgestellt. Sie ließ all ihre Künste
springen: sie sang Gassenbubenlieder, fluchte wie eine
Marketenderin, blies auf dem Kamm, führte den König zu zehnjährigen Mädchen im Hirschpark, setzte
der 80 jährigen Marquise d'Urfé Maikäfer in ihre von
Goldfäden durchzogene Perücke, alles nutzlos. Der
König starrte sie an, wirr und welk, leer wie ein umgestürzter Becher, wie ein zersprungenes Glas, aus
dem Tropfen für Tropfen das Wasser fließt. Er
gähnte nur: 'Saint-Germain soll mir das Lied spielen –']

"Genug!" Eine schneidende Handbewegung des
Königs verbot auch jedes weitere Gespräch über diesen schmachvollen König. "Was wissen Sie von dem
polnischen Landstreicher, den der Russe beherbergt?"

Der Polizeiminister wischte den Schweiß von der
Stirne.

"Nur das, was ich schon zu sagen die Ehre hatte.
Er spielt Klavier und macht Verse. Jedenfalls benutzt ihn der General als Lockvogel für die Polen –"

"Und die Polen glauben ihm dann eher, daß er
ihr Freund ist. Übrigens sahen Sie damals diesen
Polen beim General?"

"Er spielte im Nebenzimmer Klavier. Etwas von
Chopin. Eine merkwürdige, fast drohende Melodie,
wie eine Horde schwarzer Riesentiere, über die ein
Gewitter hinzieht. Dann wurde es ein schwächeres
Wetterleuchten über unheimlich gefärbte Wolkenstreifen, die wie Schwertlilien aussahen oder wie
arme Seelen, die zitternd und entfleischt dem Fegfeuer entsteigen –"

Der König stampfte mit dem Fuße. "Das haben
Sie wahrscheinlich in dem Chopin-Artikel dieses
elenden Janin gelesen. Er ist der geistige Urheber
auch dieses verfluchten Pamphlets. Ihre Floskeln von
Schwertlilien und armen Seelen sind mir langweilig.
Ich liebe Musik überhaupt nicht, am wenigsten aber
diese karamelensüße, parfümierte Totenmusik von
Chopin. Einmal spielte er vor mir, zusammen mit
dem Pianisten Ignaz Moscheles, weil meine Frau
und meine Schwägerin mich drängten. Aber dies war
das letztemal. Nie wird dieser Herr Chopin die Tuilerien wieder betreten. Und nun will ich Ihnen weiter
auf die Spur helfen: dieser verfluchte polnische Landstreicher, der bei Swerdlow wohnt, hat das Pamphlet geschrieben. Er hat es in der Wohnung des Generals mit ihm durchgesprochen; der Papagei hat die
Worte aufgeschnappt. – Ein Glück, daß ich und der
Papagei da bin –"

Der Polizeiminister verneigte sich, von diesem blutigen Hohn wie von einem Peitschenschlag getroffen.

"Was soll mit dem General geschehen?" stammelte
er mit bleichen Lippen.

Der König sammelte seinen Blick und gab noch
keine Antwort.

"Ich halte ihn für geisteskrank. Das ist das einfachste. Man muß große Rücksicht auf meinen Vetter,
den Zaren in Petersburg nehmen –"

Die Worte kamen langsam und erzwungen. Ein zorniges Funkeln glomm in den Augen Louis-Philippe’s.
Dann versank er wieder in Nachdenken.

"Dieser Landstreicher aber – hah! Die Königsmörder ließen meine Vorfahren vor hundert Jahren noch
von 4 Pferden in Stücke reißen. Vorher mußten sie,
eine brennende Kerze in der Hand, kniend vor dem
Bild des Königs Abbitte leisten. Heute ahnden meine
Gerichte solche Schändung meines königlichen Namens mit einer Geldbuße –"

"Ich werde ihn in Polizeihaft nehmen, die sehr
lange dauern wird und für ihn den Vorteil hat, daß
er ungestörte Ruhe und Einsamkeit für neue schriftstellerische Produkte hat –"

"Sie haben freie Hand!" sagte der König nur, mit
einem gespannten, starrenden Blick aus seinen Augenwinkeln.

"Daß ich so blind war! Daß der Birnkopf mir darauf helfen mußte!" murmelte der Polizeiminister,
als er die Treppe der Tuilerien hinabstieg. "Was ich
damals im Treibhaus des Generals sah, hätte mich
schon stutzig machen sollen!"

Mit diesem Treibhaus hatte es in der Tat eine sonderbare Bewandtnis. Gleich nachdem ihm die Millionenerbschaft ausgezahlt worden war, kaufte sich
General Swerdlow ein früher dem Grafen v. Artois
gehöriges prunkvolles Hotel unweit des Faubourg
Saint-Germain.

Ganz Paris sprach davon, wie er sich diese etwas
altväterlichen Räume einrichtete. Es kamen Kandelaber, die vielleicht aus türkischen Moscheen geraubt
waren, venetianische Kronleuchter, golddurchwirkte
Vorhänge. Massiv silberne Schränke mit geschnitztem
Elfenbein wurden aufgestellt, und wetteiferten mit
rotausgeschlagenen, flammenden wie in schwere
Träume versunkenen Glasschränken, mit Vasen, Statuetten und Emailarbeiten im Stil Louis #sc[XV].

Aber der General hielt sich fast mehr in seinem
Treibhause auf als in diesen prunkvollen Räumen. Die
Diener schüttelten die Köpfe, wenn sie ihn täglich
fast zur selben Stunde den Garten mit dem Springbrunnen und den verstümmelten Statuen durchschreiten und im Pavillon verschwinden sahen. Sie lauschten anfangs an der Türe des Treibhauses, dann schlich
einer nach dem andern fort. Jetzt wichen sie ihm sogar aus. So unheimlich starrte schon die Türe, als
wäre sie der Rachen eines versteinerten Tieres. Alle
Schrecken einer bösen, ungezähmten Welt, von denen
sonst nur die Phantasten heimgesucht werden, überfielen auch sie.

Schon der Faulbeerbaum mit seinen verrenkten
Gliedern und die zwei Orangenbäume an der Türe
mit ihren hyazinthenen Schatten sahen ganz anders
aus als die anderen Bäume. Wie Epileptiker wanden
sie sich in Krämpfen.

Man konnte die Rosen innen an der Wand hinaufklettern sehen. Gelb wie Eiter waren sie, von giftigen Säften aufgetrieben. Diese Blüten dort glichen
Mumien. Aus diesen Purpurblüten, die wie verruchte
Glocken aussahen, quollen giftige Fliegenschwärme
heraus.

Waren es böse Geister? Diese violetten Blumen in
der Ecke neben den gelben Rosensträuchern waren
wie die gierigen Hände von Giftmischerinnen.

Jeden zweiten Tag kam ein Mann mit einem Stiernacken und einer dröhnenden Baßstimme.

Er ließ ein Klavier in diesem Treibhaus aufstellen
mitten unter diese namenlos fremden und unheimlichen Blumen und brachte auch ein altes Bild: Ein
blasser, starrblickender Mann, schilfdürr, in einer verschollenen, schlotternden Hoftracht und mit einem
blauen Ordensband.

Einmal erlauschte es die Zofe, wie der Stiernackige
zum General sagte: "Es muß im Treibhaus versteckt
sein. Saint-Germain hatte hier sein Laboratorium. In
dem Buch, das die Marliani gestern beim Antiquar
Russelton in der Rue de la Paix fand, steht es."

"Russelton? Ist es keine Fälschung?" fragte der
General mißtrauisch.

"Wir werden daraus das Rezept für Goldmachen
und das Jugendelixier gewinnen" erwiderte der
Fremde mit großer, tragischer Geste dessen, der sein
Genie angezweifelt sieht.

Der fahle, gedunsene Fleischberg lachte häßlich:

"Viele sagen, Russelton sei ein Fälscher, ein englischer Mucker."

Dann traten sie ein und schlossen die Türe hinter
sich. – – –

Heute, fast um dieselbe Zeit, wie der Polizeiminister in den Tuilerien war, konferierte Swerdlow
wieder mit Alexandre, der, seit er erklärter Günstling
der Frau Generalkonsul Marliani geworden war, seinen legendären grünverschossenen Mantel einem
Bettler schenkte und sich den Titel "Professor der
Magiologie und des Mesmerismus" beilegte.

"Wie lange ist dieser anmaßende Junge mit seiner
polnischen Stülpnase und seinem gotteslästerischen
Maul schon bei Ihnen? Er grüßt mich kaum und
wagt es, mein Jugendelixier anzuzweifeln. Bereits hat
mir Frau Marliani für einen Fingerhut voll 100 Fr.
bezahlt –"

"Oh! Flavio Sikorski!" ächzte der leberkranke
Fleischberg. "Drei Wochen ist er hier. Es sind Gründe
der Staatsräson, Gründe der Politik, der –"

"Genug! Genug! Darum muß ich seine Frechheit
ertragen –" murrte der Stiernackige.

"Flavio Sikorski spielt mir Chopin vor. Ich mag
sonst keine andere Musik hören. Chopin ist Lethe für
mich. Ich vergesse Schreckliches, Schauerliches.
Ich habe an Flavio gutzumachen, was ich an seinen
Eltern beim polnischen Aufstand gesündigt habe. Es
waren reiche, polnische Großgrundbesitzer. In Litauen war es. Sie gewährten aufständischen Polen Unterschlupf. Warum übrigens mußten Sie das tun?"

Der General unterbrach sich "Sie gehen, Meister
Alexandre? Warum gehen Sie? Wir hätten heute am
Jugendelixier Saint-Germains brauen können. Wir
wollten doch den Extrakt der gelben Rosen beimischen –"

"Ich komme, wenn dieser Pole das Haus verlassen
hat –" rief Alexandre wütend und warf die Türe
hinter sich zu.

"Gut! Geh! Du bist ja doch auch ein Schwindler!"
murmelte Swerdlow. #quote[Dein Jugendelixier kostet mich
nur Geld. Dein Saint-Germain ist ein Phantast. Auf
der großen Messe in Moskau und damals in Konstantinopel habe ich ein Dutzend solcher Gesellen herumlaufen sehen. Sie treiben Schlangenzauberunfug, lassen Geister erscheinen, schlucken glühende Kohlen –
und die Zuschauer werfen ihnen die Geldstücke in
den Mund. Nein. Geh nur, guter Professor der Magiologie! Vorläufig bleibt Flavio noch bei mir, bis ich das
Mißtrauen der Polen vollends eingeschläfert habe.
Und ich will noch Chopin vorgespielt haben. Es ist
Lethe! Trank des Vergessens! Oh! Ich habe viel zu
vergessen – – Habe ich diesem einfältigen Alexandre
nicht zuviel gestanden? Daß ich die Eltern dieses Flavio abschlachten ließ, daß ich seinem Vater, bevor
ich ihn aufhängen ließ, selber die Füße abschnitt,
weil der Ast zu niedrig war? – –

Hätte ich gewußt, daß der Sohn so gut Chopin
spielt, so hätte ich die Eltern gewiß verschont. Dafür
habe ich Flavio mein Vermögen vermacht, das Geld
und den Palast. Schon, um diesen anmaßenden
Alexandre zu ärgern –

Oh! Ich bin schlecht. Gott wird mich am Jüngsten
Tag mit Fäusten schlagen! Vielleicht enterbe ich auch
Flavio wieder, wenn es mir beliebt. Wenn ich Chopin nicht mehr hören mag. Was er wohl dann für
Augen macht – –]

Da ertönte aus dem Rosengebüsch ein schrecklicher Schrei der Wut. Eine blasse Gestalt wie ein
Leichnam, den die Raserei lebendig gemacht hat,
stürzte auf den General zu. Aus dem verstörten, entsetzlich verzerrten Mund quollen sinnlos wütende
Worte: "Die Füße hast du abgehackt! Dein Blutgeld, – dein Testament, – du Schurke, Verräter,
Henker – stirb! Ersticke in deinem Fett und deinen
Sünden! Du hackst keine Beine mehr ab! Ich kam zu
dir, um dich zu strafen! Schurke! Untier! Verpestete
Seele!"

Flavio Sikorski hatte ein Holzscheit ergriffen, das
am Boden lag. Bei jedem seiner wütenden Schimpfworte schlug er auf den General ein, sinnlos in seiner
Raserei. Vielleicht hatte ihn schon der erste Schlag
und der Schrecken des Überfalls getötet und die
folgenden Wutschreie und Schläge trafen einen Leichnam.

Langsam nur beruhigte sich Flavio. Mit den Füßen
stieß er den Leichnam fort. – – –

Dort in den Tuilerien sprach der Polizeiminister
gerade von den seltsamen Schreien des Papageis. War
es eine unerklärliche, geheimnisvolle Fernwirkung,
daß Flavio jetzt wieder zur Besinnung kam? Er sah
in den Garten hinaus. Es war ein Wunder zu nennen,
daß niemand die schreckliche Szene belauscht hatte.

Da draußen im Garten wogten die Feuerströme
blühenden Mohns im wühlenden Wind. Der arme
Delphin briet weiter in dem ausgetrockneten Bassin
und der armlose Faun starrte weiter auf die Nymphe.
Flavio eilte zum Hausverwalter Casimir hinauf. Ihm,
seinem polnischen Landsmann, der seiner Mutter,
einer Italienerin, die Schmuckartikel und Kleider aus
Warschau besorgt hatte, durfte er vertrauen. Flavio
holte ihn ins Treibhaus herab.

"Ich habe ihn getötet. Aus Rache. Du weißt es, Casimir, du hast die Polen gesehen, die er gehenkt hat,
die starren, stolzen, spitzen Gesichter! Du hast auch
meine Eltern gesehen. Sein Testament nehme ich
nicht an –"

"Davon ein andermal! Er hat es mir zur Aufbewahrung gegeben. Wir verlieren Zeit. – Schnell!
Werfen Sie das blutige Holzscheit über die Mauer –"
drängte Casimir.

In diesem Moment wurde wütend an der Schelle
gerissen. Die Dienerschaft rief nach Casimir, den niemand im Treibhause vermutete.

"Die Polizei!" kreischte die Zofe auf.

Casimir warf seine Börse Flavio zu, der schon zur
Türe gesprungen war.

"Über die Gartenmauer und dann am Zaun vorbei!" rief er ihm nach.

Schon umstellten die Polizisten den Pavillon. Flavio
mußte jetzt schon über die Gartenmauer sein. Casimir weigerte sich, die Türe des Treibhauses zu
öffnen. Diese listig gewonnene Minute Vorsprung
rettete Flavio.

Dann trat der Kommissär zu dem Leichnam. Nur
ein Polizist folgte ihm. Sie durchwühlten die Taschen
des Toten. Casimir zertrat, so gut es ging, die Fußtapfen Flavios.

"Lassen Sie's gut sein, Herr Casimir!" sagte der
Kommissär fast schalkhaft. Er hatte ein Notizbuch
in der Brusttasche des Generals gefunden und zeigte
es, während seine Augen vor Genugtuung funkelten,
seinem Untergebenen.

"Unglaublich!" flüsterte dieser.

"Scheußlich! Unerhört!" wiederholte der Kommissär ganz laut.

"Wir sind sehr zufrieden, Herr Casimir," sagte er
in jovialster Laune: "Ein kleiner Mord an einer solchen Bestie, ein Mord noch dazu, der uns (er hielt
triumphierend die Brieftasche in die Höhe) eine derartige Enthüllung in die Hände spielt, wird nicht sehr
streng bestraft. Immerhin haben wir den Auf‌trag,
Herrn Flavio Sikorski zu verhaften. Ich vermute,"
fügte er listig lächelnd bei, "daß er noch vor kurzem
hier war und diesen Mann, der hier am Boden liegt,
den wir übrigens jetzt ins Haus hinübertragen wollen,
für immer von seiner Leberkrankheit befreit hat –"

Im Notizbuch des Generals hatte der Kommissär
die Belege dafür gefunden, daß die Baronin v. Feuchère, nicht zufrieden mit den 8 Millionen des Herzogs v. Condé, mit Swerdlow zusammenarbeitete und
das Blutgeld für die der Polizei denunzierten Polen
teilte.

Die Verfolgung Sikorskis wurde dank dieser hochwichtigen Entdeckung wohl nicht allzu streng durchgeführt. Denn sonst hätte ihn die so findige Polizei,
welche die Schatten wispern hörte und die Träume
belauschte, noch in dieser Nacht verhaften können.
Planlos, wie ein seiner Sinne nicht Mächtiger irrte
Flavio von Gasse zu Gasse, die lebhaften Straßen meidend. Vielleicht war gerade dies ein Fehler. Erst nach
einer halben Stunde dachte er daran, an einem Brunnen seine Blutflecken abzuwaschen.

Die Furien des bösen Gewissens, die wütend beflissen und wahllos streng hinter jeder Missetat und
jedem Fehltritt ihren Jagdeifer zeigen, schrien ihm
unablässig ins Ohr: "Mörder! Mörder!"

In einem dunklen Wald sinnloser Schrecken hetzten
sie ihn herum. Phantastische Schrecken des an seiner
Kunst und seiner Zukunft bitter Verzweifelnden gesellten sich den grausamen Quälereien dieser unholden Göttinnen hinzu. Niemals würde er ein Künstler
werden! Ewig würde er ein armseliger Stümper neben
Chopin sein, diesem Zauberer, Magier, Gotte! – –

Ja. Er hatte dieses Pamphlet "Gastmahl der Schatten" geschrieben, hatte die Könige, hatte Göttliches
und Menschliches in den Staub gezogen. Es war aber
keine politische oder religiöse Überzeugung oder gar
Fanatismus dabei: nur verbittert und tief unglücklich
war er, daß seine Künstlerträume in Paris zerrannen
wie Schnee in der Sonne.

Die _Kunst_ hatte ihn verlockt, das Furchtbare,
Gleißende und Trügerische, das man Kunst nennt, das
tolle, groteske, unheimliche Zufallsspiel der Kunst.
Chopin war das Irrlicht, dem er gefolgt war.

Wie bei einem Gottesurteil im Mittelalter war er
ohne Zögern über glühende Pflugscharen gegangen,
hatte wie ein Märtyrer um die Kunst gerungen. Die
böse Schimäre mit ihren giftigen, gelben Fledermausflügeln hatte ihm ins Ohr geflüstert, ihm Gold und
Ruhm in der rosenfarbenen, sonnentrunkenen Welt
verheißen, wo die Tuben des Glanzes und der Herrlichkeit tönen. Wie mit einer Flammengeißel hatte
sie ihn vorwärts gepeitscht. Der graue Alltag, die
schreckliche Not in Paris hatte seine Träume verschlungen, wie die Sonne den Meerschaum aufsaugt.
Jetzt war er nur noch ein kleines Sandkorn in grauer,
unabsehbarer, trostloser Wüste, ein _Mörder_! Rechts
von ihm schritt die Verzweiflung mit totbleichem
Gorgonengesicht, die trostlose Verlassenheit auf der
anderen Seite. Ein Gewisper von Schatten war um
ihn, die händeringend, verstoßen, enttäuscht, entzaubert wie er, sinnlos herumwandelten.

Eine tiefe, trostlose Müdigkeit stieg grau und
schwer vor ihm auf; eine düstere Nacht mit tiefschleppenden Wolken wälzte sich heran, löschte alle
Farben aus, erdrückte ihn.

Er hörte die Seine rauschen. Dort an der Kaimauer
stand ein Mann und beobachtete ihn.

"Das Testament!" flüsterte Flavio in einer jener
sonderbaren Ideenverknüpfungen, die uns bei einem
hoffnungslosen Zusammenbruch überfallen.

Mochte Casimir das Geld behalten oder den Polen
schenken oder in die Seine werfen!

Er dachte jetzt noch an seinen Konzertfrack, der
in toten Falten im Zimmer hing. Vielleicht hat ihn
die Polizei beschlagnahmt. Seltsam, welch sonderbare
Dinge sich noch in seinem Bewußtsein drängten: Er
hatte schwedische Handschuhe, genau wie Chopin,
aber Chopin hatte keinen solchen grauen Rock von
gesticktem Lyoneser Samt. –

Der Mann, der ihn beobachtete, stand nicht mehr
da. – Er war wohl fortgegangen –

Flavio nahm einen Anlauf, um über das Geländer
zu springen, da riß ihn eine kräftige Faust zurück.

"Lassen Sie mich los!" schrie Flavio. Seine Stimme
war zertreten, klang, wie wenn Dornen darüber gewälzt worden wären –

"Nein! Ich lasse Sie nicht los. Ich ziehe Sie sogar
weg vom Geländer, wie Sie sehen. Sie werden alles
begreifen, Herr Sikorski, wenn Sie meinen Namen
hören: Urhan, Violaspieler am Theater. Man nennt
mich auch den 'Spieler des lieben Gottes', da ich
mich bemühe, Tag und Nacht bemühe, von frühmorgens bis zum Beginn meines Theaters und dann wieder nach Theaterschluß umherlaufe, um Seelen zu
retten, weil ich wie in Flammen stehe vom Eifer für
das Seelenheil meiner Mitmenschen –"

Schon schritten sie am Kai weiter. Flavio war so
verblüfft von diesem Seelenretter, daß er ihm willenlos folgte. Noch nie hatte er solche Augen gesehen,
solche Ungetüme von flackernden, brennenden Augen, die das ganze Gesicht beherrschten und die hohe
Stirne, welche die gelbliche Blässe des Elfenbeins
hatte, wie zwei Kugeln durchbohrten.

"Ich werde mit Ihnen Arbeit haben, Herr Sikorski,"
fuhr er fort. "Aber ich werde Sie retten. Sie sind in
einem schlimmen Bann. Verstehen Sie mich nicht
falsch! Ich spreche nur von Ihrer Seele. Ihr Leib, Ihre
Person, die neben mir hergeht, ist seit drei Stunden
schon in voller Sicherheit –"

"In voller Sicherheit? –"

"Wie ich sage. Ich kenne zufällig den Polizeikommissär, der Sie verhaften wollte. Gott sei Dank, ich
habe die Gnade, immer die richtigen Menschen zu
kennen, wenn ich Seelen retten will. Der Polizeikommissär teilte mir mit, daß der Mord nicht weiter verfolgt werden solle. Aus politischen Gründen. Man
fand auch schreckliche Enthüllungen über die Baronin
v. Feuchère im Notizbuch des Generals. Als man sie
verhaften wollte, sprang sie zum Fenster hinab.
Noch als sie in den letzten Zuckungen auf dem
Pflaster lag, hielten ihre Finger einen Brief umklammert, der ihr sofort abgenommen wurde, noch ehe
man sie aufhob. Sie haben so gut wie nichts mehr von
der Polizei zu fürchten. Der Kommissär lachte, als
ich ihm sagte, daß ich Ihre Seele retten würde. Wenn
ich außer der Ihrigen noch zwei andere Seelen gerettet haben werde, habe ich das Tausend voll. Dann
muß ich ein großes, frommes Dankgelübde erfüllen –"

Es war Mitternacht. Die Glocke der nahen Kirche
schlug ängstlich und verstört.

"Ja, ich werde einen schweren Kampf um Ihre
Seele führen müssen, Herr Sikorski. Denn Sie sind im
Banne eines Dämons und dieser Dämon heißt Chopin.
Seine Seele ist mir zu verwickelt, zu labyrinthisch, zu
unheimlich –"

Er zeichnete mit seinen dürren, entfleischten
Fingern (Flavio staunte jetzt über die eiserne Kraft
dieser Faust, die ihn vom Brückengeländer zurückgerissen hatte) sonderbare, verschnörkelte Linien in
die Luft und nestelte daran herum, wie ein Anatom,
der seine Präparate zerlegt.

"Ich muß Sie jetzt verlassen," rief er plötzlich,
jäh seine Figurenmalerei abbrechend. "Ich habe noch
Dienst für den lieben Gott am Palais Royal da bei den
Arkaden, Ein junges Mädchen muß gerettet werden,
das seit zwei Tagen mit einer unverbesserlichen Dirne
dort gesehen wird. Oh! Dies gehört zu meinen härtesten Arbeiten."

Er lächelte schmerzhaft, wie ein Märtyrer, der den
glühenden Rost besteigen will. Ganz Paris wußte –auch Flavio erinnerte sich jetzt, davon gehört zu haben – daß dieser Seelenjäger, der jede Sünde ausrotten, jedes Ärgernis beseitigen wollte, wie der Gärtner sein Unkraut ausjätet, wenn er im Theater spielte, nie auf die Bühne sah und die Augen ganz schloß,
wenn die Nymphen des Balletts auf dem Podium erschienen.

"Gehen Sie getrost in Ihr Haus zurück! Niemand
wird Sie behelligen!" rief er, schon davoneilend, zurück.

= Das Lied Saint-Germain's

In jener Nacht, wo ihn Urhan gerettet hatte, ging
Flavio in einer unerklärlichen Stimmung noch einmal an die verhängnisvolle Stelle zurück, wo er in
die Seine hatte hinabspringen wollen, und sah über
die Wellen hin.

Das höhnisch lächelnde Gespenst des Monds streute
gelbe Lichter darauf, aber die bleich zuckenden Wellen belebten sich nicht. Die traurig blinzelnden Sternengesichter verfahlten; der jetzt hinter dem Kirchturm zwiegespaltene Mond machte sie auffrösteln. Ein
Vogel, vom Mondlicht genarrt, sang mit grellen,
ängstlichen Lauten und vertiefte den Bann der
Schwermut. Über die grauen verfallenen Bäume am
Kai sank ein Schleier von unheimlicher, öder Traurigkeit; die Wellen der Seine schienen zu erstarren in
geheimnisvoller Ruhe. Nur ein leises Zittern und Beben des Spiegels, ein ersticktes Gurgeln drang zu ihm
herauf, Träume, unter welchen die da unten begrabenen Unglücklichen noch einmal aufzuckten.

Durch die Stille der Nacht hörte man das Atemholen von Paris. Urhan suchte dort unter den Arkaden des Palais Royal die Seelen, an deren Rettung er
noch glaubte.

Flavio lachte bitter auf. Er war jetzt Herr
über einige Millionen, der Alpdruck des Mords wich,
die Schatten seiner hingeschlachteten Eltern waren
mit ihm versöhnt.

Hatte er nicht einmal ein Pamphlet "Das Gastmahl
der Schatten" geschrieben? Unter die Brückenbogen,
in die Hausgänge, sogar in die Kirchen gelegt?

Das war erst vor einigen Tagen. Ihm dünkten es
schon tausend Jahre zu sein.

Von einem Gaukler und Phantasten, diesem Saint-Germain hatte er geschrieben, der am Rand der Welt
lebte, im Feuerschein der Ideale und Illusionen, die
er den Flammen übergab, unter sinkenden Sternen,
von der Sintflut benagt, die er selbst ersehnt hatte,
weil ihm das Paradies nur eine Verbesserung, das
Nichts aber die Vollendung war.

Die Seele dieses heillosen Schwarmgeistes hatte ihre
Pestkeime auch zu ihm geweht und die Töne seines
unheimlichen Lieds wie den Traum von Träumen zu
ihm gesandt. Wie im Altertum verruchte Völker in
feindliche Städte Sündendirnen schickten, die von
heimlichen Krankheiten angefressen waren.

Der Irrstern, die böse Schimäre war es, die ihn verlockt hatte. Freilich, er war kein Sonntagskind, kein
Auserwählter der Kunst wie dieser Chopin, dieser
Glückspilz; kein Auserwählter, kostbar wie das scheue
Einhorn und der weiße Hirsch.

Geäfft hatten ihn die Phantomen des Ruhms. Elsner, der Lehrer Chopins, der den Namen seines Schülers wie der Priester die Monstranz herumtrug, hatte
ihn mit den Regeln des Kontrapunkts gequält und
im Stacheldraht der Harmonielehre umhergetrieben,
den Chopin, als wären es Spinnweben, zerriß, wie Herkules noch in der Wiege die zwei Schlangen erwürgte,
die ihm eine böse Göttin sandte. Und er gehörte nur
zu den vielen Tausenden und Abertausenden, die nicht
begnadet genug waren, obwohl sie fühlten, daß sie
Künstler werden oder nicht leben wollten.

Nie hatte er den Kuß des Genius gefühlt. Der
Widerschein einer toten Sonne in einer trüben Herbstlandschaft leuchtete ihm; bleichfarbige, duftlose
Astern nur, entlaubte, fröstelnde Bäume und unsicher
flatternde Falter, mit zerrauften, entfärbten Schwingen tauchten auf, während er über die spitzen Dornen dieser leiderfüllten Erde ging, während er in den
Hungergassen von Paris umherirrte, in elenden Kneipen spielte und in einem Zigeunerwagen schlief.

Jetzt war er reich, wohnte in einem Palast, schlief
in einem Seidenbette, konnte Trüffeln auf der Tafel
haben, wenn er sie begehrte, aber was nützte es ihm?

Er war deswegen nicht um einen Zoll näher an
Chopin's Kunst herangekommen.

Die unerhörte Laufbahn dieses Glückspilzes hatte
ihn verwirrt, wie das böse Irrlicht dem Wanderer
zublinzelt und an den Sumpf lockt, der ihn verschlingen wird –

In dieser Nacht noch schlich Flavio wieder in das
Treibhaus, suchte das Holzscheit, mit dem er den
Russen erschlagen hatte, und schlug damit auf die
Tasten des Flügels ein, hieb die Füße mit einer Axt
ab, die an der Gartentüre stand.

Casimir kam dazu, als der Flügel schon in Trümmern lag. Er faltete die Hände, als Flavio ihm von
Urhan erzählte und all dem Schicksalsvollen, das
sich in diesen wenigen Stunden ereignet hatte.

Auch die noch nicht verteilten Exemplare seines
"Gastmahls der Schatten", die im Keller versteckt
waren, wurden verbrannt.

Während er die letzten Fünkchen an den verkohlten Papierresten hingleiten sah, fragte er Casimir:

"Hast du schon einmal von dem Goldmacher und
Schwindler Saint-Germain gehört?"

Als Casimir verneinte, klatschte Flavio in ausgelassener Freude ihm Beifall zu:

"Gottlob! Heil dir, Getreuer! Du Auserlesener
unter allen Parisern, der du von diesem Unglücksmenschen noch nichts gehört hast!"

Die Musikalien im Klaviersalon entgingen nur
durch Casimirs Fürsprache dem Flammentode. – –
Es wurde still im Totenhause des Generals. Früher
war die Baronin v. Feuchère gekommen mit dem letzten Anhang, der bei ihrem Geize und ihrem versengten Rufe ausgehalten hatte, einer ganz verarmten Baronin, die mit einigen Tassen Tee zufrieden war,
einem verkrachten Schauspieler und mehreren anderen fragwürdigen Existenzen. Auch die weltberühmte
Dichterin mit dem olivenbraunen Mulattengesicht, der
stark gebogenen Nase, dem plumpen Hals einer
Bäuerin und dem perversen Geschmack für weibische,
lungenkranke Künstler war gekommen: George Sand.

"Weder George Sand noch –" er zögerte, Chopin
beizufügen – "noch sonst jemand von ihren Verwandten oder Bekannten darf kommen" schärfte er
Casimir ein. Aber es kam anders.

Flavio saß im Künstler-Café Caveau in der Ecke
gerade unter der Büste Glucks, glücklich, das laute,
aufdringliche, ehrgeizige und unvornehme Lärmen
und Schauspielern dieser Literaten, Maler und Musiker
nur aus der Ferne als unbeteiligter Zuschauer mitansehen zu können.

Da kam die Olivenbraune mit dem Giftschlänglein
heran.

In der Zeit seiner Not hatte Flavio die George Sand
einmal im Polnischen Klub gesehen. Sie kam mit
einer ganzen Kohorte ihrer Anhänger, ja Anbeter:
junge Republikaner mit runden Hüten und fliegenden Kravatten à la Byron herrschten vor, dann machten Anhänger des "Jungen Frankreichs" mit blauen
Westen sich laut, daneben Saint-Simonisten mit
einem Schlangenstab als Abzeichen, das sie trotz dem
polizeilichen Verbote sogar ostentativ trugen, und
Junge Sozialisten in Arbeiterblusen. Die Dichterin
hielt einen Vortrag über den Sozialismus, diese kaum
geborene Bewegung, die aber in wenigen Jahren sich
über ganz Europa, ja die ganze Welt ausbreiten sollte.
Was die Dichterin mit ihrem rauhen, fast männlichen
Organ und den lebhaften Bewegungen ihrer gedrungenen, fast plumpen Hände sagte, war ein ziemlich verworrenes und unklares Konglomerat schlecht verdauter, zusammengelesener und exzerpierter Theorien, Philosophien und Utopien, denen wohl niemand
im Saal ganz folgen konnte. Aber die wie Rosinen in
einen zähen, unverdaulichen Teig eingestreuten Phrasen von Völkerbefreiung, Emanzipation des vierten
Stands und Sieg einer neuen Weltordnung wurden
mit einem Sturm wütendster Begeisterung aufgenommen, nicht zum wenigsten, weil die Rednerin,
die Urenkelin eines sächsischen Marschalls, unter
ihren vielfältigen Ahnen so viele Träger erlauchter,
aristokratischer Namen aufweisen konnte und sich
jetzt herabließ, zu diesen Enterbten, Verfolgten, Geächteten zu kommen.

Flavio stimmte damals nicht in die allgemeine Begeisterung ein. Die Deklamationen der geleierten
Dichterin mochten wohl aufrichtig sein, aber viel davon war phrasenhaft, lyrisch-verschwommen und immer ins Himmelblau des ewigen Fortschritts und der
endlichen Erlösung zu unendlicher Harmonie aufgefärbt. Sie hatte gut reden von der Erlösung und dem
Morgenrot, das sie auf‌tauchen sah, sie, die Besitzerin
eines Landguts in Nohant, das sie ihrem geschiedenen
Mann im Prozeß abgestritten hatte. Auf ihrem prächtigen Landsitze ließ sichs auch gut träumen von der
Linderung der Not und dem Heraufziehen des goldenen Zeitalters.

"Harmonie! Göttliche Harmonie!" war ihr drittes
Wort. Aber etwas Gräßliches, mit göttlicher Harmonie ganz Unvereinbarliches wisperten sich zwei ihrer
Bekannten zu.

Die so lyrisch schwärmende Dichterin hatte die Gewohnheit, auf ihren Spaziergängen in Nohant Schmetterlinge zu fangen und mit einer Nadel an ihrem Umhang aufzuspießen, um sie dann zu Hause ihrer
Sammlung einzuverleiben.

Oh! Wie wenig von der göttlichen Harmonie spürten diese armen Schmetterlinge auf den gefühlvollen
Spaziergängen der lyrisch-philosophischen Schriftstellerin!

Beim Weggehen, umringt von Huldigungen, warf
die Gefeierte auch Flavio einen Blick zu, der wohl
mehr dem hübschen, jungen Mann als dem Polen und
dem revoltierenden, zerlumpten Proletarier galt. Wie
vielen Männern hatte sie Blicke zugeworfen: Männern
aller Art. Männern, mit denen sie philosophierte, Männern, mit denen sie mütterlich war wie mit Chopin,
Männern, die sie interessierten, sei es als Mensch, sei
es als Künstler, Männern, die sie bloß in Druckerschwärze für ihre Romane und Novellen verwandeln
wollte, und solchen Männern, die sie wie die Schmetterlinge in Nohant in ihr Herbarium einfing, mit ihren
Phrasen wie mit zartem Nektar und Ambrosia fütterte
und dann wieder fliegen ließ.

Vielleicht kam der Weltberühmten eine halb unbewußte Erinnerung an das Zusammentreffen im Polnischen Klub. Sie überfiel Flavio mit ausgesuchter
Liebenswürdigkeit, ließ ihre Busenfreundin Marliani,
die im Dornendickicht der Eifersucht saß, gar nicht
zu Wort kommen.

"Ich möchte Sie in meinem Chopin-Roman verewigen. Chopin heißt hier Prinz Carol; für Sie habe ich
noch keinen Namen. Ich denke, einen Schüler und
Bewunderer Chopins aus Ihnen zu machen – Sie sind
Pole, Millionär, Klavierspieler, wohnen in dem Haus
eines russischen Generals, den der Schlag getroffen
hat – ich finde alles riesig interessant –"

"Hat ihn wirklich der Schlag getroffen?" fiel die
Marliani eifersüchtig gehässig ein. "Man munkelt –"

Sie war wieder in ihrem Lieblingsberuf, aus stumpfen, zahmen Gerüchten donnernden Skandal zu machen. Bei jedem ihrer verfänglichen Worte schien es,
als ginge man zwischen unsichtbaren Dolchen hindurch.

"Warum interessiert dich dies, Liebe?" fragte die
Sand. "Ist dieses russische Sünden- und Greuelschwein Swerdlow wert, daß man davon spricht?"

"Der Selbstmord der Baronin v. Feuchère soll damit zusammenhängen," beharrte die Marliani. "Unser
Meister Frédéric (Chopin) ist empört, daß man seinen Namen mit Saint-Germain verquickt – Janins
Artikel brach gerade an der interessantesten Stelle ab
– Jetzt schweigt er sich aus –"

"Wie unser Herr Sikorski. Er scheint Ihre Gesprächsthemen nicht zu lieben, gute kleine Marliani –
konstatierte schadenfroh die Dichterin.

Die Marliani, ganz bleich vor Zorn, ging zum Sturm
über.

"Ich bin weder eine Dichterin, um einen Roman
über Herrn Sikorski zu schreiben, noch habe ich ein
Landgut in Nohant, um ihn dahin einzuladen – Oder
ist es noch nicht so weit? Bis Chopin Ihrer Einladung
dorthin folgte, vergingen drei Monate. Er war wirklich eine turris eburnea, wie Janin schrieb, ein elfenbeinerner Turm, wie es in der Litanei heißt –"

"Damals waren die Seiltänzer neben dem Café Tivoli Mode, liebe, kleine Marliani. Während ich Chopin gewann, beschäftigten Sie sich dort –"

Die Dichterin legte ihre Zigarette weg und trommelte auf dem Marmortischchen eine Mazurka Chopins. Dann sah sie Flavio voll ins Gesicht: "Sie haben
viel Seelenverwandtes mit Chopin. Vorhin hatten Sie
auch sein Lächeln, über das Herr Janin sich so ärgert.
Ich möchte Sie Klavier spielen hören – Vielleicht
haben Sie auch etwas von der Seele Chopins –"

"Ich werde für die nächste Zeit nicht zu Hause sein.
Wohin ich reise, ist noch unbestimmt, aber sicher ist,
daß ich das Klavier lange Zeit nicht mehr anrühre –"

Die Marliani hatte ein triumphierendes, knochenhaft feindseliges Lächeln. Sie beugte sich vor, zum
Kampfe gerüstet: "Dort ist Ihr Schwiegersohn Clésinger. Ist er so spät gekommen? Sein Gesicht ist
eingeschwollen –"

Ganz Paris wußte, daß in Nohant ein häßlicher
Auf‌tritt zwischen den beiden gewesen war. Solange,
die Tochter der Dichterin, haßte ihren Gatten Clésinger, den die Mutter ihr aufgezwungen hatte; diesmal machten sie aber gemeinsame Front gegen George
Sand. Diese mußte die gemeinsten Beschimpfungen
Clésingers anhören und die Tochter der Pariser Vogelhändlerin, die sie war, gab es reichlich zurück, Solange, die Chopin zärtlich Soli nannte, ein schwarzes,
launisches, bösblickendes Wesen, bekam einen Weinkrampf und Clésinger mußte zwei Ohrfeigen von seiner Schwiegermutter einstecken.

Die Sand antwortete mit einem verblichenen
Lächeln und dem Zucken auf‌flackernder Wut:

"Clésinger ist ein Rohling, ein Polterer und ein
mittelmäßiger Bildhauer. Ich gebe es offen zu, um
Ihnen den Wind aus den Segeln zu nehmen, kleine,
liebe Marliani. Er versteht eben auch Chopin nicht,
dieses mein Sorgenkind. Clésinger, dieser Elefant und
Chopin, der nervenschwache Pfau! Chopins raffinierte
Seelenräusche und genußvollen Melancholien, die er
in sich hineinschlürft wie andere ihre Tasse Schokolade, Chopins hysterischer Weltekel und dagegen
Clésinger! Der hat Weinräusche statt Seelenräusche;
Melancholie befällt ihn nur, wenn er sein Geld verspielt hat und die Gläubiger ihn drängen. Sie passen
nicht zusammen. Ich kann kaum mehr wagen, Frédéric nach Nohant einzuladen –"

"Der Platz für den neuen Thronfolger ist also frei,"
stichelte die Marliani, die mit Genugtuung sah, daß
Flavio Anstalten machte, aufzubrechen.

"Dieser Flavio ist noch schwerer zu erobern als
Chopin," dachte sie. "Dazu ist er noch Millionär –"

"Es ist jedenfalls kein Seiltänzer vom Tivoli,"
zischelte die Sand zu ihr hinüber, während Flavio
den Kellner bezahlte.

"Ich habe hinter die Kulissen der vornehmen Welt
einen kleinen Blick getan," dachte Flavio, während
er nach Hause ging. Ein trübseliger, raschelnder
Wind schüttelte die Bäume und das feine Schluchzen
des leise einsetzenden Regens hüllte ihn in eine Melancholie, die wie eine Zentnerlast auf seine Schultern drückte.

"Warum habe ich den Flügel zerschlagen?" murmelte er. "Chopin ist auch kein Halbgott. Seine Umgebung prügelt und beschimpft sich wie Fuhrleute in
der rue Babylone. Vielleicht kann ich ihn noch erreichen. Oder wenn ich ihn nicht erreiche, wenigstens
unter die ersten Pianisten in Paris kommen. Nur
müßte ich Eines haben – etwas"

Er wagte es kaum, das Wort vor sich hinzusprechen: Es war das Lied Saint-Germains.

Seine Aufgabe war also eine doppelte: auf dem
Klavier weiterzuüben, täglich acht Stunden, wie man
es Franz Liszt nachsagte, und dann das Andere: das
faszinierende, die ganze Welt behexende Musikstück
Saint-Germains zu bekommen.

Wie frühere Menschen die Insel der Seligen, den
Eingang zur Unterwelt suchten, so wollte er sich auf
die Pilgerfahrt machen, dieses Lied zu finden.

Es war nutzlos, in Paris zu suchen. Russelton, mit
dem der Professor der Magiologie Alexandre seine
Geschäfte machte, schreckte ihn ab, auch von den
anderen Antiquaren.
Er wollte fort von Paris, nach dem Süden. Die
schrecklichen Ereignisse der letzten Tage verleideten
ihm diese Stadt, diese Symphonie von Zinnen, Kuppeln, Triumphbögen, aber auch von lockenden Irrlichtern.

Er überstürzte sogar die Abreise, damit nicht vorher
noch Frau Sand, die Unausweichliche, Unvermeidbare ihren schon angedrohten Besuch abstatte. Auch
Clésinger, erzählte ihm Casimir, stand in dem Rufe
alle Millionäre, die ihm bekannt waren, heimzusuchen
und sich für eine Bildhauerarbeit zu empfehlen.

Schon waren seine Koffer gepackt, da begegnete
ihm vor Russeltons Laden der Professor der Magiologie. Er trug jetzt zu seinem neuen Mantel Schuhe,
die sogar elegant zu nennen waren. Sein Hut war
nach der neuesten englischen Mode.

"Sie reisen ab? Wie schade! Ich wollte eben zu
Ihnen, um Sie vor Russelton zu warnen. Dieser Mucker mit dem Würdeschritt und der steif‌leinenen
Ehrbarkeit ist ein Gauner – Mein Geschäftsfreund
in Avignon hat mich gewarnt –"

"Sie wechseln Ihre Ansichten von heute auf morgen," erwiderte Flavio kalt. "Beim General Swerdlow sprachen Sie anders –"

Schon eilte Flavio davon.

Dieses Zusammentreffen mit ihm gerade jetzt war
aber doch ein seltsamer Zufall. Und warum mußte
er gerade Avignon nennen?

Flavio erinnerte sich, daß in Avignon ein Freund
seines Vaters, auch ein emigrierter Pole, ein Seidengeschäft betrieb. Und sein Sohn Jan, der in Paris
als Schriftsteller sich einen Namen machen wollte,
war gleich ihm gescheitert und in die elenden
Gassen der Armut untergetaucht.

Das letztemal war er mit ihm in der grauenhaften
Gasse "Zur alten Laterne" zusammen. In der Kneipe
des alten Barrye, der mitten im Sommer eine Pelzkappe trug, die sein Menschenfressergesicht einrahmte. Barrye behauptete, ein russischer Soldat habe
ihm 1815, als er Paris gegen die Alliierten verteidigte,
mit dem Säbel ein Ohr abgehauen. In Wirklichkeit
hatte ihm dies ein dem Bagno entflohener Galeerensträfling angetan, den Barrye bei sich vor der Polizei
versteckte und verraten wollte, weil sie über den Anteil an einem Gaunergeschäft uneins wurden.

Als Flavio bei ihm für Klavierspielen und Botengänge angestellt war, galt der abgefeimte Wirt den
Polen als eifriger Revolutionär und Bundesgenosse.
Gar manches Komplott wurde in dem kleinen Seitenzimmer ausgeheckt, wo Opium geraucht wurde.

Auch Flavio war kein Verdacht gegen Barrye aufgestiegen. Er wollte dort Jans Adresse erfahren, um
ihm zu helfen.

Die grauenhafte Erinnerung an die Tage seiner
Not überwältigte ihn, als er an die Markthallen kam
und der Giftgestank des nahen Schlachthauses über
die rissigen, tiefäugigen, verpesteten Baracken hinstrich.

Es war die äußerste Armut, die sich ihrer Lumpen
nicht mehr schämt und dem Verbrechen in die Arme
sinkt.

Flavio näherte sich der hölzernen Treppe, durch
welche die darmartig schmale, steil ansteigende Gasse
in zwei Teile geschnitten wurde.

"Ist es möglich, daß ich vor einem halben Jahr
noch hier war?" fragte er sich, von einem leisen
Grauen gepackt.

Von irgend einer abergläubischen Vorstellung ergriffen, zählte er die schwarzen, ausgetretenen Stufen
der Holztreppe. Es waren 17. Eine ungerade Zahl.

Menschen, in Lumpen gehüllt, Kinder voll Grind
und Geschwüren, Gestalten wie phantastische Tiere,
die im Schlamm eines Flusses wühlen, kletterten die
Treppe auf und ab.

Dort war die Wirtschaft Barryes, am letzten Absatz der Treppe.

Aber wo war das Schild, die blecherne Birne, die
an einen Menschenkopf erinnerte? Fremde Gesichter
sahen aus dem Hause. Vergebens suchte er den Mann
mit der Pelzkappe, dieses wie mit der Axt zubehauene
Gesicht, das wächsern in den verwilderten Bart zerfloß.

Da rief eine dunkle, freundliche Stimme Flavios
Namen.

"Ich bin es. Urhan. Reden wir leise!"

"Herr Urhan! Verehrter Seelenretter und auch
mein Retter! Sehe ich Sie in dieser Gasse?"

"Vor allem! Betreten Sie das Haus Barryes nicht!
Folgen Sie mir! An den Markthallen wollen wir weitersprechen. Sehen Sie nicht, daß das Haus bewacht
wird? Der Drehorgelmann dort am Eingang ist ein
verkleideter Pole –"

"Was ist geschehen?"

"Die Polen haben Barrye entlarvt. Erinnern Sie sich
noch an das Nebenzimmer, wo Opium geraucht
wurde? An den hüstelnden Chinesen, der auf dem
Teppich kauerte? In der Ecke, wo die Komplotte
der Polen flüsternd besprochen wurden, entdeckte
gestern ein Gast durch Zufall eine durch eine Tapete
bisher verdeckte kleine Öffnung in der Wand: er
lauschte und hörte Barryes Stimme vom oberen
Stockwerk. Kurz! Es war eine Leitung. Dionysius,
der syrakusanische Tyrann, wenn ich mich noch recht
aus der Schulzeit erinnere, hat durch diese seine Erfindung, das Ohr des Dionysius, die Gespräche der
Staatsgefangenen belauscht. Gestern nacht wurde
Barrye von den Polen hingerichtet. An der Seine
unten versenkten sie ihn in einem Sack. Hier verkehrte übrigens auch die Baronin v. Feuchère, die ein
so schauerliches Ende fand und der General Swerdlow ebenfalls. Sie arbeiteten mit dem Wirt Barrye
zusammen –"

Flavio reichte dem Seelenretter eine 100 Fr.-Note
und schrieb ihm den Namen Jans auf.

"Haben Sie die Güte, dieses Geld einem Freunde
von mir zu geben, dessen Vater mit meinen Eltern
befreundet war, und nun in Avignon sich als Seidenhändler durchschlägt –"

"Ich kenne auch den Sohn," jubelte Urhan. "Er
kann gerettet werden. Namentlich, wenn er jetzt die
100 Fr. bekommt. Er wollte Diener bei Chopin werden, da Chopin seinen entlassen will. An Chopin ist
ja alles Unruhe, Wechsel, Hast, wenn er auch äußerlich gelassen und still erscheint. Er ist beständig in
seelischer Unruhe, die ein Ausdruck seiner Gottverlassenheit ist. Seine Freunde täuschen sich in ihm.
Er ist gleichmäßig freundlich zu jedem, jeder hält
sich für den Bevorzugten. Er aber sitzt da wie ein vornehmes Kätzchen aus dem Faubourg Saint-Germain,
die Krällchen eingezogen und streckt seine Pfötchen
hin; er will bedauert, geschmeichelt, besonders aber
bedient sein. Tausenderlei Gänge und Besorgungen
gibt es da. Fontana, seinerzeit sein Mitschüler in Warschau, ist ganz sein Haussklave geworden; kaum findet er bei den vielen Besorgungen, die ihm aufgehalst
werden, noch die Zeit, seine Klavierstunden zu geben.
Chopin will jetzt zum siebenten Male in Paris umziehen. Daneben will er mit dem Musikverleger
Schlesinger neue Verträge abschließen. Der gute Fontana läuft atemlos in Paris herum. Die neue Wohnung muß still sein, und doch im Zentrum von Paris.
Kein Schmied oder sonst ein lärmender Betrieb darf
in der Nähe sein. Die Zimmer müssen gegen Süden
liegen, wenn nicht alle, so doch das Klavierzimmer,
die Tapeten müssen tourterelle-farbig sein, wenn
irgend möglich.

Ich werde Jan das Geld geben. Er soll kein Diener
bei Chopin werden. Er klimpert ohnehin etwas auf
dem Klavier und wenn er beständig Chopin spielen
hört, bekommt er auch den Klavierwahn und die bösen Zaubertöne haften an ihm und klammern sich
immer fester, wie eine Zecke, die sich in die Haut des
Pferdes einnistet –"

"Warum sagen Sie: 'bekommt _auch_ den Klavierwahn?'" wollte Flavio auffahren. Doch er sagte nur:
"Beeilen Sie sich, Herr Urhan! Ich reise morgen ab!"

Der Seelenretter sah ihn schweigend an, als wenn
er eine stille Bestätigung finden wollte.

"Es ist nicht gut, wenn Sie abreisen, Herr Sikorski."

Mit einer leichten Handbewegung irgend einen Einwand Flavios abschneidend und wie ein Feldherr, der
seine Truppen plötzlich und unerwartet abschwenken
läßt, fuhr er fort:

#quote[Ich sah Chopin gestern im Garten. Er sah leidend,
überanstrengt, gequält aus. Das Zerwürfnis mit der
Sand ist es nicht. Auch nicht das Lungenleiden, das
sich sogar etwas gebessert hat. Seine Einnahmen sind
so gut, daß er fast luxoriös leben kann. Der Diener
sagte mir, daß er 20 Fr. für die Stunde nimmt und
dabei sind es die hochadeligsten Kreise aus dem Faubourg, die von Seide, Diamanten, Perlen und Pelzwerk glitzern und rieseln.

Nein. Ich sah Chopin, hinter der Gartenmauer versteckt, einige Sekunden lang genau ins Gesicht.

Ich täusche mich nicht. Er kommt mir rätselhafter und unheimlicher vor wie je. Seine Augen, wie
ich sie jetzt sah, erschreckten mich. Sie lagen tief
in den Höhlen und hatten die Farbe von poliertem
Mahagoniholz. Etwas Starres und Drohendes lag in
ihnen, etwas Fanatisches, wie ich es auch einmal bei
Giacomo Meyerbeer, dem Ehrgeiznarren, gesehen
habe. Aber der Ehrgeiz ist es nicht bei ihm; er ist ja
gesättigt von Ruhm, seine Kompositionen werden auf
der ganzen Welt gespielt. Nein. Ich sah schärfer in
ihn hinein: die Seele formt den Körper und ich fand
sein Gesicht verändert: die leichtgeschwungene Nase
war schärfer, kantiger, der zarte Abriß des Wangenknochens kam mir härter vor. Der gräßliche Janin
ließ vorgestern einen neuen, diesmal ziemlich harmlosen Aufsatz über Chopin erscheinen. Er sprach von
Ekstasen der Traumwelt, Seelenberauschungen und
den brennenden grünen Augen eines Werwolfs, der
finster, voll unbestimmten Hasses und voll Menschenverachtung bei ihm herumgeistere.

Ich erstarrte, als ich die Augen Chopins sah: Wirklich! Das alles las ich darin. Und dabei erschienen
mir diese Augen so fern allem Menschlichen, so teilnahmslos, als wäre dieser Garten mit den Taxushecken und Rosenbeeten und diese Gartenmauer, hinter der ich ihn beobachtete, eine Million Meilen entfernt. Und als ich dann fortschlich und über ihn nachdachte, zweifelte ich sogar, ob mich nicht das Geschreibsel Janins verführt hätte, Dinge zu sehen, die
nicht waren. Aber ich kam immer wieder auf den
ersten unheimlichen Eindruck zurück.

Wie mir ein Pole von den Seen seiner Heimat erzählte, die harmlos aussehen, still unter ihren Wasserpflanzen atmen, aber unergründlich und unberechenbar sind.

Aber ich begnügte mich mit dieser Feststellung
nicht, ich, der Detektiv und Spürhund Gottes. Ich wagte mich in seine Wohnung. Sie wissen vielleicht, wie
Chopin sich hermetisch gegen alles, was ihm fremd
und störend ist, abzuschließen versteht. Ich zitterte
ein wenig, als ich das Vorgärtchen mit den Tulpenbeeten durchschritt und an die blumengefüllten
Vasen der Treppe kam. Im Parterre wohnt ein alter
Marquis, ein Pair, berstend vor Hochmut; auf der
Straße hält er immer sein Ohrhörnchen in der Hand,
da er stocktaub ist. Gottlob! Er hörte mich deswegen
nicht und sein Diener, der bei dem kargen Geizhalse
sich sehr unbehaglich fühlt, war gerade fort. Ich
hatte Glück. Chopins Diener kam herab.

Ich hatte ihn damals obdachlos in der rue Tivoli
getroffen, unter diesen Schmutzbergen, dem Schutt
eingerissener Häuser, den bleichen Laternen, unter
deren Schein sich Diebe und Einbrecher Zeichen geben. Er war bei einem Hasenfellhändler, der selbst
halb verhungerte. Es gelang mir, ihn bei einer guten,
alten Frau, einer Rentnerin, unterzubringen; von da
kam er zu Chopin. Man freut sich immer, wenn man
seine Bemühungen um den Nebenmenschen mit
Dank belohnt sieht.

Der Diener vertraute mir manches über Chopin an,
das mir seine Seele blitzartig erhellte.]

#quote[Ein Glück, daß wir uns hier treffen! Er hätte Sie
unter keinen Umständen empfangen. Seit einiger
Zeit wird er immer abgeschlossener, ich will nicht
gerade sagen, hochmütiger. Die adeligen Schülerinnen, parfümierte Leisetreter mit Orden und Diamantsäbeln, alte Mumien, die mit gespitztem Finger
den Tabak aus der Dose nehmen, über Rheuma und
ihre sonstigen adeligen Gebresten jammern, und die
Zeiten unter Ludwig #sc[XVIII]#ednote[König von Frankreich (1755 – 1824).] herbeisehnen, kaltherzige Greise mit fixen Ideen von der alten Bourbonenherrlichkeit und alten, farblosen Sprüchen und
dem ganz vornehmen Hüsteln kommen zu ihm. Eine
unübersteigliche Mauer schließt ihn ab. Übrigens
kommt es mir vor, als ob er auch diese Hochadeligen
verachtete. Er ist fast kein Mensch mehr. Seine Kunst
macht einen Halbgott, einen Gott weiß was? aus ihm.
Manchmal kommt er mir wie der lebendig gewordene
Hochmut vor. Ich denke da, er wird noch zu Stein
und geht als sein eigenes Denkmal durch die Straßen
von Paris. Und manchmal wieder habe ich tiefes Mitleid mit ihm, wenn er da am Flügel sitzt und komponiert. Ich habe eine kurze Zeit lang im Steinbruch
bei den Steinhauern in Fontenay gearbeitet. Lange
konnte ich es nicht aushalten. Da steht man in einem
hölzernen Rad und tritt auf die Hölzer, immer so
zu und das Rad dreht sich langsam dabei. Wenn man
14 Tage so die Hölzer des Rads auf- und abgetreten
hat, hat man eine Strecke hinter sich fast so groß
wie der Weg zum Mond hinauf, aber man bleibt immer in dem Rade, man schwitzt, der Kopf wirbelt
einem. Ich habe es mitgemacht.

Aber wenn ich da Chopin am Klavier sitzen und
sich abquälen sehe, kommt mir die Rädermühle in
Fontenay wie ein Kinderspiel vor.

Schweiß perlt ihm da von der Stirne; er rauft sich
die Haare. Dann springt er auf vom Klavier, nimmt
die Schreibfeder und kritzelt Noten hin. Nicht lange
und er zerreißt es wieder. Ich habe gesehen, wie er
die Schreibfeder zerbiß.]

"Das war mir neu, daß Chopin so schwer arbeitet,"
sagte Urhan zu Flavio, der stumm und starr zuhörte.
Ich suchte den Diener auszuhorchen, seit wann diese
Wandlung mit Chopin vorgegangen sei.

"Noch nicht so lange," meinte der Diener. "Er
sucht eine Melodie und kann sie nicht finden –"

"Welche ist es? Antworten Sie mir! Ich muß es
wissen –" Ich war ganz Detektiv und Spürhund
Gottes.

#quote[Er klagt, daß er verstimmt und voll Langeweile
sei, daß ihn alles anekle. Mit der dünnen, zarten Violin-Saite vergleicht er sich, die auf einen Kontrabaß
gespannt worden sei –

Ich frage Sie, welche Melodie er sucht und nicht
finden kann. Warum antworten Sie nicht?]

"Es ist seit dem Artikel von Janin im Journal. Er
regte sich sehr darüber auf, wenn er auch äußerlich
ruhig blieb. Das ist so seine Art. Er kann seine Gefühle meisterhaft verbergen, aber ich komme dahinter. Ich bin überzeugt, daß er den Artikel und das
über den Goldmacher Saint-Germain sehr genau las,
aber es war zu bewundern, wie er sich in der Hand
hatte, als Verleger Schlesinger ihm das Blatt zeigte.
Er verzog keine Miene, nahm das Papier in die Hand,
hielt es etwas von sich weg und riß es ganz langsam
durch. Zwei fast gleiche Stücke fielen zu Boden. Der
Tanzlehrer Abraham, bei dem das adelige Faubourg
die alten Menuetts und Komplimente unter Louis
#sc[XIV] und #sc[XV] lernt, hätte es nicht graziöser und
hoffährtiger machen können –"

Flavio und der Seelenretter waren wieder am
Hause angelangt, das in den letzten Tagen so seltsame
Dinge erlebt hatte.

"Ich sehe klar, ganz klar; nach dem, was mir Chopins Diener gesagt hat, finde ich meine bisherigen
Vermutungen vollauf bestätigt und keines weiteren
Beweises mehr bedürftig," sagte der Seelenretter
in einem triumphierenden Tone, dem Staatsanwalte
gleich, der seine donnernde Anklagerede abschließt.
"Ich wiederhole meinen wohlmeinenden Rat: bleiben
Sie in Paris und unter meiner Obhut! Ich bin überzeugt, daß Sie nie mehr ein Pamphlet im Stil Ihres
gräßlichen 'Gastmahls der Schatten' schreiben werden. Aber ich fürchte, daß der Dämon, in dessen Banne Sie sind, eine andere Fallgrube für Sie bereit hält,
in die Sie stürzen werden. Hörten Sie, daß Chopin
das Lied Saint-Germains sucht? Daß er die Feder
zerbeißt, weil eine gnädige Fügung und ein barmherziger Engel nicht dulden kann, daß er eine
so trostlose, so seelenmörderische, so verzweiflungsvoll von Gott verlassene Melodie erfindet. Chopin
ist ein übergroßes, übermenschliches Genie. Noch
kein Komponist bisher erfand so originelle Melodien.
Ein leichtes wäre es ihm, auch die Melodie zu finden,
die dieser Allerweltsgaukler Saint-Germain damals
vor Ludwig #sc[XV] spielte, um ihn vollends zu verderben. Aber der barmherzige Gott, der die Seelen der
Menschen behütet, läßt es nicht zu. Er schickt Melancholie, Weltekel über Chopin. Die Melancholie, offenbarte Gott der hl. Brigitta, ist das Bad, in dem der
Teufel badet. Und der Teufel – er gestand es selbst
der hl. Brigitta – ist kalt, leer, verzweifelt. Dies
alles fiel mir ein, als ich Chopin im Garten in die
Augen sah. Er gehört zu den Seelen, die dem
Menschlichen entfremdet, immer blasser, verwelkter,
ausgehöhlter in leidendem Hochmut und der schmerzlichen Wollust des Untergangs dem Nichts entgegengehen und sich in Rauch auf‌lösen, in böse Dämonen, die in traumhaft beschwerter Nacht über unbewehrte Seelen herfallen –"

Als Urhan gegangen war, hatte Flavio mit seinem Hausverwalter eine lange Unterredung. Ein
neuer Flügel wurde in das Treibhaus geschafft und
noch in der Nacht reiste Flavio ab. Er ging vorher am
Hause Chopins vorbei, sah seine Gestalt hinter den
Seidenvorhängen sich abzeichnen, blaß, kühl, wie
einen Kreidestrich auf grauem Papier.

Der Verleger Schlesinger kam aus dem Hause, blaß
und verärgert, und klagte Flavio seine Not.

"Welche Empfindsamkeit! Welch übertriebene
Delikatesse! Jetzt, wo Chopin neue Konkurrenten bekommt, außer Liszt jetzt noch die Herz, Döhler,
Schulhoff! Die komponieren für das liebe, träge,
seichte Publikum das Zwitschern des Kanarienvogels,
Mühlengeklapper, Pferdegetrappel, Gnomentanz,
Feenzauber und Perlenregen und ihre Verleger werden reich dabei. Die Konzerte rentieren sich nicht
mehr; ich muß jetzt auch bei den Solisten die Claque,#ednote[Bestellte, mit Geld oder Freikarten bezahlte Gruppe Beifall Klatschender.]
Kerle wie Braulard und Florentino, bezahlen. Ich bat
Chopin, seine letzte Komposition, das Scherzo, in
'Gastmahl der Schatten' umtaufen zu dürfen. Das
hätte nach dem Janinschen Artikel und dem Pamphlet wenigstens 5000 Exemplare mehr ausgemacht.
Nun, Chopin gab mir nicht einmal eine Antwort. Nur
die Nasenflügel zog er hinauf und lächelte. Das war
alles. Mir bleibt nur noch die Fürsprache der Sand,
obwohl ich wenig Hoffnung habe. Die Zeiten, wo sie
sich schminkte und prahlte: 'Ich bin deine Muse!'
sind vorbei. Über ihr Verhältnis scheint langsam die
Eiszeit hereinzubrechen."

"Sorgen Sie nicht, Herr Schlesinger! Wenn ich von
der Reise zurückkomme, werde ich etwas in Ihren
Verlag geben können, das Sie zum König aller Verleger macht –"

Kopfschüttelnd sah ihm Schlesinger nach: "Die
ererbten Millionen sind ihm in den Kopf gestiegen!
Nun. Ich warte auf dieses Opus. Als Millionär wird
er ja die Druckkosten bezahlen können –"

Flavio atmete auf, als er im Zuge saß, der ihn nach
Süden trug. Manchmal sah er die Gestalt Urhans,
seine großen, starren Augen auf‌tauchen und mit einer
dunklen, unbestimmten Warnung wieder versinken.

"Warum soll ich nicht das Lied dieses Saint-Germain suchen? Was geht mich seine heilige Brigitta
und der Teufel an, der in der Schwermut sein Bad
nimmt? Ich werde im blauen Mittelländischen Meer
baden; seine Wellen werden alles von mir abspülen,
was ich in Paris erlebt habe, die Jahre meines Elends,
meine Rache an Swerdlow, den närrischen Urhan und
den Schurken Barrye. Auch die Schmarotzer und
Schmeichler, die jetzt schon meine Millionen umschwärmen wie die Wespen den Honig; diese Schleicher und Schöntuer, diese Sand und ihren Schwiegersohn. Die sieche, ekle Haut ist unter ihrer Schminke;
aus dem Geknister kostbarer Toiletten bricht die Gemeinheit und üble Berechnung jäh hervor."

Er hielt inne. Sprach nicht Urhan aus ihm?
Urhan, der sich über die Vornehmtuer, den Hochmut Chopins entrüstete? Aber hatte nicht Chopin das
Recht, hochmütig zu sein? Durfte er sich nicht die
Menschen auswählen, die zu ihm paßten?

Dieser Urhan, der in allen Seelensiechbetten herumschnüffelte, sah überall Verderbnis, Hölle und Teufel. Wenn Chopin seine Seele hinwelken ließ und
sich um ein altes Lied abquälte, strafte er sich selbst.
Wenn er seine Seele in Schwermut badete, stand es
ihm frei wie anderen Künstlern das Opiumrauchen
und der Absinth. Wenn er sich für diesen verschollenen Gaukler, Phantasten und Halbnarren Saint-Germain interessierte, war dies ebenso sein selbstherrliches Recht, wie wenn er sich, alle Welt wußte es,
nachts am Flügel phantasierend an den Visionen polnischer alter Ritter, Wojwoden und Burggräfinnen
berauschte oder aus Kirchhöfen klappernde Skelette heranschleichen sah.

War es nicht ein unermeßlicher Gewinn für die
Kunst, daß dieses erlesene Genie sich den blassen,
düsteren, melancholischen Regionen der Seele zuwandte und in heroischer Aufopferung dahinwelkte,
statt in draller, pausbäckiger Gesundheit die beängstigende Überfülle glatter und billiger, wenn auch
wohlgeratener Kunstprodukte zu vermehren?

Dieser polternde Derwisch, dieser zweite Savonarola, der Seelenretter Urhan faselte von der giftigen
Berauschung durch die Kunst. Auch ein Arzt, der
früher in Paris gewesen war, schrieb davon. Das Buch
lag auf seinem Schreibtisch. Ein langweiliges Buch
mit tollen Phantasien von den alten ägyptischen
Tempeltänzen und der Gaukelei der Salome vor
Herodes. Warum zitierte er nicht auch die Posaunen
von Jericho?

Dieses Überhebliche an Saint-Germain, dieser
Ekel am Menschlichen war vielleicht ein Erbteil seiner Mutter, die ihn widerwillig empfangen hatte!

Am Bilde Saint-Germains, an diesem harten Stirnwinkel in dem blassen, an einen Pferdekopf erinnernden Gesichte, an diesen dünnen Lippen und diesen
finster ausgezogenen Brauen war etwas, das vor ihm
warnte. Aber täuscht nicht die Physiognomie sehr
oft? Die Einbildung, das, was wir aus Dichtern zusammenlesen, ist oft wie ein trügerischer Spiegel, der
nur zeigt, was man zu sehen erwartet, und verbirgt
und umfärbt, was man ablehnt.

Unterwegs stieg ein gutgekleideter älterer Mann
mit klug forschenden, aber guten Augen ein.

Er besaß wohl das, was Chateaubriand die "schreckliche Gabe, sich vertraut zu machen" nennt.

Denn schon teilte ihm Flavio sein Reiseziel, Avignon, mit. Bald sprachen sie von dem Antiquar, den
Flavio aufsuchen wollte.

"Ein seltsamer Kauz!" rief der Neugierige. "Zum
Glück ist er reich und kann seinen Passionen nachleben. Ein wahres Reisefieber ist in ihm, obwohl er
schon seine 70 Jahre auf dem Rücken hat. Sie
haben wohl auch von dem Chopin-Artikel Janins gehört, Herr Sikorski? Unser Antiquar kann ihn fast
auswendig und spricht bloß noch von Chopin und
Saint-Germain. So ist er auch auf das Lied Saint-Germains gekommen und sucht überall fieberhaft danach. Sie können von Glück reden, wenn Sie ihn in
Avignon antreffen. Ich weiß nicht, welcher Spaßvogel
ihm die tolle Idee eingegeben hat, daß es irgendwo
in Ägypten zu finden sein müsse. Zufällig ist auch
ein Privatgelehrter in Avignon, der eine Zeit lang das
Pyramidenland und seine heiligen Stiere und Ibisse
studierte. Sie schwärmen zusammen vom Nil mit
seinen Lupinen- und Rosenfeldern, von den Wüstenlerchen und dem zärtlichen Licht der violetten Sonne,
das sich auf die Nilwellen ergießt, die bald veilchenfarbig, bald wie welkende Chrysanthemen aufschimmern sollen. Die Nilwellen und abermals die Nilwellen sind ihr Gesprächsstoff stundenlang und der
Antiquar hat das Gelübde getan, selbst die kleinste
Hütte des schmutzigsten Fellachendorfs nach diesem
Lied zu durchsuchen und jeden Sandhaufen der
Wüste bis zum schwarzen Saum der letzten Wüstenberge zu durchwühlen. Dieser Janin hat ihn auf dem
Gewissen."

Draußen in der lichtgebadeten klaren Luft flog
hochrot flammendes Buschwerk, dicht wie der Urwald, vorbei und Zikadengeschrill quoll aus den
roten Blumenteppichen. Büffelbespannte Wagen
zogen wie schwarze Steinblöcke vorüber.

Tragische, wütende Glocken schollen von den Kirchen der immer näherkommenden Stadt Avignon.

"Die Prozession des heiligen Benezet wird eingeläutet," belehrte der Mitreisende und bald
schwemmte dieser neue Gesprächsstoff über den
populärsten Heiligen der ganzen Gegend den Antiquar, den Privatgelehrten, die Fellachendörfer, die
Wüstenlerchen und selbst die Nilwellen fort.

= Die Odyssee

Die Prozession des heiligen Benezet, des Bischofs
und Brückenbauers von Avignon, war fast zu Ende.
Mit ihr schritten Noah, die Patriarchen, die Judenkönige, Esther, Sulamith, Heilige des Kalenders und
die Sünder der Vorhölle, Propheten, Schriftgelehrte
und Kardinäle, Pagen in Scharlach und sogar Maultiere, die stolz und selbstbewußt dreinschauten.

Flavio und der Antiquar stiegen eilends den Schloßberg hinab, während die Prozession zur Kirche einzog.

"Schnell! Schnell!" drängte der Antiquar. "Ehe die
Glocken zu läuten aufhören, müssen wir an der Brücke
sein –"

Vom weiß gepuderten Weg bogen sie über violette
Furchen in eine wahre Prärie riesenhaft aufgeschossenen Grases, das sich in der Sonne krümmte, durchquerten, von wütendem Hundegebell umkläfft, Gärten der Vorstadt mit gigantischen Blumenvasen, in
denen die Aloe und der Akanthus sich aufreckte, starr
wie ein Skelett.

"Noch gehen die Glocken! Es ist noch Zeit, aber
wir müssen durch das hohe Schilf durchkommen!"

Die Rhone war nicht mehr ferne; das Wellengetöse und der auf- und abschwellende Gesang der
Zikaden war schon in ihren Ohren. Aber rotbraune
Mauertrümmer unter faulenden Orangenschalen und
schmutzigem Sand von der Farbe eines verwesenden
Fischleibs hielten auf. Ein großer, flackernder Tulpenbaum, der in der unerbittlichen Sonne tiefblau
wie aus Saphir geschnitten mit einer Gebärde des
Fanatismus zum Himmel starrte, wies den kürzesten
Weg.

Oben gingen die Glocken noch, die Olivengärten
sandten ihren bleiernen Glanz herab, mit dem sich
Zitronenfarbe und in der Sonne zerflammender Purpur mischte, aus wahren Goldseen von Geranien, Tulpen und Oleandern.

Jetzt sahen sie die Rhone ganz nahe mit dem Wellengekräusel der perlgrauen Wasser und die zitternden Striche der Kähne, die in diesen Wirbeln umhergeschleudert wurden.

"Sehen Sie diesen halbzerstörten zweiten Brückenpfeiler genau an!" gebot der Antiquar. #quote[Ich will es!
Sagen Sie mir, was Ihnen auffällt! Erfahren Sie vorher nur, daß diese Brücke vor 200 Jahren auf Befehl
Ludwig #sc[XIV] von Frankreich gesprengt wurde, da
die Stadt Avignon irgendwie seinen Unwillen erregt
hatte. Aber mit dieser Brücke hat es eine seltsame
Bewandtnis. Sie kann nicht sterben. Sie ist der Ewige
Jude unter den Brücken.

Die Pulverminen Ludwig #sc[XIV] haben sie erschüttert und die Pfeiler oben abgerissen; Regen hat sie
abgewaschen, mit den Wellen zusammen abgenagt
und in ein Skelett verwandelt, aber sie steht noch.
Sagen Sie mir jetzt, was Sie sehen! Ist es nicht ein
Kopf dort an diesem zweiten Pfeiler? Sehen Sie nicht
die Stirne, diesen verkniffenen Mund, diese Nase;
dort den Backenknochen?]

"Fast seh ich's. Ja, ich sehe es!" stammelte Flavio.
"Wie seltsam! Ja, es ist ein Kopf!"

"Und jetzt, wenn wir Glück haben, werden Sie
die unerhörteste Musik hören, die jemals in die Ohren
von Menschen geklungen hat – Sehen Sie nach dem
Pfeiler und schalten Sie das Geräusch der Wogen
aus! Sehen Sie starr nach dem Pfeiler mit dem Kopf!
Hören Sie nichts?"

Aus dem Gurgeln der Wellen tönte es in der Tat
heraus wie das Geschrei der Todesangst.

Flavio schauderte. Waren es Ertrinkende, die um
Hilfe schrien? Aber jetzt klang es wie ein Gewieher
von Mauleseln, wie das Lachen schamloser Weiber,
wie schrille Flötentöne, wie Ziegengemecker, wie das
Gebrüll einer wütenden Menge –

"Nicht wahr, Sie hören es auch? Jetzt ist es wieder
wie das Gebrüll eines Löwen. Aber warten Sie, Herr
Sikorski! Heute hoffe ich endlich auch den zarten
Gesang zu hören, den lockenden, Herz und Sinn betörenden Gesang, das Lied Saint-Germains. Seit dreizehn Jahren warte ich darauf. Ich weiß es genau,
daß ich noch die Gnade haben werde. Ein Fischer
hat das Lied gehört. Vor vierzig Jahren, während
"auch wieder die Glocken der Prozession läuteten.
Aber er konnte es nicht aufschreiben, da er nichts von
Musik verstand. Aber dennoch packten ihn die Töne
so gewaltig, daß er fast tiefsinnig davon wurde und
sich in die Rhone stürzte."

"Urhan hat doch recht," murmelte Flavio, nach
dem Pfeiler starrend. Aber was war dies? Die grotesken Formen der verwitternden Blöcke schienen sich
zu beleben. Waren dies nicht schwarze Gestalten, die
sich aus den Felsblöcken des Pfeilers loslösten?

Sie schienen sich vor seinen Blicken zu verbergen,
Jetzt! Flavio sah ganz genau, wie einer, ein wahrer
Riese, einen Kahn an den Felsen heranzog. Eine
schwarze Römerlocke hing ihm quer herein in die
vulkanisch zerklüftete Stirne. Ein jüngerer Bursche
sprang zu ihm in den Kahn.

Das war nicht Saint-Germain oder ein Dämon, den
er heraufgesandt hatte! Diese Schreie eben, die wie
Ziegengemecker, Gewieher von Mauleseln, Lachen
schamloser Weiber klangen, kamen nicht aus dem
Munde geheimnisvoller Spukgestalten. Diese Rhonefischer waren es, die den alten Antiquar so grausam
verspotteten.

Vom jenseitigen Ufer winkten sie höhnisch herüber.

Flavio sah, wie der Alte sich ins Gras warf, vom
Übermaß der Verzweiflung gepackt. Wie ein Tier,
das man auf die Stirne geschlagen hat, lag er im
Schilfgras, bewegungslos, ein Stück Holz, ein toter
Stein.

Flavio stand ratlos und starrte bald auf den alten
Mann, dessen jahrelange Träume mit einem Schlag
so grausam zerstört worden waren, bald auf die Wellen und den trügerischen Brückenpfeiler, um den
es zischend und quirlend aufstieg.

Die Beiden drüben am Ufer waren jetzt verschwunden.

Vom Schloßberg her kam der Lärm der von der
Prozession Heimkehrenden. Die Patriarchen und
 Propheten, Esther, Sulamith und die Sünder der Vorhölle hasteten nach Hause zum Mittagessen.

Ein hohes, kicherndes Schluchzen kam aus dem
Schilfe.

Es zerriß Flavio das Herz. Dann war der Alte aufgesprungen: der Mantel flatterte um seinen Leib; die
langen Arme, die so entfleischt und hölzern waren,
daß sie den Flügeln einer Windmühle glichen, waren
nach dem Brückenpfeiler ausgestreckt:

"Schändliches Ungetüm! Gleißender, tückischer
Lügenwurm!" drohte er hinüber.

Aber niemand antwortete diesen Schreien ohnmächtiger Verzweiflung. Ein Schatten nur lag über
dem Brückenpfeiler wie ein böses, spöttisches Phantom, dessen zackige Schwingen gesättigt sind von den
Seufzern trübverlorener Seelen, und den tiefen, wortlosen Klagen ihrer Sehnsucht. Die im unbarmherzigen Sonnenlicht auf‌lodernden Felsblöcke kauerten
wunderlich stumm und still.

Ein silberner Fisch schnellte aus den Wellen empor
und versank plätschernd wieder.

Der Alte hatte sich jetzt wieder gefaßt. Wie einer,
der einen langen, tiefen, traumlosen Schlaf hinter
sich hat. Er blickte Flavio an, aber dieser Blick war
tot, als befänden sie sich in einer Wüste, wo nichts
Lebendiges mehr ist, unter großen, hönischen, mitleidlosen Sternen, in unermeßlichen Stillen ...

Der Antiquar wollte sterben. An die Rhone dachte
er. Aber er ging mit Flavio langsam nach Hause zurück. Es war ein abscheulicher Tod, in den Wellen
zu ersticken und noch greulicher war es, als aufgedunsene Wasserleiche den frechen Blicken der Neugierigen preisgegeben zu sein.

Der Privatgelehrte hatte ihm ein Gift aus Kairo
mitgebracht, das vielleicht schon der schreckliche
syrische Despot, den die zitternde Christenheit den
"Alten vom Berge" nannte, angewendet hatte. Es war
unter der Flut seiner Bücher versteckt; er mußte es
finden.

Der Antiquar sprach von einem chemischen Rosenkreuzerrezept und duldete es, daß Flavio in seiner
Bibliothek mitsuchte. Es war astrologischer Kram,
ein Sammelsurium mittelalterlichen Aberglaubens,
darunter seltene Chroniken, Höllenzwänge, Zauberformeln, magische Behexungen, Goldmacherrezepte
und Sympathiekuren.

Schon sank die Dämmerung herein. Noch immer
suchten sie. Der Garten am Hause und die Rhone
lagen stumm und glasig da. Eine leise Brandung bewegte die Luft. Der Faulbeerbaum an der Gartentüre
griff mit seinen verworrenen Arabesken in die glanzlose, perlenweiße Flut des Himmels. Die Wellen
der Rhone hörte man nur von ferne, wie durch eine
Taucherglocke.

Sie fanden ein Bild des Grafen Saint-Germain.
Der Alte warf es auf den Boden und das sardonische
Lächeln schien sein dürres, vertrocknetes Gesicht
gleichsam zu spalten.

Man müßte das Gift finden. Unmöglich konnte es
dieser Umgebung, diesen Teufelsbüchern und Höllenzwängen, unter denen es sich doch wohl fühlen mußte,
entwichen sein. Hier in diesem Zwielicht entzündete
sich das Unheimliche dieser Bücher zu einem wühlenden Fieber; das Zimmer verengte sich zu dem Laboratorium eines mittelalterlichen Zauberers mitten im
feindlichen Halbdunkel toter Gelasse mit halbverloschenen Inschriften. Uralte, vom Tod vergessene
Menschen, Schemen, die sich unter die Menschen
mischten, stiegen steinerne Wendeltreppen hinauf,
starrten nach den schwarzen Raben, die wie schwarze
Pünktchen um den halbverfallenen Turm kreisten,
und unten im verwilderten Schloßgarten lockten die
Bündel roten, giftigen Fingerhuts unter hohen Farren. Über allem aber lasteten fahle Wolken und
der dumpfe Schrecken blutiger Legenden und knöchener Phantome –

Uralte, steinerne Gesichter mit mumienhaft
drohenden Zügen schlüpften aus den dunklen Ecken,
drohende Hände reckten sich; dann verschwanden die
Gesichter und die Hände.

"Gerettet! Gerettet!" schrie der Alte mit übermenschlicher Stimme. Ein traumhaftes Lächeln glitt
über seine verwitterten Züge. Überströmend war
das Glücksgefühl, das ihn durchwogte. Zitternde,
stammelnde Laute kamen über seine Lippen. Vor den
Augen hatte er die gefalteten Hände und schluchzte;
sein ganzer Körper bebte von dem tiefen, schweren
Schluchzen.

"Was haben Sie gefunden?" fragte Flavio, vor
freudiger Überraschung starr.

"Den Mann habe ich gefunden, der allein auf der
ganzen Welt mir und Ihnen das Rätsel Saint-Germains und seines Lieds lösen kann. Wir müssen morgen sofort in aller Frühe nach Mallorca fahren –"

"Nach Mallorca? Nach dieser schrecklichen Insel?
George Sand war vor 8 Jahren mit Chopin dort und
jetzt noch ist Paris voll von den Schauermärchen,
die diese Frau von den Bewohnern dieser Insel, diesen tückischen, habgierigen Insulanern, erzählt. Man
vertrieb sie aus der ersten Wohnung. Man lieferte
ihnen keine Milch mehr, es regnete zur Decke herein, die Kleider verschimmelten. Die Leute in Palma
wollten die George Sand, die Jakobinerin und Hexe,
am Galgen aufhängen. Zwei Bücher von ihr verbrannten sie auf dem Marktplatz –"

"Was tut das?" lächelte der Antiquar mit dem
Starrsinn des Greises. "Wir werden einen 97 Jährigen
Mann dort finden, einen Ehrenmann, den der Tod
vergessen hat und den er auch nie von der Erde wegnehmen sollte – einen Mann, der mit Saint-Germain als ganz junger Mensch auf Mallorca zusammen
war. Einen Mann, der sicher auch das Lied Saint-Germains hat –"

Flavio machte, schon halb überredet, noch einige
Einwendungen. Der Bürgerkrieg der Christinos mit
den Karlisten, die ihre Gefangenen in Ziegelöfen
brieten, flackerte wieder auf – die Franzosen waren
wegen der Einmischung Frankreichs in die spanischen
Händel verhaßt – vielleicht bekam man auch keine
Wohnung, wie es Chopin und der George Sand widerfahren war –.

Der Antiquar hörte kaum darauf. Er ordnete die
verwühlten Bücher und ein Virtuose des Reisens, der
er war, stellte er schon die Reiseroute zusammen.

"Oh! Wenn Sie diesen Mendizabal sehen und seine
Erinnerungen hören –" schwärmte der Alte, der
nun auch schon die Koffer herbeischleppte.

"Mendizabal? Welcher Name! Etwas Medusenhaftes liegt darin. Man denkt an einen Basilisken –"

Der Alte lächelte nachsichtig.

"Ich habe ihn nie gesehen und kenne ihn nur aus
seinen Briefen. Aber das genügt mir. Er muß ein
Mensch von edelstem Charakter, mit einem Herzen
von Gold sein – Reich, wohltätig, still, ohne Amt
und Würde, obwohl sein Neffe der allmächtige
Finanzminister Spaniens ist –"

"Mendizabal, der die spanischen Klöster aufhob
und die Mönche vertrieb?"

"Derselbe. Unser Freund ist der Onkel. Er hebt
sicher kein Kloster auf und kümmert sich um Mönche
gar nicht. Er ist Geschichtsforscher, Philosoph,
Sammler, Kunstliebhaber und ein großer Musiknarr.
Er kann jede Note von Chopins Kompositionen auswendig. Aber er ist nicht überspannt. Er arbeitet
täglich in seinem Garten, füttert seine Hühner und
ordnet seine große Pflanzensammlung. Dabei lebt er
aber schon ganz im Jenseitigen, in einer Sphäre, wo
hohe, kühle Sterne ihre Bahnen ziehen –"

"Also ein Ausbund von Tugend, Moral und Wohlanstand, ein Unikum!", lächelte Flavio. "In meinem
'Gastmahl der Schatten' schrieb ich, daß kein unausstehlicheres Pack zu finden sei als die sogenannten Anständigen und Ehrenwerten –"

Der Antiquar sann nach. "Persönlich habe ich ihn
nicht gesehen," sagte er dann sehr langsam und mit
abgewogenem Wort. "Eines, das muß ich sagen, gibt
mir zu denken in dem letzten Brief. Er schreibt
mir, daß ihn ein Gedanke quäle, Tag und Nacht, jede
Minute und jede Sekunde, und er könne ihn nicht von
sich abschütteln – Was es sei, schrieb er mir nicht.
Jetzt mache ich mir Gedanken darüber –"

// TODO Lelio oder Flavio?
"Chopin," sagte Flavio nur. Der Antiquar schwieg,
aber irgend ein ähnlicher Gedanke mußte auch in
ihm aufgestiegen sein. Er nickte ganz leise.

"Reisen Sie mit?" fragte der Alte,

"Unter allen Umständen," sagte Flavio. "Ich muß
diese fixe Idee Mendizabals kennen lernen –"

Sein Blick verlängerte sich, ward starr und dunkel.
Er hob das Bild Saint-Germains auf, das der Alte
auf den Boden geworfen hatte, zerriß es und ließ
es wieder auf dieselbe Stelle fallen.

Draußen zog ein Gewitter herauf. Der Wind wühlte
in den dicken, aufgedunsenen wilden Weinranken
und formte seltsame Figuren aus ihnen wie gierige
Hände, die über eine hilflose Seele herfallen. Die
Brückenpfeiler ballten sich wie Fäuste; vom Wasser
kam es her wie der Leichenduft des Schierlings. Der
Modergeruch der unheimlichen Bücher mischte sich
dazu.

Der Sturm wurde heftiger; die Bäume krümmten
sich, ihre Äste krachten. Über den Schloßberg mit
dem Zyklopenbau des Papstpalastes zuckte eine weiß
und grün gesprenkelte Flammensäule nieder. Die
Brückenpfeiler, vom Regen gepeitscht, reckten sich
trotzig in den flammenden Gewitterhimmel; sie
schienen in den Flammen aufzujauchzen.

Jetzt krachte ein Donnerschlag herab, als wollte der
Himmel den Erdstern mit einem Schlag zerschmettern. Sein Krachen erschütterte das ganze Haus.

"Ein böses Vorzeichen für die Reise," murmelte
Flavio. Der Greis zuckte nur die Achseln. Seltsam
leuchtete es auf in seinen halberloschenen Augensternen. Ein totenhaftes Grinsen flog über seine Züge.

Er sah nach der Brücke, als spräche er zu ihr.

"Ich höre nicht den Donner. Ich höre nur das
Hohngeschrei, dieser Elenden am Brückenpfeiler.
Aber ich werde mich an ihnen rächen –"

In diesem Augenblick zuckte eine glitzernde Feuerschlange fast vor seinen Augen herab. Der blendende
Glanz züngelte nach und verschwand mit leisem Knistern.

Vor Schrecken bleich stammelte Flavio:

"Wer ist dieser Mendizabal? Was werden wir auf
Mallorca erleben?"

Der Blitz hatte das Bild Saint-Germains mit grellem Feuer überflackert. Noch immer starrten ihn
diese maskenhaften Züge an, diese trüben, steinernen, wissenden Augen.

Sie folgten ihm, wenn er wegsah, während der Kopf
starr wie Stein blieb. Diese schrecklichen Augen
krochen ihm nach, als wären sie selbständige, lebendige Wesen. Sie krochen heran, dann stellten sie sich
wieder tot und nahmen doch Besitz von seiner Seele;
sie nisteten sich in ihre innersten, verborgensten Winkel ein und umklammerten ihn wie schemenhafte Ungeheuer, wie spöttisch grinsende Sklaven, die ihren
Herrn überfallen. Sie kamen hervor aus einem leuchtenden Nebel wie kleine farbige Kugeln, wie Figuren
auf einer von innen beleuchteten Alabastervase.

Draußen erschöpfte sich das Gewitter in fernen
Donnerschlägen und matteren Blitzen. Aber es war
fast, als hätte es seine Wut an das Bild Saint-Germains abgegeben.

Giftiger und drohender starrten die bannenden Augen: "Mein Lied willst du? Ich glaub es dir. Du wärst
der erste Klavierspieler der Welt. Liszt, Chopin,
Kalkbrenner würden verschwinden neben dir. Du
würdest die Seelen bezwingen wie das Steppenfeuer
dürres Gras. Auf den Knien würde die Welt vor dir
liegen. Der Zar auf seinem Throne, Metternich, die
Giftspinne der heiligen Allianz, die zusammen wetteifern, deine Landsleute vollends zu vernichten und
die letzten Freunde und Verwandten, die du noch
hast, den Raben als Galgenfutter zu liefern, sie beide
würden zittern, würden sie dich dieses Lied spielen
hören, gleichwie damals Ludwig #sc[XV] zitterte, als ich
es ihm in Marly vorspielte. Das Lied wäre die Fliege,
die dem Kaiser Titus ins Gehirn hinaufkroch. Ich
habe dich in deiner Erniedrigung gesehen, als du in
der 'Alten Laternengasse' bei Barrye trocknes Brot
aßest, gleich dem anderen schlammigen Gewürm dieser Gasse, diesen Gelegenheitsdieben, Einbrechern
und Dirnen, die wie Wespen herumschwärmen. Ich
sah dich spielen bei diesem Wirt, während die Laterne traurig beim Knirschen ihrer Rollen schaukelte
und deine Klaviertöne begleitete. Damals phantasiertest du über mich und dichtetest das 'Gastmahl
der Schatten'. Du brachtest mich den Parisern wieder in Erinnerung, streiftest den Staub, den die boshafte, gefräßige Zeit aus ihren bösen Fledermausflügeln auf mich fallen ließ, wieder ab. Ich war dir
dankbar. War ich es nicht, der dir den Gedanken eingab, am General Swerdlow Rache zu nehmen für
deine Angehörigen, Dienste bei ihm zu nehmen und
ihn dann zu erschlagen? Begnügst du dich damit, diesem Fettwanst den Schädel zertrümmert zu haben?
Denkst du nicht manchmal an die Fliege des Kaisers
Titus? Welterschütternde Taten warten auf dich. Es
scheint mir aber, daß du dich zufrieden gibst, einen
reichen Mann in Paris zu spielen, dich beneiden, umschmeicheln und dabei hinter deinem Rücken bespötteln zu lassen –"

Flavio, überwältigt von seiner Traumphantasie,
stampfte mit dem Fuße auf. Er bückte sich, um
Saint-Germains Bild aufzuheben.

Der Antiquar, mit dem Einpacken beschäftigt, bemerkte es nicht oder stellte sich wenigstens so.

"Waren Sie schon in Warschau?" fragte Flavio den
Alten. #quote[Nein? Ich staune, da Sie doch unermüdlich die ganze Welt bereisen. Saint-Germain war auch
dort, damals vor 30 Jahren, als er an Zarenmord
dachte. Er gründete in Warschau eine revolutionäre
Illuminatenloge. Ich möchte ihn gesehen haben, damals in Warschau, in seiner französischen Hoftracht
mit goldbordierter weißer Weste und dem blauen
Ordensbande unter diesen tscherkessischen Soldaten,
den langbärtigen Juden und den polnischen Bauern
mit ihren roten Stiefeln.

Was würde er heute zu dem Großfürsten Konstantin und zu den russischen Galgen am Sächsischen
Platz und vor der St. Katharinenkirche in Warschau sagen? –]

"Halten Sie ein!", rief der Alte mit einer zackig
überflackerten wirren Geste. "Ich sage bloß, daß er
sich beim Großfürsten Konstantin einführen ließe
und ihm sein 'Lied' vorspielen würde, einmal, zweimal, bis er das Gewünschte erreicht hätte. Sicher
würde er die Wirkung des Liedes auch durch spiritistische Sitzungen mit Geisterbeschwörungen verstärken –"

Flavio antwortete nicht. Er starrte auf das Bild
Saint-Germains, das er heimlich wieder unter einer
aufgeschlagenen alten Chronik versteckt hatte, wie
der Wanderer auf die Sphinx, die vor ihm am Rand
des Abgrunds kauert –

Er fühlte, daß das Unheimliche, das er heute erlebt hatte, Gestalt annahm, daß es sich nahte, an der
Tür pochte, Einlaß heischend, daß es die Türe schon
überschritten hatte –

Etwas in diesem Zimmer, das sah er fast vor seinen Augen, war von diesem unheimlichen Zauber belebt.

Er verdeckte diese gespenstischen Augen vollends,
aber nun blickten sie aus diesen verblichenen, altväterlichen Gobelins an den Wänden, aus den schwarzgerahmten Familienbildern, die bei jedem Windstoß
sich hoben und senkten und in dem seltsamen Licht
der wehenden Kerze sich gegeneinander bewegten;
sie starrten aus dieser altertümlichen Uhr, die eine
Tiergestalt vorstellte, halb Sphinx, halb Chimäre,
welche die Flügel zu schlagen, die Klauen auszurecken schien –

"Warum stampften Sie vorhin mit dem Fuße?
Was sahen Sie? In diesem Zimmer spielen sich tolle
Dinge ab –" fragte der Antiquar mit tastender etwas
verschleierter Stimme und lächelte dabei, wie bloß
Diplomaten und Verschworene lächeln ...

Schon fuhren sie auf den unendlich blauen, fast
purpurnen Wogen des Meeres. Die Wellen glitten
wie Träume, die ein lautes Wort zerstören kann. Kein
Luftzug bewegte die Taue; ihre Schatten zitterten
nicht einmal, wenn sie aufs Verdeck fielen. Die
Wimpel hingen schlaff von den Masten herab, die
französische Küste schwand mit ihren gelben Felsen.

Auch alle Wirklichkeit schien für Flavio hinzuschwinden. Welcher unheimliche, unsichtbare Fährmann entführte ihn? Warum hoben und senkten
sich diese Wellen so unmerklich, als wollten sie sich
ganz unhörbar machen?

Die teuflische Ruhe dieses eigentümlich gefärbten
Meeres und dieser unruhige Schimmer in der Luft
flößte Flavio Entsetzen ein. Verfluchte Schiffe in
alten Zeiten fuhren so dem Eingang in den Hades
zu; der Fliegende Holländer winkte ihnen aus der
Ferne und von der Insel der verzweifelnden Sirenen
kamen schrille Schreie. Und während die törichten,
ahnungslosen Passagiere vom Wunderland Zipangu
oder dem Lotosland am Nil träumten, sog sie vielleicht schon der schreckliche Strudel ein ...

Eine steile Küste winkte, aber die Feierlichkeit
und Ruhe des Orients war um ihre Ufer. Ihre Klippen zerschmolzen im pfauenblauen Himmel. Weiße
Segel streiften über das Meer, das jetzt bald veilchenblau, bald flaschengrün, bald purpurn dahinrollte.

"Hier fuhr Chopin vor acht Jahren –" sagte träumend der Antiquar.

"Die Mulattin nebst ihrer Tochter mit ihm," ergänzte Flavio. "Mich schaudert noch von meinem Zusammentreffen mit ihr im Künstlercafé. Hoffentlich
treffen wir es besser mit unserem Logis –"

Schon lag der Golf von Palma vor ihnen, die Vororte dieser großen Stadt, ihre Kathedrale und die smaragdgrünen Felsen über ihr im Weihrauchduft des
blauen Mittags mit seiner fast schwermütigen Sonne.
Ein sanfter Wind wiegte das wundersame Meer, dessen Wogen in dieser Umarmung dahinstarben.

Keine Gondel umdrängte das Schiff, als sie landeten; keine Paßbehörde, keine Sanitätsoffiziere.

Kein Bettler war zu sehen; diese Leute waren höflich, sanft, fast schüchtern.

"Sie hat übertrieben, die gute George Sand, mit
ihren tückischen und wilden Insulanern –" bemerkte der Antiquar. "Ich sehe ja gerade das Gegenteil –"

"Sollte Herr Mendizabal, unser Ehrenmann, nicht
auch am Ende sich ins Gegenteil verwandeln?" lachte
Flavio.

Sie vertrauten ihr Gepäck einem Maultiertreiber
an, dessen stolze Tiere hintereinander mit klingendem Messingstäbchen und kleinen Glöckchen behängt
dahin trabten.

Mendizabal wohnte außerhalb der Stadt, oben bei
der Felsenschlucht mit ihren steil züngelnden Zypressen. Man sah die Klippen und ihre unerhört abenteuerlichen Formen. Das waren versteinerte Tiergestalten, Menschenköpfe, Orgelpfeifen, Säulenknaufe,
kauernde Tiere, Figuren aus einer Mondlandschaft,
oder von einem wahnsinnig gewordenen Gotte geschnitzt. Das Gerippe einer Windmühle, deren Flügel den abgebrochenen Fühlhörnern eines Schmetterlings glichen, starrte kläglich in die Luft.

"Kennen Sie Herrn Mendizabal?" fragte Flavio den
Maultiertreiber.

Nur zögernd, ängstlich, fast mit zitternder Stimme
bejahte dieser.

"Er ist reich und sehr sonderbar," sagte er nur
und machte sich mit den Maultieren zu schaffen.

Flavio sah sich mißtrauisch in diesen engen Gassen um, mit ihren hermetisch verschlossenen Häusern und den hohen düsteren Mauern, über die kaum
einige klägliche Baumzweige sahen. Selten nur konnte
er in einen melancholischen Hof hineinsehen, wo
einige struppige Palmen und spitze, trübselige Zypressen um ein Fleckchen blauen Himmels kämpften.

Um die schmutzigen Läden schwirrten ekle Fliegenschwärme.

War es denkbar, daß hier in diesem Schmutz und
diesem verstaubten, kümmerlichen Elend Chopin,
dieser verzärtelte Sybarit, gelebt hatte?

"Auch ich kann's nicht fassen, daß Chopin es hier
auch nur eine Woche lang aushielt," sagte der
Antiquar, als hätte er Flavios Gedanken erraten,
und deutete auf eine kleine Winkelwirtschaft, über
deren Türe ein verzupfter Lorbeerbusch wie ein Hut
hing. Aus dem Eingang, einem rußigen Gewölbe, an
dessen Decke ein von Spinnweben überzogener
eiserner Leuchter hing, drang der Geruch von
Schmalz, Öl und Knoblauch. Ein vampirartiges
quäkendes Hündchen sprang heraus.

Im Halbdunkel des Ganges unterschied Flavio
jetzt einen Bauern, der rülpsend auf einer Bank saß
und aus einem Weinschlauch trank. Eine Magd, die
vorbeikam, rasselte mit ihrem Blecheimer.

"Chopin! Chopin!" rief plötzlich Flavio aus. "Wer
spielt hier Chopin?"

Der Antiquar eilte herbei. Die Töne kamen vom
Hofe her. Eine rote Backsteinmauer leuchtete, als sie
die Türe aufstießen.

Vor dem kleinen Hinterhaus stand ein verkrüppelter, bronzefarbener Lorbeerbaum, unter dem Gras
und Brennessel wucherten. An dem vergitterten Fenster über der winzigen Türe tauchte ein Frauenkopf
auf und verschwand.
"Gehen wir hinauf!" munterte Flavio den Alten
auf. Am Eingang stolperte Flavio über die zerbrochene Marmorschale eines ehemaligen Springbrunnens, die nun als Schmutzschale dienen mußte.

Droben setzte das Klavierspiel aus.

Aber Flavio ging hinauf, während der Antiquar
wartete und sich müd an die Hofmauer lehnte, aus
deren schwarzen Mauerfugen lange, starre Gräser wie
Finger wuchsen. Der Klavierspieler trat aus der
Türe und begrüßte Flavio mit der gewinnenden
Freundlichkeit, die ihm schon bei der Landung an
diesen Insulanern aufgefallen war.

"Sie wünschen wohl Autogramme und Briefe des
großen Meisters Chopin, der vor acht Jahren mit
seiner Freundin unsere Insel mit seinem Besuch beehrte?"

"Sie haben Briefe und Autogramme Chopins? Wie
ist dies denkbar?" fragte Flavio, starr vor Staunen.
"Korrespondieren Sie mit Chopin?"

"Mein Prinzipal, Herr Mendizabal, ist Chopins
bester Freund," wich der Klavierspieler aus. "Treten
Sie, bitte, ein! Suchen Sie aus! Mein Prinzipal hat
mir einige Briefe überlassen. Er korrespondiert sehr
fleißig mit Herrn Chopin. Sogar einen Brief des Zaren
an den Meister besaß Herr Mendizabal. Ich habe mir
erlaubt, ihn an mich zu nehmen, da Herr Mendizabal,
obwohl sehr reich, mir den Gehalt schuldig blieb –"

"Genug! Genug!" rief Flavio, vor Entrüstung seiner nicht mehr mächtig. Mit einem Blick hatte er
schon beim Eintritt in das Zimmer das elende Fälscherhandwerk dieses Unverschämten, seinen ganzen
Apparat mit verschieden geformten Schreibfedern,
Gänsekielen, Tusche und Pergamentpapier von jeder
Qualität und Größe erfaßt.

Er wollte ohne Gruß forteilen, besann sich aber
anders.

"Ich bin hier fremd. Begleiten Sie mich zu Ihrem
Prinzipal!"

Ein Geldstück, das ihm Flavio in die Hand drückte,
machte ihn willfährig.

"Der Herr hier ist ein Angestellter des Herrn Mendizabal und Mendizabal ist, wie ich höre, in eifrigem
Briefwechsel mit Chopin," stellte Flavio vor.

"Waren Sie auch mit Chopin damals bekannt, als
er hier auf der Insel war?" fragte der Antiquar mit
amüsiertem Spott. Aber der Gauner zeigte sich der
Situation gewachsen.

"Ich war damals zwar noch ziemlich jung, aber
Frau George Sand besonders schätzte mich. Oft
mußte ich die Zänkereien und Streitigkeiten mit
ihrem ersten Hausherrn wieder glatt machen. Frau
Sand war sehr unvorsichtig. Sie interessierte sich für
Cuenco, einen jungen Häuptling der Carlisten, auf
dessen Kopf die Christinos einen Preis gesetzt hatten –" und mit einer bewunderungswürdigen Verschmitztheit ablenkend, fuhr er fort: "Sehen Sie
hier oben neben der Klostermauer die rote, zerklüftete Steinwand? Dort hatte Cuenco unter dem
Dickicht von Stacheleichen, Stechpalmen, Pinien und
Rosmarinbüschen sein Versteck. Ich war zweimal
oben bei ihm. Beim zweiten Male traf ich Frau Sand
oben. Sie war wie eine Spanierin gekleidet; eine Granatblüte im Haar hielt ihre Mantilla an der Seite hinauf, aber sie verstand sich doch nicht darauf, sie wie
eine Spanierin zu tragen. Die Mantilla verschob sich
und ich erkannte sie.

Vor ihrer Abreise unterhielt sich Frau Sand lange
mit mir. Es war im Garten des Klosters von Valdemosa, wo sie nach dem Streit mit dem Hausherrn Obdach fanden. Frau Sand beklagte sich über Chopins
Launen und schimpfte auf seine Pariser Freundinnen.

"Das sind verzärtelte, herausgeputzte, perlenbehängte Eintagsfliegen," sagte sie. "Eintagsfliegen.
Sie baden sich in Wein und verschlucken Perlen, die
sie in Essig aufgelöst haben –"

Flavio und der Antiquar sahen sich an, die Lügenphantasie dieses Burschen ärgerlich anstaunend.

"Woher er dies aufgeschnappt hat?" sagte der
Blick Flavios; ein hartes, kühles Lächeln unterstrich
es. Und der Antiquar schien zu sagen: "Erhoffen wir
Besseres von seinem Prinzipal!"

= Die Allerseelennacht

Mendizabal, der Würdegreis mit dem goldenen
Herzen, erwies sich als eine aus gut und böse, Schwindel und Schwärmerei seltsam gemischte Natur. Dem
Äußeren nach dem General ähnelnd, nur ohne die
Speckfalte, die sich bei Swerdlow den Hals hinaufschob, erstaunlicherweise trotz den Methusalem-Jahren fast noch ohne Falten in dem wie ein Kürbis zerquetschten Gesicht, zeigte er zwar kein goldenes
Herz, noch weniger ein vornehmes Wesen und eine
freigiebige Hand, auch gestand er keineswegs eine
Mitschuld an den Fälschungen des Klavierspielers ein.

Aber selbst der mißtrauische Flavio überzeugte
sich, daß seine Schwärmerei für Chopins Kunst echt
und aufrichtig war.

"Wissen Sie, daß Chopin hier auf der Insel kurz
nachdem er in sein neues Heim im Kloster von Valdemosa übersiedelt war, sein polnisches Allerseelenfest feierte?" vertraute er kaum nach den ersten
Worten der Begrüßung seinen Gästen an.

"Das polnische Allerseelenfest?" wiederholte der
Antiquar dreimal in verschiedenem Tonfall.

Flavio sah ungläubig drein. Sicher nistete hier die
fixe Idee, von der dieser Methusalem schrieb. Und
überdies, wie kam Chopin auf dieser südlichen, sonnenhellen Insel dazu, dieses düster-phantastische polnische Nationalfest zu feiern?

An ihrem Tag im Kalender kommen die armen
Seelen aus dem Fegfeuer, frierend und hungrig, voll
Harm, sie setzen sich an den Herd, flehend mit dringlicher Beschwörung. Oh! Wer würde ihre Bitte nicht
erhören, sie fortweisen vom warmen Herd, oder mit
der Bewirtung knausern? Niemand in der armen
Bauernhütte, vor der nur ein wilder Birnbaum steht,
hinter dessen Ästen das Dach mit den grauen Ziegeln fast verschwindet; niemand auch im Herrenhaus,
wo die Vorfahren, als Polen noch frei war, ihre
Pferde mit silbernen Hufen beschlagen lassen konnten.

Niemand auch in der elendesten, nur mit Lehm und
Binsen bedeckten Hütte.

Denn es ist nicht nur grausam und ganz unmenschlich, auch freventlich und unklug, solche arme,
flehende Seelen schnöd abzuweisen und ungelabt
wieder ziehen zu lassen. Denn jede polnische Familie
hat ihr Hausgespenst; in gar mancher Nacht hört man
Geräusch im Hausflur, Gebrüll in alten Gelassen
und Türmen; oft auch verstecken sich diese armen
Seelen in Bäumen und in der Nähe von Bienenstöcken
und von Basilikumkraut, das sie stärkt und aufrichtet.

"Erzählen Sie alles, was Sie wissen, Herr Mendizabal!" bat Flavio.

Dieser sah auf und zuckte zusammen. Sein verzerrtes Gesicht glich jetzt den Draperien eines hieratischen Priestergewands. Die schmale Hand zeichnete
eine Geste von eindringlicher Abwehr.

"Wissen Sie vor allem, daß ich dem polnischen
Dichter Julius Slowacki, als er mich hier besuchte,
von diesem Allerseelenfest auf dringendes Bitten hin
erzählte und daß ich es bitter bereute? Auch von
Saint-Germain darf ich Ihnen kein Wort sagen –"

"So erzählen Sie uns wenigstens, was Sie mit dem
Dichter Slowacki erlebten! –" drängten beide, die
ihre tiefe Enttäuschung kaum verbergen konnten.

"Ich muß erst den Pförtner des aufgehobenen
Klosters von Valdemosa fragen; diesem vertraute
Slowacki sich an."

"Gehen wir!" rief Flavio. "Suchen wir den Alten
auf! Ich will nicht mehr warten, bis Sie ihn gefragt
haben –"

"Gern will ich Ihnen gefällig sein, da Sie meine
Gäste sind und vom Meister kommen. Aber wissen
Sie, daß ich, seit Chopin hier war, dieses verödete
Kloster nicht mehr betrat? Wissen Sie, daß ich Unmensch es war, der Chopin aus seiner ersten Wohnung vertrieb und auch schuld war, daß ihm der
längere Aufenthalt in diesem Klosterasyl unmöglich
gemacht wurde?"

"Sie, der größte Verehrer des Meisters?"

#quote[Das ist es ja, was ich täglich, jede Stunde bereue.
Gekränkte, erbärmliche Eitelkeit war es. Ich lud
Chopin in mein Haus ein. Ein großes Festmahl war
gerichtet; die Vornehmsten, Reichsten und Einflußreichsten von Palma sollten kommen. Chopin, aus
irgend einem Grunde, lehnte ab. Ich überwand mich
und ging noch einmal zu ihm. Da Chopin mit Frau
Sand im Garten war, mußte ich warten. Ich hörte die
// TODO wo geht das ' zu?
gellende Stimme der Dichterin herauf. 'Warum
willst du die Einladung Mendizabals nicht annehmen? Weil du ihn mit schmutzigen Händen im Garten arbeiten sahst? Ist das ein Grund? Aber so bist
du auch in Paris. Perlenbehangene Gräfinnen aus dem
Faubourg Saint-Germain sind deine Sache; mumienhafte Pairs, die zehn Regierungen nacheinander ihren
Eid geschworen und gebrochen haben und als Mummelgreise noch sich nicht schämen, den Bürgerkönig,
der ihnen ein Greuel ist, um Orden, Ämter und
Pensionen anzubetteln. Über meinen Hausdichter
und Hausphilosophen Leroux ziehst du die Nase hinauf, obwohl er ein gebildeter und geistvoller Mensch
ist, bloß weil er tagsüber in seiner Buchbinderwerkstätte steht. Dein seelenloser, abscheulicher Hochmut
zieht dich zu diesen Puppenmenschen. Hast du je
rechte, wahre und herzliche Sympathie für irgend
einen Menschen gefühlt? Du hast es mir einmal selbst
gesagt, daß niemand dich länger als höchstens drei
Tage fesseln kann. Die Sängerin Constantia Gladkowska gab mit dir zwei Konzerte in Warschau, als
deine Laufbahn begann. Du schienst für sie zu
schwärmen. Weil sie ein weißes Kleid trug und weiße
Rosen im Haar. 'Sie ißt Kreide und trinkt halbgekochten Kaffee, damit sie blaß bleibt,' spottetest du.
Fontana ist bloß dazu da, dir deine Gänge in Paris
zu besorgen. Tag und Nacht hetzest du ihn herum,
und niemand weiß, was du im stillen über ihn denkst.
Freilich! Er soll sich noch glücklich schätzen, daß
er dir dienen darf; denn er wird auf diese Weise
in deine Biographie kommen und unsterblich werden!
Ein Hauch, ein fallendes Blatt, eine schlecht gebundene Krawatte zerstört bei dir sofort jede Sympathie.
Wenn Leroux in den Salon in Nohant kommt,
stehst du auf: du kannst ja die Demokraten mit ihren
verwilderten Bärten und dem Tabaksgeruch, wie du
sagst, nicht leiden. Der Faubourg Saint-Germain dagegen! Das ist Verderbnis, mit Parfüm übertäubt,
Plattheit, mit Seidenspitzen bedeckt, aber freilich
es ist Parfüm und rieselnde Seide. Da kann man auf
dem Klavier Einhörner mit Pfauenflügeln und
Schwäne, die vor Hochmut sterben, dazu dichten!
Da kann man sich an parfümierter Melancholie laben,
genau so, wie ein Marquis mit gespitzten Fingern
sich eine Prise aus seiner elfenbeinernen Dose nimmt.
Und ich? Nun, ich werde bald bloß noch den Krankendienst bei dir besorgen.

Ich frage dich also noch einmal: 'Warum willst
du nicht zu Mendizabal kommen, der dein Genie auf
Knien verehrt?'

Chopin näherte sich einem Jasminstrauche, der ihn
mit seinem weißen Sternenregen überschüttete,
pflückte eine Blüte, sog ihren Duft ein und sagte mit
kühl gleitender Stimme: 'Ich komponiere für Gerechte und Ungerechte, für Könige und graue Bettler, für geputzte Kurtisanen und Utopisten mit
Strohkränzen auf ihren Köpfen, aber bei diesem
Mendizabal spiele ich nicht –'

Ich floh aus dem Hause, Chopin war noch neben
dem Jasminstrauch, als ich zurücksah –]

Schon lag das verlassene Kloster vor Flavio und
dem Antiquar. Die Zellen mit den regenbogenfarbigen Steinen waren leer, da noch kein Käufer sich
gefunden hatte. Unter den zierlichen, gotischen
Arkaden mit den dünnen, gebrechlichen Säulchen
und dem zierlich gemeißelten Blätterwerk wandelte
kein Mönch mehr.

Aber der Geruch von Weihrauch und Moder, von
ausgegrabenen Mumien und uralten Geheimnissen
war noch immer um dieses halbverfallene Gebäude
mit dem Riesenportal, das bestimmt schien, von Urweltungetümen betreten zu werden.

Mendizabal, der nachkam, begrüßte den mit Gartenarbeit beschäftigten Pförtner, den zweiten Methusalem auf dieser Insel der Langlebigen.

"Es sind Freunde Slowackis und Chopins" stellte
Mendizabal vor. "Sie möchten von dem polnischen
Dichter Slowacki hören –"

"Ich will niemand mehr sehen. Von Slowacki
darf ich nichts erzählen" murrte der Pförtner und
ging, ohne aufzusehen, am Beet der großen Sonnenblumen mit den Bienenschwärmen vorbei zu den
hohen Büschen Melissenkrauts, die von Bienen umschwärmt waren, als sollten diese die Eindringlinge
scheuchen. Eine verwilderte Taxushecke mit nie gesehenem Unkraut verbarg ihn jetzt vollständig.

Man sah nur noch hoch aufgeschossenes Melissenkraut, verdrehte Distelstauden, an denen die Sonnenstrahlen wie Raupen hinaufkrochen. In der Ferne
auf dem Meer zogen gelbe, orangefarbene Segel über
die Wellen; von der Sonne betäubte Wolken sanken
kraftlos auf sie nieder vom Himmel, der sich in
Weiß und Orange auf‌löste.

"Empfang die Gäste, Isidoro! Ist dies Gastfreundschaft?" rief Mendizabal und eilte auf das Versteck
zu.

Isidoro trat hervor. Er deutete auf einen Bienenschwarm, dessen Summen er lauschte.

"Gut!" sagte er dann. "Kommen Sie mit in den
kleinen Anbau da oben! Seit Slowacki hier war, habe
ich ihn nicht mehr betreten."

Sein schwerer Schlüssel zermalmte, was vom Wind
verweht, sich in das Schlüsselloch geflüchtet hatte.
Mit Mühe ließ sich das Tor öffnen, dessen Angeln
der Rost angefressen hatte. Eine enge Wendeltreppe
stieg glatte, feuchte Stufen aufwärts zu einem engen
Korridor voll Staub und Spinnweben.

Der Pförtner stieß eine halbvermorschte Türe auf:
"Hier wohnte vor 80 Jahren der Magier Saint-Germain, bevor er zu dem Maler dort bei dem maurischen Kreuz hinaufzog!"

Seine Stimme klang feierlich wie die eines alten
Heidenpriesters, der ein Orakel verkündet.

"Hier wohnte Saint-Germain? Darf ich es glauben?" rief der Antiquar.

Er sah bald auf die Decke, deren Stuck langsam
abbröckelte, bald auf eine zerbrochene Majolikavase, die mitten auf dem wurmstichigen Tische neben einem Fruchtkörbchen mit grau verschimmeltem
Brot stand.

Dann ließ er sich, schwer atmend auf den mottenzerfressenen Sessel, den einzigen in dem engen Gemache, nieder.

"Oh! Ich glaube es. Dort im Kamin dieser Haufen
feine, weiße Asche! Es funkelt heraus wie eine kleine
Stange Gold. Ich glaube es. Saint-Germain war da –
Hier trieb er seine alchimistischen Studien –"

Er stieß das Fenster auf, lauschte auf das Meer
hinaus, wie er es in Avignon vor den Brückenpfeilern
getan hatte.

Ein zitternder Glockenschlag floh durch die Luft,
verfing sich in der grauen Melancholie dieses Verfalls, starb in diesen vermoderten Samtvorhängen, an
diesem von der Zeit benagten Fensterbogen dahin.

"Es ist wie in Avignon," flüsterte der Antiquar.
"Ich höre den Gesang der Wellen. Bald werde ich
mehr hören –"

Der alte Pförtner schlug ein Kreuz. Die Zypressen
des Gartens schauerten auf in einem plötzlichen
Windstoß. Die Wolken über den Wellen an der
schroffen, von Palmen und Aloen gezackten Küste
schimmerten blaßgrün in der weißglühenden Sonne,
die ihre Strahlen schwelgerisch wie Goldstaub herniederfallen ließ. Die Wellen wurden kleiner, taumelten schlaftrunken, müde.

Mendizabal schlich unbemerkt fort. Flavio sah
auf einen Schrank in der Ecke, der einem Altarschrein glich. Es war ganz stille in diesem wie verzauberten Gemache. Aber diese Stille war nicht leblos. Dieses Schweigen wob sich aus Tausenden von
Geräuschen, die man nicht hörte, aber ahnte.

Dort am Schrank in der Ecke war etwas Flackerndes, wie eine Kerze, die sich leise im Wind bewegte.
Es war eine leidvolle Geste wie eine irrende Seele,
die über eine Steppe schwebt, bis sie im Nebel zerrinnt.

Flavio schauderte. Wieder starrten die grauen, lähmenden, traurigen Augen auf ihn. Jetzt kleiner, sternartig, wie die eines zitternden Tiers! Aber wieder in
demselben leuchtenden Nebel, den er in Avignon gesehen hatte.

Vermischten sich nicht die Farben? Das Gesicht
wurde rätselhafter, aber lebendiger und in demselben
Maße verfahlte die Luft, die es umgab, in einem
Windschauer, der winzige, blitzartig aufzuckende
Wirbelgespenster aufblies.

Auch der Antiquar sah nach dem Schrank. "Was
sehen Sie?" fragte er Flavio mit zitternder Stimme.

Flavios leicht erhobene Hand blieb in der Luft
hängen, als wäre sie erstarrt. Der alte Pförtner sprang
auf ihn zu.

"Sie sehen ihn! Ich weiß es – dieses Gespenst
vergewaltigt die Seelen – Schleudern Sie es von
sich! Sehen Sie nicht in seine schrecklichen Augen!
Ich bin ihnen damals unterlegen – damals schon,
als ich ein Hirtenknabe war und droben beim maurischen Kreuz die Schafe hütete – Warum raste
immer mein Schäferhund heran wie ein gefiederter
Pfeil und bellte ihn so wütend an? – Warum will
ich jetzt nicht reden und muß es doch? Dort am maurischen Kreuz sah ich ihn zum erstenmal; es sind
bald 70 Jahre und doch habe ich nichts vergessen –"

"Sie haben Saint-Germain gesehen?"

#quote[Ich habe ihn gesehen. Dort oben am maurischen
Kreuz, als ich meine Schafe hütete. Ich war etwa
acht Jahre alt und der unheimliche Mensch etwa
40 Jahre. Doch wenn ich ihn näher betrachtete,
konnte er ebenso gut nur 20 Jahre, oder auch
60 Jahre alt sein. Er war wie ein Prinz gekleidet. Er
glitzerte nur so von Diamanten. Zuerst sprach er von
dem schrecklichen Erdbeben in Lissabon. 'Ich habe
es erlebt,' sagte er. 'Ich war zehn Tage verschüttet
und grub mich heraus. Ganz Lissabon war ein Trümmerhaufen. Der Gestank der Tausenden von Leichen
war entsetzlich und doch sah ich, wie Gerettete,
halb wahnsinnig vor Hunger, an ihnen nagten. Alle
Kirchen waren eingefallen, und nur ein schlechtes
Haus und das Steueramt blieben stehen.'

'Was sagst du dazu?' fragte er mich mit einem
entsetzlichen Lächeln. 'Darf der liebe Gott, wenn er
alliebend sein will, so Entsetzliches zulassen?'

Es war merkwürdig, daß jedesmal bei einer solchen Lästerung mein Schäferhund ihn höchst vorwurfsvoll anschaute und laut knurrte.

Bald redete die ganze Insel von ihm und seinen
Teufeleien. Die einen sagten, er sei der Sohn eines
portugiesischen Bankiers und einer Prinzessin, die
anderen behaupteten, er sei aus Cadix gekommen.
Aber alle haßten ihn wegen seines Hochmuts und seiner Prahlereien: Auch zu mir sagte er, er sei schon vor
dreihundert Jahren in Madrid gewesen und habe
dort sich einen so prächtigen Palast erbaut, daß der
spanische König auf ihn eifersüchtig geworden sei.
Seine Zimmer und Korridore seien mit Goldplatten
belegt gewesen. Damals zwar wohnte er in Palma
nicht mehr so vornehm wie vor dreihundert Jahren
in Madrid, als sein Palast mit Goldplatten gepflastert
war. Beim maurischen Kreuz hauste ein alter Maler,
der nahm ihn auf. Im Korridor waren Spinnweben,
die Treppe war abgetreten, die Zimmer voll Schmutz.
Vor der Haustüre standen zwei halbvertrocknete
Zwergpalmen. Alles dort oben, wo er wohnte, war
einsam, verschimmelt, wie vom Tod angehaucht.

Aber Saint-Germain begann schon den Leuten
wahr zu sagen, Wunderkuren zu machen und von
 seinen Rezepten zur Erlangung ewiger Jugend zu sprechen. Auch prahlte er damit, Gold machen zu können. Aber es tauchten Gerüchte auf, daß nur die
Spitze des Stäbchens mit Gold bestrichen wäre, das
Innere nach wie vor ein unedles Metall bliebe.

Alles wäre gut gewesen und die guten Leute auf
dieser Insel hätten sich an seine ruhmredigen Prahlereien gewöhnt. Da brach auf Mallorca eine ganz unheimliche Krankheit aus, eine geistige Epidemie, ähnlich dem Geißlerwahn im Mittelalter.

Menschen, die früher lebenslustig, munter und
guter Dinge waren, schlichen umher wie Trappistenmönche. In ihren Augen, aus denen frohe Laune gesprüht war, lag Trübsinn, Bosheit, Niedergeschlagenheit und verbitterter Hochmut. Burschen, die früher
in den Schenken Gitarre geklimpert hatten, schlichen
trübselig wie Kerzen, die der Küster ausgeblasen
hat, am Ufer, sahen in die Wellen und sprachen unter
greulichen Lästerungen auf die Güte und Vorsehung
Gottes von den Greueln des Lissaboner Erdbebens. Es
kamen unerhörte Kirchenschändungen vor, vor dem
Hause des Gouverneurs explodierte eine Bombe.

Gedichte und kleine Bücher wurden verbreitet, die
von den gemeinsten Lästerungen nur so strotzten.
Sogar auf den Kirchenbänken fand man sie, mit teuflischer Berechnung in Form von Gebetbüchern eingebunden. Auch die Mönche im Kloster Valdemosa
wurden nicht verschont. In ihrem Klostergarten lagen die giftigen Pamphlete, wie Kröten und Gewürm,
das nach einer Überschwemmung übrig bleibt. Sogar an den verkrüppelten Olivenbäumen und den
Platanen hingen die Schandhefte wie giftige Früchte
und Sodomsäpfel, die voll Asche sind.

Ein wahres Fieber der Gottlosigkeit und einer
krankhaften Wut schlich über die Insel hin. Selbst
die Glocken der Kathedrale klangen anders. Sie blökten wie aus einem Grab heraus. Die Behörde ließ eine
Untersuchung einleiten, um den Täter zu entdecken
und zur Strafe zu ziehen. Ein Preis wurde auf seine
Entdeckung gesetzt. Um diese Zeit traf ich wieder mit
Saint-Germain oben am maurischen Kreuz zusammen. Er hielt ein Notenblatt in der Hand und
kritzelte Notenköpfe darauf. Mir warf er einen mißtrauischen Blick aus seinem maskenartigen Gesicht zu.

'Es gibt 1000 Reales zu verdienen, wenn man den
entdeckt, der den Wirrwarr auf die Insel gebracht
hat!' Er sah mich höhnisch an. Seine Stimme war wie
der feuchte Hauch des Herbstwinds.

'Das ist mehr wie Wirrwarr; das ist Verbrechen
und Teufelei!' entgegnete ich und erstaunte über
meine Kühnheit, während ich ihm diese Worte ins
Gesicht schleuderte.

'Ei! Ei!' lachte er giftig. 'Du redest für deine Jahre
schon sehr klug. Willst du dir die 1000 Reales verdienen?'

Dabei schwenkte er das Notenblatt in der Luft
und sah mir starr in die Augen.

Er stand neben dem verwitterten Stamm einer gefleckten Platane, die wohl dreißig Fuß im Umfang
hatte und ringsum von zerbrochenen antiken Marmor- und Granitsäulen gestützt wurde.

'Die Erde bebt,' rief er mit einer gellenden, hohen
Stimme; 'es knistert im Gebälk der Paläste. Was man
für heilig und ewig hielt, bekommt Risse und neigt
sich vornüber, um einzufallen. Viele Würmer bohren,
viele Ratten wühlen. Aber Würmer und Ratten kann
man sehen und unschädlich machen. Man kann die
kleinste Dosis Gift im Körper nachweisen und den
Täter henken. Es gibt aber Gifte, die kein Chemiker
nachweisen kann. Es gibt tötliche Waffen, die unsichtbar sind wie winzige Sonnenstäubchen. Es gibt
Krankheiten, die nicht einmal den Wind brauchen,
um von einem Land zum andern getragen zu werden.
Diese Gifte, diese tötlichen Waffen werden nie nachgewiesen werden können.'

Wieder schwenkte er das Notenblatt und der Hohn,
mit dem er mich jetzt ansah, war noch unheimlicher
und erschreckender.

Mein Schäferhund heulte durchdringend auf. Ich
wollte aufschreien und konnte nicht. Der blasse
Schrecken hatte mich ausgehöhlt wie einen leeren
Becher. Es schien mir, als wollte der Himmel, niedriger geworden, auf mich stürzen, um mich zusammenzudrücken. Meine vom Übermaß des Entsetzens
verwirrten Sinne spiegelten mir Schreckgespenster in
der Luft vor, schwarze Vögel, geflügelte Drachen,
die im Zickzack seltsame Kreise zogen.

Ich weiß nicht, wie lange er stumm vor mir stand
und mich anstarrte. Endlich hörte ich ihn auf‌lachen:
'Ich gehe jetzt, dummer Bauerntölpel!'

Der Hund bellte ihm wütend nach; aber ich erinnere mich, daß sich ihm vorher die Haare gesträubt
hatten. Während der schreckliche Mensch den Berg
hinunter ging, sah ich violette Schatten von den Rändern seines Mantels gleiten.

Als der Hund zu bellen aufhörte, war unermeßliches Schweigen. Ich habe noch nie eine solche Stille
um mich herum gefühlt. Kein Vogel sang, ich sah
kein Schiff auf dem Meer, kein Tier weit und breit.
Die Welt um mich her schien ausgestorben und der
Unheimliche, der da unten an der Klostermauer verschwand, war ihr Henker gewesen. Mit seinen Giften,
die niemand sah, und seinen Waffen, unsichtbar und
ungreifbar gleich den Sonnenstäubchen, hatte er ihr
den Garaus gemacht. Diese Seelenpest auf der Insel
war der Anfang ihrer Agonie und die Totenvögel
schlugen schon mit ihren Flügeln an die Fenster –

Zweimal trieb es mich damals, die Anzeige gegen
Saint-Germain zu machen. Ich unterließ es. Dagegen richtete ich es ein, daß ich mit dem Maler zusammentraf, bei dem er wohnte.

Er lachte hellauf, als ich ihm den Vorfall auf dem
Berg erzählte.

'Dummheit! Lächerliche Phantasien!' rief er einmal über das andere Mal. 'Du möchtest ihm wohl
einen Hexenprozeß anhängen. Aber du bist zu spät
daran. Die französischen Philosophen mit Herrn v.
Voltaire an der Spitze haben diesem erbärmlichen
Hexenwahn den Hals umgedreht – Es gibt keine
Hexensalben mehr, keinen Teufelsfuß, keinen Ritt
auf den Hexentanzplatz. Du hast Herrn Saint-Germain falsch verstanden –

Beschämt schlich ich fort. Aber ich war kaum hundert Schritte gegangen, als mich der Neffe des Gouverneurs einholte: 'Erzähle mir noch einmal den Vorgang!' sagte er mit einem Ausdruck in der Stimme,
 der keine Weigerung zuließ. 'Dieser Saint-Germain ist ein Feind Gottes und der Menschen.'

'Es ist gut,' sagte er, als ich geendigt hatte, und
eilte weg.

Am nächsten Tag trieb ich meine Herde nicht mehr
dahin, wo mir der Unheimliche begegnet war. Ich
führte sie einen anderen Weg und kam an einem
alten Brunnen vorbei, dessen Steine schon zerfallen
waren.

Die alte Dienerin des Malers kam mir entgegengelaufen: 'Hast du’s schon gehört? Sie wollten ihn verhaften. Aber sie kamen zu spät. Ich hätt’ es ihm gegönnt. Mein Herr freut sich ja darüber. Für ihn ist
dieser Saint-Germain ein wahrer Halbgott. Aber ich
hab' auch meine Gedanken über diesen Menschen,
gerade so wie du –'

Saint-Germain war also entflohen und die Insulaner hatten das Nachsehen. – Doch ich muß jetzt
schließen. Meine Tauben warten auf mich. Ich habe
seitdem diesen Saint-Germain nicht mehr gesehen
und weiß nichts mehr von ihm –]

"Was ist mit Slowacki?" fragte der Antiquar.

"Was ist mit diesem Notenblatt, das damals, wie
Sie sagten, Saint-Germain vor Ihren Augen hin und
her schwenkte?"

"Ich muß meine Tauben füttern!" beharrte der
Pförtner. "Auch ist es mir peinlich, diese schrecklichen Erinnerungen zu erneuern –"

Damit mußten die beiden sich vorläufig zufrieden geben.

"Ich bin überzeugt, daß das 'Gastmahl der Schatten,' dieses Lied Saint-Germains, auf dieser Insel
irgendwo versteckt ist –" sagte der Antiquar vorsichtig und lauernd.

"Das polnische Allerseelenfest werde ich auf alle
Fälle hier auf dieser Insel feiern –" sagte Flavio vor
sich hin, aber der Antiquar hätte es gehört, auch
wenn er ganz leise gesprochen hätte.

Der Drachen der Eifersucht schritt hinter ihnen
her. Alles, was sie auf diesem Heimweg sprachen,
hatte einen anderen, verstörten Klang.

"Die zum 'Gastmahl der Schatten' in der Unterwelt Hinabsteigenden müssen einen Obolus für den
Fährmann Charon bereit halten," stichelte Flavio mit
verstecktem Spott. Hätte er brutalere Worte wählen
wollen, so würde er gesagt haben: "Dieses Lied Saint-Germains wird viel Geld kosten. Ich werde leicht imstande sein, dich zu überbieten –"

Es waren nur noch einige Tage zum Allerseelenfeste. Wie oft waren Flavio und der Antiquar, jeder
heimlich, und ohne daß der andere eine Ahnung
davon hatte, zum Klosterpförtner geschlichen, ihm
seine Geheimnisse abzulisten!

Flavio hatte bereits begonnen, große Summen zu
bieten, aber umsonst.

Der Fall des polnischen Dichters Slowacki und seines Allerseelenfests dagegen lag klar vor Augen, wenn
er auch kein Licht in dieses verworrene Labyrinth
brachte.

Dieser Dichter der Schwermut und der Empörung,
ein Schulfreund und Altersgenosse Chopins, gleich
ihm ein saturnischer Geist und gezeichnet mit dem
Kainsmal des Genies, hatte auf Mallorca namentlich durch Mendizabal ebenfalls von Saint-Germains
 Aufenthalt auf dieser Insel gehört. Welch ungeheuerlicher, überschwänglich beglückender Vorwurf für
ihn! In dem phantastischen Turmzimmer des
Klosterpförtners hielt er die polnische Allerseelenfeier mit Basilikumkraut und vollen Körben für die
armen Wichtlein.

Niemand sah ihm zu. Der Klosterpförtner schlief
in seiner Zelle ein.

Aber am nächsten Tage sah der Dichter verstört
aus, wich allen neugierigen Fragen Mendizabals mit
fast unhöflicher Deutlichkeit aus und reiste ab.

Nur dem Klosterpförtner vertraute er beim Abschied an, daß er in der Ecke des Zimmers eine blasse
Gestalt gesehen habe; die Lippen habe diese Gestalt
bewegt und leise mit dem Finger gedroht.

Das war alles.

Mendizabal, dem vielleicht auch der Aufenthalt
der Gäste lästig wurde, zeigte sich immer wortkarger und sie mußten es als eine große Gnade ansehen,
wenn er überhaupt noch ein Gespräch über Chopin
zuließ.

"Es gibt kein Geheimnis Saint-Germains," wich
er aus, "Er war ein Halbnarr, dem das Erdbeben von
Lissabon den Verstand verwirrt hatte. Seine fixe Idee
war, die Welt müsse aussterben; das sei ihre Erlösung.
Ist dies nicht närrisch?"

"Teuflisch ist es!" rief Flavio. "Luzifer in seiner
Hölle träumt davon."

"Was ist mit seinem Lied?" fragte der Antiquar.
"Chopin muß auf dieser Insel davon gehört haben –"

"Chopin!" rief Mendizabal mit einem unbeschreiblichen Ton. "Auch er feierte hier sein Allerseelenfest. Vielleicht hat er das Lied schon. Vielleicht hat
er die Töne da und dort in seine Kompositionen hineingewebt – Oh! Chopin! Er ist ein Meister, etwas
zu verbergen. Ein Diplomat –"

Der Antiquar sah Mendizabal mit einem haßerfüllten Blick an.

Dieser verlogene Greis! War er nicht selbst der
größte Heimlichtuer und Schleicher?

Acht Tage war er mit Flavio jetzt schon in diesem Hause und nichts, nicht die geringste Spur war zu
entdecken, daß das Lied bei ihm versteckt wäre.
Mit abgefeimter Bosheit, eine spöttische Geste in die
Luft zeichnend, ging dieser Mensch mit dem goldenen
Herzen an seinen offenen Schränken vorbei, lächelte
nur und zog sich in den Garten zu seinen Truthühnern zurück, ohne die Schubfächer wieder zu verschließen, als wollte er sagen: "Bei mir werdet ihr
vergebens suchen!"

Der Antiquar dachte schon daran, sich Nachschlüssel zu verschaffen. Flavio wich er aus. Der aber gab
die Hoffnung noch nicht auf, vom Klosterpförtner
etwas zu erfahren.

Ihn mit Geld zu bestechen, das sah er, war die aussichtsloseste Sache von der Welt. Niemand war bedürfnisloser als Isidoro. Das Wasser vom Klosterbrunnen und das Gemüse seines Gärtchens nebst
einigen Honigscheiben, das war alles, was er brauchte.
Flavio versuchte auch, ihm von einer anderen Seite
aus beizukommen. Vor Isidoros Augen ging er in die
verlassene Klosterkapelle und heuchelte eine Frömmigkeit, die ihm schon, bevor er aus Polen floh,
fremd geworden war. Der Pförtner sah mit zufriedenem Kopfnicken Flavios Bekreuzigungen und Kniefälle vor den heiligen Bildern, aber wenn auf Chopins
Allerseelenfest die Rede kam, schwieg er hartnäckig
und zog sich zu seinen Bienenkörben zurück.

"Chopin!" sagte er nur. "Ja, ein sehr großer
Künstler. Wir auf der Insel wußten es schon, kaum
daß er gelandet war. Viele gingen damals ans Haus,
wo er wohnte, um ihn zu sehen. Aber jeder hatte
sich ihn anders vorgestellt. Da muß man die berühmten Stierkämpfer sehen! Das sind Gestalten! Chopin
aber! Wie ein krankes Huhn sah er aus. In einen
Schal war er gewickelt und hüstelte hinein. So sagten mir wenigstens die Leute. Ich will nichts über
Herrn Chopin gesagt haben. Was wäre das für eine
böse Sache, wenn Sie es ihm in Paris erzählen würden –"

Der behutsame, peinlich sanfte Tonfall dieser
Stimme machte Flavio wütend.

"Ich erzähle ihm nichts, wenn ich ihn in Paris sehe;
das könnte ich Ihnen beschwören. Sie dürfen mir
alles sagen, was Sie von ihm wissen. Ich bin sein
Freund. Ich meine es gut mit ihm. Vielleicht kann
ich seine Seele retten –"

Flavio spielte seinen letzten Trumpf aus. Schon
phantasierte er sich in Urhans Rolle hinein.

Aber auch dies war vergeblich.

"Ich verstand Herrn Chopin nicht. Er war zu fein
und wie ein glatter Fisch, der einem unter den Händen entschlüpft. Sonst hätte ich damals schon, da
er fast neben mir im Kloster wohnte, seine Seele
gerettet – Aber" – Isidoro bekreuzte sich – "ich
gab jede Hoffnung auf – Er war auch zu stolz und
sprach so wenig mit mir –"

Flavio seufzte tief auf. Auch Isidoro war ein glatter Fisch, der ihm entschlüpfte.

Flavio erinnerte sich an eine Szene im elterlichen
Haus in Litauen. Ein leibeigener Bauer ging auf der
Straße; der Kreisrichter, den sie alle wie den Teufel
fürchteten, kam um die Ecke.

Was zwischen ihm und den Bauern vorging, konnte
Flavio zuerst nicht sehen. Dann aber lief der Bauer
zu ihm, fiel auf die Knie, faltete die Hände wie zum
Gebet und weinte. Als der Kreisrichter sich unwillig
abwandte, kroch er ihm nach und zupfte ihn am Mantel. Der Kreisrichter schlug ihm auf die Hände, der
Bauer ließ den Mantel los, aber er faltete wieder die
Hände und weinte noch lauter.

"Er muß es mir sagen, ich werde hartnäckig sein
wie der Leibeigene damals," dachte Flavio. "In drei
Tagen ist die Allerseelennacht. Bis dorthin muß er
es mir sagen –"

Er starrte Isidoro an, dachte diesen Gedanken in
ihn hinein, wie der Hypnotiseur in sein Medium. Aber
Isidoro widmete sich ganz seinen Bienenstöcken, als
gäbe es sonst nichts auf der Welt.

Jetzt tauchte plötzlich auch der Antiquar an der
Gartenpforte auf. Als er Flavio sah, wollte er sich
verstecken; aber es war schon zu spät.

"Sie interessieren sich wohl für die Bienenstöcke
eines spanischen Klostergartens?" höhnte Flavio.

"Ich will ehrlich sein und sage Ihnen ganz offen,
daß ich dasselbe suche, was auch Sie suchen, Herr
Sikorski. Vielleicht finde ich es, wenn ich auch an
Obolen nicht so gesegnet bin wie Sie," entgegnete der
Antiquar, den Spott Flavios von neulich zurückgebend.

"Glück auf zum Fund!" rief ihm Flavio mit
düsterem Blick nach.

Der Antiquar hob drohend die Hand. "Stolpern Sie
nicht auf der Wendeltreppe, Herr Sikorski!"

Die Wendeltreppe, das Turmgelaß oben mit dem
Schrank in der Ecke, das war es also. Beide wußten
es, daß sie dort oben das Notenblatt mit dem Lied
Saint-Germains suchen mußten. Niemand hatte es
ihnen gesagt und keiner hatte es bis jetzt dem andern
anvertraut.

Geheimnisvoll, wie aus der Luft war es ihnen zugeflogen, daß jenes Notenblatt, das Saint-Germain
damals oben auf dem Berg beim maurischen Kreuz
vor den schreckensstarren Augen des guten Isidoro
schwenkte, das war, was sie finden mußten. Das Lied
Saint-Germains stand darauf!

Es war nur eine phantastische Vermutung, ein
Wunschtraum. Gleich in den ersten Tagen ihres Aufenthalts auf der Insel hatte Mendizabal nebenher erwähnt, daß der Maler, bei dem Saint-Germain damals wohnte, bevor er von der Insel flüchtete, sich
zuletzt, vielleicht durch Isidoros Bemühungen, der
den Hirtenberuf aufgab und Gärtner und Pförtner
bei den Mönchen wurde, bekehrt habe und sehr oft
zu Bruder Isidoro ins Kloster gekommen sei. Der
Maler sei sogar sehr fromm geworden und habe auf
dem Totenbett dringend nach Isidoro verlangt. Zuletzt habe er ihm auch ein Päckchen anvertraut. Die
Dienstmagd des Malers konnte es bestätigen, daß er
dabei sehr geheimnisvoll tat und durch eine
Geste, da er nicht mehr sprechen konnte, strengstes
Stillschweigen anbefahl.

Je mehr Mendizabal und der Klosterpförtner sich
in Stillschweigen hüllten, desto klarer und untrüglicher bekamen der Antiquar und Flavio die Gewißheit, daß in diesem Päckchen, das der sterbende Maler dem Bruder Isidoro übergab, das Notenblatt mit
dem Lied enthalten sei.

Nur noch zwei Tage, und jetzt nur noch ein Tag
war bis zur Allerseelennacht!

Der Antiquar hatte sich schon das Basilikumkraut,
das man für das Fest braucht, besorgt, freilich auch
einen weniger harmlosen Nachschlüssel für die
Turmtüre. Wenn er das heißersehnte Lied Saint-Germains hatte, wollte er gleich in der Frühe abreisen.
In Avignon, wo ihn diese frechen Buben verspottet
hatten, würde er dann sein Haus und die entbehrlichen Bücher verkaufen und nach dem Lande auswandern, das ihn magisch lockte: nach Ägypten.
Dort im bleichen Meer der sonnengierigen Wüste,
über sich windgetragene Geier und die orangerote
Sonne, würde er den magischen Tönen dieses Liedes,
das er schmerzvoll ersehnt und vergebens in Avignon
gesucht hatte, lauschen. Ein Fellache würde es ihm
vorspielen; immer wieder würde er es zu hören begehren, den Blick sättigend an den Wogen des Nils,
die in Wunderfarben aufblühten, vom Violett da, wo
sie an die Felsen anschlugen, bis zum Smaragdgrün
und dem glitzernden Blau des Pfauenrads.

Aber auch Flavio besaß einen Nachschlüssel, nicht
nur zum Haustor, sondern auch für den Schrank. Er
war schon im Begriff gewesen, ihn zu öffnen, da
hörte er Schritte auf der Wendeltreppe, wenigstens
bis zur Hälfte der Treppe herauf, – mit Entsetzen
zählte Flavio die tappenden Geräusche, – und jetzt
hielten sie inne, entfernten sich langsam wieder.

Flavio war gerettet. Jedenfalls hatte der Pförtner
einen Lichtschimmer gesehen. Morgen würde Flavio
eine Blendlaterne haben.

Aber heute würde er diesen mürrischen Alten, der
ihm mit seiner starrsinnigen Geheimtuerei die Auskunft verweigerte, für immer die Lust vertrieben
haben, ihm nachzuschleichen und das Lied zu entreißen, das hier bloß im Schrank vermoderte, während
es in seiner Hand –

Schon stand es klar vor ihm: Was vor 1000 Jahren
die Fliege dem Kaiser Titus angetan hatte, das
konnte sich in Warschau wiederholen beim Großfürsten Konstantin, dem Henker der Polen. Er hatte
das Gift in der Hand, von dem Saint-Germain dem
jungen Tölpel Isidoro gesprochen hatte, das Gift, das
nicht einmal den Wind brauchte, um von einem
Land zum andern getragen zu werden. Die tötliche
Waffe stand ihm zu Gebot, die so unsichtbar war wie
ein winziges Sonnenstäubchen: Notenköpfe, die sich
unter fünf Notenlinien harmlos versteckten, aber,
wenn man unter den acht sich beständig wiederholenden Tönen die richtige Folge fand, wie die
Fliege des Kaisers Titus in die Gehirne der Hörer
hinaufkrochen ...

Wieder überfiel ihn die Erinnerung an das Elend,
das er in seiner polnischen Heimat zurückgelassen
hatte.

War die Rache, die er an Swerdlow genommen
hatte, die ausreichende Sühne für die russischen
Greuel, die wie ein schwarzes, uferloses Meer sein
Land überschwemmten? Immer tiefer, finsterer und
erdrückender senkten sich diese apokalyptischen Gewitterwolken mit Donner und Blitz der Zerstörung
herab, Flutberge der Verwüstung und des Jammers
heranwälzend und die Hände krallend, um zu zerstören, was noch übrig war.

Lebhafter, greifbarer als in Paris sah er sein von
den Russen zerstörtes Elternhaus. Es war fast nur
noch ein glühender Aschenhaufen wie das ganze
Dorf. Trotz der Gefahr schlich er sich damals noch
einmal hin. Die Balken starrten schwarz wie umgewühlte Steine, das Dach lag vornübergeneigt wie der
zitternde Kopf eines Greises; an der Türe, die teilweise dem Feuer widerstanden hatte, klebte schwarz
geronnenes Blut. Im Garten standen noch einige von
Rauch gebeizte, zersplitterte Bäume, in einem Beet
wilder Himbeeren wimmerte eine vom Feuer versengte Katze. Aus dem Schutt und der Brandasche
schien noch das Gebrüll der Kosaken zu dringen,
das Krachen der Flinten, der Angstschrei der Opfer.
Das Feuer fraß weiter, zog alles herab in den großen
Aschenhaufen, den Kirchhof seiner Heimat; Totenklagen, schwer wie Grabsteine, stöhnten über traurige, gemarterte Erde –

Dieses Lied Saint-Germains hatte ihm den richtigen Weg gewiesen. Nie würde Flavio die Kunst
Chopins erreichen. Der Lorbeer eines Dichters am
Klavier war ihm ohnehin versagt. Aber in Warschau
winkte ihm Weltruhm. Die Tat, die er plante, wäre
eine Sensation, größer, auf‌flammender und erschütternder als die Künstlertaten Chopins, Liszts und
Paganinis zusammen.

Nein! Flavio wollte nicht den müßigen, überflüssigen, von Schmeichlern mißbrauchten Millionär
in Paris spielen!

Wenn er seine Mission in Warschau ausgeführt
hatte, dem Galgen auf dem Sächsischen Platz entronnen war, wollte er wie der Dichter Julius Slowacki,
den es ja auch nach Mallorca getrieben hatte, in
Europa umherreisen, bis er am Rande der Welt ankam und in den Hades hinabsah mit seinen Asphodeloswiesen, dem strengen Pluto, der starrlächelnden
Proserpina und dem Weiher mit den schwarzen
Schwänen. Vielleicht würde ihm Chopin heraufwinken –

Aber auch Flavios wartete die bitterste Enttäuschung. Mendizabal fiel es am Allerseelentage auf,
daß Flavio und gleich nach ihm der Antiquar schon
bald nach dem Abendessen fortgingen. Er war seit
einigen Tagen zwar in besserer Laune, weil Flavio
ihm schon jetzt eine beträchtliche Summe für die
Aufnahme und Bewirtung bezahlte, aber das gespannte Verhältnis zwischen seinen beiden Gästen
und ihre Geheimnistuerei war ihm ärgerlich und fast
unheimlich.

Er sah ihnen nach. Beide waren vorsichtig genug,
zuerst eine dem Kloster ganz entgegengesetzte Richtung einzuschlagen; dann aber eilten sie, jeder für
sich, dem Kloster zu.

Flavio kam zuerst an und suchte sich zunächst ein
Versteck aus, um nicht vom Antiquar, der nicht ausbleiben konnte, überrascht zu werden.

Auch stellte er kein Basilikumkraut auf den Tisch,
das seine Anwesenheit dem Antiquar verraten hätte.

Ein Nachschlüssel öffnete den Schrank. Flavio
prallte zurück vor Überraschung. Drei große Fächer
waren vollgestopft mit Manuskripten, Notizbüchern,
Mappen, Flugschriften, Pamphleten, Zeichnungen,
Tabellen und Berechnungen. Alles war in fast unleserlicher Schrift geschrieben und um alles noch hoffnungsloser zu verwirren mischten sich Geheimzeichen darunter: Dreiecke, Tiergestalten, die ägyptischen Hieroglyphen glichen oder den Schnüren der
Knotenschrift alter mexikanischer Völkerstämme.
Aber kein einziges notenbeschriebenes Blatt fand sich
darunter. Flavio leerte die Fächer aus und breitete
diesen Wust von Papieren vor sich hin. Er zündete
das Licht an, um besser zu sehen. Erst wollte er alle
Notenblätter aussuchen und dann die Auswahl treffen. Aber alles war mit diesen winzigen Lettern kreuz
und quer beschrieben, über Durchstrichenes schoben
sich noch unleserlichere Worte ein; ganze Zeilen waren nur eine höhnische Prozession seltsamer Zeichen
und Hieroglyphen.

"Sind dies die Armenseelen? Wollen sie meiner
spotten?" stöhnte Flavio verzweifelt. Viele Tage, ja
Wochen brauchte man, um dies alles zu entziffern
und dieser gierige Antiquar konnte jeden Augenblick
kommen!

Er wühlte sinnlos in dieser Papierflut, während
ihm der Schweiß von der Stirne rann. So nahe am
Ziel und nun, wo er es fast mit den Händen greifen
konnte, das teuflische Hindernis! In seiner Brust stieg
es herauf, gurgelnd, rauschend wie die steigende
Flut. Er atmete schwer. Wirre Gedankenfetzen flatterten durch sein Gehirn, in dem kein gesunder
Fleck mehr war.

Die brennende Kerze gaukelte ihm eine Vision
quälender Schreckensgestalten vor. Das safrangelbe
Gespenst der Flamme lockte wispernde Larven heran: das waren die abgestorbenen Schatten; immer
mehr krochen aus dem Fußboden, aus den Ritzen
der Wände heraus.

Wenn sie an der Kerze vorbeistrichen, flackerte
sie und das Geräusch des knisternden Wachses wurde
deutlicher.

Sie sahen mit grauen, armen, jammernden Blicken auf ihn. Das Licht blinzelte, die Flamme der
Kerze schwankte heftiger und sah aus wie der zackige
Stab eines Magiers.

Das ganze Zimmer war nur noch eine Höhle voller Angstgedanken und leidvoller, bleicher Verzweiflung.

Kläglicher wisperten die Larven. Von der Stadt
her kam der zentnerschwere Klang einer verstörten Glocke.

"Seid ihr nicht die armen Seelen? Hat nicht General Swerdlow und der Großfürst Konstantin euch
gemordet?" stöhnte Flavio.

Näher an ihn drängten sich die Larven, sie beugten sich über die heillosen Zettelhaufen, sahen wieder auf mit einem gelösten, törichten Lächeln und
zerfielen dann im Kerzenlicht, um neuen Platz zu
machen.

"Grollt ihr mir, ihr armen Seelen, weil ich das
Körbchen mit Backwerk vergessen habe?" flüsterte
Flavio ihnen zu. "Warum helft ihr mir nicht, dieses
Notenblatt suchen? Ich muß es haben, ehe dieser
Narr von Avignon kommt –"

In seinen Augen flackerte es auf. Die zitternden
Hände wühlen in dieser Zettelflut, die sich wie nach
einem magischen Gesetze noch zu vermehren schien.

Die Schattenlarven antworteten nicht. Es wurde so
still in dem Gelasse, daß man den Holzwurm im
Schrank pochen hörte.

"Du wirst – es – nicht – finden!"

War es Hohn oder verzweifelten auch die armen
Seelen, die dem Holzwurm diese trostlosen Worte
in sein Pochen eingaben?

Flavio ließ die Hände sinken.

"Ich werde es nicht finden!"

Aus diesen Zettelhaufen kamen die quälenden Gedanken, sie quollen aus den Blättern hervor, krochen
die vergilbten Seiten entlang und kamen ganz nahe
an ihn herangeschlichen. In sein armes Gehirn bohrten und krallten sie sich ein.

Der Holzwurm schwieg jetzt. Die Glocken von
Palma schlugen an – ein Ton nach dem andern –
dann erstarben sie, ganz leise rauschte der Klosterbrunnen. Draußen in der Dämmerung, da über dem
maurischen Kreuz, kreiste noch ein Vogel; ein flackerndes Licht, das Flavio abergläubisches Entsetzen
einflößte, zeichnete einige Streifen von ihm.

Kam da nicht ein Geräusch von der Wendeltreppe?
Das waren Schritte, die leise auf‌treten wollten, aber
sich doch verrieten. Der Antiquar war es! Wie ein
Aasgeier wollte dieser alte Narr seine Nachlese halten.

Was er nicht fand, das hoffte dieser graue Schleicher listig an sich zu reißen! Ein Beben des Zorns,
ein Anschwellen der Wut, ein noch verhaltener Sturm
von Rache lauerte in Flavio.

Jetzt ging die Türe auf! Der Antiquar heulte auf
wie ein wildes Tier, als er Flavio neben dem Zettelhaufen stehen sah.

"Mir gehört es!" schrie er wie ein Irrsinniger.

Jetzt ein furchtbarer Aufschrei Flavios! – ein
dumpfes Poltern – das Stampfen und Röcheln
zweier ringender Männer – der Antiquar lag am Boden. Eine breite Wunde klaffte an der Schläfe, das
Blut lief in die Augenhöhlung, rann herunter bis
aufs Kinn, bis an den Hals.

Stumpf, keines Gedankens fähig, starrte Flavio den
Leblosen an. Das Schreckensbild des erschlagenen
Swerdlows stieg vor ihm auf –

Wieder lauschte er zum Fenster hinaus – nur der
Klosterbrunnen rauschte. Niemand hatte es gehört –

Da ein neues Entsetzen! Während des Ringens war
die Laterne umgefallen und hatte mit ihrer Flamme
den Rand des Zettelhaufens erfaßt.

Bald war ein dicker Umschlag durchgefressen und
nun breitete sich die Flamme mit blitzartiger Geschwindigkeit nach allen Seiten aus, bis alles in ihren
höllischen Purpurmantel gehüllt war –

"Das Lied Saint-Germains gehört mir! Gebt es
heraus! Ich will es!" heulte Flavio auf, als könnten
diese Flammen ihn hören.

Wieder zur Besinnung gekommen, riß er mit einer
hölzernen Latte, die am Fenster lehnte, ein kleines
Päckchen aus der Feuersglut. Auch seine Ränder
waren schon schwarz verkohlt; der Bindfaden, der
es zusammenhielt, fiel ab wie mürber Zunder.

Es waren Rezepte für das Elixier der ewigen
Jugend, bestimmt für Saint-Germains Zeitgenossinnen, für die Hofdamen Louis #sc[XV], für Gräfinnen
und Marquisen dieser Rokokowelt, die Schönheitspflästerchen auf‌legte, die Locken mit Puder bestreute und sich lächelnd in den von Amoretten umgaukelten Spiegel besah –

Mit einer Gebärde wütender Enttäuschung warf
Flavio die Blätter in den schon langsam verglimmenden Aschenhaufen.

Plötzlich stutzte er. Dieses Blatt, fast das allerletzte schon, das auch bereits von der Flamme angenagt war, hatte ja Notenlinien und da standen Notenköpfe! Verkritzelt zwar und kleiner als Fliegenköpfe!

Er stolperte über die Leiche des Antiquars, so
hastig entzündete er die Kerze wieder an den letzten
Funken des Aschenhaufens.

Die Flamme flackerte über das Blatt hin, über unleserliche, verkritzelte, wie zum Hohn kreuz und quer
überschriebene Notenköpfe. Das, was Flavio entziffern konnte, waren abgerissene Gedankenfetzen und
verworrene Tonphantasien. Da, wo die Noten leserlicher waren, hatten die Flammen genagt –

Mit einem verzweifelten Aufschrei warf Flavio das
Blatt auf den Tisch. Es fiel gerade auf die mit Blut
bespritzte Ecke des Tisches, wo der Antiquar in dem
schrecklichen Kampf auf Leben und Tod mit seiner
Schläfe angestoßen war.

Flavio nahm es an sich und steckte es in die
Tasche, ohne es von den Blutflecken zu reinigen.

"Ich muß mich retten!" murmelte er.

Der Aschenhaufen war schon erkaltet. Flavio
schloß den Schrank, warf die Asche zum Fenster hinaus in die Jasminsträucher, entfernte die Blutflecken vom Tische und vom Fußboden und trug die
Leiche des Antiquars vorsichtig die Treppe hinab.

Er hatte sich wieder vollständig in der Gewalt,
so wie damals, als er sein Pamphlet in die Kirchen
und Hauseingänge in Paris gelegt hatte.

Bruder Isidoros Zelle war am anderen Ende des
weitläufigen Klosterbaus. Flavio schleppte die Leiche
deshalb an den Bienenstöcken vorbei und brachte sie
glücklich über die Klostermauer. Dort legte er sie
nieder, um denselben Weg noch einmal zurückzugehen und die Blutspuren zu verwischen.

Zum maurischen Kreuz trug er dann die unheimliche Last. Dort war seit den Zeiten der maurischen
Sultane, die zwei Christen dort hatten pfählen lassen,
eine abergläubisch gemiedene Stelle, der jeder gerne
auswich, weil der Teufel, auf diesem Fleckchen Erde
wenigstens, unbeschränkte Macht hatte und selbst
Gott trotzen konnte.

Dort, glaubten die Insulaner, hatte selbst die
Madonna, die sonst dem Sündenwurm den Kopf zertritt, ihre Macht verloren und mußte traurigen Herzens zusehen, wie der böse Feind, ihr geschworenster
Widersacher, ohne daß sie ihm in den Arm fallen
konnte, ganz gelassen eine christliche Seele nach der
anderen anfiel, überwältigte und in seinem ziegenledernen Höllensack forttrug.

Der arme Antiquar, der schon in Avignon hatte
sterben wollen, weil er das Lied und das Rätsel Saint-Germains nicht finden konnte, dieser Don Quixotte,
der auf dieser Insel sich nun am ersehnten Ziel
wähnte, mußte kläglich scheiternd an einem Fleck
Erde, der fast schlimmer als ein Schindanger war,
elend vermodern. Denn erst acht Tage nach der unheimlichen Allerseelennacht fand ein Maultiertreiber
die Leiche ...

Dem Bruder Isidoro schob Flavio einen Zettel in
seine Zelle mit der Bitte, für einen Unbekannten zehn
Seelenmessen lesen zu lassen. Das Geld, ließ er noch
wissen, sei neben den Bienenstöcken versteckt. Dort
fand denn auch der erstaunte Klosterbruder eine so
hohe Geldsumme, wie sie auf dieser bescheidenen
Insel wohl noch nie für Seelenmessen bezahlt worden war.

= Die Umarmung der Schatten

Auf der Rückfahrt Flavios war über der See dieselbe Stille, derselbe feierliche Schrecken des Schweigens. Wollten ungnädige, rächende Götter ihn wohlbehalten nach Paris kommen lassen, um ihn dort um
so sicherer zu verderben?

Auf dem Schiff erst reinigte Flavio das Notenblatt
Saint-Germains von den Blutflecken. Stundenlang
starrte er auf die Notenhieroglyphen. Vielleicht vier
Notenzeichen ließen sich feststellen: eine Quartenfolge und der Schritt zu einer kleinen Septime: das
reine, heilige, wenn auch mysteriöse Intervall der
Quart und im höhnischen Gegensatz dazu die zweideutig schillernde, von der Sündenschlange und ihren
Satansmärchen träumende Septime. Und diese beiden Intervalle waren durch unleserlich Verkritzeltes
getrennt wie je zwei aus verschiedenen Sätzen herausgerissene Worte.

Auf den blauen, fast purpurnen Wellen dahingleitend, träumte Flavio von diesen Intervallen.

Die verkritzelten Zeichen entwirrten sich zu
zackigen, altertümlichen Tempeltürmen, zu Zyklopenmauern, die verschütteten Städten noch entrissen wurden; zu zauberrüchigen, bösen Götterstatuen, die zur Nachtzeit da droben auf dem römischen
Hügel Palatino ihre Marmorfinger aus der Erde
herausstreckten, um die Christen zu erschrecken.
Die unheimliche Septime verwandelte sich in verruchte Baalspfaffen, auf deren bleichen Stirnen das
Kainsmal der Verdammnis brannte, in fabelhafte
Wundertiere am Rand des uferlosen Meeres, da
wo die Erde aufhört und die purpurne Woge der
letzten Tiefe sich heraufwälzt. Nein! Trostlose, fahle,
arme Seelen waren es; aus der vergessenen Pracht
uralter Sarkophage, aus stillen, toten Meeren. Aus
ausgestorbenen Städten, über die schweigende, seltsame Vögel ziehen, leuchteten sie auf wie düstere
Fackeln über einem Mausoleum.

Und plötzlich erklang ihm das kläglich verstümmelte, von Flammen versengte, von dämonischer
Hand entstellte, gleich dem in Stücke gerissenen Leib
eines Verbrechers zerfetzte Lied Saint-Germains!

So sangen böse Molochpriester bei den Festen des
heiligen, weißen Stiers; das war die Hymne der Satansanbeter in den finsteren Zeiten der Geißelbrüder,
da der Teufel zu den Schornsteinen der Häuser hereinsah und mit äffisch segnender Gebärde den Hexen
zuwinkte. So sang die von allen Konzilien verfluchte
Sekte des Kainiten, welche in rasenden Hymnen zu
allen bösen Geistern flehten, daß die Welt aussterbe,
daß die Sterne verglimmen, die Weltenuhr zerschellen, die Milchstraße zerstäuben möchte. So
sangen die Elenden, Entgleisten, unter dem Saturn
Geborenen, die von der bösen Schimäre Verlockten –

Doch die sanfte, heilige Quart löschte mit eiligem
Finger diese bösen Zauberrunen, wandelte sie in
überschwenglich beglückende, hauchzarte, in unantastbarer Glorie verklärte Feste der Erinnerung an
tief und fern geliebte Schatten ...

Aber zwei andere böse Schatten winkten, jetzt,
wo die gelben Felsen der französischen Küste in der
Ferne auf‌tauchten, und erhoben drohend ihre entfleischten Hände: Flavio sah die schwarz durchfluteten Bäume vor seinem Treibhaus in Paris und den
unförmigen, blutrünstig geschlagenen Körper Swerdlows, den man heraustrug, und dort von Mallorca
her oben an der Felsenschlucht mit den grotesken
Steinfiguren wuchs das maurische Kreuz aus der
Erde, der verbogene Stamm wuchs und wuchs bis
an die Wolken und der eine Kreuzesarm deutete auf
die Leiche des Antiquars, die unten auf der Steinstufe lag.

Es war ein französischer Bürger, den Flavio in der
unseligen Nacht da auf Mallorca erschlagen hatte.

Er zitterte vor bleicher Angst bei der Landung in
Marseille. Aber niemand hielt ihn auf, niemand verlangte seinen Paß.

Die rächenden Furien hatten sich irgendwo versteckt, aber sie folgten ihm auf dem Fuße.

Ein unheimlich mahnender Vorfall vertrieb ihn
schon nach wenigen Stunden aus dieser gefährlichen
von Sonnenglut, Verbrechen und Vergangenheit
durchwühlten Stadt, die fast schon Afrika ist.

Er saß ahnungslos in einem Kaffeehaus, an dem
eine Prozession von Mädchen aller Länder und Farben vorüber ging; tunesische mit blauschwarzen Locken, holländische, blaß und schweigsam wie die
nächtlichen Glocken ihrer Heimat, Spanierinnen mit
der weißen Granatblüte im Haar, Mädchen aus
Algier, die das Geldstück, das man ihnen zuwirft,
mit unkeuscher Gebärde in ihrem Leibe bergen –

"Ich hörte ihn in Paris bei der Premiere von
Meyerbeers 'Robert der Teufel'," sagte ein junger Seeoffizier sehr laut. "Ich täusche mich nicht. Sehen Sie
hier gegenüber das Fenster mit den gelben Damastvorhängen und den Balkon daneben mit den roten
Klematispflanzen? Hier wohnte er. Hier beging er den
Selbstmord – Von diesem Balkon stürzte er sich
herab –"

Ein Schaudern überlief Flavio. Genau so sah sein
Balkon in Paris aus.

"Sagen Sie mir, bitte, wer Selbstmord beging und
weshalb?" wandte sich Flavio an den Offizier.

"Das war der berühmte Sänger Roger, und", fügte
er zögernd bei, unheimlich betroffen von dem aufgeregten Ton der Frage, "er nahm sich das Leben,
weil er, feinfühlig wie er war, das Leben nicht mehr
ertragen konnte, übrigens ein glück- und ruhmgesättigtes, von vielen Tausenden beneidetes Leben, wie
Sie vielleicht auch wissen –"

Fluchtartig verließ Flavio die Stadt.

Nach Nohant wollte er. Chopin mußte ihm Rede
und Antwort stehen. Zufällig hatte ihm ein Musiker
in Marseille gesagt, daß Chopin, ausgesöhnt mit Frau
Sand, wieder dort weile.

Aber je näher er diesem Landsitz der Frau Sand
kam, desto unschlüssiger wurde er.

Er wollte Chopin fragen, was er damals vor acht
Jahren bei seiner polnischen Allerseelenfeier auf
Mallorca erlebt habe. Aber wer gab ihm das Recht,
in diese Seelengeheimnisse Chopins zu dringen? Wie
würde Chopin, dieser mißtrauische, sensible Mensch,
diese Frage auffassen? Würde er ihn überhaupt empfangen?

Er stand unschlüssig am Parktor. Der Park lag
in der Melancholie des letzten Herbstes stumm und
öde. Die blassen Sonnenstrahlen glitten von den traurig verwelkten Bäumen mit mattem Perlmuttergeflimmer auf den mit toten Blättern besäten Boden.
Die Taxushecke trauerte stumm, düster, erstickt
unter dem grauen Himmel. Von den Platanen, die
schwarzen Türmen glichen, fielen welke Blätter,
taumelnd wie verwundete Vögel. Und dort unten bis
fast an die Hütten des Dorfes drängte sich die Heidelandschaft mit ihren traurigen Augen heran.

Noch ehe Flavio läutete, näherte sich eine schlanke,
in einen grauen Schal gehüllte Gestalt dem Parktor.

"Meister Chopin?" rief Flavio freudig überrascht.

"Nein, der bin ich nicht. Wohl aber sein Doppelgänger, der Dichter Julius Slowacki –" war die leise,
von Hüsteln unterbrochene Antwort – "Chopin ist
abgereist, nach einem nicht wieder gutzumachenden
Auf‌tritt mit Frau Sand. Ich kam, um noch einmal
zu versöhnen, aber nach dem, was ich sehe und höre,
möchte ich bloß auf dem Grabe dieses Verhältnisses,
das neun Jahre dauerte, ein Kreuz aufpflanzen und
die Erde fester stampfen – Frau Sand wollte nicht
länger sein Krankenpfleger sein, sie wollte sich unter
allen Umständen von ihm trennen – Oh! Mehr will
ich über diese schreckliche Frau nicht sagen. Ich
reise auch ab, heute noch – Schon der Anhang, den
sie hier um sich hat, eine Horde von Schwärmern,
Schwindlern und träumenden Utopisten, ist mir unerträglich –"

"Wohin ist Chopin abgereist?" fragte Flavio.

"Nach Paris. Er will umziehen, um auch aus der
Nachbarschaft der Frau Sand und der Frau Generalkonsul Marliani wegzukommen, nach der Place Vendôme 12, was er überhaupt schon länger plante –"

"Place Vendôme 12?" jubelte Flavio auf. "Dann
ist er ja mein Nachbar. Oh! ich werde dann alles von
ihm erfahren können –"

Slowacki lächelte über den verwirrten Enthusiasmus Flavios.

"Man dringt nicht so leicht in die Geheimnisse
dieses orchideenhaften Rätselmenschen ein –"

Er deutete auf eine steinerne, von gelbgrünen
Flechten halbverzehrten Statue der Pomona, von der
aus die Bäume der Allee gleich Fabeltieren einer
nach dem andern zum Schloß aufstiegen.

"Sehen Sie diese arme steinerne Göttin?" fuhr
Slowacki fort. "Chopin kommt mir noch steinerner
vor. Dem Menschlichen ganz entfremdet. So
schwächlich sein Körper ist – er ist lungenkrank
wie ich; das kann ich Ihnen ja sagen – so hart, ja
steinern ist sein Wille, sein Geist überhaupt. Sehen
Sie die Geschäftsbriefe an seine Verleger oder seine
Kontrakte mit dem Konzertagenten! Er gibt sich oft
wie ein verzärteltes Kätzchen im Salon, das sich nur
unter Samtdecken, Seidenspitzen und kostbaren Teppichen wohl fühlt, aber innerlich ist er wie von Stein,
von Granit. Etwas Magisches ist an ihm –"

"Ich dachte es; ich werde es aber dennoch erfahren. Chopin muß es mir anvertrauen. Er wird die
Noten entziffern können –" und nun erzählte Flavio alles, was er in Paris seit seinem Pamphlet "Gastmahl der Schatten" erlebt hatte. Auch vom Antiquar, von Mendizabal und der Allerseelennacht mit
dem Antiquar. Den Dichter erfaßte ein Schauer.

"Auch ich erlebte eine Allerseelennacht," sagte er
zögernd. #quote[Sie war ebenso tragisch wie die Ihre, wenn
auch kein Antiquar dabei war.

Ich hörte eine Prophezeiung aus dem Gewisper der
armen Seelen heraus. Jung werde ich sterben wie
Chopin. Meine stolze Seele wird verdorren wie die
Chopins. Und ich glaube es. Es gibt Tage, wo ich eine
Maske tragen möchte, da es mich ekelt, Menschen
zu sehen. Ich sah Seelenverwandte unter den Schatten der armen Seelen. Sogar den wahnsinnigen Sardanapal, der sich lebendig verbrannte. Aus all dem
Schwarm der kleinen Wichtelmännchen stach er hervor mit seinem prächtigen, hyazinthfarbenen Gewand, seiner Tiara, die mit Amethysten und fahlen
Rubinen geschmückt war, und dem Goldreif mit den
blauen Saphiren und tolläugigen Jantaren. Seine Lippen waren bewunderungswürdig hochmütig und
doch sanft gekrümmt wie bei einer leidenden griechischen Maske. Manchmal habe ich diese Lippen bei
Chopin gesehen und es war auch dieselbe verblichene
Stimme, die bei Chopin mich dann an welken Purpur und altes Elfenbein erinnert – Ich will Ihnen
noch gestehen, daß ich die elendeste, trostloseste Erkenntnis von unserem ganzen Dasein damals da oben
in diesem Turmgemach auf Mallorca gewonnen habe.
Es war wirklich, als wenn dieser Saint-Germain, von
dem Sie mir erzählten, diese Giftgedanken mir eingeblasen hätte. Es war wirklich, wie Sie sagten, als
streute man Asche auf Rosen. Es läßt sich ja ohnehin so viel über den Schmutz und die Niedrigkeit des
Lebens sagen, wie es bei Chopin schon aus einem
Lächeln, einer verachtungsvollen Geste mir entgegenkommt. Und wenn ich nachdenke über uns Geschöpfe, die wir in Unrat geboren werden und in
greulichem Leichengestank verwesen, – die wir –]

Die schrille Mannesstimme der Dichterin von der
Terrasse oben verscheuchte Flavio, der noch am selben Tag nach Paris zurück fuhr. – – –

Wirklich war Chopin schon Flavios Nachbar geworden, als dieser in Paris wieder ankam. Urhan, der
erste Besucher, wurde kurz abgefertigt.

Als Entschädigung gestattete Flavio dem Seelenretter, im Treibhause und im Pavillon zu säubern.
Lächelnd sah er zu, wie Urhan die gelben, aufgedunsenen Rosen, die krankhaften Orchideen und all
die namenlos fremden, unheimlichen Blumen ausriß.

"Ein Asyl für Elende und Obdachlose könnte man
hier einrichten. Manches könnte dadurch gesühnt
werden," redete er auf Flavio ein. Gestern, bei dieser Kälte schon hatte er in einem Winkel bei den
Markthallen, in dem Sack eines Lumpensammlers
verkrochen, ein Kind gefunden, obdachlos, eine
Waise, der Gnade des Teufels preisgegeben.

"Flammèche#footnote[Flammèche = Flämmchen.] nennen sie ihn. Schon 16 jährig ist
er, aber von Hunger und Entbehrung entkräftet und
im Wachstum zurückgeblieben, sieht er aus wie ein
Kind. Mit dem Gesicht einer Spitzmaus sah er aus
dem ekelhaften Lumpensacke heraus, als ich ihn aufstöberte. Mit seinem kleinen, krächzenden Stimmchen schrie er kläglich auf, als er mich sah, da er
mich für einen Polizisten hielt. Oh, das arme Würmchen! Sein Vater ist im Steinbruch verunglückt, die
Mutter starb unter dem Fallbeil, weil sie sich eines
holländischen Matrosen erwehren wollte, der sie mit
einer häßlichen Krankheit angesteckt hatte, und ihn
erstach. Zuletzt war Flammèche bei einem alten
Lumpensammler. Tapfer ging er neben ihm her, half
sammeln. Mit Haken zogen sie die Lumpen aus verpesteten Löchern. Vor einer Woche starb der Alte
und Flammèche sitzt im Elend da. Man muß ihm helfen. Wo soll ich ihn unterbringen?"

Der Seelenretter sah bald auf Flavio, bald in die
weiten Räume des Treibhauses. Wie leicht könnte
man das arme Kind hier unterbringen!

Flavio reichte Urhan eine 1000 Fr.-Note hin.
"Nehmen Sie dies für das Waisenkind, für diesen
Flammèche!"

"Ihr Engel hat diese gute Tat gesehen, Herr Sikorski! Aber nur mit dem einen Auge freut er sich,
das andere weint!" rief der Seelenretter. "Er freut
sich über Ihre überreiche Gabe, und weint, weil er
die Gebärde des Abscheus und die spitzen Finger sah,
mit denen Sie mir diese Summe für das arme Würmchen überreichten –"

"Mein Engel mag zufrieden sein, wenn er nur mit
seinem _einen_ Auge sich über mich freuen kann,"
entgegnete Flavio übelgelaunt.

Der arme Urhan wußte nichts zu erwidern oder
wagte es nicht, um sich nicht Flavios Wohlwollen
für seine Schützlinge zu verscherzen.

Er schlich traurig fort, wie ein Hund, den man
von der Schwelle gewiesen hat.

"Das Böse färbt ab," murmelte er, die Marmortreppe mit ihren Porphyrvasen und den Statuen antiker Dämonen hinabsteigend. Luzifer gab diese
stolzen, spitzen Finger seinem Apostel, diesem Saint-Germain; von ihm erbte sie Chopin mit der Schar
seiner vergötzenden Anbeter und Anbeterinnen im
Faubourg Saint-Germain und jetzt ist Flavio im Banne Chopins, des Stärkeren, der zu ihm sagt: "Gib
mir deine Seele! Ich will sie ummodeln nach der meinen! Wie ein Stück Wachs will ich sie kneten nach
dem Muster der meinen! –"

Es war ein verzweifelter Kampf, aber Urhan gab
noch nicht alle Hoffnung auf. Flavios Bankkonto,
vor dem selbst Rothschild Respekt gehabt hätte,
schmolz langsam von den ungezählten Summen, die
er für die Armen gab. Aber niemals brachte ihn Urhan dazu, den Dank der Unglücklichen entgegenzunehmen, die er vom Hungertod und den teuflischen
Gefahren der Straße errettete.

"Ich helfe ihnen gerne, aber ich will sie nicht
sehen!" war alles, was er dem drängenden Urhan
entgegensetzte. Das waren immer wieder die stolzen, spitzen Finger Chopins, der Flavios Seele an
sich zog, um sie auszusaugen wie ein Vampyr.

Täglich sah man Flavio zu Chopin hinüber gehen
oder am Fenster seinem Spiel lauschen. Wohnte er
einer Unterrichtsstunde Chopins bei, so konnte Fontana, Chopins Haussklave und Vermögensverwalter,
sicher sein, in der Marmorvase, wo die Schüler ihr
Honorar niederlegten, zum mindesten eine 100 Fr.-Note zu finden. Eigentlich war schon seit der 20 000
Fr.-Spende der Engländerin Jane Stirling Chopins
Existenz für lange hinaus sichergestellt. Diese hochherzige Schülerin, durch eine grausame Laune der
Natur in ihrem Äußeren fast bis zum Lächerlichen
verunstaltet, war eine Art weiblicher Urhan, ins
Schottisch-Puritanische übersetzt. Sie quälte Chopin
mit Bibellektüre und trübseligen Erbauungsbüchern.

Wozu noch weiter Konzerte geben? Überreich an
Weltruhm und an Bewunderung der vornehmsten
und gefeiertsten Künstler Europas war jetzt doch sein
Leben! Was komponierte er noch? Warum gab er
noch Konzerte? Die konnte er getrost der klebrigen
Mittelmäßigkeit und ihrer glänzenden, bestechenden
Banalität überlassen. Selbst Rellstab in Berlin hatte
seinen aufgeblasenen Kunstdünkel aufgegeben und
kroch den Spuren Robert Schumanns nach, dessen
einzige Sorge es nur noch war, neue, enthusiastische
Schilderungen des Phänomens Chopin in seiner Zeitschrift erscheinen zu lassen. Wozu noch dieser kleinlichen Eitelkeit des Konzertpodiums zu frönen, statt
seinem Seelenheil zu leben!

Die gute Jane Stirling ängstigte sich sehr wegen
der Gleichgiltigkeit Chopins, die fast an Spott
grenzte. Tief bekümmert befragte sie das Bibelorakel.

Drohende Orakelstimmen versuchte sie in Freundlicheres umzudeuten, hoffnungspendende Aussprüche
beruhigten und beglückten sie.
Mehrmals schlug sie die strengen Drohungen auf
gegen die Lauen, die nicht kalt und nicht warm sind
und ausgespien werden sollten – –

Mit edler, faltiger Würde, die ihre eckigen, wie
aus Pappendeckel geschnittenen Bewegungen milderte, näherte sie sich dann dem Flügel und legte
die aufgeschlagene Bibel neben die gottlose weltliche
Musik – und Chopin nickte ihr lächelnd zu. Es war
dieses undefinierbare, verwirrende, verfänglich
schwebende Lächeln, das auch sie zur Verzweiflung
brachte.

War die Seele Chopins aber wirklich weder kalt
noch warm? Janin damals mit seiner glitzernden,
spitzen Bosheit hatte sie besser gedeutet. Den
Schmutz und die Niedrigkeit der Gegenwart floh sie
und verbarg sich in längst vergangene Zeiten bei
tief und fern geliebten Schatten, bei leuchtend, in
zarter, nie befleckter Glorie Verklärten! Diese einsame Seele zog hilflos und dennoch tapfer in einer ihr
fremden Welt ihre träumerische Bahn. War es zu
verwundern, daß die Dinge um Chopin her ihre Farbe verloren und in toten Tagen und Nächten dahinwelkten? Daß der Gesang der Schatten lockender
wurde, die Klagen der geliebten Toten sehnsuchtsvoller und die Wollust des einsamen, stolzen Vergehens
bezwingender?

Es war kurz vor dem Allerseelentag 1847. Erst
jetzt wagte es Flavio, den Meister nach seinen Erlebnissen bei seiner Allerseelennacht auf Mallorca zu
fragen.

Chopin spielte gerade auf seinem Flügel. Seine
glitzernden Passagen und berückenden Kantilenen
 hüllten eine unheimliche Stimmung in den Purpurmantel erlesenster Schönheit. Aber immer drängte
sich ein Thema vor, das etwas Nächtigdüsteres hatte,
etwas von grauen Sandwüsten und starrer Priesterlichkeit, die mit nächtig düsteren Fragen zu bösen,
fahlen Sphinxen und den Pyramiden, diesen stummen Leichenbehältern aufsah. Jetzt murmelten tückische Triolen, wie träges Wasser, das in gemauerten, schwarzen Grüften dahinfließt, als hätte es nie
das Licht gesehen.

– "Die Septime!" rief Flavio aus.

Chopin hielt inne mit dem Spiel und hörte Flavio
zu, der alles erzählte. Von Avignon an bis zu dem
Mord auf Mallorca.

Die Wirkung auf Chopin war eine wahrhaft entsetzenerregende.

Vielleicht noch niemand hatte Chopin, diesen beherrschtesten, kultiviertesten aller Menschen, sich
einem Zornesausbruch hingeben sehen. Diesmal aber
verlor der Meister, vor Wut erblassend, für einige
Augenblicke die Herrschaft über sich selbst.

"Schweig! Warum erzählst du mir das? Du hast
ihn ermordet, diesen widerlichen Antiquar! Was
habe ich mit diesem schmutzigen Gaukler Saint-Germain zu tun! Verlaß mich! Ich kann dich nicht mehr
sehen! Ich hasse dich und deine Septime!"

In dieser Nacht wollte Flavio sterben. Die Lampen seines Theaters waren abgebrannt; die schillernden Götzen, die er aus ihrem Modergrab ausgegraben
und zur Verehrung in den grellen Tag heraufgezerrt
hatte, das Fanatisch-Unheimliche seines Empfindens
sank zusammen zu einem widerwärtigen, grau verwesenden Aschenhaufen.

Ja, Urhan hatte recht. Die Schwermut, der Weltekel, der in Chopin war, hatte seine Seele ergriffen. Die bösen, schillernden Gedankenbilder hatten
Formen angenommen und sich bei ihm eingenistet.
Überwältigt hatten sie sein armes Gehirn und mit
brennenden Träumen verwirrt.

Wieder stand er an der Seinemauer wie damals.
Aber kein Urhan kam.

Es war eine tumultuarische Nacht. Weiter unten am
Ufer, wo die Häuser sich näher herandrängten, sah
er dunkle Schatten und seltsam! unter ihren Schritten war es, als röteten sich die Steinplatten mit Blut.

Die Schatten kamen immer näher: in schwarze
Mäntel gehüllte Männer, die Fackeln trugen. Einer
schwenkte einen Stab, an dem oben eine riesige Birne
hin und her schwankte.

Leise, aber fanatische Schmährufe auf den König
wurden ausgestoßen.

"Der Tag kommt für die Hoffärtigen! Der Taifun
der Volkswut rast heran –" deklamierte der Mann,
der die Birne trug.

Jetzt erkannte ihn Flavio: Es war der Professor
der Magiologie. Vielleicht machte er jetzt mit Politik
bessere Geschäfte als früher mit seinem Jugendelixier.

War dies nicht auch ein Wink für Flavio? Bisher
hatte er für den politischen Zeitungskram nicht das
geringste Interesse gezeigt. Wenn sein Diener Casimir von der wachsenden Unzufriedenheit mit der
Regierung erzählte, von der Organisation der Bewegung durch zwölf geheime Sektionen, Gruppen und
Leiter, hatte er kaum zugehört.

Ja, wenn es sich um den Großfürsten Konstantin gehandelt hätte! Um ein Attentat auf ihn!

Seine wütenden Phantasien aus der Zeit der
Elendsjahre erwachten wieder und ergriffen ihn mit
unwiderstehlicher Gewalt.

Ein Irrweg war es, dieser Traum von der Kunst,
dieser Götzendienst mit Chopin, der ihn so grausam
von sich gestoßen hatte! Flavios Reichtum erlaubte
es ihm ja, ein teueres, vornehm aufgezogenes Konzert nach dem andern zu geben, ganz Paris nach und
nach mit Freibillets und Reklame in seine Konzerte
zu locken, aber er schauderte schon vor dem Gedanken zurück, auf dem Podium zu stehen und um
den Beifall dieser Menschen, die ihm herzlich gleichgiltig und verächtlich waren, mit wohlgedrechselten
Komplimenten und süßlich gezierten Tanzmeistermanieren zu betteln. Er stellte sich Chopin vor, wenn
er nachsichtig lächelnd in der vordersten Reihe saß,
die Fingerspitzen, wie es seine Sitte war, ineinander
gelegt, den Kopf etwas gesenkt, und mit einem immer nachsichtigeren, ablehnenderem Lächeln allmählich zum Halbgott erstarrend, der im Allerheiligsten thront und draußen im Vorhof kümmerliche
Tempelsklaven sich um die Rauchfässer bemühen
sieht; zum Halbgott, der schon in Zorn gerät, wenn
man ihm von einer Allerseelennacht erzählt und jenem dämonischen Bereich, in dem er allein schalten
will, er, der größte Magier, gegen den in der Tat der
irrlichternde Saint-Germain doch nur ein Jahrmarktsgaukler ist – –

Nein! Er wollte nicht den endlosen traurigen Zug
dieser Tantalusseelen vergrößern, dieser Halbtalente,
die in trostlos sinkenden Nebeln, ohne Hoffnung,
steuerlos umherirren und doch nur den Triumph dieser ganz Großen, dieser unerhört Genialen vergrößern, die, wie Chopin, die Nerven von Elfen, den
Fleiß von Heroen, zehn Sinne, drei Augen haben, die
in einer ganz anderen Luft atmen, nicht auf derselben Erde wohnen wie diese anderen, die nicht Auserwählten, denen diese leiderfüllte Erde nur spitze
Dornen streut –

Die trübselige Morgendämmerung stand schon am
scharlachen entzündeten Firmament, als Flavio wieder zu seiner Wohnung zurückkam. Es trieb ihn nach
dem durch Urhans Exorzismus gereinigten Treibhaus.

Die wenigen Blumen, die dem strengen Gericht des
Seelenretters entgangen waren, warfen grämlich dahinkriechende Streifen in das verzerrte, schattenhafte Licht, das Symbol seines armen, durch Schrecken, Verzweiflung und Phantasmen vernichteten Lebens.

Die im zitronengelben Osten langsam heraufkommende Sonne, vor der die Nacht fahl zerfallen mußte,
ließ diese Schatten vom Schwarz zum Grau und bald
zum Violett wechseln und stieß die bleich zuckenden
Wellen der Nacht in den Abgrund zurück, dem sie
entstiegen waren.

Fast atmete Flavio wieder auf, als jetzt die sonnendurchwirkte Morgenröte weihevoll den Himmelsthron bestieg, in einem Gefolge bald goldig, bald
weinrot schimmernder flockiger Schäferwolken.

"Alles wird noch gut werden," murmelte Flavio.

Ein ganz sonderbares Gefühl überkam ihn, ein
greisenhaftes Glücksgefühl, fast Freude zu nennen.

"Ich habe das Gespenst Saint-Germains überwunden, ich habe den Bann Chopins gebrochen, so wie
die Sonne jetzt diese schreckliche Nacht und den
großen, verstörten Mond, der mich an die Seine
lockte, zu Boden geworfen und zertreten hat. Daß
ich mich wegen dieses vornehmtuerischen Götzen,
der sich selbst und seine Leidenschaftssucherei anbetet, gestern in solche Verzweiflung stürzte! – Ich
werde stark sein von jetzt an, nicht mehr der Götzenanbeter sein wie ein wahnsinniger Fakir in der
Wüste, der seinem Götzenphantom zu Ehren sich die
Nägel in seine geballte Faust wachsen läßt und über
die Sonne jauchzt, die seinen Leib ausdörrt –"

Die Dämonen, die den Menschen verderben sollen,
erscheinen ungerufen vor ihm, aber immer zu einer
Zeit, wo sie mit offenen Armen aufgenommen werden.

Am selben Vormittag erschien bei Flavio – der
Professor der Magiologie. Zum ärgerlichen Staunen
Casimirs empfing Flavio ihn freundlich. Zwei Stunden verhandelten die beiden hinter verschlossenen
Türen, die indes dem lauschenden Diener so viel
durchließen, daß er mit Unruhe, ja Entsetzen erfüllt wurde.

"Der Birnkopf! – In einem Jahr haben wir ihn
am Galgen neben dem Zaren Nikolaus – die #sc[XII]
Sektion, deren Haupt ich bin – ein Attentat, das ihn
diesmal nicht verschont – wir ernennen Sie zum
Ehrenpräsidenten –"

Schon ein einziges dieser Schlagworte, die an das
Ohr des vor Schrecken erstarrten Dieners drangen,
hätte genügt, Flavio auf die Galeere zu bringen.

"Er ist verloren!" stammelte Casimir. "Ich sehe
ihn schon mit der Eisenkette am Fuß und der Brandmarkung auf der Brust. – Tausendmal besser wäre
er doch der Freund Chopins geblieben! Chopins Launen sind unerträglich, aber solche Greuelgedanken
wie ein Attentat auf den König sind ihm ebenso undenkbar wie mir. Gut! Chopin mag wie ein Pfau in
wallender Purpurtoga herumwandeln und wenn er
gestorben ist, rosenrot und strahlend im Weltenraum herumflattern und sich über die Denkmäler
und Marmortempel, die er auf Erden hat, freuen;
mein Herr darf ihn dafür auch beneiden. Man kann
sich doch an Herrn Chopins Launen gewöhnen – aber
dieser grauenhafte Mensch mit seiner Sektion und
seinem Attentat –"

Als er dann den Professor strahlenden Gesichts die
Treppe hinabgehen sah, wußte er alles, ohne daß
Flavio ihm ein Wort gesagt hätte. Schritt für Schritt
kam das Unheil näher.

Schon mußte das Treibhaus neu eingerichtet werden.

"Ich werde hier kleine Gesellschaften haben. Wir
können da musizieren und Whisttische aufstellen"
betonte Flavio viel zu oft und an die Ohren der Dienerschaft hin. Casimir glaubte kein Wort davon; er
wußte alles.

Der Professor kam jetzt öfter. Sein Gesicht sah
bei jedem Weggehen strahlender aus; das Bündel
Banknoten, die er mitnahm, wurde größer.

Der Allerseelentag 1847 kam heran, die Zeit der
Beschwörungen und der bösen Nächte. Für Chopin
und Flavio auch die Zeit wirr verschlungener Erinnerungen und lautloser Tränen.

An die Fenster des Treibhauses, wo jetzt einmal
in der Woche die Radikalsten der polnischen Verschwörer zusammenkamen, pochte triumphierend
der Geist der nahen, großen Revolution; für Flavio
aber flatterte der Totenvogel herbei, schlug die Flügel, flatterte ans Fenster und schrie um die Wette
mit einem nervenschwachen Pfau.

Flavio war mitten auf den tausend Irrwegen des
Lebens, schon näherte er sich dem abschüssigen
Pfad, der zum Tod führt.

Chopins Gesicht sah grauer, steinerner, abgestorbener aus als sonst. Die Einsamkeit, welche andere
Menschen nur an besonderen Tagen ertragen können, kauerte beständig zu seinen Füßen. Seine Seele
verwelkte, wie der Seelenretter Urhan sagte, der
sich jetzt auch nicht mehr zu Flavio heraufwagte.

Durch seine hochmütigen Einsamkeiten quälte
sich Chopin hindurch, wie totmatte Pilger durch sonnenverbrannte, grenzenlose Wüsten. Da waren die
polnischen Gefangenen – er hörte ihre Schritte –
über die endlose Steppe zwischen Nacht und Tod
trieb man sie – manchmal an dicken, mürrischen
Fichtenwäldern sah man Leichen mit starren, stolzen, spitzen Gesichtern im Wind schaukeln – und
das Tränenkrüglein des polnischen Volkes zitterte in
der Hand Gottes – – –

Er sah sie an den Fichtenwäldern der trostlosen
Steppe vorbeiziehen, sah die Schneeflocken herniederrieseln, wie leise Vögel.

Die Einsamkeit um Chopin ward quälender, bitterer. Er hatte seine eigene Seele, seine eigenen Gefühle, seine eigenen Enttäuschungen und Verzweiflungen.

Aber kann man immer nur in schwelgerischer Melancholie bei längstvergangenen, träumenden, süßen
Schatten weilen, bei tief und fern Geliebten?

Das Wort: "Ich langweile mich" kam aus seinem
Munde über die noch immer hochmütig gekräuselten Lippen, während der aufgewühlte Glanz in den
Augen die fieberhaften Gedanken verriet, die in dieser Stirne wühlten.

Von welchen längstvergangenen, träumenden, süßen Schatten war er umringt, wenn er diese Worte
aussprach: "Ich langweile mich!"?

Ging dieser ruheloseste aller Menschen mit den
polnischen Gefangenen über die endlose Steppe?
Oder träumte er von schwermütigen, hohen, blaugrünen Zypressen, von toten, verzweiflungsvollen Erinnerungen an all die Schönheit, die er nie gesehen,
nie geküßt hatte?

Oh! auf all den starren, schweigsamen Totenbildern seiner gepeinigten Seele stand das Wort: Langeweile.

Aber es war nicht die lasterhafte Langeweile des
römischen Kaisers, der den Flötenspieler aus Egium,
 den Köchen aus Elida, den Tänzerinnen aus Naukratis zurief:

"Fort mit euch! Ich langweile mich!"

Nicht diese kindische Langeweile, die ihre Hände
nach allen Seifenblasen der Welt ausstreckt und unzufrieden ist, wenn sie nicht alle erhaschen kann.

Diese Langeweile Chopins, von der er damals immer öfter in seinen Briefen schrieb, war, giftgetränkt, zornig und weltanklagend wie sie war, der
Seele jenes Mannes verwandt, der damals auf Mallorca vor dem erstarrten Hirtenjungen Isidoro das
Notenblatt schwenkte.

Und wenn er dieses Wort "Langeweile" aussprach,
gähnte er nicht; er zerbiß es und spie es aus mit
hochmütig gespitzten Lippen.

Er, der bestrickendste, verlockendste Poet auf dem
Klavier, las nur noch die polnischen Gedichte des
ihm seelenverwandten Julius Slowacki und einige
Bände Voltaires, der spitzmaulig hohnlächelnden
Sündenschlange, die auf allen Bäumen des Paradieses
herumkroch und sie mit ihrem Speichel vergiftete.
Seine romantischen Zeitgenossen Victor Hugo und
Lamartine, die den räudigen Glanz versunkener, barbarischer Jahrhunderte in schwelende Weihrauchwolken hüllten und das Parfüm modischer Kurtisanen darübergossen, um die Wechselbälge ihrer Poesie schmackhafter zu machen, bereiteten ihm fliegenartiges Unbehagen, namentlich Victor Hugo mit
seiner Vorliebe für Monströs-Verkrüppeltes und Gotisch-Drachenhaftes, der indessen, der Zeitströmung
folgend, seine Leier auf die neue Saint-Simonistische
und sozialistische Strömung umstimmte. Denn schon
hörte man von Plänkeleien zwischen der königstreuen
Munizipalgarde und einzelnen Abteilungen der Pariser Besatzung unter ihren Stadtsergeanten.

Straßenredner tauchten allenthalben auf, namentlich in der seit jeher revolutionär gesinnten Vorstadt Saint-Antoine. Der Gruß dieser armen, schlecht
genährten Bevölkerung an die Aristos (Aristokraten), so nannte man dort summarisch alle besser oder
gar vornehm Gekleideten, war wie ein Bellen; ein
Händedruck glich einem Dolchstoß.

Schon tönten dort die verhängnisvollen Rufe: Auf
die Barrikaden!

Wenn Dragoner; den Karabiner in der Faust, heransprengten, wurde es still. Aber die Revolution
hatte sich dort eingenistet. Wie Raben, wenn sie den
Blutgeruch wittern, nicht mehr vom Galgen zu verscheuchen sind. – –
Es hatte 11¾ auf der Uhr der Weltgeschichte geschlagen. Achtzehn Jahre hatte der Bürgerkönig sich
auf seinem durch üble Ränke erlisteten und erschlichenen Thron behauptet, allen Pamphleten, Anfeindungen, ja Attentaten zum Trotz. Jetzt, in diesen
letzten Wochen des Jahres 1847, rollten die ersten
Sturmwellen gegen das Regierungsschiff heran,
schleuderten es gegen den Himmel, daß die Wände
krachten und die Masten splitterten und rissen
es wieder in den Abgrund der wütenden Wasserwogen hinab.

Immer mehr Verschworene kamen im Treibhause
Flavios zusammen. Selbst die Blutrünstigsten, die
sich bisher wie eine Schar verstörter Fledermäuse
in den Pariser Katakomben, 20 Meter unter dem
Straßenpflaster, verkrochen hatten, und nun ihre
Zeit gekommen sahen. Was sie in dieser Unterwelt,
diesem Labyrinth kreuz und quer laufender und oft
im Schlammgerinnsel fast versinkender Stollen geplant, was sie selbst in diesen gräberhaften, schwarzen Nischen sich nur zugeflüstert hatten, das besprachen sie nun laut und ohne Scheu im Treibhaus
Sikorskis. Denn das strafende Weltgericht war nahe,
die orkanhaft mit tausend Schrecken niederprasselnde Katastrophe. Der Hauch unsichtbarer Riesen
trieb Legionen dicker schwarzer Wolken wirbelnd
über Paris, der Stadt des Lichts, der Weltgeschichte,
aber auch der Satyrspiele, zusammen. Schon stürzten
weiß und grün gesprenkelte Flammensäulen wie einst
auf Sodom herab und fraßen sich vor den Tuilerien
in die hoffärtige Allee ein ...

Wieder konferierte der Polizeiminister mit dem
Bürgerkönig wegen Sikorskis und der Zusammenkünfte in seinem Treibhause.

Diesmal obsiegte der Polizeiminister mit seiner
Meinung: Noch nicht zugreifen! Abwarten! Beobachten und dann erst die Falle schließen!

= Die Seelenwaage

Flavio wußte, daß er beobachtet wurde. Ein Ministerialbeamter, der gern seine Weine trank, warnte
ihn, und auch der getreue Casimir, den die Angst um
seinen Herrn nicht mehr schlafen ließ, freute sich,
einen so mächtigen Bundesgenossen gefunden zu
haben.

Von Tag zu Tag hoffte er, daß das Treibhaus geschlossen und die Verschwörer mit ihren finsteren
Plänen hinausgetrieben würden.

Flavio jedoch zuckte nur leichthin die Achsel:

"Man kann sie gewähren lassen!"

Aber die tiefste, versteckteste Ablehnung seiner
bisherigen Gesinnungsgenossen sprach aus der Handbewegung, welche einen stummen Kommentar zu seinen kargen Worten lieferte.

Casimir sah erstaunt auf.

"Viele unter diesen Leuten sind sehr ungepflegt,
sie haben struppiges Haar und schmutzige Fingernägel," fügte Flavio nach einer langen, unbekümmerten Pause bei, so leichthin und nebensächlich, als
handelte es sich um Leute auf dem Monde.

Es war, als spräche Chopin aus ihm.

"Du wunderst dich, Casimir, über meinen Wankelmut? Du siehst, daß Chopin auf mich abfärbt? Mag
sein. Zu lange habe ich das Gift seiner Melodien eingesogen. Nebenbei, Casimir, kann ich dir anvertrauen, daß diese Burschen ganz niederträchtig an
mir handeln. Ich bin ihnen nur der einfältige Geldgeber und Millionär, der die Revolution als Sport
betreibt wie der englische Lord ein Pferderennen. –
Ich bin ihnen nur der zu einem Halbgott aufgeblähte
Millionär mit der granitnen Habgier und der lächerlichen Wichtigtuerei. Einer dieser Menschen hat auch
ein Pamphlet auf mich gemacht. Fast hätte ich mich
über eine Stelle in diesem Machwerk beunruhigt. Da
redet dieser Sudler mir nach, ich hätte mit meinem
Geld gipserne Gesetze umgestoßen –"

"Der General Swerdlow?" schauderte Casimir zusammen.

Flavio ging an den Flügel und spielte einige
Akkorde. Dann brach er ab und sah Casimir starr
an:

"Ich will diese Menschen verabschieden und wieder zu Chopin zurückkehren –"

"Wie der verlorene Sohn!" jubelte Casimir auf.

"Ja. Wie der verlorene Sohn oder noch besser wie
einer, der von diesem Magier nicht mehr loskommt –"

Flavio wurde von Chopin empfangen, als ob nichts
vorgefallen wäre. Über die Geheimversammlungen
im Treibhaus lächelte er mitleidig amüsiert, wie ein
Kind, dem man ein Märchen von einem alten, bösen
Menschenfresser erzählt.

Flavio, seiner Sache noch nicht gewiß, suchte sich
Chopins durch einen Gewaltstreich zu versichern.
Während er das verfängliche Lächeln des Meisters
zu deuten suchte, flog sie ihm zu, die exzentrische,
diesen aufgeregten Zeitläuften wie eine Faust ins Gesicht schlagende Idee: Jetzt, wo die Armen mit starren, bösen Augen zu den festlich beleuchteten Fenstern der Reichen und den Wappen des Hochmuts
hinaufsahen, wo der tausendfüßige Polyp des murrenden Volkes vor den Prunksälen dieser stolzen,
geldkühlen Reichen kauerte und seine Arme gegen
die flammensprühenden Kronleuchter und champagnergefüllte Becher ausstreckte, jetzt, wo die in
Lumpen gehüllten Spukgestalten der Elenden von
dem phantastischen Riesen träumten, der mit seiner
Fackel ihnen voranziehen und die hochmütigen Paläste des Reichtums in Aschenhaufen verwandeln
würde, wollte Flavio ein unerhörtes Fest geben!
Mochte man es "Das Gastmahl der Schatten" nennen oder "Eine Nacht in Niniveh oder Babylon oder
Persepolis", es war ihm gleichgiltig. Es sollte ein stolzes, unerhörtes, noch nie dagewesenes Fest sein,
ein Fest voll Hochmuts, voll sphynxhafter Rätsel und
tiefer, ferner Vergangenheiten.

"Voll tiefer, ferner Vergangenheiten," nickte Chopin. "Ich werde Ihr Fest besuchen –"

"Was ist dies?" rief Flavio. "Hören Sie diesen Tumult von der Seine her? Es ist Alarm."

"Oh! ich höre es, es sind wirre Trommelsignale
und Trompeten. Wie diese Töne so unheilvoll rasseln!"

"Schwarze Rauchwolken!" schauderte Flavio.
"Dort, Meister! Sehen Sie die gelben Flammenstreifen dazwischen?"

Ein rotes Flammenmeer schwemmte den Rauch
weg. Hochauf‌lodernde, rubinrote Feuergarben ergossen sich über den ganzen Horizont. Riesenfunken flogen wie feurige Drachen. Das unheilvolle wirre Rauschen in der Luft drang bis zu den beiden.

"Das ist Revolution" sagte Flavio mit bebender
Stimme.

Chopin bedeckte sein Gesicht mit beiden Händen.

"Oh, die Revolution damals in Warschau!" stöhnte
er. "Ich war schon in Wien und meine Eltern sahen
die Kosaken kommen mit brennenden Fackeln. Neben ihren Pferden her liefen polnische Gefangene,
an Stricken angebunden. Auf dem Marktplatz wurden sie erschossen –"

Die sich drängende, hin und her zurückströmende
Menge ergoß sich durch die Nebengassen näher an
Chopins Haus heran. Die Flammensäulen wurden
zwar kleiner, aber die wie in Zauberrunen zerflatternden Formen waren unheimlicher und drohender. Chopins Diener stürzte herein,

"Ein Marktschiff geriet in Brand. Wahrscheinlich
war es Brandstiftung. Die brennenden Balken
schwammen davon und steckten Holzhäuser und
Warenschuppen an. Die Nationalgarde kam und
löschte. Aber sehr viele Schläuche waren zerschnitten. In der Vorstadt Saint-Antoine werden schon
Barrikaden gebaut und die Pflastersteine herausgerissen. Der König will nachgeben und die Reformbankette erlauben. Hoffentlich ist es nicht zu spät –"

"Alles stürzt in den roten Ring Saturns, das Verhängnis kommt näher und näher –"

Flavio deklamierte es wie einen Vers aus einem
unheilschwangeren griechischen Schicksalsdrama.

"Sind Sie noch immer entschlossen, jetzt, wo die
Revolution auf‌flammt, das Fest zu geben?"

Etwas Verhängnisvolles zwang Flavio zu sagen:
"Ich will es geben, wenn nur Sie kommen, Meister!"

Chopin versprach, zum Feste zu erscheinen.

Wie jetzt Clésinger sich beeilte, Auf‌träge für das
Fest zu bekommen! Selbst George Sand, die nach
ihrem endgiltigen Bruch mit Chopin die verlassene
Dido, aber doch noch immer mütterlich Besorgte
zu spielen sich bemühte, brachte ihre Schützlinge,
dichtende und malende Epheben, ins Haus und Flavio wies ihre Dienste zur Verschönerung des Festes
nicht zurück.

Gautier, der Dichter kostbarster Nippsachen,
Maler und Kunstkritiker in einer Person, übernahm
den Saal, wo der Thron für Pluto, dem Richter der
Unterwelt und die mondstarre Proserpina stehen
sollte. Délacroix, der Maler der afrikanischen Löwenjagden und der tragischen Gluten des Orients, erbot
sich, den Saal Charons und der verzweifelnden Schatten in aller Eile auszumalen. Clésinger, der mit Fontana, dem unermüdlichen Haussklaven Chopins, um
die Wette sich um die Dekoration bemühte, nahm
zwei große Säle für eine Rokokofantasie im Stile
Louis #sc[XV] in Beschlag.

Der Kritiker d'Ortigue, ein Freund Liszts, machte
sich gleichfalls sehr wichtig, zog alte Kupferstiche
hervor und kritisierte. Mit seinem Entenschnabel und
den abstehenden Ohren glich er selbst einem fabelhaften Vogel der Unterwelt, der um die Schatten im Nachen Charons herumstrich. Der halbverhungerte Dichter Borel, der oft unter den Brückenbogen übernachtete, aber nur von babylonischen Prunkgemächern,
chinesischen Opiumhöllen und den Hexentänzen mittelalterlicher Teufelbündler träumte, deren schauerliche, mystische Pracht und stolze, unerbittliche Verdammnis ihn über das Elend seines Pariser Bettlerlebens hinwegtäuschen sollte, hatte jetzt gute Tage:
als Zeremonienmeister sollte er die Gäste empfangen.
Dank der Freigebigkeit Flavios konnte er bereits jetzt
in blaugrünem Frack, braunseidener Weste, ebensolchen Beinkleidern und einem Onyxknopf im Batisthemd in den Festsälen sich wichtig machen.

Es war am Vorabend des Festes.

Flavio erschrak, als der Diener Chopins ihm ein
Briefchen überbrachte: Chopins höfliche Absage, da
er eine Konzertreise nach England unternehmen
wolle!

Alles war leer und tot für Flavio. Er lehnte sich
wie ein zu Tod Getroffener an den Flügel.

Mozarts Büste, die darauf stand, starrte ihn höhnisch
an wie ein häßlicher, hämischer Vogel mit Glotzaugen. Da lag eine Mazurka von Chopin, deren welke,
hochmütige Trauer er auf den Knien anbetete. Mit
einem irrsinnigen Gelächter zerriß er sie in kleine
Stücke und ließ sie auf den Teppich herabflattern,
wie Bilderstürmer in verruchten Jahrhunderten die
abgeschnittenen Köpfe von Märtyrern und toten Heiligen in den Schmutz warfen.

Der Kritiker Jules Janin ließ sich melden, gleich
nach ihm George Sand. Natürlich hatten beide wieder Anliegen. Der Mann mit dem Assyrerbart
feilschte um den Preis einer Lobeshymne in seiner
Zeitung, die Dichterin wollte noch eine Statue ihres
Schwiegersohnes Clésinger loswerden, die er schon
drei Jahre unverkäuflich in seiner Werkstatt stehen
hatte.

Auch Jules Janin kannte sie: es war Louis #sc[XIV]
mit seiner Allongeperücke und dem etwas albernen
Lächeln seines kleinen herzförmigen Munds, von bewundernden Genien umflattert.

"Eine kleine Anspielung auf unseren Gastgeber
und Mäzen," lockte die Dichterin. Janin, in seinem
Sessel fast sichelförmig zusammengekrümmt, sekundierte.

Flavio fing im Spiegel seine spöttische Geste auf,
die er zur Dichterin hinübersandte.

Er genehmigte alles und schob die beiden fast zur
Türe hinaus.

Dann schlich er ins Treibhaus hinüber. In der Ecke
versteckt, lagen dort große Mengen Pulvers und in
harmlosen Verpackungen von einem befreundeten
Chemiker hergestellte Explosivstoffe.

Flavio trug sie vorsichtig in den Keller seines Hauses hinüber. Dann eilte er – zum Seelenretter Urhan.
Er wollte seinen schrecklichen Entschluß unwiderruflich machen, wie der Selbstmörder, um sich den
feigen Rückzug ins Leben abzuschneiden, in Briefen
an ganz Fernstehende seine verzweifelte Absicht mitteilt.

Flavio traf ihn zu Hause: die schwärmerische Einfalt und überquellende Menschenliebe des Sonderlings hatte sich hier in dieses armselige Dachzimmer
verkrochen. Keinen Sous von den Riesensummen, die
Flavio ihm für seine Armen zur Verfügung gestellt,
hatte er für sich verwendet: davon legte der wurmstichige Stuhl Zeugnis ab, der jämmerliche Tisch,
dessen Füße wie mit der Axt zubehauen waren, der
Teller darauf mit den zerbrochenen Rändern und der
kümmerliche Schrank in der Ecke, den zwei untergeschobene Ziegelsteine vor dem Umfallen bewahren
mußten.

"Was haben Sie hier, Herr Urhan?" fragte Flavio erstaunt, auf den Tisch deutend, wo eine verworrene Bleistiftzeichnung lag.

"Das ist meine Seelenwaage! Rechts die Gewichte
des Guten, Schönen und Rettenden, links die Mühlsteine des Teufels und die Todsünden. Auch Ihre
Seelenwaage und die Chopins ist darunter. Eine Zeitlang habe ich an Ihnen beiden verzweifelt. Aber nun,
da Sie zu mir kommen, Herr Sikorski –"

"Nun, Herr Seelenretter, müssen Sie noch mehr
Gewichte in die linke Schale meiner Seelenwaage legen, ganze Zentnergewichte; denn morgen nacht
werde ich sterben und diesmal werden Sie mich nicht
mehr zurückhalten –"

"Herr Sikorski! Herr Sikorski!" schrie der arme
Seelenretter auf, aber Flavio eilte schon die Treppe
hinab ...

Der Abend des unheimlichen Festes war da.

Urhan, die arme Seele, war beim Toreingang versteckt, sah die Kutschen vorfahren und die seidenen
Schleppen sich die Marmortreppen hinaufschlängeln,
Einmal nur bekam er Flavio zu Gesicht: aber er verschwand schnell an der Kellertreppe, dabei zeigte
er ein zufriedenes, fast heiteres Gesicht.

"Vielleicht ist er gerettet! Das Fest bringt ihn auf
andere Gedanken!" jubelte es in Urhan.

Schon kam Flavio wieder vom Keller herauf.

Oben war George Sand die Königin des Festes. Sie
nahm Gautiers Glückwünsche zu ihrem zweideutigen
Roman "Lucrezia Floriani" entgegen, beteuerte, daß
er nichts enthielte, was Chopin kränken könnte,
selbst, wenn seine Nerven noch spinnenwebfeiner
wären. Sie wollte auch jetzt noch als Chopins mütterliche Freundin dastehen, vor der etwas skeptischen Mitwelt und besonders auch vor der Nachwelt, die ihr den Heiligenschein des Märtyrers verleihen würde für das, was sie mit den Launen, Empfindlichkeiten und phantastischen Klagen des polnischen Virtuosen erduldet hatte. Janin nickte ihr mit
einem Lächeln von abgründiger Bosheit zu.

"Wo ist Saint-Germain?" fragte er und ließ seinen
viereckigen assyrischen Bart im Saale herumkreisen.

"Man hätte doch leicht eine alte, kaduke Klappergestalt aufgetrieben, in ein Magiergewand gesteckt,
parfümiert und noch mit einem Ordensband und
einer Perücke versehen –"

Er schwieg als er Flavio kommen sah, aber dieser
hatte alles gehört.

Casimir kam und spielte ihm einen Zettel in die
Hand:

"Chopin ist eben abgereist. Nach England!"

Verstohlen flüsterte er ihm zu: "Brechen Sie das
Fest ab! Schützen Sie ein Unwohlsein vor! In der
Vorstadt Saint-Antoine hat eben der Barrikadenkampf begonnen. Die Lichter in den Häusern ringsum sind ausgelöscht –"

"Ich werde auch die Lichter hier auslöschen, nur
anders, als du denkst, Casimir – Geh' hinüber in
Chopins Wohnung!"

"Was soll ich dort?" stammelte Casimir. "Was soll
ich dort? Herr Chopin ist ja schon abgereist –"

Flavio stampfte mit dem Fuße.

"Geh' hinüber! Ich befehle es dir! Geh' sofort hinüber!"

Der Mann mit dem Assyrerbart war aufmerksam
geworden und schlich herzu. Aber schon fiel die
Maske über Flavios Gesicht. Janin rächte sich durch
lästerlich übertriebene Schmeichelei.

"Oh der armselige Westen!" rief er mit emphatischer Handbewegung. "Wenn ich an die babylonischen Riesentempel denke, die kaum auf vier Felsen Platz hatten! Bei Ihrem Feste freilich, lieber Herr
Sikorski, bekommt man wenigstens wieder einen
Schimmer von diesen ach! so längstvergangenen Zeiten mit ihren hängenden Gärten, Pyramiden und
Mausoleen –"

"Ach! und hier unten im Park treibt sich ja fast
ein Leviathan im Bassin herum," kreischte die Sand
mit unnachahmlichem Spott auf. "Oder ist es nur ein
melancholischer Schwan, der zu viele Kantilenen unseres polnischen Meisters gehört hat?"

Erschrocken sprang Flavio ans Fenster.

Wenn es Verschworene waren, die das Verschwinden
des Pulvers und der Explosivstoffe gemerkt hätten?

Aber niemand war an der Fontäne. Aus dem von
Wolken vermauerten Himmel und seiner Sternenherde senkten sich nur einige kranke Lichter; das
zischelnde Licht des Mondes kroch hervor und verschwand wieder.

"Ihr werdet bei euren Leviathanen und Riesentempeln eher sein, als ihr es ahnt! Pluto und Proserpina werden euch Säle bieten, die größer und babylonischer sind als die meinen – – – –"

Er stand im Keller, ein brennendes Kerzenlicht in
der Hand. Vor ihm lagen die schrecklichen, Tod und
Verderben speienden Pulvermassen. Wie in einem
fürchterlichen Taifun würden sie, ihrem engen Kerker entronnen, die Steinblöcke des Palastes in die
Luft schleudern, die Bäume entwurzeln, vielleicht die
ganze Straße in einen Trümmerhaufen verwandeln.
Auch das Haus Chopins, des Meisters.

Er wiederholte zweimal den Namen dieses einzigartigen, von ihm bewunderten und mit schmerzlicher
Wut gehaßten Meisters, des unnahbaren, stolzen Adlers, der, unbekümmert um Zusage und wartende
Gäste, majestätisch nach England entschwebte, der
jetzt schon auf dem Ärmelkanal schwamm und es
als ein Almosen betrachtete, an das Fest und den
Festgeber, die kleine Milbe, zu denken, mit der er
manchmal zusammen gewesen war. Aber wenn wirklich Chopin der große, triumphiernd entschwebende
Adler war, hatte dann dieser Spitzbauch Janin und
diese Dichterin mit dem Mulattenkopf das Recht,
über ihn zu spotten?

Er näherte die Flamme dem totbringenden Pulverhaufen. Blitzartig, in einer unabsehbaren, aber klar
vorüberrollenden Bilderreihe sah er noch einmal das
spukhafte Panorama seiner Vergangenheit vorüberziehen, die, obwohl von einigen Sonnenstrahlen
durchzuckt, tragisch, unselig und vergiftet gewesen
war.

Diesmal würde er nicht den Anblick einer häßlichen, verquollenen Wasserleiche bieten. In Atome
aufgelöst, wie die Asche eines Verbrannten, würde
er sich in die Lüfte verstreuen! – –

Da – was war dies? Dort oben spielte jemand
Chopin. Seinen Trauermarsch!

Diese Töne, übermächtig und gnadenlos in Verzweiflung, Schönheit des Untergangs und Besessenheit, diese überirdischen Töne, die dem Meister von
den Lippen des Allerhöchsten oder des Beherrschers
aller Schatten in sein williges Ohr geflüstert worden
waren ...

"Oh, Meister Chopin!" stammelte Flavio, auf die
Knie sinkend, "ich bewundere dich, ich hasse deinen
Hochmut und dennoch knie ich vor dir und deinen
berückenden Weisen. Würde man mir das Herz aus
dem Leibe nehmen, es würde dein Name Chopin darauf stehen und einige Takte deiner schmerzlich berauschenden Tonschöpfungen!"

Die Kerze war längst verlöscht; der droben spielte
jetzt einen Walzer Chopins. Vielleicht tanzten sie dazu und ahnten nicht die Todesgefahr, die über ihren
törichten Häuptern geschwebt hatte, so wenig wie
das Macabre und Tief-Tragische, das sich selbst auf
die übermütigen Läufe dieses Walzers herabsenkte.

Jetzt verstummte der Walzer. Aber von der Straße
her kam ein wirres Rauschen und verscheuchte die
Finsternis, die bisher die vornehmen Häuser dieser
stillen, hochmütigen Straße begraben hatte. Über
zerrüttete und verzweifelte Glockentöne fielen plötzlich wütende Schreie, Flintenschüsse und das drohende
Blöken der Sturmglocken her. Das zischelnde Mondlicht erlosch am teuflisch drohenden Himmel.

Flavio eilte an das Gartentor. Schon wälzte sich
das drohende Gebrüll der Menge ihm entgegen. Mit Stöcken, Flinten, Piken und Eisenstangen Bewaffnete
füllten die ganze Straße.

Ein wie ein Zyklope der Zerstörung fantastisch
ausgerüstete Mann deutete auf Chopins Wohnung.

"Dort oben," brüllte er, "wohnt dieser Verzärtelte,
dieser Schwelger, der euch verachtet und höchstens
einmal mit spitzem Finger euch Almosen zuwirft!
– Wollen wir ihm nicht einen Besuch abstatten?"

#quote[Nein, Professor der Magiologie! Halbgötter tötet
man nicht. Ich biete meinen Palast dafür an. Ich
lade alle ein, die hier sind!

Ich biete Ihnen mein Haus zur Plünderung. Aber
Chopins Wohnung muß unversehrt bleiben wie ein
Heiligtum. Überdies ist er schon auf dem Wege nach
London, um dort Konzerte zu geben –]

Schon stürzten die Ersten zum Treppenaufgang.
Casimir schleppte Fässer Wein und die Reste der
Mahlzeit herbei. Die erschrockenen Gäste, Clésinger, Janin und George Sand voran, flüchteten.
Jetzt wurden sogar Hochrufe auf Chopin laut. Der
Professor der Magiologie schloß schnell und verstohlen mit Casimir einen Geheimvertrag ab: der Pöbel
würde nicht in die Säle heraufkommen. Dafür wollte
der Magiologe sorgen. Als Gegenleistung allerdings
mußte ihm Casimir eine Riesensumme und kostbarstes Inventar zusichern.

In dieser Nacht noch fand Flavio seinen Tod.
Einige wollten ihn an der Seine gesehen haben. Andere versicherten, er sei bei den Barrikadenkämpfen
in der Vorstadt Saint-Antoine von einer Kugel getroffen worden. Er war einer jener Unglücklichen, die
als Fragezeichen geboren werden und auf deren Grab
der Tod einen Gedankenstrich setzt – –

Etwa drei Wochen später, als der Bürgerkönig aus
den Tuilerien verjagt war, traf aus Schottland die
Nachricht ein, daß Chopin nach seinem Konzert in
Edinburg einen Blutsturz erlitten habe und in den
Armen seiner fanatischen Anbeterin Miß Stirling verschieden sei.

Aber noch einmal mußte das knöcherne Gespenst
von ihm ablassen. Chopin kehrte im Januar 1849
wieder nach Paris zurück. Aber das Siegel des Todes
war auf seine Stirne gedrückt. Die tränenerstickten
Huldigungen seiner Schüler und Schülerinnen verscheuchte das gräßliche Gespenst von seinem Krankenlager, doch immer wieder stellte es sich zu Häupten des Bettes auf.

Aus den Veilchenbuketts, die sie in seinem Zimmer verstreuten, kam leiser Modergeruch; der Finger
einer Totenhand zuckte über die unschuldigen, trauernden Veilchen, und verschwand wieder.

An schönen, sonnigen Tagen konnte der teure
Kranke wieder vom Bett aufstehen und an den Balkon gehen; aber die Ärzte wußten, daß dieses Stadium der Lungenschwindsucht nicht mehr heilbar
war.

Es war unheimlich und erschreckend, wie ihm die
Umwelt immer mehr entschwand. Immer unerträglicher quälte ihn der Husten und das, was er seit
einigen Jahren in seinen Briefen die "Langeweile"
nannte.

Der verhängnisvolle Oktober des Jahres 1849
nahte, das schon die nächsten Freunde Chopins und
die Genossen seines Ruhms dahingerafft hatte:

Den Pianisten Kalkbrenner, die Sängerin zweier
Welten Angelica Catalani und den Dichter Julius Slowacki, den unheimlichen Doppelgänger und Seelenverwandten Chopins, und jenseits des Ozeans den
phantastischen, mondsüchtigen Schilderer aller Absonderlichkeiten und Todessehnsüchte Allan Poe.

Schon kam Chopins Schwester aus Warschau ans
Krankenbett. Aus Nizza flatterte die kleine, verwehte
Gestalt der Gräfin Delphine Potocka herbei. Der
Maler Delacroix, von allen Freunden Chopins der
Getreuesten einer, zeigte ihm seine neuesten Skizzen
von türkischen Despoten und tunesischen Räuberhorden, als könnten diese handfesten Abenteurer das
schreckliche Knochengespenst des Todes vertreiben.
Giacomo Meyerbeer erkundigte sich öfter, ein süßliches Lächeln auf seinen aschfarbigen verkniffenen
Zügen.

Fürst Zartoryski kam fast täglich. Unten am Hauseingang harrte der Seelenretter Urhan.

Mit dem Fortschreiten der Krankheit wagte auch er
Stufe für Stufe sich näher heran. Er atmete auf, als
er den Abbé Jalowicki, Chopins Jugendfreund, zu
dem Kranken kommen sah. Er brachte es nicht über
sich, diesen seeleneifrigen Priester zu fragen, noch
weniger ihm seine Theorie der Seelenwaage vorzutragen; seine ängstlichen Augen forschten nur in den
Mienen des Abbés, wenn er das Krankenzimmer verließ.

Am 12. Oktober atmete Urhan auf. Der Abbé kam
auf ihn zu, tiefe Rührung in seinem totblassen Gesicht. Zum erstenmal redete er den Seelenretter an:

"Beruhigen Sie sich, Herr Urhan! Der Meister hat
zu meiner unsagbaren Freude wohlvorbereitet und
mit tiefer Andacht die heiligen Sterbesakramente
empfangen."

Nun hatte Urhan sicher seine tausendste Seele gerettet. Tief atmete er auf, doch wieder überkam ihn
die Zweifelsucht.

"Der Hochmut? Die erste und verhängnisvollste
Todsünde und der Zentnerstein auf der Seelenwaage?" rief er dem davoneilenden Priester nach.

Der sah nicht mehr um.

Am 13. Oktober 1849 gegen Abend fragte Clésinger im Vorzimmer schon, wann er die Totenmaske
abnehmen könnte.

Aber um Mitternacht atmete Chopin immer noch.
Der Abbé wich nicht vom Krankenlager. Sie alle
knieten, schluchzten und murmelten Gebete.

Wie lange noch sollte der grauenhafte Todeskampf
des Erstickenden währen?

Gegen ein Uhr nach Mitternacht kam Jules Janin,
vielleicht von einer Theaterpremiere, mit würdiger
Trauermiene.

Miß Stirling, ganz grau – verfallen und mit dem
Schlaf kämpfend – denn es war schon ihre dritte
Nachtwache – saß vor der Türe des Krankenzimmers, mit ihrer langen, mageren Gestalt einem riesigen Trauervogel gleichend.

Sie zitterte vor einer Taktlosigkeit Janins und
atmete auf, als er sich mit Pleyel, dem Klavierfabrikanten und Konzertunternehmer, in das Klavierzimmer zurückzog.

Zum geöffneten Fenster hinein schwankten die
bizarren Schatten der Baumäste und breiteten einen
Schleier von unendlicher, öder Trauer aus. Der bläuliche Windhauch spielte mit den Fenstervorhängen.

In das Weinen und Schluchzen der Knieenden und
Betenden stach das qualvolle Röcheln des Sterbenden ...

Floß das Sternenlicht jetzt leiser über die Nacht
hin, die süß zu tönen begann von dem Mondhorn?
Bereiteten sich die bleichen Fluten des Mondlichts vor,
die erlöst sich losringende Seele auf ihrer Wanderung
zu dem Sternbild ihres unsterblichen Ruhms zu begleiten?

Noch immer schluchzten sie und murmelten Gebete. Aber größere Sterne leuchteten jetzt darüber;
heiligere Gewißheit nickte ihnen zu.

Der Alp fiel von dem gequälten Körper; die Angst
der schrecklichen Verlassenheit im Tod zerstob.

Gab es nicht eine Zeit, wo man in Paris davon
sprach, daß Chopin zu den Schatten des Hades hinabgestiegen sein müsse, zu fern und tief geliebten,
längst verstorbenen Seelen? Wo die Göttin Proserpina ihm todestrunkene Weisen ins Ohr flüsterte, wo
nie gehörte Melodien wie kostbare Perlen bleicher
Trauer aus den Wellen des Acherons herauf‌tönten?

Wo die zahllos umherschwirrenden Schatten traurig die Becher wegstellten, weil sie welke Asche
auf ihrem Grund sahen? –

Die Achse des großen Wagens stand bereits morgenwärts. Die Seele Chopins flog schon den Sternen
zu.

"Er ist tot!" murmelte die erlöste Stimme des
Abbés. Seine zitternden Hände formten mit großer
inniger Gebärde das Zeichen des heiligen Kreuzes.

Noch schwebte traumverwirrtes Dunkel im Zimmer und aus diesem Dunkel klangen geträumte Töne,
wehte ein leiser Hauch. Ein Schatten, jetzt verewigt
und unsterblich verschwand.

Zum letzten Male sah man das marmorfaltige
Lächeln um seinen Mund und das süße Traummal,
das auf seiner Stirne brannte. Orchideen, große,
weiße Tuberosen sproßten unter dem Hauche seines
Schattens und verwelkten.

Wohin schwebte der schwankende Schatten? Zu
den Seelen des Hades an den Rand des Flusses Acheron, zu Gräbern, auf die sie mit zitternden Fingern
das verzweifelte Wort: Nichts! schrieben?

Oder schwebte er zu seligen Gefilden, wo der Lärm
menschlicher Wirren und Tragödien kein Echo mehr
fand, wo der Tod tot war und die Schauer des
Menschlichen unter der magischen Beschwörung
seiner Melodien verwelkten?

Fast wußten es die Schluchzenden und Betenden
im Sterbezimmer.

Denn siegreich war die Stirne des Entschwebenden
gewesen, und sein Haupt stolz erhoben, als lauschte
er seinen eigenen Melodien nach, die triumphierender
und ewiger waren als alle lärmenden Machthaber
und Imperatoren, wahrer als alle Philosophien, weil
sie an die tiefsten, rätselvollsten und schauerlichsten
Pforten des ewig Verschlossenen und ihre hoffnungslosen Eisenstäben pochten: diesen Melodien, die
ganz unvergänglich waren, weil sie erklingen mußten, so lange Tränen der Melancholie, der Schwärmerei und der Verzweiflung aus Menschenaugen fließen, weil sie dauern mußten, bis der müde Erdstern
zu den anderen sterbenden Welten in den Strom der
Unendlichkeit verfließt – –

Die Gräfin Potocka, Miß Stirling und Fontana, der
Getreue, Hilfsbeflissene, neigten sich über das Totenbett und streuten Veilchen auf die Decke –

#heading("Epilog", numbering: none)

Fast neunzig Jahre vergingen, seit Chopin in Paris
unter tränenerstickten Huldigungen starb.

Sein Ruhm, damals schon ein europäischer, hat seitdem den ganzen Erdkreis überschattet und willig
beugen ihm die Allergrößten unter den Großen ihre
Häupter. Gleich einem immerwährenden Opferfeuer
flackern seine Melodien über den Erdball hin und
obwohl seine Seele uns immer rätselvoller und undurchdringlicher wird, ist die Nachwelt ihm hingegebener wie je, weil viele seiner Weisen aus Regionen kommen, zu denen nie ein Musiker vordrang,
weil sie aus dem Reiche Charons und der Schatten
des Hades erklingen, aus dem Inferno der unter dem
Saturn Geborenen, der am Leben Zerbrochenen und
Verzweifelten, denen er aus kostbaren Schalen das
Schmerzensgut seiner Eingebungen darbietet.

Zu ihnen gehört auch meine Freundin Leonie v. B.,
die den Lethetrank seiner Weisen schlürfte und, seinen magischen Namen auf den Lippen, ins Schattenreich hinabsteigen mußte. Sie weihte dem Meister
einen fast religiösen Kult. Wie Mönche im Mittelalter
zu dem Gekreuzigten in schwärmerischen Visionen
aufsahen, so kniete sie vor Chopin. Sie pilgerte zu
dem kleinen Häuschen bei Warschau, wo seine Wiege
stand. Sie besuchte die Insel Mallorca, träumte unter
den hohen, blaugrünen Zypressen des Klostergartens,
sah die verfallene, nach Weihrauch und Moder duftende Zelle, wo Chopin fast ein Jahr weilte, von starren, schweigenden Totenbildern umgeben.

Vielleicht feierte sie schon oft ein Allerseelenfest
nach polnischem Brauch, um den abgöttisch verehrten Schatten heraufzubeschwören.

Vor einem Jahr, in Tirol ereilte sie das tragische
Verhängnis. In einem welteinsamen Dörfchen, wo
auch ich die düstere, tiefgründige Melancholie dieser
schwarzbewaldeten Bergrücken mit den rätselhaft
murmelnden Wasserläufen an den schwarzgrünen
Wiesenhängen in mich aufnahm.

Ein aus dem Süden hierher verwehter Falter, dessen Flügel grau und purpurfarben wie Blut und Asche
funkelten, gaukelte um mich her: Hermes, der Sendbote, der die Seelen geleitet –

Ich kann es nicht sagen, warum ich ihm bis zum
nächsten Dorf folgte und warum ich dort im Gasthof die ruhelose Pilgerin Leonie traf. Gerade heute,
in dieser gar nicht kalendermäßigen Sommernacht,
wollte sie das Allerseelenfest Chopins feiern. Schon
hatte sie Wein besorgt, auch das Basilikumkraut
nicht vergessen.

Wir warteten, bis die zackigen Wolken dunkler
wurden. Die Leute vom Dorf glichen nur noch
großen, schwarzen Waldameisen. Langsam stieg der
blutrote Mond herauf, der sich von den Träumen
der Phantasten nährt. Dann war es Nacht. Aber sie
vermochte es kaum, die Blumen schwarz zu färben
und ihre Kelche zu verschließen.

"Ist es Chopin?" rief Leonie mit verzückter Geste.

Jemand über uns (ach! diese Zaubertöne kamen
nicht, wie meine dem Phantastischen hingegebene
Freundin glaubte und hoffte, aus der Wand oder aus
dem Reiche der Schatten herauf!) spielte ein Notturno von Chopin.

Ich habe die eminentesten Chopinspieler gehört:
den stolzen Paderewski, den sensiblen v. Pachmann,
Backhaus, Rachmaninoff und sie alle. Aber das waren
doch nur Seelenfragmente Chopins. Aber dieser Mann
da oben spielte den ganzen Chopin: den capriziösen,
schwermütigen, dämonischen, verzweifelnden, hochmütigen, weltverachtenden Chopin, seine blassen
Freuden und seine ohnmächtigen, hilflosen, wütenden und rachsüchtigen Tränen, die Idyllen der polnischen Dorfmusikanten und die Metaphysik des
Himmels und der Hölle und ihrer heillosen Gestirnkarte. Vulkane brachen auf, babylonische Riesenpaläste, tausendjährige mittelalterliche Dome wuchsen aus der Erde ...

Daß es mir nicht einfiel! Niemand anderer als
Raoul v. Koczalski war es, der spielte! Ein Freund
hatte mir tags zuvor gesagt, daß Koczalski mit
seinem Auto von Innsbruck her durch unser armes,
bescheidenes Gebirgsdörfchen kommen werde, um
nach Wien zum Konzert zu fahren.

"Sein Auto hat einen Schaden genommen!" bestätigte die Wirtin.

Das Spiel brach ab.

Als ich ins Zimmer zurückkam, wo die Allerseelennacht gefeiert worden war, kniete Leonie am
Boden.

Ich schlich mich fort.

Am nächsten Tag ward sie vermißt. Gegen Abend
fand ein Bauer unten in der trichterförmigen Einsenkung des nahen Wildbachs einen verstümmelten
Leichnam. Aber ein glückliches Lächeln war über
ihren Zügen. Sie hatte Chopin gehört! – –

Ich ließ ein Marterl für sie errichten. Als ich es
ein Jahr später wieder sah, war es schon halb verwittert in Wind und Regen ...
