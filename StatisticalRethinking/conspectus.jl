### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 5c7e0508-f534-11ec-06b1-3bb92776da0d
using PlutoUI

# ╔═╡ 34febd97-cc9e-483f-8362-462b8908590a
TableOfContents(depth=4)

# ╔═╡ cc2d42ed-1258-4c4c-adc9-f053a1eb769d
md"""
# Statistical Rethinking (conspectus)
#### Richard McElreath
"""

# ╔═╡ ca9d3d48-2f25-49d3-96b8-7616a5818c16
md"""
## 1 The Golem of Prague
"""

# ╔═╡ 2764cfd6-2660-406a-98a2-3d52314bb4b3
md"""
---

A golem (goh-lem) is a clay robot from Jewish folklore, constructed from dust and fire and water. It is brought to life by inscribing emet, Hebrew for “truth,” on its brow. Animated by truth, but lacking free will, a golem always does exactly what it is told. This is lucky, because the golem is incredibly powerful, able to withstand and accomplish more than its creators could. However, its obedience also brings danger, as careless instructions or unexpected events can turn a golem against its makers. Its abundance of power is matched by its lack of wisdom.

---

Голем (гох-лем) — це глиняний робот з єврейського фольклору, сконструйований з пилу, вогню та води. Він оживає, коли на його лобі написано emet, що на івриті означає «істина». Оживлений істиною, але позбавлений свободи волі, голем завжди робить саме те, що йому говорять. Це добре, адже голем неймовірно могутній, здатний витримати і досягти більшого, ніж могли його творці. Однак його послух також приносить небезпеку, оскільки необережні вказівки або несподівані події можуть налаштувати голема проти його творців. Його надмір сили обертається браком мудрості.

---

"""

# ╔═╡ 8dcd9e3f-e1ac-4a90-8d44-5aa3c5428cff
md"""
### 1.1. Statistical golems
"""

# ╔═╡ 5e04d98b-1179-4798-9426-701bce87d8c1
md"""
---

Scientists also make golems. Our golems rarely have physical form, but they too are often made of clay, living in silicon as computer code. These golems are scientific models.

But these golems have real effects on the world, through the predictions they make and the intuitions they challenge or inspire. A concern with “truth” enlivens these models, but just like a golem or a modern robot, scientific models are neither true nor false, neither prophets nor charlatans. Rather they are constructs engineered for some purpose. These constructs are incredibly powerful, dutifully conducting their programmed calculations.

---

Науковці також виготовляють големів. Такі големи рідко мають фізичну форму, але вони також часто зроблені з глини, живуть у кремнії як комп’ютерний код. Ці големи є науковими моделями.

Але ці големи мають реальний вплив на світ через передбачення, які вони роблять, і інтуїцію, яку вони викликають або надихають. Зацікавлення «істиною» оживляє ці моделі, але так само, як голем чи сучасний робот, наукові моделі не є ні істинними, ні помилковими, ні пророками, ні шарлатанами. Скоріше це конструкції, створені для певної мети. Ці конструкції неймовірно потужні, вони сумлінно проводять запрограмовані розрахунки.

---

"""

# ╔═╡ d91855d6-e3e8-4cf5-89a4-64574bce3834
md"""
---

Sometimes their unyielding logic reveals implications previously hidden to their designers. These implications can be priceless discoveries. Or they may produce silly and dangerous behavior. Rather than idealized angels of reason, scientific models are powerful clayrobots without intent of their own, bumbling along according to the myopic instructions they embody.

---

Іноді їхня непохитна логіка виявляє наслідки, які раніше приховували їх дизайнери. Ці наслідки можуть бути безцінними відкриттями. Або вони можуть викликати нерозумну і небезпечну поведінку. Замість ідеалізованих ангелів розуму, наукові моделі є потужними глиняними роботами без власного наміру, що прямують відповідно до короткозорих інструкцій, які вони втілюють.

---
"""

# ╔═╡ 1ac054d9-1f95-48a4-8737-95c9817ca6e6
md"""

---

There are many kinds of statistical models. Whenever someone deploys even a simple statistical procedure, like a classical t-test, she is deploying a small golem that will obediently carry out an exact calculation, performing it the same way (nearly ) every time, without complaint. Nearly every branch of science relies upon the senses of statistical golems. In many cases, it is no longer possible to even measure phenomena of interest, without making use of a model. To measure the strength of natural selection or the speed of a neutrino or the number of species in the Amazon, we must use models. The golem is a prosthesis, doing the measuring for us, performing impressive calculations, finding patterns where none are obvious.

---

Існує багато видів статистичних моделей. Кожного разу, коли хтось розгортає навіть просту статистичну процедуру, як-от класичний t-тест, він розгортає маленького голема, який буде слухняно виконувати точні обчислення, виконуючи його однаково (майже) кожного разу, без нарікань. Майже кожна галузь науки спирається на відчуття статистичних големів. У багатьох випадках вже неможливо навіть виміряти явища, які цікавлять, не використовуючи модель. Щоб виміряти силу природного відбору чи швидкість нейтрино чи кількість видів в Амазонії, ми маємо використовувати моделі. Голем — це протез, який вимірює за нас, виконує вражаючі обчислення, знаходить закономірності там, де вони не є очевидними.

---

"""

# ╔═╡ cc76b4dd-f91c-4ab3-b29b-5efd29506d6e
md"""
---

However, there is no wisdom in the golem. It doesn’t discern when the context is inappropriate for its answers. It just knows its own procedure, nothing else. It just does as it’s told.

---

Проте в големі немає мудрості. Він не розпізнає, коли контекст не підходить для його відповідей. Він просто знає свою процедуру, нічого іншого. Він просто робить так, як сказано.

---

"""

# ╔═╡ 0fb4290a-bdce-45af-87a6-fef9cea0deae
md"""
---

Furthermore, no statistical tool does anything on its own to address the basic problem of inferring causes from evidence. Statistical golems do not understand cause and effect.

---

Більше того, жоден статистичний інструмент сам по собі не робить нічого для вирішення основної проблеми - формулювання причини на підставі доказів. Статистичні големи не розуміють причини і наслідки.

---

"""

# ╔═╡ 75882559-bf21-4174-8341-67234688a9fd
md"""

---

What researchers need is some unified theory of golem engineering, a set of principles for designing, building, and refining special-purpose statistical procedures. Every major branch of statistical philosophy possesses such a unified theory. But the theory is never taught in introductory and often not even in advanced courses. So there are benefits in rethinking statistical inference as a set of strategies, instead of a set of premade tools.

---

Дослідникам потрібна якась уніфікована теорія інженерії големів, набір принципів для проектування, побудови та вдосконалення статистичних процедур спеціального призначення. Кожна велика галузь статистичної філософії має таку єдину теорію. Але таку теорію ніколи не викладають на вступних і часто навіть на підвищених курсах. Таким чином, є потреба в переосмисленні статистичного висновку як набору стратегій, а не набору заздалегідь підготовлених інструментів.

---

"""

# ╔═╡ 036cb7c5-7a08-4b1c-a684-3011ee253852
md"""
### 1.2. Statistical rethinking
"""

# ╔═╡ 94f51500-2454-45aa-9fd9-35ab187893f7
md"""
---

In fact, deductive falsification is impossible in nearly every scientific context. In this section, I review two reasons for this impossibility.

(1) Hypotheses are not models. The relations among hypotheses and different kinds of models are complex. Many models correspond to the same hypothesis, and many hypotheses correspond to a single model. This makes strict falsification impossible.

(2) Measurement matters. Even when we think the data falsify a model, another observer will debate our methods and measures. They don’t trust the data. Sometimes they are right.

---

Насправді дедуктивна фальсифікація неможлива майже в кожному науковому контексті. У цьому розділі я розгляну дві причини такої неможливості.

(1) Гіпотези не є моделями. Зв'язки між гіпотезами та різними видами моделей складні. Багато моделей відповідають одній і тій же гіпотезі, а багато гіпотез відповідають одній моделі. Це унеможливлює сувору фальсифікацію.

(2) Питання вимірювання. Навіть коли ми думаємо, що дані фальсифікують модель, інший спостерігач буде обговорювати наші методи та способи вимірювання. Вони не довіряють даним. Іноді вони мають рацію.

---
"""

# ╔═╡ 0affa7d9-999e-4dbb-9a56-e7d62b2b9dab
md"""

---

The scientific method cannot be reduced to a statistical procedure, and so our statistical methods should not pretend.

---

Науковий метод не може бути зведений до статистичної процедури, і тому наші статистичні методи не повинні на це претендувати.

---

	Rethinking: Is NHST falsificationist? Null hypothesis significance testing, NHST, is often identified with the falsificationist, or Popperian, philosophy of science. However, usually NHST is used to falsify a null hypothesis, not the actual research hypothesis. So the falsification is being done to something other than the explanatory model. This seems the reverse from Karl Popper’s philosophy.

---

	Переосмислення: ПЗНГ фальсифікатор? Перевірка значущості нульової гіпотези, ПЗНГ, часто ототожнюється з фальсифікаторською, або попперівською, філософією науки. Однак зазвичай ПЗНГ використовується для фальсифікації нульової гіпотези, а не фактичної гіпотези дослідження. Отже, фальсифікація робиться на щось інше, ніж пояснювальна модель. Це виглядає протилежним філософії Карла Поппера.

---

"""

# ╔═╡ fd5d38f8-13ca-4098-ac6f-6bd5d39f0b59
md"""
#### 1.2.1. Hypotheses are not models.
"""

# ╔═╡ cf3e8069-1624-4d7a-85d2-3edd3d5fdbbf
md"""

---

(1) Any given statistical model (M) may correspond to more than one process model
(P).

(2) Any given hypothesis (H) may correspond to more than one process model (P).

(3) Any given statistical model (M) may correspond to more than one hypothesis (H).

---

(1) Будь-яка дана статистична модель (M) може відповідати більш ніж одній моделі процесу (P).

(2) Будь-яка задана гіпотеза (H) може відповідати більш ніж одній моделі процесу (P).

(3) Будь-яка дана статистична модель (M) може відповідати більш ніж одній гіпотезі (H).

---

"""

# ╔═╡ 484f6417-0575-4ff6-b8e5-804509e21804
md"""

---

	Rethinking: Entropy and model identification. One reason that statistical models routinely correspond to many different detailed process models is because they rely upon distributions like the normal, binomial, Poisson, and others. These distributions are members of a family, the exponential family. Nature loves the members of this family. Nature loves them because nature loves entropy, and all of the exponential family distributions are maximum entropy distributions. Taking the natural personification out of that explanation will wait until Chapter 10. The practical implication is that one can no more infer evolutionary process from a power law than one can infer developmental process from the fact that height is normally distributed. This fact should make us humble about what typical regression models—the meat of this book—can teach us about mechanistic process. On the other hand, the maximum entropy nature of these distributions means we can use them to do useful statistical work, even when we can’t identify the underlying process. Not only can we not identify it, but we don’t have to.

---

	Переосмислення: Ентропія та ідентифікація моделі. Однією з причин того, що статистичні моделі зазвичай відповідають багатьом різноманітним детальним моделям процесів, є те, що вони спираються на такі розподіли, як нормальний, біноміальний, Пуассоновський та інші. Ці розподіли є членами сім'ї, експоненційної сім'ї. Природа любить членів цієї родини. Природа любить їх, тому що природа любить ентропію, а всі експоненціальні розподіли сімейства є розподілами максимальної ентропії. Вилучення природної персоніфікації з цього пояснення зачекає до розділу 10. Практичний висновок полягає в тому, що не можна зробити висновок про еволюційний процес із степеневого закону так само, як можна зробити висновок про процес розвитку з того факту, що висота нормально розподілена. Цей факт повинен зробити нас скромними щодо того, що типові моделі регресії — суть цієї книги — можуть навчити нас механістичним процесам. З іншого боку, максимальна ентропійна природа цих розподілів означає, що ми можемо використовувати їх для виконання корисної статистичної роботи, навіть якщо ми не можемо визначити основний процес. Ми не тільки не можемо його ідентифікувати, але й не повинні.

---
"""

# ╔═╡ 4de8ed0c-a967-4b7a-912d-d4e2b33e6a60
md"""
#### 1.2.2. Measurement matters.
"""

# ╔═╡ 14b60e2b-24f8-461b-8024-9e5f75648179
md"""

---

A compelling scientific fable that employs modus tollens concerns the color of swans. Before discovering Australia, all swans that any European had ever seen had white feathers. This led to the belief that all swans are white. Let’s call this a formal hypothesis:

H0 : All swans are white.

When Europeans reached Australia, however, they encountered swans with black feathers. This evidence seemed to instantly prove H 0 to be false. Indeed, not all swans are white. Some are certainly black, according to all observers. The key insight here is that, before voyaging to Australia, no number of observations of white swans could prove H 0 to be true. However it required only one observation of a black swan to prove it false.

---

Переконлива наукова байка, яка використовує modus tollens, стосується кольору лебедів. До відкриття Австралії всі лебеді, яких бачив європеєць, мали біле пір’я. Це призвело до переконання, що всі лебеді білі. Назвемо це формальною гіпотезою:

H0 : Усі лебеді білі.

Однак коли європейці досягли Австралії, вони зустріли лебедів із чорним пір’ям. Ці докази, здавалося, миттєво довели, що H0 хибний. Дійсно, не всі лебеді білі. На думку всіх спостерігачів, деякі, звичайно, чорні. Ключове розуміння тут полягає в тому, що до подорожі до Австралії жодна кількість спостережень білих лебедів не могла довести, що H0 правдивий. Однак знадобилося лише одне спостереження чорного лебедя, щоб довести це хибність.

---
"""

# ╔═╡ b9be360c-c21d-42dc-9ad5-001256bad677
md"""
##### 1.2.2.1. Observation error.
"""

# ╔═╡ b165d1fb-d49a-42b0-b0bf-8994550a69e6
md"""

---

In 2005, a team of ornithologists from Cornell claimed to have evidence of an individual Ivory-billed Woodpecker (Campephilus principalis), a species thought extinct. The hypothesis implied here is:

H0 : The Ivory-billed Woodpecker is extinct.

It would only take one observation to falsify this hypothesis. However, many doubted the evidence. Despite extensive search efforts and a $50,000 cash reward for information leading to a live specimen, no evidence satisfying all parties has yet (by 2015) emerged. Even if good physical evidence does eventually arise, this episode should serve as a counterpoint to the swan story. Finding disconfirming cases is complicated by the difficulties of observation. Black swans are not always really black swans, and sometimes white swans are really black swans. There are mistaken confirmations (false positives) and mistaken disconfirmations (false negatives). Against this background of measurement difficulties, scientists who already believe that the Ivory-billed Woodpecker is extinct will always be suspicious of a claimed falsification. Those who believe it is still alive will tend to count the vaguest evidence as falsification.

---

У 2005 році команда орнітологів із Корнелла заявила, що має докази існування окремого дятла (Campephilus principalis), виду, який вважався вимерлим. Тут мається на увазі така гіпотеза:

H0 : Дятел слонової кістки вимер.

Щоб спростувати цю гіпотезу, знадобиться лише одне спостереження. Однак багато хто сумнівався в доказах. Незважаючи на значні пошукові зусилля та грошову винагороду в розмірі 50 000 доларів США за інформацію, що приведе до живого зразка, досі (до 2015 року) не з’явилося доказів, які б задовольнили всі сторони. Навіть якщо врешті-решт знайдуться вагомі речові докази, цей епізод має стати контрапунктом до історії про лебедів. Пошук непідтверджуючих випадків ускладнюється труднощами спостереження. Чорні лебеді не завжди насправді чорні лебеді, а іноді білі лебеді справді чорні лебеді. Існують помилкові підтвердження (помилково позитивні) і помилкові скасування (помилково негативні). На цьому фоні труднощів вимірювання вчені, які вже вважають, що дятел слоноводзьобий вимер, завжди з підозрою ставитимуться до заявленої фальсифікації. Ті, хто вірять, що воно все ще живе, будуть схильні вважати найрозмитіші докази фальсифікацією.

---
"""

# ╔═╡ 0c79694f-de1f-4a80-8329-2eb6988789c0
md"""
##### 1.2.2.2. Continuous hypotheses.
"""

# ╔═╡ 84b2de1a-2567-447e-865a-c9f1017e66dc
md"""

---

Another problem for the swan story is that most interesting scientific hypotheses are not of the kind “all swans are white” but rather of the kind:

H0 : 80% of swans are white.

Or maybe:

H0 : Black swans are rare.

Now what are we to conclude, after observing a black swan? The null hypothesis doesn’t say black swans do not exist, but rather that they have some frequency. The task here is not to disprove or prove a hypothesis of this kind, but rather to estimate and explain the distribution of swan coloration as accurately as we can. Even when there is no measurement error of any kind, this problem will prevent us from applying the modus tollens swan story to our science.

---

Інша проблема історії про лебедів полягає в тому, що більшість цікавих наукових гіпотез не типу «всі лебеді білі», а скоріше типу:

H0 : 80% лебедів білі.

Або можливо:

H0 : Чорні лебеді зустрічаються рідко.

Який висновок ми робимо після спостереження за чорним лебедем? Нульова гіпотеза не говорить про те, що чорних лебедів не існує, а про те, що вони мають певну частоту. Завдання тут полягає не в тому, щоб спростувати чи довести гіпотезу такого роду, а скоріше в тому, щоб якомога точніше оцінити та пояснити розподіл забарвлення лебедів. Навіть якщо немає будь-якої похибки вимірювання, ця проблема не дозволить нам застосувати історію про лебедя modus tollens до нашої науки.

---
"""

# ╔═╡ 817c6567-de17-49e7-bf44-6a0c4d7e3a05
md"""
#### 1.2.3. Falsification is consensual.
"""

# ╔═╡ a3a7eba6-45b7-4495-8206-a2a183574968
md"""
---

The scientific community does come to regard some hypotheses as false. The caloric theory of heat and the geocentric model of the universe are no longer taught in science courses, unless it’s to teach how they were falsified. And evidence often—but not always—has something to do with such falsification.

But falsification is always consensual, not logical. In light of the real problems of measurement error and the continuous nature of natural phenomena, scientific communities argue towards consensus about the meaning of evidence. These arguments can be messy. After the fact, some textbooks misrepresent the history so it appears like logical falsification. Such historical revisionism may hurt everyone. It may hurt scientists, by rendering it impossible for their own work to live up to the legends that precede them. It may make science an easy target, by promoting an easily attacked model of scientific epistemology. And it may hurt the public, by exaggerating the definitiveness of scientific knowledge.

---

Наукове співтовариство починає вважати деякі гіпотези помилковими. Теорія тепла та геоцентрична модель Всесвіту більше не викладаються в наукових курсах, якщо тільки не для того, щоб навчити, як вони були сфальсифіковані. І докази часто — але не завжди — мають якесь відношення до такої фальсифікації.

Але фальсифікація завжди консенсусна, а не логічна. У світлі реальних проблем похибки вимірювання та безперервної природи природних явищ наукові спільноти сперечаються щодо консенсусу та щодо значення доказів. Ці аргументи можуть бути заплутаними. Фактично, деякі підручники спотворюють історію, тому це виглядає як логічна фальсифікація. Такий історичний ревізіонізм може зашкодити кожному. Це може завдати шкоди вченим, унеможлививши відповідність їхніх власних робіт легендам, які їм передували. Це може зробити науку легкою мішенню, просуваючи легко атакувану модель наукової епістемології. І це може зашкодити громадськості, перебільшуючи остаточність наукових знань.

---
"""

# ╔═╡ fe680d45-baa2-43e3-a3f6-02c00aaa898a
md"""
### 1.3. Tools for golem engineering
"""

# ╔═╡ 8ff6f93f-1cbe-47bb-b7c6-69c37d7fcf22
md"""

---

In this book I’ve chosen to focus on tools help with each purpose. These tools are:

(1) Bayesian data analysis

(2) Model comparison

(3) Multilevel models

(4) Graphical causal models

---

У цій книзі я вирішив зосередитися на інструментах, які допомагають в багатьох випадках. Ці інструменти:

(1) Байєсівський аналіз даних

(2) Порівняння моделей

(3) Багаторівневі моделі

(4) Графічні причинно-наслідкові моделі

---

"""

# ╔═╡ 37fd060e-8502-488b-985b-da22e04476d2
md"""
#### 1.3.1. Bayesian data analysis.
"""

# ╔═╡ 535a91f9-4adb-48e4-8feb-738292ab4e6e
md"""
---

Bayesian data analysis takes a question in the form of a model and uses logic to produce an answer in the form of probability distributions.

In modest terms, Bayesian data analysis is no more than counting the numbers of ways the data could happen, according to our assumptions. Things that can happen more ways are more plausible. Probability theory is relevant because probability is just a calculus for counting. This allows us to use probability theory as a general way to represent plausibility, whether in reference to countable events in the world or rather theoretical constructs likeparameters.

	Rethinking: Probability is not unitary. It will make some readers uncomfortable to suggest that there is more than one way to define “probability.” Aren’t mathematical concepts uniquely correct? They are not. Once you adopt some set of premises, or axioms, everything does follow logically in mathematical systems. But the axioms are open to debate and interpretation. So not only is there “Bayesian” and “frequentist” probability, but there are different versions of Bayesian probability even, relying upon different arguments to justify the approach. In more advanced Bayesian texts, you’ll come across names like Bruno de Finetti, Richard T. Cox, and Leonard “Jimmie” Savage. Each of these figures is associated with a somewhat different conception of Bayesian probability. There are others. This book mainly follows the “logical” Cox (or Laplace-Jeffreys-Cox-Jaynes) interpretation. This interpretation is presented beginning in the next chapter, but unfolds fully only in Chapter 10.

	How can different interpretations of probability theory thrive? By themselves, mathematical entities don’t necessarily “mean” anything, in the sense of real world implication. What does it mean to take the square root of a negative number? What does mean to take a limit as something approaches infinity? These are essential and routine concepts, but their meanings depend upon context and analyst, upon beliefs about how well abstraction represents reality. Mathematics doesn’t access the real world directly. So answering such questions remains a contentious and entertaining project, in all branches of applied mathematics. So while everyone subscribes to the same axioms of probability, not everyone agrees in all contexts about how to interpret probability.

---

Байєсівський аналіз даних бере запитання у формі моделі та використовує логіку для отримання відповіді у формі розподілу ймовірностей.

Скромно кажучи, байєсівський аналіз даних — це не більше ніж підрахунок кількості способів, якими дані можуть статися згідно з нашими припущеннями. Речі, які можуть статися більшими способами, більш правдоподібні. Теорія ймовірностей актуальна, оскільки ймовірність — це лише обчислення для підрахунку. Це дозволяє нам використовувати теорію ймовірностей як загальний спосіб представлення правдоподібності, чи то стосовно подій у світі, які підлягають обчисленню, чи скоріше теоретичних конструкцій, таких як параметри.

	Переосмислення: ймовірність не є єдиною. Деяким читачам буде незручно припустити, що існує більше ніж один спосіб визначення «ймовірності». Хіба математичні концепції не є однозначно правильними? Ні. Як тільки ви приймаєте певний набір передумов або аксіом, усе логічно випливає в математичних системах. Але аксіоми відкриті для дискусій і тлумачень. Таким чином, існує не тільки «байєсівська» та «частотна» ймовірність, але навіть існують різні версії байєсівської ймовірності, які спираються на різні аргументи для обґрунтування підходу. У більш просунутих байєсівських текстах ви зустрінете такі імена, як Бруно де Фінетті, Річард Т. Кокс і Леонард «Джиммі» Севідж. Кожен з цих підходів пов'язаний з дещо іншою концепцією байєсівської ймовірності. Є й інші. Ця книга в основному дотримується «логічної» інтерпретації Кокса (або Лапласа-Джеффріса-Кокса-Джейнса). Це тлумачення представлено на початку наступного розділу, але повністю розкривається лише в розділі 10.

	Як можуть процвітати різні інтерпретації теорії ймовірностей? Самі по собі математичні сутності не обов’язково щось «означають» у сенсі наслідків реального світу. Що означає взяти квадратний корінь з від’ємного числа? Що означає взяти границю, коли щось наближається до нескінченності? Це важливі та рутинні поняття, але їхні значення залежать від контексту та аналітика, від переконань щодо того, наскільки добре абстракція відображає реальність. Математика не має прямого доступу до реального світу. Тому відповіді на такі запитання залишаються суперечливим і цікавим проектом у всіх галузях прикладної математики. Отже, хоча всі дотримуються однакових аксіом ймовірності, не всі згодні в усіх контекстах щодо того, як інтерпретувати ймовірність.

---
"""

# ╔═╡ 7abae738-39c3-43f3-9520-9ee2bdb8bffe
md"""
---

	Rethinking: A little history. Bayesian statistical inference is much older than the typical tools of introductory statistics, most of which were developed in the early 20th century. Versions of the Bayesian approach were applied to scientific work in the late 1700s and repeatedly in the 19th century. But after World War I, anti-Bayesian statisticians, like Sir Ronald Fisher, succeeded in marginalizing the approach. All Fisher said about Bayesian analysis (then called inverse probability) in his influential 1925 handbook was:
	
	[...] the theory of inverse probability is founded upon an error, and must be wholly rejected. 
	
	Bayesian data analysis became increasingly accepted within statistics during the second half of the 20th century, because it proved not to be founded upon an error. All philosophy aside, it worked. Beginning in the 1990s, new computational approaches led to a rapid rise in application of Bayesian methods. Bayesian methods remain computationally expensive, however. And so as data sets have 	increased in scale—millions of rows is common in genomic analysis, for example—alternatives to or approximations to Bayesian inference remain important, and probably always will.

---

	Переосмислення: трохи історії. Байєсівський статистичний висновок набагато старший за типові інструменти вступної статистики, більшість із яких були розроблені на початку 20 століття. Версії байєсівського підходу застосовувалися в науковій роботі наприкінці 1700-х років і неодноразово в 19 столітті. Але після Першої світової війни статистикам-антибайєсівцям, таким як сер Рональд Фішер, вдалося маргіналізувати цей підхід. Усе, що Фішер сказав про байєсівський аналіз (який тоді називали зворотною ймовірністю) у своєму впливовому довіднику 1925 року:
	
	[...] Теорія оберненої ймовірності заснована на помилці, і її слід повністю відкинути.
	
	Протягом другої половини 20-го сторіччя байєсівський аналіз даних ставав все більш прийнятним у статистиці, оскільки він не ґрунтувався на помилках. Відкинувши всю філософію, це спрацювало. Починаючи з 1990-х років, нові обчислювальні підходи призвели до швидкого зростання застосування байєсівських методів. Проте байєсівські методи залишаються дорогими з точки зору обчислень. І тому, оскільки набори даних зросли в масштабі — наприклад, мільйони рядків є звичайним явищем для геномного аналізу, альтернативи або наближення до байєсівського висновку залишаються важливими, і, ймовірно, завжди будуть.

---
"""

# ╔═╡ 344ea1f4-1465-4f9a-8913-4d136d73f17a
md"""
#### 1.3.2. Model comparison and prediction.
"""

# ╔═╡ 5271b679-9753-4e96-9803-b6728eed6c5a
md"""

---

We’ll look deeply at two related tools, neither of which knows the future: cross validation and information criteria. These tools aim to let us compare models based upon expected predictive accuracy.

Comparing models by predictive accuracy can be useful in itself. And it will be even more useful because it leads to the discovery of an amazing fact: Complex models often make worse predictions than simpler models. The primary paradox of prediction is overfitting:
Fitting is easy; prediction is hard.

Cross-validation and information criteria help us in three related ways. First, they provide useful expectations of predictive accuracy, rather than merely fit to sample. So they compare models where it matters. Second, they give us an estimate of the tendency of a model to overfit the data. This will help us to understand how models and data interact, which in turn helps us to design better models. We’ll take this point up again in the next section. Third, cross-validation and information criteria can help us to spot highly influential observations.

---

Ми детально розглянемо два пов’язані інструменти, жоден із яких не знає майбутнього: перехресну перевірку та критерії інформації. Ці інструменти призначені для порівняння моделей на основі очікуваної точності прогнозування.

Порівняння моделей за прогнозною точністю може бути корисним саме по собі. І це буде ще корисніше, оскільки веде до відкриття дивовижного факту: складні моделі часто дають гірші прогнози, ніж простіші моделі. Основний парадокс передбачення полягає в надмірному налаштуванні (припасуванні):
Налаштування просте; передбачення важке.

Перехресна перевірка та інформаційні критерії допомагають нам трьома пов’язаними способами. По-перше, вони забезпечують корисні очікувану точність прогнозування, а не просто налаштування до вибірки. Вони порівнюють моделі там, де це важливо. По-друге, вони дають нам оцінку тенденції моделі до надмірного налаштування до даних. Це допоможе нам зрозуміти, як моделі та дані взаємодіють, що, у свою чергу, допоможе нам розробляти кращі моделі. Ми знову звернемося до цього питання в наступному розділі. По-третє, критерії перехресної перевірки та інформаційні критерії можуть допомогти нам виявити найвпливовіші спостереження.

---
"""

# ╔═╡ 68aaf256-cb89-43d4-8ed5-1ff0fd3cc0f0
md"""
---

	Rethinking: The Neanderthal in you. Even simple models need alternatives. In 2010, a draft genome of a Neanderthal demonstrated more DNA sequences in common with non-African contemporary humans than with African ones. This finding is consistent with interbreeding between Neanderthals and modern humans, as the latter dispersed from Africa. However, just finding DNA in common between modern Europeans and Neanderthals is not enough to demonstrate interbreeding. It is also consistent with ancient structure in the African continent. In short, if ancient north-east Africans had unique DNA sequences, then both Neanderthals and modern Europeans could possess these sequences from a common ancestor, rather than from direct interbreeding. So even in the seemingly simple case of estimating whether Neanderthals and modern humans share unique DNA, there is more than one process-based explanation. Model comparison is necessary.

---

	Переосмислення: неандерталець у тобі. Навіть прості моделі потребують альтернативи. У 2010 році проект генома неандертальця продемонстрував більше послідовностей ДНК, схожих з неафриканськими сучасними людьми, ніж з африканськими. Цей висновок узгоджується зі схрещуванням неандертальців і сучасних людей, оскільки останні розселилися з Африки. Однак просто знайти спільну ДНК сучасних європейців і неандертальців недостатньо, щоб продемонструвати схрещування. Це також узгоджується з давньою структурою на африканському континенті. Коротше кажучи, якщо стародавні північно-східні африканці мали унікальні послідовності ДНК, то і неандертальці, і сучасні європейці могли володіти цими послідовностями від спільного предка, а не від прямого схрещування. Отже, навіть у, здавалося б, простому випадку оцінки того, чи неандертальці та сучасні люди мають унікальну ДНК, існує більше ніж одне пояснення, засноване на процесі. Порівняння моделей необхідне.

---
"""

# ╔═╡ 6efa8240-e801-4463-b2a6-366bfbb57a41
md"""
#### 1.3.3. Multilevel models.
"""

# ╔═╡ 9ee32b3c-e640-49f3-820d-22f456988fdd
md"""

---

What this means is that any particular parameter can be usefully regarded as a placeholder for a missing model. Given some model of how the parameter gets its value, it is simple enough to embed the new model inside the old one. This results in a model with multiple levels of uncertainty, each feeding into the next—a multilevel model.

Like Bayesian data analysis, multilevel modeling is not particularly new, but it has only been available on desktop computers for a few decades. And since such models have a natural Bayesian representation, they have grown hand-in-hand with Bayesian data analysis.

We will be interested in multilevel models primarily because they help us deal with overfitting. Cross-validation and information criteria measure overfitting risk and help us to recognize it. But multilevel models actually do something about it. What they do is exploit an amazing statistical trick known as partial pooling that pools information across units in the data in order to produce better estimates for all units.

---

Це означає, що будь-який конкретний параметр можна розглядати як заповнювач для відсутньої моделі. Враховуючи модель того, як параметр отримує своє значення, досить просто вбудувати нову модель у стару. Це призводить до моделі з кількома рівнями невизначеності, кожен з яких переходить у наступний — багаторівнева модель.

Як і байєсівський аналіз даних, багаторівневе моделювання не є новим, але воно доступне на настільних комп’ютерах лише кілька десятиліть. А оскільки такі моделі мають природне байєсівське представлення, вони росли рука об руку з байєсівським аналізом даних.

Багаторівневі моделі нам будуть цікаві в першу чергу тому, що вони допомагають впоратися з надмірним налаштуванням. Перехресна перевірка та інформаційні критерії вимірюють ризик надмірного налаштування та допомагають нам його розпізнати. Але багаторівневі моделі насправді можуть дещо з цим зробити. Вони використовують дивовижний статистичний трюк, відомий як часткове об’єднання, який об’єднує інформацію про одиниці в даних, щоб отримати кращі оцінки для всіх одиниць.

---

"""

# ╔═╡ 608b16c3-83a9-4b0b-9176-4a93dabf571b
md"""

---

Partial pooling is the key technology, and the contexts in which it is appropriate are diverse. Here are four commonplace examples.

(1) To adjust estimates for repeat sampling. When more than one observation arises from the same individual, location, or time, then traditional, single-level models may mislead us.

(2) To adjust estimates for imbalance in sampling. When some individuals, locations, or times are sampled more than others, we may also be misled by single-level models.

(3) To study variation. If our research questions include variation among individuals or other groups within the data, then multilevel models are a big help, because they model variation explicitly.

(4) To avoid averaging. Frequently, scholars pre-average some data to construct variables for a regression analysis. This can be dangerous, because averaging removes variation. It therefore manufactures false confidence. Multilevel models allow us to preserve the uncertainty in the original, pre-averaged values, while still using the average to make predictions.

---

Часткове об’єднання є ключовою технологією, і контексти, у яких це доречно, різноманітні. Ось чотири банальних приклади.

(1) Для коригування оцінок повторного відбору проб. Коли кілька спостережень виникають від одного об'єкту, місця чи часу, традиційні однорівневі моделі можуть ввести нас в оману.

(2) Для коригувати оцінки дисбалансу у вибірці. Коли деякі об'єкти, місця чи час відбираються частіше, ніж інші, однорівневі моделі також можуть ввести нас в оману.

(3) Для вивчення варіації. Якщо наші дослідження включають варіації між окремими об'єктами чи іншими групами в межах даних, тоді багаторівневі моделі є великою підмогою, оскільки вони явно моделюють варіації.

(4) Щоб уникнути усереднення. Часто вчені попередньо усереднюють деякі дані для побудови змінних для регресійного аналізу. Це може бути небезпечно, оскільки усереднення усуває варіацію. Тому це породжує помилкову довіру. Багаторівневі моделі дозволяють нам зберегти невизначеність початкових, попередньо усереднених значень, водночас використовуючи середнє для прогнозування.

---
"""

# ╔═╡ ade0974b-8c58-49ae-9cbf-8c5fbd21d6d5
md"""

---

	Rethinking: Multilevel election forecasting. One of the older applications of multilevel modeling is to forecast the outcomes of democratic elections. In the early 1960s, John Tukey (1915–2000) began working for the National Broadcasting Company (NBC) in the United States, developing real-time election prediction models that could exploit diverse types of data: polls, past elections, partial results, and complete results from related districts. The models used a multilevel framework similar to the models presented in Chapters 13 and 14. Tukey developed and used such models for NBC through 1978. Contemporary election prediction and poll aggregation remains an active topic for multilevel modeling.

---

	Переосмислення: багаторівневе прогнозування виборів. Одним із давніх застосувань багаторівневого моделювання є прогнозування результатів демократичних виборів. На початку 1960-х років Джон Тьюкі (1915–2000) почав працювати в Національній телерадіомовній компанії (NBC) у Сполучених Штатах, розробляючи моделі прогнозування виборів у реальному часі, які могли використовувати різні типи даних: опитування, минулі вибори, часткові результати, і повні результати з відповідних районів. Моделі використовували багаторівневу структуру, подібну до моделей, представлених у розділах 13 і 14. Тьюкі розробив і використовував такі моделі для NBC до 1978 року. Сучасне прогнозування виборів і агрегація опитувань залишається активною темою для багаторівневого моделювання.

---
"""

# ╔═╡ b187369f-19ca-4533-8638-41b5d9709af4
md"""
#### 1.3.4. Graphical causal models.
"""

# ╔═╡ b14bde05-d4b8-4d3e-977a-dd27ea887218
md"""

---

When the wind blows, branches sway. If you are human, you immediately interpret this statement as causal: The wind makes the branches move. But all we see is a statistical association. From the data alone, it could also be that the branches swaying makes the wind. That conclusion seems foolish, because you know trees do not sway their own branches. A statistical model is an amazing association engine. It makes it possible to detect associations between causes and their effects. But a statistical model is never sufficient for inferring cause, because the statistical model makes no distinction between the wind causing the branches to sway and the branches causing the wind to blow. Facts outside the data are needed to decide which explanation is correct.

Now we turn to a secondary paradox in prediction: Models that are causally incorrect can make better predictions than those that are causally correct. As a result, focusing on prediction can systematically mislead us.

---

Коли вітер дме, гілки гойдаються. Якщо ви людина, ви негайно інтерпретуєте це твердження як причинно-наслідковий зв’язок: вітер змушує гілки рухатися. Але все, що ми бачимо, це статистична асоціація. Виходячи лише з даних, також можна зробити висновок, що коливання гілок викликає вітер. Цей висновок здається дурним, адже ви знаєте, що дерева не коливають своїх гілок. Статистична модель — це дивовижний механізм асоціацій. Він дає змогу виявити асоціації між причинами та їх наслідками. Але статистичної моделі ніколи не вистачає для висновку про причину, тому що статистична модель не робить різниці між вітром, який змушує гілки колихатися, і гілками, які викликають вітер. Щоб вирішити, яке пояснення є правильним, необхідні факти поза даними.

Тепер ми звернемося до іншого парадоксу в передбаченні: моделі, які причинно неправильні, можуть робити кращі прогнози, ніж ті, які причинно правильні. У результаті зосередження на передбаченні може систематично вводити нас в оману.

---

"""

# ╔═╡ 8446d704-3cf4-49a5-a2e9-6826a328915e
md"""

---

We’ll use a graphical causal model to represent a causal hypothesis. The simplest graphical causal model is a directed acyclic graph, usually called a DAG. DAGs are heuristic—they are not detailed statistical models. But they allow us to deduce which statistical models can provide valid causal inferences, assuming the DAG is true.

---

Ми будемо використовувати графічну причинно-наслідкову модель для представлення причинно-наслідкової гіпотези. Найпростішою графічною причинно-наслідковою моделлю є спрямований ациклічний граф, який зазвичай називають DAG. Такі графи є евристичними — вони не є детальними статистичними моделями. Але вони дозволяють нам зробити висновок, які статистичні моделі можуть надати дійсні причинно-наслідкові висновки, припускаючи, що DAG вірний.

---

"""

# ╔═╡ 1eccd565-0ab8-481f-aab8-fdbc5b096be2
md"""

---

	Rethinking: Causal salad. Causal inference requires a causal model that is separate from the statistical model. The data are not enough. Every philosophy agrees upon that much. Responses however are diverse. The most conservative response is to declare “causation” to be unprovable mental candy, like debating the nature of the afterlife. Slightly less conservative is to insist that cause can only be inferred under strict conditions of randomization and experimental control. This would be very limiting. Many scientific questions can never be studied experimentally—human evolution, for example. Many others could in principle be studied experimentally, but it would be unethical to do so. And many experiments are really just attempts at control—patients do not always take their medication.
	
	But the approach which dominates in many parts of biology and the social sciences is instead causal salad. Causal salad means tossing various “control” variables into a statistical model, observing changes in estimates, and then telling a story about causation. Causal salad seems founded on the notion that only omitted variables can mislead us about causation. But included variables can just as easily confound us. When tossing a causal salad, a model that makes good predictions may still mislead about causation. If we use the model to plan an intervention, it will get everything wrong. There will be examples in later chapters.

---

	Переосмислення: причинно-наслідковий салат. Причинно-наслідковий висновок вимагає причинної моделі, яка є окремою від статистичної моделі. Даних недостатньо. Кожна філософія погоджується з цим. Однак відповіді різноманітні. Найконсервативніша відповідь — оголосити «причинно-наслідковий зв’язок» розумовою цукеркою, яку неможливо довести, як дискусії про природу загробного життя. Трохи менш консервативним є наполягання на тому, що причину можна встановити лише за суворих умов рандомізації та експериментального контролю. Це було б дуже обмежуючим. Багато наукових питань неможливо дослідити експериментально — наприклад, еволюція людини. Багато інших, у принципі, можна досліджувати експериментально, але робити це було б неетично. І багато експериментів насправді є лише спробами контролю — пацієнти не завжди приймають ліки.
	
	Але підхід, який домінує в багатьох частинах біології та соціальних наук, натомість є причинно-наслідковим салатом. Причинно-наслідковий салат означає підкидання різних «контрольних» змінних у статистичну модель, спостереження за змінами в оцінках, а потім розповідь про причинно-наслідковий зв’язок. Причинний салат, здається, заснований на уявленні про те, що лише пропущені змінні можуть ввести нас в оману щодо причинно-наслідкового зв’язку. Але включені змінні можуть так само легко заплутати нас. Змішуючи причинно-наслідковий салат, модель, яка робить хороші прогнози, все одно може ввести в оману щодо причинно-наслідкового зв’язку. Якщо ми використовуємо модель для планування діяльності, все буде неправильно. У наступних розділах будуть приклади.

---

"""

# ╔═╡ 4ebec233-0a9a-41dc-80d0-08339b3b3dd8
md"""
### 1.4. Summary
"""

# ╔═╡ e940821a-8a8d-412f-9e6f-9365be881255
md"""

---

This first chapter has argued for a rethinking of popular statistical and scientific philosophy. Instead of choosing among various black-box tools for testing null hypotheses, we should learn to build and analyze multiple non-null models of natural phenomena. To support this goal, the chapter introduced Bayesian inference, model comparison, multilevel models, and graphical causal models. The remainder of the book is organized into four interdependent parts.

(1) Chapters 2 and 3 are foundational. They introduce Bayesian inference and the basic tools for performing Bayesian calculations. They move quite slowly and emphasize a purely logical interpretation of probability theory.

(2) The next four chapters, 4 through 9, build multiple linear regression as a Bayesian tool. This tool supports causal inference, but only when we analyze separate causal models that help us determine which variables to include. These chapters emphasize plotting results instead of attempting to interpret estimates of individual parameters. Problems of model complexity—overfitting—also feature prominently.
So you’ll also get an introduction to information theory and formal model comparison in Chapter 7.

(3) The third part of the book, Chapters 9 through 12, presents generalized linear models of several types. Chapter 9 introduces Markov chain Monte Carlo, used to fit the models in later chapters. Chapter 10 introduces maximum entropy as an explicit procedure to help us design and interpret these models. Then Chapters 11 and 12 detail the models themselves.

(4) The last part, Chapters 13 through 16, gets around to multilevel models, as well as specialized models that address measurement error, missing data, and spatial correlation. This material is fairly advanced, but it proceeds in the same mechanistic way as earlier material. Chapter 16 departs from the rest of the book in deploying models which are not of the generalized linear type but are rather theoretical models expressed directly as statistical models.

The final chapter, Chapter 17, returns to some of the issues raised in this first one.

---

У першому розділі йдеться про необхідність переосмислення популярної статистичної та наукової філософії. Замість того, щоб вибирати серед різних інструментів чорні скриньки для перевірки нульових гіпотез, ми маємо навчитися створювати й аналізувати численні ненульові моделі природних явищ. Щоб підтримати цю мету, у розділі було представлено байєсівський висновок, порівняння моделей, багаторівневі моделі та графічні причинно-наслідкові моделі. Решта книги складається з чотирьох взаємозалежних частин.

(1) Розділи 2 і 3 є основоположними. Вони знайомлять із байєсівським висновком і основними інструментами для виконання байєсівських обчислень. Вони рухаються досить повільно і підкреслюють суто логічне тлумачення теорії ймовірностей.

(2) У наступних чотирьох розділах, з 4 по 9, будується множинна лінійна регресія як байєсівський інструмент. Цей інструмент підтримує причинно-наслідковий висновок, але лише тоді, коли ми аналізуємо окремі причинно-наслідкові моделі, які допомагають нам визначити, які змінні включити. У цих розділах наголошується на побудові результатів замість спроби інтерпретації оцінок окремих параметрів. Проблеми складності моделі — надмірні налаштування — також займають важливе місце.
Тож ви також отримаєте вступ до теорії інформації та формального порівняння моделей у розділі 7.

(3) Третя частина книги, розділи з 9 по 12, представляє узагальнені лінійні моделі кількох типів. Розділ 9 представляє ланцюг Маркова Монте-Карло, який використовується для підгонки моделей у наступних розділах. Розділ 10 представляє максимальну ентропію як явну процедуру, яка допоможе нам розробити та інтерпретувати ці моделі. Потім розділи 11 і 12 детально описують самі моделі.

(4) Остання частина, розділи з 13 по 16, розповідає про багаторівневі моделі, а також про спеціалізовані моделі, які вирішують помилки вимірювання, відсутні дані та просторову кореляцію. Цей матеріал досить просунутий, але він розвивається таким же механізмом, як і попередній матеріал. Розділ 16 відрізняється від решти книги розгортанням моделей, які не є узагальненим лінійним типом, а є скоріше теоретичними моделями, вираженими безпосередньо як статистичні моделі.

Останній розділ, розділ 17, повертається до деяких питань, порушених у цьому першому.

---
"""

# ╔═╡ 72058069-368f-4860-9baa-f6e3d51406b4
md"""
## 2 Small Worlds and Large Worlds
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─5c7e0508-f534-11ec-06b1-3bb92776da0d
# ╟─34febd97-cc9e-483f-8362-462b8908590a
# ╟─cc2d42ed-1258-4c4c-adc9-f053a1eb769d
# ╟─ca9d3d48-2f25-49d3-96b8-7616a5818c16
# ╟─2764cfd6-2660-406a-98a2-3d52314bb4b3
# ╟─8dcd9e3f-e1ac-4a90-8d44-5aa3c5428cff
# ╟─5e04d98b-1179-4798-9426-701bce87d8c1
# ╟─d91855d6-e3e8-4cf5-89a4-64574bce3834
# ╟─1ac054d9-1f95-48a4-8737-95c9817ca6e6
# ╟─cc76b4dd-f91c-4ab3-b29b-5efd29506d6e
# ╟─0fb4290a-bdce-45af-87a6-fef9cea0deae
# ╟─75882559-bf21-4174-8341-67234688a9fd
# ╟─036cb7c5-7a08-4b1c-a684-3011ee253852
# ╟─94f51500-2454-45aa-9fd9-35ab187893f7
# ╟─0affa7d9-999e-4dbb-9a56-e7d62b2b9dab
# ╟─fd5d38f8-13ca-4098-ac6f-6bd5d39f0b59
# ╟─cf3e8069-1624-4d7a-85d2-3edd3d5fdbbf
# ╟─484f6417-0575-4ff6-b8e5-804509e21804
# ╟─4de8ed0c-a967-4b7a-912d-d4e2b33e6a60
# ╟─14b60e2b-24f8-461b-8024-9e5f75648179
# ╟─b9be360c-c21d-42dc-9ad5-001256bad677
# ╟─b165d1fb-d49a-42b0-b0bf-8994550a69e6
# ╟─0c79694f-de1f-4a80-8329-2eb6988789c0
# ╟─84b2de1a-2567-447e-865a-c9f1017e66dc
# ╟─817c6567-de17-49e7-bf44-6a0c4d7e3a05
# ╟─a3a7eba6-45b7-4495-8206-a2a183574968
# ╟─fe680d45-baa2-43e3-a3f6-02c00aaa898a
# ╟─8ff6f93f-1cbe-47bb-b7c6-69c37d7fcf22
# ╟─37fd060e-8502-488b-985b-da22e04476d2
# ╟─535a91f9-4adb-48e4-8feb-738292ab4e6e
# ╟─7abae738-39c3-43f3-9520-9ee2bdb8bffe
# ╟─344ea1f4-1465-4f9a-8913-4d136d73f17a
# ╟─5271b679-9753-4e96-9803-b6728eed6c5a
# ╟─68aaf256-cb89-43d4-8ed5-1ff0fd3cc0f0
# ╟─6efa8240-e801-4463-b2a6-366bfbb57a41
# ╟─9ee32b3c-e640-49f3-820d-22f456988fdd
# ╟─608b16c3-83a9-4b0b-9176-4a93dabf571b
# ╟─ade0974b-8c58-49ae-9cbf-8c5fbd21d6d5
# ╟─b187369f-19ca-4533-8638-41b5d9709af4
# ╟─b14bde05-d4b8-4d3e-977a-dd27ea887218
# ╟─8446d704-3cf4-49a5-a2e9-6826a328915e
# ╟─1eccd565-0ab8-481f-aab8-fdbc5b096be2
# ╟─4ebec233-0a9a-41dc-80d0-08339b3b3dd8
# ╟─e940821a-8a8d-412f-9e6f-9365be881255
# ╟─72058069-368f-4860-9baa-f6e3d51406b4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
