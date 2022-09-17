# Hacklab Jyväskylä Logo

Introduce the construction of files.dot.

You are only supposed to use nodes with two peripheries or
at least nodes following them.

## Colors

Introduce the construction of colorize.m.

We are interested in hue--saturation--lightness
over hue--saturation--value space,
because it goes from black to saturated color to white
instead of going from black to saturated color.
The hue--saturation--lightness space is often quantized
from $0$ to $360$, $255$ or $100$,
which we would like to respect.
The prime factorizations of these bounds are
$2^3 \times 3^2 \times 5$, $3 \times 5 \times 17$ and $2^2 \times 5^2$
respectively.
If we want a reasonable subdivision
of the space with as few rounding errors as possible,
we need to choose a suitable collection of common factors
from the factorizations.
As it turns out,
the only possible choice with no errors at all is $5$.
This gives the partition
$p \equiv [0; 51; 102; 153; 204; 255]$,
which is exact.

Sometimes we are likely to need finer control,
especially on the darker end of the green spectrum.
If we give up the constraint on $100$
(or replace it with $105$, which factorizes into $3 \times 5 \times 7$),
we get one more option, which is $15$.
This gives us the partition
$q \equiv
[0; 17; 34; 51; 68; 85; 102; 119; 136; 153; 170; 187; 204; 221; 238; 255]$.
Subtracting the previous partition from this one gives
$r \equiv [17; 34; 68; 85; 119; 136; 170; 187; 221; 238]$.

Without further ado,
let us choose our theme colors as
$\mathrm{HSL} (q_{4 / 15}, p_{2 / 5},
[p_{0 / 5}, q_{(2 + 0) / 15}; p_{3 / 5}; q_{(15 - 2) / 15}])$ or
$\mathrm{HSL} (q_{4 / 15}, q_{6 / 15},
[q_{0 / 15}, q_{(2 + 0) / 15}; p_{9 / 15}; q_{(15 - 2) / 15}])$ or,
in expanded form, $\mathrm{HSL} (68, 102, [0; 34; 153; 221])$.
The hexadecimal color codes for these come out
as `#000000`, `#1f3014`, `#91c270` and `#daebcf` respectively.
We can also compute the remaining spectrum as follows.

Blaze it with GNU Octave 4.2.2.
Witness it with Inkscape 0.92.3 and GraphViz 2.40.1.

With `theme (5, 3)`, out comes the following coarse palette.
With `theme (15, 6)`, out comes the following fine palette.

We export these palettes into PPM files and,
for the sake of convenience,
use them as indexes for PNG files.

## Idea

Muutama huomio logosta pitää tuoda esille, jos ne eivät vielä selvinneet ihmisille.
Asettelun ja värityksen ajatus on muodostaa Conwayn game of lifen glider, koska se on jonkinlainen makerspacejen symboli (hyvää suomenkieltä).
Heksaluku taas viitaa yhdistyksen perustamisvuoteen sekä matalan tason ohjelmointiin.
Luku on alleviivattu, jotta sen lukemissuunta on mahdollista määrittää, mutta alleviivaus ei jatku koko matkaa, koska muutoin se rikkoisi soluautomaatin pikselit.
Fontit on piirretty elektoriikassa paljon käytettyjen kymmenen ja seitsemän segmentin näytöille, jotka loistavat hieman taustalta.

## Raster Graphics

Introduce the construction of composite.png.

Isompi fontti on ankkuroitu 27x21 pikselin ruudukkoon ja pienempi sen puolitukseen.
Värit on valittu hsv-avaruuden tasajaosta vihreällä sävyllä.
Ilmeisesti värejä pitää vielä säätää, mutta se ei ole ihan helppoa, koska liian kirkkaat taustakoristeet tekevät tekstistä vaikeaselkoista ja liian tummat taustakoristeet häviävät taustaan kuin varjot ikään.
Reunus on toki turha, mutta lisäsin sen logoon aluksi sen takia, jotta logon voisi johdonmukaisemmin upottaa mustaan tai valkoiseen taustaan.

WCAG AAA?
WhoCanUse: Kontrastisuhteet ovat
noissa kolmessa versiossa 6.81:1, 10.15:1 ja 21:1,
joten sen puolesta ei ole ongelmaa.

## Vector Graphics

Introduce the construction of logo.svg.

We write the SVG files by hand,
because Inkscape does not allow exact arithmetic,
controlling node order, etc,
but we still use some Inkscape features to make life easier.

Aseta logo Texasin päälle.
Pitää olla tarkka, jotta ei tule selkkausta.

Smoothing is done by first offsetting by -2, then by +2,
and finally by pruning the remaining holes by hand.
Holes are unaffected by smoothing.

## Vector Animations

Introduce the construction of animate.m.

Further animations are also possible, such as this in a path node.

```
<animate attributeName="opacity" values="0;1" dur="0.2s" calcMode="discrete" />

https://cloudfour.com/thinks/rasterizing-svg-animations/

document.getElementById('svg').pauseAnimations();
document.getElementById('svg').setCurrentTime(0.1);
document.getElementById('svg').setCurrentTime(0.2);
document.getElementById('svg').setCurrentTime(0.3);

var t = 0.0; function f() {document.getElementById('svg').pauseAnimations(); document.getElementById('svg').setCurrentTime(t); t += 0.01; if (t <= 1.0) window.setTimeout(f, 1000);} f();
```

Oh, yes.
The integrals!

\newcommand \full{\mathrm d}

Assume $\Omega > 0$ pointwise.
Time-to-on for one single component is distributed according to
$p : \Omega \to [0, \infty[$ constrained by $\int_\Omega p = 1$.
For an arbitrary component with a characteristic time-to-on $T$
the total power consumption from start to time $t$ is
$$W (T, t) = \int_0^t \full t P \times \theta (t - T)
= \int_0^t \full t \begin{cases}
  0, & t < T \\
  P, & t \ge T
\end{cases}$$
where $P$ is a constant power demand.
Expected power use until $t$ is thus
$$M (t) = \int_\Omega \full T T \times W (T)
= P \times \int_\Omega \full T T \times \int_0^t \full t \theta (t - T)
= P \times \int_a^b \full T T \times (t - T) \times \theta (t - T)
= P \times \int_{t - b}^{t - a} \full x x \times (t - x) \times \theta (x)
= \frac P 6 \times \begin{cases}
  0, & t < a \\
  2 \times a^3 - 3 \times a^2 \times t + t^3, & a < t < b \\
  2 \times a^3 - 2 \times b^3 + 3 \times b^2 \times t - 3 \times a^2 \times t, & b < t
\end{cases}
= \frac P 6 \times \begin{cases}
  0, & t < a \\
  (t^2 - 3 \times a^2) \times t + 2 \times a^3, & a < t < b \\
  3 \times (b^2 - a^2) \times t - 2 \times (b^3 - a^3), & b < t
\end{cases}$$
We do not actually need this.

The momentary power consumption for one component at time $t$ is
$$w (T, t) = P \times \theta (t - T)
= \begin{cases}
  0, & t < T \\
  P, & t \ge T
\end{cases}$$
where $P$ is a constant power demand.
The expected power use at $t$ is thus
$$m (t) = \int_\Omega \full T T \times w (T)
= P \times \int_\Omega \full T T \times \theta (t - T)
= P \times \int_{t - b}^{t - a} \full x (t - x) \times \theta (x)
= \frac P 2 \times \theta (t - a) \times (t^2 - a^2 + (b - t) \times (b + t) \times \theta (t - b))
= \frac P 2 \times \begin{cases}
  0, & \phantom{0 < {}} t < a \\
  t^2 - a^2, & a < t < b \\
  b^2 - a^2, & b < t \phantom{{} < \infty}
\end{cases}$$
