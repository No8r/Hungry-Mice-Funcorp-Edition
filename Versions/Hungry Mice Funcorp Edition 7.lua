local TFM = tfm.exec
local GET = tfm.get
local room = GET.room
local changeSize = TFM.changePlayerSize
local addTextArea = ui.addTextArea
local data = {}
local p = {}
local imgs = {}
local foodPoints = {}
local inRoom = 0
local alives_numbers = 0
local img_numb = 0
local levelsXP = {}
local gifs = {
    {"177baec9d34.jpg","177baec9d34.jpg","177baec9d34.jpg", "177baeccc19.jpg", "177baeccc19.jpg", "177baece38a.jpg", "177baecfafa.jpg", "177baed126b.jpg", "177baed29dd.jpg", "177baed414e.jpg","177baed5907.jpg", "177baed7033.jpg", "177baed87a4.jpg", "177baed9f14.jpg", "177baedb687.jpg", "177baedcdf9.jpg", "177baede56a.jpg", "177baedfcdc.jpg", "177baee144d.jpg", "177baee2bbe.jpg","177baee432e.jpg", "177baee5a9e.jpg", "177baee720f.jpg", "177baee720f.jpg", "177baee8981.jpg", "177baee5a9e.jpg", "177baee720f.jpg", "177baee720f.jpg", "177baee720f.jpg", "177baee720f.jpg", "177baee720f.jpg", "177baee720f.jpg", "177baee720f.jpg"},
    {"177ca7c2f69.jpg", "177ca7c46db.jpg", "177ca7c5e4e.jpg", "177ca7c75bd.jpg", "177ca7c8d2f.jpg", "177ca7ca4a1.jpg", "177ca7cbc12.jpg", "177ca7cd386.jpg", "177ca7ceaf8.jpg", "177ca7d0269.jpg", "177ca7d19dc.jpg", "177ca7d314e.jpg", "177ca7d48bf.jpg", "177ca7d6032.jpg", "177ca7d77a8.jpg", "177ca7d8f16.jpg", "177ca7da686.jpg", "177ca7dbdfa.jpg", "177ca7dd56b.jpg", "177ca7decdd.jpg", "177ca7e044e.jpg", "177ca7e1bbf.jpg", "177ca7e332f.jpg", "177ca7e4aa1.jpg", "177ca7e6215.jpg", "177ca7e7986.jpg", "177ca7e90f8.jpg", "177ca7ea86a.jpg", "177ca7ebfdb.jpg", "177ca7ed74b.jpg", "177ca7eeebe.jpg", "177ca7f062f.jpg", "177ca7f1da4.jpg", "177ca7f3513.jpg", "177ca7f4c89.jpg", "177ca7f63f6.jpg", "177ca7f7b67.jpg", "177ca7f92d9.jpg", "177ca7faa4b.jpg", "177ca7fc1bd.jpg", "177ca7fd92f.jpg", "177ca7ff0a0.jpg", "177ca800810.jpg", "177ca801f82.jpg", "177ca8036f3.jpg", "177ca804e66.jpg", "177ca804e66.jpg", "177ca8065d6.jpg","177ca8065d6.jpg", "177ca8065d6.jpg", "177ca8065d6.jpg"},
    --{"177d07b35d0.jpg", "177d07b4d40.jpg", "177d07b64b3.jpg", "177d07b7c24.jpg", "177d07b9395.jpg", "177d07bab04.jpg", "177d07bc278.jpg","177d07bd9e9.jpg", "177d07bf159.jpg"}
}

local module = {
    admins = {({pcall(nil)})[2]:match".-#%d+"},
    name = "Hungry Mice <fc>Funcorp Edition!</fc>",
    lobby = true ,
    lobby_animation = gifs[math.random(#gifs)],
    lobby_map = [[<C><P MEDATA="1,1;;;;-0;0:::1-"/><Z><S><S T="0" X="0" Y="0" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="5,5,177bc42833e.png"/><S T="14" X="401" Y="425" L="823" H="85" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="-42" Y="313" L="823" H="85" P="0,0,0,0,-90,0,0,0"/><S T="14" X="843" Y="302" L="823" H="85" P="0,0,0,0,-90,0,0,0"/><S T="14" X="417" Y="-43" L="889" H="85" P="0,0,0,0,-180,0,0,0"/></S><D><DS X="399" Y="368"/></D><O/><L/></Z></C>]],
    commands = {"lang", "language", "map", "profile", "p", "help", "h", "msg", "foods", "admin"},
    names = {},
    minium_player = 2 ,
    max_player = 30 , 
    started = false , 
    stuff = {
        developer = "Noooooooorr#0000",
        translators = {
            ["tr"] = {"Wwwarda#0000","Shun#8960"},
            ["ro"] = {"Sky#1999"},
            ["hu"] = {"Peanut_butter#0095","Weth#9837"},
            ["fr"] = {"Wonder#6997"},
            ["ru"] = {"Breathin#2158"},
            ["es"] = {"Stargazing#0010"},
            ["de"] = {"Missdilan#3234"},
            ["br"] = {"Santoex#0000"}
        }
    },
    keyboard_keys = {0, 1, 2, 3, 32, 80, 72, 81, 77, 16},
    foods = {},
    foodsNumb = 0 ,
    foodmax = 0 ,
    micefast = 20 ,
    timeMin = 2.5 ,
    level = {
        min = 1,
        max = 99,
    },
    images = {
        helpMenu = {
            [1] = {"17809223f86.png" , ":21", - 215 , - 165},
        },
        sizeMenu = "1795bb31bf3.png",
        sizeBanner = "1799620c10d.png",
        updatesMenu = "1798693ac2d.png",
        profile = {
            [1] = {"177f973026f.png" , ":20", - 145 , - 140},
            [2] = {"177f9736b0e.png" , ":21", - 90 , - 65},
            [3] = {"177f9733eac.png" , "&23", - 23 , - 65},
            avatars = {
                [1] = {"177f9405cc1.png", -27, -27}
            }
        }
    }
}

local map = {
    corrent = 1,
    sizeType = 1,
    maxSize = 5,
}

local maps = {
    [1] = {
        "@6155757", "@6155655", "@6112555", "@6116558", "@6150705", "@6119631", "@6119722", "@6121962"
    },
}

local images = {
    {"Crewmate",
        {
            {"Red", "178bcd41232.png", 110.5, 190},
            {"Yellow", "178bcd44113.png", 110.5, 190},
            {"White", "178bcd429a3.png", 110.5, 190},
            {"Orange", "178bcd3fac1.png", 110.5, 190},
            {"Lime", "178bcd3e350.png", 110.5, 190},
            {"Green" , "178bcd3cbdf.png", 110.5, 190},
            {"Lime", "178bcd3e350.png", 110.5, 190},
            {"Gray" , "178bcd3b46b.png", 110.5, 190},
            {"Blue" , "178bcd38589.png", 110.5, 190},
        }
    },
    {"Robot Mouse (By Spinnando#0000)",
        {
            {"White", "178bdf96b2a.png", 128, 190},
            {"Normal" , "178bdf9829a.png", 128, 190},
            {"Colorful" , "178bdf9b17e.png", 128, 190},
            {"Red" , "178bdf9c8ee.png", 128, 190},
            {"Golden", "178bdf99a0b.png", 128, 190},
            {"Cyan", "178bdf9e05e.png", 128, 190},
            {"Green", "178bdf9f7d0.png", 128, 190},
            {"Purple", "178bdfa0f42.png", 128, 190},
        }
    },
    {"Cute Ghost",
        {
            {"Beige", "178c09a08a0.png", 132, 190},
            {"Yellow", "178c099f12f.png", 132, 190},
            {"White", "178c099936d.png", 132, 190},
            {"Purple", "178c09a2012.png", 132, 190},
            {"Green" , "178c099d9bd.png", 132, 190},
            {"Pink", "178c099c24c.png", 132, 190},
            {"Light Blue" , "178c099aada.png", 132, 190},
        }
    },
    {"Sheep",
        {
            {"White", "178cc1108e3.png", 175.5, 190},
            {"Black", "178cc112054.png", 175.5, 190},
            {"Purple", "178cc1137c6.png", 175.5, 190},
            {"Blue", "178cc114f37.png", 175.5, 190},
            {"Pink", "178cc1166ab.png", 175.5, 190},
            {"Orange", "178cc117e1c.png", 175.5, 190},
            {"Yellow", "178cc11958e.png", 175.5, 190},
            {"Green", "178cc11ad00.png", 175.5, 190},
        }
    },
    {"holded by Spiderman",
        {
            {"Nothing", "17b554c1dfc.png", 206, 190},
            {"Chicken", "17b554c356f.png", 206, 190},
            {"Meli", "17b554c4ce0.png", 206, 190},
            {"Cheese", "17b554c6454.png", 206, 190},

        }
    },
    {"Skeleton", "1789e6b9058.png", 122.5, 170},
    {"Meli Mouse", "178cbf1ff84.png", 140, 180},
    {"Rabbit", "178a763048a.png", 105, 220},
    {"Deer", "1792c9cacd8.png", 136.5, 190},
    {"Kangaroo", "178a8fd60a4.png", 132.5, 190},
    {"Dora Mouse", "178ab77286f.png", 140, 190},
    {"Creepy Cupid", "178a8eedcd1.png", 161.5, 175},
    {"Skelaton Cat", "1792c9cd64e.png", 195, 180},
    {"Chicken", "1789e74c570.png", 135, 170},
    {"Scarecrow", "1789e83df76.png", 135, 170},
    {"Fish1", "17897d80b92.png", 50, 150},
    {"Fish2", "17a6c73f36f.png", 100, 180},
    {"Fish3", "17a2b11452f.png", 164.5, 180},
    {"Patrick", "178a8cc2fa2.png", 113.5, 190},
    {"Tentacles1 Squid", "178c0ae903f.png", 192, 190},
    {"Tentacles2 Squid", "178c1ea37d2.png", 140, 190},
    {"Tentacles3 Squid", "17abba28cad.png", 205.5, 180},

    {"Dancing Dora", "17a2b117411.png", 100, 180},
    {"Dora", "1789d45e0a4.png", 117, 170},
    {"Jerry", "17898047f7a.png", 92.5, 160},
    {"Triangle Jerry", "1789e5aece6.png", 150, 155},
    {"Standing Jerry", "1789e6216c4.png", 98, 170},
    {"Hungry Nibbbles", "1792c9c8635.png", 129.5, 180},
    {"Cardi b", "178a8c50903.png", 171.5, 180},
    {"Confused Girl", "17a24638fe5.png", 122.5, 180},
    {"Disgusted Boy", "17a2462dea9.png", 143, 180},
    {"Yelling Girl", "17a2969f993.png", 110, 180},
    {"Meli", "178c1db92ce.png", 127.5, 180},
    {"Surprised Pikachu", "178c1dbc1b1.png", 174, 180},
    {"Surprised Cat", "178c1dbaa41.png", 175, 180},
    {"Sitting Fox", "178f74e11bb.png", 101, 180},

    {"Hamster1", "179d3702e39.png", 100, 180},
    {"Hamster2", "179d3705de7.png", 140, 180},
    {"Hamster3", "179d3a777a5.png", 145, 180},
    {"Hamster4", "17a2b118b83.png", 170, 180},
    {"Hamster5", "17a6c73dbfd.png", 150, 180},
    {"Laughing guy", "179d3a6ea1e.png", 127.5, 180},

    {"Pro Cat", "1792c9c4b6b.png", 114.5, 180},
    {"Cute cat", "17a296a8bb0.png", 132.5, 180},
    {"Rainbow Unicorn", "17a296e5244.png", 137, 180},
    {"Sonickles", "17a297a663d.png", 172.5, 180},
    {"Garcello", "179d36c4ab3.png", 92.5, 180},
    {"Doge", "17a2b115ca3.png", 109, 180},

    {"Mouse handle cheese", "17a86f5af88.png", 129.5, 180},
    {"Hiii", "17a2b11ba68.png", 130, 180},
    {"Angelena", "17a2b11d1d9.png", 145, 180},
    {"Donkey (shrek)", "17a6c740adf.png", 93, 180},
    {"Funny chicken", "17a6c742250.png", 135, 180},
    {"Rubber chicken", "17b40991910.png", 115.5, 180},
    {"Chicken", "17b4055f0ca.png", 266, 190},
    {"Puppet Monkey", "17a6c7439c3.png", 156.5, 180},
    
    {"Puppet Monkey1", "17a6c7468a7.png", 161, 180},
    {"Puppet Monkey2", "17a6c749789.png", 107.5, 180},
    {"Kermit Frog", "17a6c74802b.png", 143.5, 180},
    {"Shrek", "17a6c745137.png", 87.5, 180},
    {"Henlo", "17a86f551c3.png", 50, 180},
    {"Bongo Cat", "17a86f59814.png", 145, 110},
    
    {"Doja cat1", "17a867f8436.png", 95, 180},
    {"Doja cat2", "17a86818aae.png", 112, 180},
    {"Doja cat3", "17a867fb316.png", 114, 180},
    {"Doja cat4", "17a86872509.png", 167.5, 180},
    {"Ariana Grande", "17a86f580a4.png", 164, 180},
    {"Drake", "17a2b11a2f6.png", 189.5, 180},

    {"Billie Elish", "17abba2a421.png", 95, 180},
    {"Kim Kardashian", "17abba25dcf.png", 103, 180},
    {"Jungkook", "17abba2753b.png", 106, 180},
    {"Jimin", "17abba2bb90.png", 111.5, 180},
    {"Taehyung", "17abba2d301.png", 123.5, 180},

    {"Spiderman staring", "17b554cc216.png", 215, 190},
    {"Spiderman explaining", "17b554caaa6.png", 169.5, 190},
    {"Spiderman", "1789d2c38cf.png", 74, 170},
    {"Spiderman love", "17b409a5d5e.png", 140, 190},

    {"Salttt", "17b409a3882.png", 116.5, 180},
    {"Penguin", "17b554c7bc4.png", 150, 190},
    {"Spongebob lady", "17b554c9336.png", 100, 190},
    {"Crazy Spongebob", "178a7684993.png", 143, 170},


}

local langue = {
    ar = {
        welcomeText = "<J><B>!مرحبًا بك في نمط الفئران الجائعة</J></B>\n<J><rose>[H]</rose> للمزيد من المعلومات يمكنك الضغط على\n <rose>!help</rose>, <rose>!h</rose> أو عن طريق إيعاز</J>\n\n<BL><FC>%s</FC> :تم برمجة هذا النمط بواسطة </BL>",
        canEatMice = "<%s>!يمكن للفئران أكل بعضها الآن</%s>",
        wonRound = "!بالجولة <V>%s</V> لقد فاز",
        eatPlayer = ".<V>%s</V> بأكل <V>%s</V> لقد قام",
        eatsYou = "!<V>%s</V> أكلك",
        poisonedApple = "<R>!لقد أكلتَ جبنة مسمومة</R>",
        diedPoisoned = "<R>.مات مسموما</R> <V>%s</V>",
        maxSize = "<J>!وصل إلى الحد الأقصى للحجم</J> <V>%s</V>",
        changedLang = "<J>.تم تغيير اللغة بنجاح</J>",
        translatedBy = "<CH>%s</CH> :تمت الترجمة إلى العربية بواسطة ",
        haveShield = "<BV>!لديه درع لا يمكنك أكله</BV> <V>%s</V>",
        byeShield = "<BV>.ثانية <N>%s</N> سيختفي الدرع بعد</BV>",
        theMaxSizeForMice = "<V>%s</V><N> :الحجم الأقصى للفئران</N>",
        eatFrozenCheese = "<R>!لقد أكلتَ جبنة مجمدة، سيتم تجميدك لمدة 5 ثواني</R>",
        timeIsOver = "<J>.أنتهى الوقت ! ، سيفوز الفأر الأكبر حجمًا</J>",
        specialEffect = "تأثير خاص",
        waitPlayers = "... انتظار اللاعبين",
        freezAll = "<r>!أكل جبنة من نوع قوس قزح <V>%s</V> تم تجميد كل اللاعبين لثانية لأن</r>",
        canRun = "<BV>ثانية <N>%s</N> يمكنك الركض لمدة</BV>",
        cantRunAnymore = "<R>لا يمكنك الركض بعد الآن</R>",
        cantSaveData = "لن يتم حفظ البيانات ، هذه نسخة تجريبية من هذه الوحدة ، لذا ربما سيتم حفظ البيانات قريبًا",

        food_type1 = "جبنة عادية",
        food_type2 = "فراولة",
        food_type3 = "جبنة مسممة",
        food_type4 = "جبنة الدرع",
        food_type5 = "جبنة التجميد",
        food_type6 = "فراولة ذهبية",
        food_type7 = "جبنة التعزيز",

        details_food_type1 = "قطعة جبن عادية لذيذة لكنها غير كافية لإشباعك",
        details_food_type2 = "الطعام المفضل لدى الفئران فهي تعادل 6 أضعاف الجبنة العادية",
        details_food_type3 = "إحترس هذه الجبنة تحتوي على سم قادر على إنقاص وزنك\n<R><font size='10'>قد تؤدي إلى موتك في حال كان حجم فأرك أقل من اللازم</R>",
        details_food_type4 = "تعطيك درع لمدة 20 ثانية، تعتبر من أندر الجبنات الموجودة",
        details_food_type5 = "فأرك لا يمكنه تحمل هذه الجبنة\n فبمجرد أكلها ستجمدك لمدة 5 ثوان",
        details_food_type6 = "!أندر طعام موجود\n تجعل فأرك ينمو بسرعة",
        details_food_type7 = "!تعزز سرعتك لمدة 25 ثانية",

        images   = "صور",
        help = "المساعدة",
        credits = "الائتمانات",
        commands = "الإيعازات",
        news = "الجديد",

        help_help = "<p align='center'><B><V>!الفئران الجائعة</V> مرحبًا بك في</B></p>\n<p align='right'><font color='#ffd991'><B>كيف يمكنني لعب هذا النمط؟</B></font>\nهدفك هو أن تصبح أكبر من خلال تناول الأطعمة على الأرض وبعد ثلاثين ثانية يمكن للفئران أن تأكل بعضها البعض عن طريق الضغط على زر المسافة ، لكن يمكنهم فقط أكل الفئران الأصغر منهم ، والفأر الذي أكل جميع الفئران سيفوز ، أو إذا انتهى الوقت ، يفوز أكبر واحد\n\n<font color='#ffd991'><B>كيف يمكنني معرفة أنواع الطعام؟</B></font>\n<a href='event:cheeseMenu'><font color='#ffd991'>هنا</font></a> يمكنك النقر على أيقونة الجبن في حافة الشاشة أو النقر",
        help_credits = "<font size='12'><p align='right'><v>Noooooooorr</v><g><font size='9'>#0000</font></g>:تم صنع هذا النمط بواسطة\n\n<font size='12'><font color='#ffd991'><B>ترجم بواسطة</B></font>",
        wins = "%s : مرات الفوز",
        rounds = "%s : الجولات",
        eatenMice = "%s : الفئران المأكولة",

        points      = "<rose> لتتمكن من تغيير لون اسمك يجب أن تفوز بجولتان • \n و لتغيير اسمك (مؤقتا) يجب أن تفوز 4 جولات • </rose>",
        colorNick   = "لون الاسم",
        changenick  = "تغيير الاسم",
        chosencolor = "<fc>في الجولة القادمة <font color='#%s'>#%s</font> سيتغير لون اسمك إلى [•]</fc>",
        chosenName  = "<fc>في الجولة القادمة <r>%s</r> سيتغير اسمك إلى</fc>",
        waitAMoment = "<fc>عليك الإنتظار لمدة %s ثانية لتتمكن من الطلب مرة أخرى [•]",
        youRadmin   = "<J>!أنت الآن مسؤول عن الغرفة<J>",
        youAre      = "<fc>!<b>%s</b> أنت الآن</fc>",
        returnMice  = "<fc>لقد عدت إلى فأر طبيعي</fc>",

        miceSizes    = "حجم الفئران",
        waitingPlayersLobby = "قاعة إنتظار اللاعبين",
        word_warning = "تحذير",
        word_no  = "لا",
        word_yes = "نعم",
        word_soon = "قريبًا",
        warning_stuckKilling = "يتم استعمال هذا عند حدوث خطأ باللعبة و يعلق فأرك بين الأرضيات\nهل أنت متأكد بأنك عالق؟",
        cantuseStuckAnymore = "لا يمكنك استخدام هذه الخاصية أكتر من مرة بكل جولة",
        word_close           = "إغلاق",
        help_commands = "\n<font color='#ffd991'><B><p align='right'>:الإيعازات المتوفرة</p></B></font> • <v>!profile</v> <g>[اسم اللاعب]</g> : إظهار ملف اسم اللاعب\n • <v>!lang</v> <g>[رمز اللغة]</g> : تغيير لغة النمط\n • <v>!help</v> : فتح قائمة المساعدة \n\n<font color='#ffd991'><B><p align='right'>:اختصارات لوحة المفاتيح</p></B></font>• <v>P</v> : إظهار ملفك الشخصي \n• <v>H</v> : فتح قائمة المساعدة\n• <v>SHIFT</v> : فتح قائمة أحجام اللاعبين\n• <v>M</v> : حل مشكلة الإلتصاق بالأرضيات",

        update1              = "<p align = 'right'><FC>:قائمة حجم الفئران</FC> <FC><B> • </B></FC>\n اضغط مطولًا على زر شيفت لفتح القائمة و رؤية أحجام اللاعبين \nالآن إذا علقت في الأراضي بسبب<FC><B> • </B></FC>\n خلل في اللعبة فيمكنك ضغط حرف \nكي تموت و تعود مرة أخرى [M]\n(لن تخسر أي شيء من حجمك)\n تغيير شريط الحجم و مكانه <FC><B> • </B></FC>\nتم تصليح بعض الأخطاء <FC><B> • </B></FC></p>",

    },
    br = {
        welcomeText = "<J><B>Bem-vindo(a) ao <V>Hungry Mice</V>!</J></B>\nPara mais informações basta pressionar a tecla <J><rose>[H]</rose>\nou digite <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>Este module foi programado por: <FC>%s</FC></BL>",
        canEatMice = "<%s>Os ratos maiores podem devorar os ratos menores agora!</%s>",
        wonRound = "<V>%s</V> ganhou a partida!",
        eatPlayer = "<V>%s</V> foi devorado por <V>%s</V>.",
        eatsYou = "<V>%s</V> devorou você!",
        poisonedApple = "<R>Você comeu um queijo envenenado!</R>",
        diedPoisoned = "<V>%s</V> <R>foi envenenado.</R>",
        maxSize = "<V>%s</V> <J>atingiu o tamanho máximo!</J>",
        changedLang = "<J>O idioma foi alterado com sucesso.</J>",
        translatedBy = "Traduzido para o Português por: <CH>%s</CH>", --translated to your language (not translated to en ;3)
        haveShield = "<V>%s</V> <BV>possue um escudo que não te permite devorar os ratos.</BV>",
        byeShield = "<BV>O escudo vai disaparecer em <N>%s</N> segundos!</BV>",
        theMaxSizeForMice = "<N>Tamanho máximo para os ratos:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Você acabou de comer o queijo congelado, vai deixar você congelado você por 5 segundos!</R>",
        timeIsOver = "<J>Acabou o tempo! O rato maior vai vencer a partida.</J>",
        specialEffect = "Efeito especial",
        waitPlayers = "Aguardando por jogadores ...",
        canRun = "<BV>Você pode correr mais rápido por <N>%s</N> segundos!</BV>",
        cantRunAnymore = "<R>Você não pode correr mais rápido.</R>",
        cantSaveData = "Os dados não serão salvos por enquanto, esta é uma versão teste deste module, etão esperamos que os dados sejam salvos em breve ^^",
        and_word = "e",

        food_type1 = "Queijo Normal",
        food_type2 = "Morango",
        food_type3 = "<font size='17'>Queijo Envenenado</font>",
        food_type4 = "Queijo Escudo",
        food_type5 = "Queijo Congelado",
        food_type6 = "<font size='16'>Morando de Ouro</font>",
        food_type7 = "Queijo Impulso",

        details_food_type1 = "Um pedaço normal de queijo, é muito gostoso, mas não o suficiente para te saciar",
        details_food_type2 = "A comida favorita dos Ratos, equivalente a 6 vezes do queijo normal",
        details_food_type3 = "Atenção! Este queijo contém toxinas que é capaz de te fazer perder seu peso extra\n<R><font size='10'>Isso pode resultar em sua morte se o seu rato for menor que o normal.",
        details_food_type4 = "Lhe dará um escudo de proteção por 20 segundos, é um dos queijos mais raros.",
        details_food_type5 = "Seu rato não suporta este queijo, então, depois de comê-lo, ele vai congela o seu rato por 5 segundos.",
        details_food_type6 = "A comida mais rara já vista!\nFaz com que seu rato cresça mais rapidamente!",
        details_food_type7 = "Este queijo aumenta sua velocidade por 25 segundos!",

        images   = "Imagens",
        help     = "Ajuda",
        credits  = "Créditos",
        commands = "Comandos",
        news     = "Novidades",

        help_help     = "<p align='center'><B>Bem-vindo(a) ao <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>Como jogar este module?</B></font>\nSeu principal objetivo é deixar seu rato o maior possível comendo os alimentos que estão no chão e após 30 segundos os ratos podem começar a devorar uns aos outros pressionando a tecla <font color='#ffd991'>ESPAÇO</font>, mas eles podem comer apenas os ratos que são menores que eles, o rato que conseguir comer todos os demais ratos vence a partida, ou então se o tempo acabar o rato maior vence.\n\n<font color='#ffd991'><B>Como posso ver os tipos de comidas?</B></font>\n Você pode clicar no ícone do queijo que está ao lado direito na borda da sua tela, clicar <a href='event:cheeseMenu'><font color='#ffd991'>aqui</font></a> ou digitar <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='12'>Este module foi criado por <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Traduzido por:</B></font>",

        wins      = "Vitórias : %s",
        rounds    = "Partidas : %s",
        eatenMice = "Ratos devorados : %s",

        points      = "<rose> • Para alterar a cor do seu Nick, você deve vencer 2 partidas.\n • Para alterar o seu nick, você deve vencer 4 partidas.</rose>",
        colorNick   = "Cor do Nick",
        changenick  = "Alterar o Nick",
        chosencolor = "<fc>[•] A cor do seu nick será alterada para <font color='#%s'>#%s</font> na próxima partida.</fc>",
        chosenName  = "<fc>[•] O seu nick será alterado para <r><b>%s</b></r> na próxima partida.</fc>",
        waitAMoment = "<fc>[•] Você deve aguardar %s segundos para solicitar novamente",
        youRadmin   = "<J>Você é um admin agora!<J>",
        isAdmin     = "<J>%s é um admin agora!<J>",
        youAre      = "<fc>Você se transformou em <b>%s</b>!<fc>",
        returnMice  = "<fc>Você voltou a ser um rato normal!</fc>",

        miceSizes            = "Tamanhos do Rato",
        waitingPlayersLobby  = "Aguardando por jogadores no salão",
        word_warning         = "Aviso",
        word_no              = "Não",
        word_yes             = "Sim",
        word_soon            = "Em breve!",
        word_close           = "Fechar",
        warning_stuckKilling = "Você está preso no chão? Você vai morrer e renascer novamente sem perder nada.",
        cantuseStuckAnymore  = "<r>[•] Você não pode usar isso mais de uma vez por rodada.</r>",
        help_commands        = "\n<font color='#ffd991'><B>Comandos disponíveis:</B></font>\n • <v>!profile</v> ou <v>!p</v> <g>[playerName]</g> : mostra o perfil do jogador.\n • <v>!lang</v> <g>[langID]</g> : altera o idioma do module.\n • <v>!help</v> or <v>!h</v> : abre o menu de ajuda. \n\n<font color='#ffd991'><B>Keyboard Shortcuts:</B></font>\n • <v>P</v> : mostra o seu perfil. \n • <v>H</v> : abre o menu de ajuda.\n • <v>M</v>: Resolve o problema de ficar preso no piso.\n • <v>SHIFT</v>: Abre o menu de tamanhos de ratos.",

        update1              = "<FC><B> • </B></FC><FC>Menu de tamanhos de ratos! :</FC> pressione [SHIFT] para abrir e ver o tamanho dos jogadores.\n<FC><B> • </B></FC>Agora, se você ficou preso no chão provavelmente devido a alguma falha do Transformice, pressione a tecla M para morrer e renascer novamente (não se preocupe, você não perderá nada) e poderá usá-lo uma vez por rodada.\n<FC><B> • </B></FC>Mudou o tamanho do banner e seu lugar\n<FC><B> • </B></FC>Bugs corrigidos",
    },
    de = {
        welcomeText = "<J><B>Willkommen bei <V>Hungry Mice</V>!</J></B>\nVerwenden sie zur information den folgenden befehl <J><rose>[H]</rose>\n oder <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>Entwickler dieses moduls <FC>%s</FC></BL>",
        canEatMice = "<%s>Die mäuse können sich jetzt gegenseitig fressen!</%s>",
        wonRound = "<V>%s</V> hat die runde gewonnen!",
        eatPlayer = "<V>%s</V> wurde von gegessen <V>%s</V>.",
        eatsYou = "<V>%s</V> hat dich gegessen!",
        poisonedApple = "<R>Du hast einen vergifteten käse gegessen!</R>",
        diedPoisoned = "<V>%s</V> <R>wurde vergiftet.</R>",
        maxSize = "<V>%s</V> <J>erreichte die maximale größe!</J>",
        changedLang = "<J>Die sprache hat sich erfolgreich geändert.</J>",
        changeLang = "<rose>Sie können Ihre sprache ändern, indem sie !lang [ID] eingeben.\nVerfügbare Sprachen : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> und <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Übersetzt ins Deutsche von:<CH>%s</CH>", --translated to your language (not translated to en ;3)
        haveShield = "<V>%s</V> <BV>hat einen schild. Sie können essen, wenn die zeit vorbei ist</BV>",
        byeShield = "<BV>Der schild verschwindet nach <N>%s</N> sekunden!</BV>",
        theMaxSizeForMice = "<N>Maximale größe für mäuse:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Sie haben gefrorenen käse gegessen, er friert Sie 5 sekunden lang ein!</R>",
        timeIsOver = "<J>Die zeit ist vorbei! Die größte maus wird gewinnen.</J>",
        specialEffect = "Spezialeffekt",
        waitPlayers = "Warten sie bis die spieler kommen ...",
        canRun = "<BV>Sie können<N>%s</N> sekunden lang schneller laufen</BV>",
        cantRunAnymore = "<R>Du kannst nicht mehr rennen</R>",
        cantSaveData = "Daten werden vorerst nicht gespeichert, dies ist die testversion dieses moduls, daher werden daten bald gespeichert ^^",
        and_word = "und",

        food_type1 = "Normaler Käse",
        food_type2 = "Erdbeere",
        food_type3 = "<font size='17'>Vergifteter Käse</font>",
        food_type4 = "Schildkäse",
        food_type5 = "Eiskäse",
        food_type6 = "<font size='16'>Goldener Käse</font>",
        food_type7 = "Geschwindigkeit",

        details_food_type1 = "Ein normales stück käse, es ist köstlich, aber nicht genug, um sie zufrieden zu stellen",
        details_food_type2 = "Das lieblingsessen der ratte entspricht 6 normalen käsesorten",
        details_food_type3 = "Achtung! Dieser käse enthält giftstoffe, die Ihr zusätzliches gewicht verlieren können\n<R><font size='10'>es kann zu Ihrem tod führen, wenn Ihre maus zu klein ist.",
        details_food_type4 = "Es gibt Ihnen einen schild für 20 sekunden, was einer der seltensten käsesorten ist.",
        details_food_type5 = "Ihre maus kann diesen käse nicht ausstehen. Sobald Sie ihn gegessen haben, friert er Ihre maus 5 sekunden lang ein.",
        details_food_type6 = "Das seltenste essen aller Zeiten!\nLässt Ihre maus schneller wachsen!",
        details_food_type7 = "Es erhöht Ihre geschwindigkeit für 25 sekunden!",

        images   = "Bilder",
        help     = "Hilfe",
        credits  = "Credits",
        commands = "Befehle",
        news     = "Nachrichten",

        help_help     = "<p align='center'><B>Willkommen bei <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>Wie kann ich dieses modul spielen?</B></font>\nIhr ziel ist es, größer zu werden, indem Sie die lebensmittel auf dem boden essen. Nach 30 sekunden können sich die mäuse gegenseitig durch drücken von <font color='#ffd991'>SPACE</font>fressen, aber sie können nur die mäuse essen, die kleiner als sie sind. Die maus, die alle mäuse frisst, gewinnt, oder wenn die zeit zu ende ist, gewinnt die größte.\n\n<font color='#ffd991'><B>Wie kann ich die arten von lebensmitteln kennen?</B></font>\n Sie können auf das käsesymbol am rand des bildschirms klicken oder <a href='event:cheeseMenu'><font color='#ffd991'>here</font></a> <font color='#ffd991'>!foods oder sie können es durch eingabe öffnen.</font>",
        help_credits  = "<font size='12'Dieses modul wurde erstellt von <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Übersetzt von:</B></font>",

        wins      = "Wins : %s",
        rounds    = "Tour : %s",
        eatenMice = "Eaten mice : %s",

        points      = "<rose> • Um die Farbe Ihres spitznamens zu ändern, müssen Sie 2 Runden gewinnen\n • Um deinen spitznamen zu ändern, musst du 4 Runden gewinnen.</rose>",
        colorNick   = "Spitzname Farbe",
        changenick  = "Spitznamen ändern",
        chosencolor = "<fc>[•] Ihre Spitznamenfarbe ändert sich in der nächsten runde in <font color='#%s'>#%s</font>.</fc>",
        chosenName  = "<fc>[•] Ihr Spitzname wird in der nächsten runde in <r><b>%s</b></r> geändert.</fc>",
        waitAMoment = "<fc>[•] Sie müssen %s sekunden warten, um erneut anzufordern",
        youRadmin   = "<J>Sie sind jetzt ein Administrator!<J>",
        isAdmin     = "<J>%s ist jetzt ein Administrator!<J>",
        youAre      = "<fc>Du hast dich verwandelt in <b>%s</b>!<fc>",
        returnMice  = "<fc>Sie sind zu einer normalen maus zurückgekehrt!</fc>",

        miceSizes            = "Mäusegrößen",
        waitingPlayersLobby  = "Bitte warten sie in der lobby",
        word_warning         = "Warnung",
        word_no              = "Nein",
        word_yes             = "Ja",
        word_soon            = "Soon!",
        word_close           = "Schließen",
        warning_stuckKilling = "Are you stuck on the ground?\n",
        cantuseStuckAnymore  = "<r>[•] Sie können dies nicht mehr als einmal pro runde verwenden.</r>",
        help_commands        = "\n<font color='#ffd991'><B>Verfügbare Befehle:</B></font>\n • <v>!profile</v> oder <v>!p</v> <g>[playerName]</g> : Zeigt das profil von spielername an.\n • <v>!lang</v> <g>[langID]</g> : ändert die modulsprache.\n • <v>!help</v> or <v>!h</v> : öffnet das hilfemenü. \n\n<font color='#ffd991'><B>Tastatürkürzel:</B></font>\n• <v>P</v> : zeigt dein profil.\n• <v>H</v> : öffnet das hilfemenü.\n• <v>M</v>: Behebt den fehler auf dem gelände zu bleiben.\n• <v>SHIFT</v>: Öffnet das menü mäusegrößen.",

        update1              = "<FC><B> • </B></FC><FC>Menü für mäusegrößen! :</FC> Halten sie [SHİFT] gedrückt, um es zu öffnen und die größe der spieler anzuzeigen.\n<FC><B> • </B></FC>Wenn sie aufgrund eines Transformice-Fehlers auf dem boden stecken geblieben sind, drücken sie einfach M, um zu sterben und erneut zu erscheinen (Sie werden nichts verlieren), und Sie können es einmal pro runde verwenden.\n<FC><B> • </B></FC>Das größenbanner und sein platz wurden geändert\n<FC><B> • </B></FC>Fehler behoben",
    },
    en = {
        welcomeText = "<J><B>Welcome to <V>Hungry Mice</V>!</J></B>\nFor more informations you can press <J><rose>[H]</rose>\n or type <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>This module was programmed by: <FC>%s</FC></BL>",
        canEatMice = "<%s>The mice can eat each other now!</%s>",
        wonRound = "<V>%s</V> won the round!",
        eatPlayer = "<V>%s</V> was eaten by <V>%s</V>.",
        eatsYou = "<V>%s</V> ate you!",
        poisonedApple = "<R>You ate a poisoned cheese!</R>",
        diedPoisoned = "<V>%s</V> <R>was poisoned.</R>",
        maxSize = "<V>%s</V> <J>reached the maximum size!</J>",
        changedLang = "<J>The language has changed successfully.</J>",
        changeLang = "<rose>You can change your lang by typing !lang [ID] \nAvailable languages : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> and <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Translated into English by: <CH>%s</CH>", --translated to your language (not translated to en ;3)
        haveShield = "<V>%s</V> <BV>has a shield that you can't eat.</BV>",
        byeShield = "<BV>The shield will disappear after <N>%s</N> seconds!</BV>",
        theMaxSizeForMice = "<N>Maximum size for mice:</N> <V>%s</V>",
        eatFrozenCheese = "<R>You have eaten frozen cheese, it will freeze you for 5 seconds!</R>",
        timeIsOver = "<J>Time's over! The biggest mouse will win.</J>",
        specialEffect = "Special effect",
        waitPlayers = "Waiting players ...",
        canRun = "<BV>You can run faster for <N>%s</N> seconds!</BV>",
        cantRunAnymore = "<R>You can't run anymore.</R>",
        cantSaveData = "The data will not be saved for now, this is a test version of this module so hopefully the data will be saved soon ^^",
        and_word = "and",

        food_type1 = "Normal Cheese",
        food_type2 = "Strawberry",
        food_type3 = "<font size='17'>Poisoned cheese</font>",
        food_type4 = "Shield cheese",
        food_type5 = "Freezing cheese",
        food_type6 = "<font size='16'>Golden Strawberry</font>",
        food_type7 = "Boost Cheese",

        details_food_type1 = "A normal piece of cheese, it's delicious, but not enough to satisfy you",
        details_food_type2 = "Mice's favorite food, equivalent to 6 times the normal cheese",
        details_food_type3 = "Watch out! This cheese contains toxin that is able to lose your extra weight\n<R><font size='10'>It may result in your death if your mouse is under-sized.",
        details_food_type4 = "It gives you a shield for 20 seconds, which is one of the rarest cheeses.",
        details_food_type5 = "Your mouse cannot stand this cheese, so once you eat it it'll freeze your mouse for 5 seconds.",
        details_food_type6 = "The rarest food ever!\nMakes your mouse grow faster!",
        details_food_type7 = "It boosts your speed for 25 seconds!",

        images   = "Images",
        help     = "Help",
        credits  = "Credits",
        commands = "Commands",
        news     = "News",

        help_help     = "<p align='center'><B>Welcome to <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>How can I play this module?</B></font>\nYour goal is to get bigger by eating the foods on the ground and after 30 seconds the mice can eat each others by press <font color='#ffd991'>SPACE</font>, but they can only eat the mice which is smaller than them, the mouse which eats all the mice will win, or if the time's end the biggest one win.\n\n<font color='#ffd991'><B>How can I know the types of food?</B></font>\n You can click on the cheese icon in the edge of screen or click <a href='event:cheeseMenu'><font color='#ffd991'>here</font></a> or type <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='12'>This module was made by <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Translated by:</B></font>",

        wins      = "Wins : %s",
        rounds    = "Rounds : %s",
        eatenMice = "Eaten mice : %s",

        points      = "<rose> • To change the your Nickname Color, you must win 2 rounds.\n • To change the your Nickname, you must win 4 rounds.</rose>",
        colorNick   = "Nickname Color",
        changenick  = "Change Nickname",
        chosencolor = "<fc>[•] Your nickname color will change to <font color='#%s'>#%s</font> in the next round.</fc>",
        chosenName  = "<fc>[•] Your nickname will change to <r><b>%s</b></r> in the next round.</fc>",
        waitAMoment = "<fc>[•] You must wait %s seconds to request again",
        youRadmin   = "<J>You are an admin now!<J>",
        isAdmin     = "<J>%s is an admin now!<J>",
        youAre      = "<fc>You transformed into <b>%s</b>!<fc>",
        returnMice  = "<fc>You returned to a normal mouse!</fc>",

        miceSizes            = "Mice sizes",
        waitingPlayersLobby  = "Waiting players lobby",
        word_warning         = "Warning",
        word_no              = "No",
        word_yes             = "Yes",
        word_soon            = "Soon!",
        word_close           = "Close",
        warning_stuckKilling = "Are you stuck on the ground? You'll die and respawn again without losing anything.",
        cantuseStuckAnymore  = "<r>[•] You can't use this more than once per round.</r>",
        help_commands        = "\n<font color='#ffd991'><B>Available commands:</B></font>\n • <v>!profile</v> or <v>!p</v> <g>[playerName]</g> : shows playerName's profile.\n • <v>!lang</v> <g>[langID]</g> : changes the module language.\n • <v>!help</v> or <v>!h</v> : opens the help menu. \n\n<font color='#ffd991'><B>Keyboard Shortcuts:</B></font>\n• <v>P</v> : shows your profile. \n• <v>H</v> : opens the help menu.\n• <v>M</v>: Solves the glitch of sticking on the grounds.\n• <v>SHIFT</v>: Opens the Mice sizes menu.",

        update1              = "<FC><B> • </B></FC><FC>Mice sizes menu! :</FC> hold on [SHIFT] to open it and see the players sizes.\n<FC><B> • </B></FC>Now if you stuck on the ground due Transformice glitch just press M to die and respawn again (you wil not lose anything) and you can use it once per round.\n<FC><B> • </B></FC>Changed the size banner and its place\n<FC><B> • </B></FC>Bugs fixed",
    },
    es = {
        welcomeText = "<J><B>¡Bienvenido a <V>Hungry Mice</V>!</J></B>\nPara más información puedes presionar <J><rose>[H]</rose>\n o escribir <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>Este module fue programado por: <FC>%s</FC></BL>",
        canEatMice = "<%s>¡Los ratones pueden comerse unos a otros ahora!</%s>",
        wonRound = "¡<V>%s</V> ganó la ronda!",
        eatPlayer = "<V>%s</V> fue devorado por <V>%s</V>.",
        eatsYou = "¡<V>%s</V> te comió!",
        poisonedApple = "<R>¡Te comiste un queso envenenado!</R>",
        diedPoisoned = "<V>%s</V> <R>fue envenenado.</R>",
        maxSize = "¡<V>%s</V> <J>alcanzó el tamaño máximo!</J>",
        changedLang = "<J>El idioma se cambió con éxito.</J>",
        changeLang = "<rose>Puedes cambiar tu idioma escribiendo !lang [ID] \nAvailable languages : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> and <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Traducido al Español por: <CH>%s</CH>", --translated to your language (not translated to en ;3)
        haveShield = "<V>%s</V> <BV>tiene un escudo que no puedes comer.</BV>",
        byeShield = "<BV>¡El escudo desaparecerá después de <N>%s</N> segundos!</BV>",
        theMaxSizeForMice = "<N>Tamaño máximo para los ratones:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Comiste un queso congelado, ¡te congelarás por 5 segundos!</R>",
        timeIsOver = "<J>¡Se acabó el tiempo! El ratón más grande ganará.</J>",
        specialEffect = "Efecto especial",
        waitPlayers = "Esperando jugadores ...",
        canRun = "<BV>¡Puedes correr rápido por <N>%s</N> segundos!</BV>",
        cantRunAnymore = "<R>Ya no puedes correr más.</R>",
        cantSaveData = "Los datos no se guardarán por ahora, esta es una versión de prueba de este modulo así que espero que los datos se guarden pronto ^^",
        and_word = "y",

        food_type1 = "Queso normal",
        food_type2 = "Fresa",
        food_type3 = "<font size='17'>Queso envenenado</font>",
        food_type4 = "Queso escudo",
        food_type5 = "Queso congelado",
        food_type6 = "<font size='16'>Fresa dorada</font>",
        food_type7 = "Queso de mejora",

        details_food_type1 = "Un trozo de queso normal, es delicioso, pero no suficiente para satisfacerte",
        details_food_type2 = "La comida favorita de los ratones, equivalente a 6 veces el queso normal",
        details_food_type3 = "¡Cuidado! Este queso contiene toxina que es capaz de hacerte perder peso extra\n<R><font size='10'>Puede provocar tu muerte si tu ratón es de tamaño insuficiente.",
        details_food_type4 = "Te da un escudo por 20 segundos, que es uno de los quesos más raros.",
        details_food_type5 = "Tu ratón no puede soportar este queso, así que una vez que lo comas congelará tu ratón por 5 segundos.",
        details_food_type6 = "¡La comida más rara de la historia!\n¡Hace que tu ratón crezca más rápido!",
        details_food_type7 = "¡Aumenta tu velocidad durante 20 segundos!",

        images   = "Imágenes",
        help     = "Ayuda",
        credits  = "Créditos",
        commands = "Comandos",
        news     = "Noticias",

        help_help     = "<p align='center'><B>¡Bienvenido a <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>¿Cómo puedo jugar este module?</B></font>\nTu objetivo es aumentar tu tamaño comiendo la comida del suelo y luego de 30 segundos los ratones pueden comerse unos a otros presionando <font color='#ffd991'>ESPACIO</font>, pero sólo pueden comer a los ratones que son más pequeños que ellos, el ratón que se coma a todos los ratones ganará, o si el tiempo se acaba el de mayor tamaño ganará.\n\n<font color='#ffd991'><B>¿Cómo puedo conocer los tipos de comida?</B></font>\n Puedes hacer click en el icono de queso que está al borde de la pantalla o hacer click <a href='event:cheeseMenu'><font color='#ffd991'>aquí</font></a> o escribir <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='11'>Este module fue creado por <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Traducido por:</B></font>",
        help_commands = "\n<font color='#ffd991'><B>Comandos disponibles:</B></font>\n • <v>!profile</v> o <v>!p</v> <g>[playerName]</g> : muestra el perfil del jugador.\n • <v>!lang</v> <g>[langID]</g> : cambia el idioma del module.\n • <v>!help</v> o <v>!h</v> : abre el menú de ayuda. \n\n<font color='#ffd991'><B>Atajos del teclado:</B></font>\n• <v>P</v> : muestra tu perfil. \n• <v>H</v> : abre el menú de ayuda.",

        wins      = "Victorias : %s",
        rounds    = "Rondas : %s",
        eatenMice = "Ratones devorados : %s",

        points      = "<rose> • Para cambiar el color de tu nombre, debes ganar 2 rondas.\n • Para cambiar tu nombre, debes ganar 4 rondas.</rose>",
        colorNick   = "Color del nombre",
        changenick  = "Cambiar Nombre",
        chosencolor = "<fc>[•] El color de tu nombre cambiará a <font color='#%s'>#%s</font> en la siguiente ronda.</fc>",
        chosenName  = "<fc>[•] Tu nombre cambiará a <r><b>%s</b></r> en la siguiente ronda.</fc>",
        waitAMoment = "<fc>[•] Debes esperar %s segundos para solicitar de nuevo",
        youRadmin   = "<J>¡Eres admin ahora!<J>",
        isAdmin     = "¡<J>%s es admin ahora!<J>",
        youAre      = "<fc>¡Te transformaste en <b>%s</b>!<fc>",
        returnMice  = "<fc>¡Volviste a ser un ratón normal!</fc>",

        miceSizes            = "Tamaño de los ratones",
        waitingPlayersLobby  = "Lobby para esperar jugadores",
        word_warning         = "Advertencia",
        word_no              = "No",
        word_yes             = "Si",
        word_soon            = "¡Próximamente!",
        word_close           = "Cerrar",
        warning_stuckKilling = "¿Estás atascado en el suelo? Morirás y aparecerás de nuevo sin perder nada.",
        cantuseStuckAnymore  = "<r>[•] No puedes usar esto más que una vez por ronda.</r>",
        help_commands        = "\n<font color='#ffd991'><B>Comandos disponibles:</B></font>\n • <v>!profile</v> o <v>!p</v> <g>[playerName]</g> : muestra el perfil del jugador.\n • <v>!lang</v> <g>[langID]</g> : cambia el idioma del module.\n • <v>!help</v> o <v>!h</v> : abre el menú de ayuda. \n\n<font color='#ffd991'><B>Atajos del teclado:</B></font>\n• <v>P</v> : muestra tu perfil. \n• <v>H</v> : abre el menú de ayuda.\n• <v>M</v>: Soluciona el glitch de pegarse en el suelo.\n• <v>SHIFT</v>: Abre el menú de tamaños.",

        update1              = "<FC><B> • </B></FC><FC>¡Menú de tamaños! :</FC> mantiene [SHIFT] para abrirlo y ver el tamaño de los jugadores.\n<FC><B> • </B></FC>Ahora si te quedas atascado en el suelo por un glitch de Transformice sólo presiona M para morir y reaparecer de nuevo (no perderás nada) y puedes usarlo una vez por ronda.\n<FC><B> • </B></FC>Se cambió el tamaño y el lugar del banner\n<FC><B> • </B></FC>Bugs solicionados",
    },
    fr = {
        welcomeText = "<J><B>Bienvenue dans le module <V>Hungry Mice</V> !</J></B>\nPour plus d'informations, vous pouvez appuyer sur <J><rose>[H]</rose>\n ou écrire <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>Ce module a été programmé par : <FC>%s</FC></BL>",
        canEatMice = "<%s>Vous pouvez maintenant manger les autres souris !</%s>",
        wonRound = "<V>%s</V> a gagné la partie !",
        eatPlayer = "<V>%s</V> s'est fait manger par <V>%s</V>.",
        eatsYou = "<V>%s</V> t'a mangé !",
        poisonedApple = "<R>Tu as mangé un fromage empoisonné !</R>",
        diedPoisoned = "<V>%s</V> <R>s'est fait empoisonner.</R>",
        maxSize = "<V>%s</V> <J>a atteint la taille maximum !</J>",
        changedLang = "<J>La langue a bien été modifiée.</J>",
        changeLang = "<rose>Vous pouvez changer la langue en écrivant !lang [ID] \nLangues disponibles : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> and <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Traduit en français par : <CH>%s</CH>",
        haveShield = "<V>%s</V> <BV>a un bouclier, va plutôt manger quelqu'un d'autre !.</BV>",
        byeShield = "<BV>Ton bouclier disparaîtra après <N>%s</N> secondes !</BV>",
        theMaxSizeForMice = "<N>Taille maximum des souris :</N> <V>%s</V>",
        eatFrozenCheese = "<R>Tu as mangé un fromage glacé, tu es donc congelé(e) pendant 5 secondes !</R>",
        timeIsOver = "<J>Le temps est écoulé ! La plus grosse souris est donc déclarée vainqueur.</J>",
        specialEffect = "Effet spécial",
        waitPlayers = "En attente de joueurs...",
        freezAll = "<r>Tous les joueurs sont glacés pendant une seconde car %s a mangé un fromage arc-en-ciel !!</r>",
        canRun = "<BV>Ta vitesse est augmentée pendant <N>%s</N> secondes!</BV>",
        cantRunAnymore = "<R>Tu ne peux plus courir.</R>",
        cantSaveData = "Les données ne sont pas enregistrées pour le moment car il s'agit d'une version de test de ce module, nous espérons par ailleurs que les données seront bientôt enregistrées. ^^",
        and_word = "et",

        food_type1 = "Fromage normal",
        food_type2 = "Fraise",
        food_type3 = "<font size='15'>Fromage empoisonné</font>",
        food_type4 = "Fromage bouclier",
        food_type5 = "Fromage glacé",
        food_type6 = "Fraise dorée",
        food_type7 = "<font size='15'>Fromage BOOSTER</font>",

        details_food_type1 = "Un morceau de fromage normal, c'est délicieux, mais pas assez pour vous satisfaire.",
        details_food_type2 = "C'est le plat préféré des souris, une simple fraise équivaut à 6 fromages normaux.",
        details_food_type3 = "Attention ! Ce fromage contient une toxine capable de vous faire perdre du poids.\n<R><font size='10'>Il peut engendrer votre mort si votre souris est trop petite.",
        details_food_type4 = "Ce fromage vous donne un bouclier pendant 20 secondes, c'est l'un des aliments les plus rares.",
        details_food_type5 = "Votre souris est trop fragile et ne peut supporter ce fromage. Par conséquent, vous serez gelé pendant 5 secondes dès que vous l'aurez mangé.",
        details_food_type6 = "La nourriture la plus rare de tous les temps !! *-*\nVotre souris grossit énormément en un instant !",
        details_food_type7 = "Votre souris court plus vite, et ce pendant 25 secondes !",

        images   = "Images",
        help     = "Aide",
        credits  = "Crédits",
        commands = "Commandes",
        news     = "Nouveautés",

        help_help     = "<p align='center'><B>Bienvenue dans le module <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>Quel est le but du jeu ?</B></font>\nVotre objectif est de grossir en mangeant les aliments au sol. Après 30 secondes, les souris peuvent se manger les unes les autres en appuyant sur <font color='#ffd991'>ESPACE</font>, mais uniquement les souris plus petites qu'elles. La souris qui aura mangé toutes les autres gagnera, ou bien la plus grosse d'entre-elles si le temps est écoulé.\n\n<font color='#ffd991'><B>Comment puis-je connaître les différents types d'aliments ?</B></font>\n Vous pouvez appuyer sur l'icône avec un fromage en bas à droite de l'écran, cliquer <a href='event:cheeseMenu'><font color='#ffd991'>ici</font></a> ou bien écrire <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='12'>Ce module a été créé par <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Traduit par :</B></font>",

        wins      = "Victoires : %s",
        rounds    = "<font size='9'>Parties jouées :</font> %s",
        eatenMice = "<font size='12'>Souris mangées :</font> %s",

        points      = "<rose> • Pour changer la couleur de votre pseudo, vous devez gagner 2 parties.\n • Pour modifier votre pseudo, vous devez gagner 4 parties.</rose>",
        colorNick   = "Couleur pseudo",
        changenick  = "Changement pseudo",
        chosencolor = "<fc>[•] Votre pseudo sera de couleur <font color='#%s'>#%s</font> lors de la prochaine manche.</fc>",
        chosenName  = "<fc>[•] Votre nouveau pseudo sera <r><b>%s</b></r> lors de la prochaine manche.</fc>",
        waitAMoment = "<fc>[•] Merci de patienter %s secondes avant de demander un nouveau changement.",
        youRadmin   = "<J>Vous êtes maintenant administrateur du module !<J>",
        isAdmin     = "<J>%s est maintenant administrateur du module !<J>",
        youAre      = "<fc>Tu t'es transformé(e) en <b>%s</b>!<fc>",
        returnMice  = "<fc>Vous êtes de nouveau une souris normale !</fc>",

        miceSizes            = "Taille des souris",
        waitingPlayersLobby  = "Salle d'attente",
        word_warning         = "Avertissement",
        word_no              = "Non",
        word_yes             = "Oui",
        word_soon            = "Prochainement !",
        word_close           = "Fermé",
        warning_stuckKilling = "Tu es coincé par terre ? Meurs pour réapparaître sans rien perdre en appuyant sur [M]!",
        cantuseStuckAnymore  = "<r>[•] Vous ne pouvez pas utiliser ceci plus d'une fois par partie.</r>",
        help_commands        = "\n<font color='#ffd991'><B>Commandes disponibles :</B></font>\n • <v>!profile</v> ou <v>!p</v> <g>[Pseudo#Tag]</g> : montre le profil du joueur.\n • <v>!lang</v> <g>[langID]</g> : Change la langue du module.\n • <v>!help</v> ou <v>!h</v> : ouvre le menu d'aide. \n\n<font color='#ffd991'><B>Raccourcis clavier :</B></font>\n• <v>P</v> : montre ton profil. \n• <v>H</v> : ouvre le menu d'aide.\n• <v>M</v>: Résout le problème qui nous fige au sol.\n• <v>SHIFT</v>: Ouvre l'onglet des tailles des joueurs.",

        update1              = "<FC><B> • </B></FC><FC>Onglet des tailles des joueurs ! :</FC> appuie sur [SHIFT] pour l'ouvrir et voir la taille des autres joueurs de la partie en cours.\n<FC><B> • </B></FC>Désormais, si tu es figé au sol à cause d'un bug de Transformice, appuye simplement sur M pour mourir et réapparaître (sans perdre quoi que ce soit). Tu peux l'utiliser une seule et unique fois par partie.\n<FC><B> • </B></FC>Changement de la taille de la bannière et de son positionnement.\n<FC><B> • </B></FC>Bugs résolus.",    },
    tr = {
        welcomeText = "<J><B><V>Hungry Mice</V>'a hoş geldiniz!</J></B>\nBilgilendirmeler için <J><rose>[H]</rose> tuşuna basabilir\n ya da <rose>!help</rose>, <rose>!h</rose></J> yazabilirsiniz.\n\n<BL>Oyun <FC>%s</FC> tarafından geliştirildi.</BL>",
        canEatMice = "<%s>Fareler artık birbirlerini yiyebilir!</%s>",
        wonRound = "<V>%s</V> turu kazandı!",
        eatPlayer = "<V>%s</V>, <V>%s</V> tarafından yendi.",
        eatsYou = "<V>%s</V> seni yedi!",
        poisonedApple = "<R>Zehirli peyniri yedin!</R>",
        diedPoisoned = "<V>%s</V> <R>zehirlenerek öldü.</R>",
        maxSize = "<V>%s</V> <J>maksimum büyüklüğe ulaştı!</J>",
        changedLang = "<J>Modülün dili başarıyla değiştirildi.</J>",
        changeLang = "<rose>Modülün dilini !lang [ID] yazarak değiştirebilirsiniz \nMevcut diller : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g>, <J>fr</J><g>(Française)</g> and <J>tr</J><g>(Türkçe)</g> </rose>",
        translatedBy = "Türkçe diline <CH>%s</CH> tarafından çevrildi",
        haveShield = "<V>%s</V> <BV>'ın kalkanı olduğu için onu yiyemezsin.</BV>",
        byeShield = "<BV>Kalkanın <N>%s</N> saniye sonra kalkacak!</BV>",
        theMaxSizeForMice = "<N>Fareler için maksimum büyüklük:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Donduran peynir yedin, bu seni 5 saniyeliğine donduracak!</R>",
        timeIsOver = "<J>Zaman doldu! En büyük fare turu kazanacak.</J>",
        specialEffect = "Özel etki",
        waitPlayers = "Oyuncular bekleniyor ...",
        freezAll = "<r>%s Gökkuşağı Peynir yediği için tüm oyuncular bir saniyeliğine donacak!!</r>",
        canRun = "<BV><N>%s</N> saniyeliğine daha hızlı koşabilirsin!</BV>",
        cantRunAnymore = "<R>Artık daha hızlı koşamazsın.</R>",

        food_type1 = "Normal Peynir",
        food_type2 = "Çilek",
        food_type3 = "Zehirli peynir",
        food_type4 = "Kalkan peyniri",
        food_type5 = "Donduran peynir",
        food_type6 = "<font size='18'>Altın Çilek</font>",
        food_type7 = "Hızlandırıcı Peynir",

        details_food_type1 = "Bir parça normal peynir, lezzetli fakat seni tatmin etmek için yeterli değil",
        details_food_type2 = "Farelerin favori yiyeceği, 6 normal peynire eşdeğer ",
        details_food_type3 = "Dikkat et! Bu peynir, kazandığın büyüklüğü kaybetmene sebep olabilecek toksinler içeriyor\n<R><font size='10'>Eğer ki çok küçük bir boyuta sahipsen ölmene neden olabilir.",
        details_food_type4 = "20 saniyeliğinie kalkan verir, en nadir peynirlerden biridir.",
        details_food_type5 = "Faren bu peynire dayanamıyor, bir kere yediğinde faren 5 saniyeliğine donacak.",
        details_food_type6 = "En nadir yiyecek!\nFarenin daha hızlı büyümesini sağlar!",
        details_food_type7 = "Hızınızı 25 saniyeliğine artırır!",

        images   = "Resimler",
        help     = "Yardım",
        credits  = "Emeği geçenler",
        commands = "Komutlar",
        news     = "Yenilikler",

        help_help     = "<p align='center'><B><V>Hungry Mice</V>'a hoş geldiniz!</B></p>\n<font color='#ffd991'><B>Bu modülü nasıl oynayabilirim?</B></font>\nAmacınız zeminlerin üzerinde beliren yiyecekleri yiyerek büyümek, 30 saniyenin ardından fareler birbirlerini <font color='#ffd991'>BOŞLUK</font> tuşuna basarak yiyebilecek, sadece kendinizden küçük fareleri yiyebilirsiniz. Kazanmak için tüm fareleri yemeli veya sürenin sonunda en büyük fare olmalısınız!\n\n<font color='#ffd991'><B>Yiyecek türlerini nasıl öğrenebilirim?</B></font>\n Ekranın sağ alt köşesinde bulunan peynir simgesine ya da <a href='event:cheeseMenu'><font color='#ffd991'>buraya tıklayarak</font></a> benzer şekilde <font color='#ffd991'>!foods yazarak da öğrenebilirsiniz.</font>",
        help_credits  = "<font size='12'>Bu modül <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g> tarafından hazırlandı\n\n<font size='12'><font color='#ffd991'><B>Çevirmenler:</B></font>",
        help_commands = "\n<font color='#ffd991'><B>Kullanılabilir komutlar:</B></font>\n • <v>!profile</v> or <v>!p</v> <g>[kullanıcıİsmi]</g> : kullanıcıİsmi'nin profilini gösterir.\n • <v>!lang</v> <g>[langID]</g> : Modülün dilini değiştirir.\n • <v>!help</v> or <v>!h</v> : yardım menüsünü açar. \n\n<font color='#ffd991'><B>Klavye Kısayolları:</B></font>\n• <v>P</v> : profilinizi gösterir. \n• <v>H</v> : yardım menüsünü açar.",

        wins      = "Kazanmalar : %s",
        rounds    = "Turlar : %s",
        eatenMice = "Yenilen fareler : %s",
    },
    hu = {
        welcomeText = "<J><B>Üdv a <V>Hungry Mice</V> játékban!</J></B>\nTöbb információért nyomd meg a <J><rose>[H]</rose> gombot\n vagy írd be a <rose>!help</rose>, <rose> parancsot!h</rose></J>\n\n<BL>A modul készítője: <FC>%s</FC></BL>",
        canEatMice = "<%s>Az egerek mostantól megehetik egymást!</%s>",
        wonRound = "<V>%s</V> nyerte a kört!",
        eatPlayer = "<V>%s</V> egérkét felfalta <V>%s</V>-t.",
        eatsYou = "<V>%s</V> megevett téged!",
        poisonedApple = "<R>Mérgezett sajtot ettél!</R>",
        diedPoisoned = "<V>%s</V> <R>meghalt a mérgezésben.</R>",
        maxSize = "<V>%s</V> <J>elérte a maximális méretet!</J>",
        changedLang = "<J>A nyelv megváltozott.</J>",
        changeLang = "<rose>Megváltoztathatod a nyelvet a !lang [ID] paranccsal\nElérhető nyelvek: <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> és <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Angolt fordítást készítette: <CH>%s</CH>",
        haveShield = "<V>%s</V> <BV>játékosnak pajzsa van, és nem lehet megenni.</BV>",
        byeShield = "<BV>A pajzs eltűnik <N>%s</N> másodperc múlva!</BV>",
        theMaxSizeForMice = "<N>A maximum egérméret:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Fagyasztott sajtot ettél, 5 másodpercig lefagysz!</R>",
        timeIsOver = "<J>Lejárt az idő! A legnagyobb egér győz.</J>",
        specialEffect = "Különleges effektek",
        waitPlayers = "Várakozás játékosokra ...",
        freezAll = "<r>Minden játékos lefagy pár másodpercre, mivel %s Szivárvány Sajtot evett!!</r>",
        canRun = "<BV>Gyorsabban futhatsz <N>%s</N> másodpercig!</BV>",
        cantRunAnymore = "<R>Nem futhatsz többé.</R>",
        cantSaveData = "A statisztikákat nem rögzítjük még, mivel ez csak egy teszt verziója a modulnak, de remélhetőleg hamarosan elérhetővé válik ez is ^^",

        food_type1 = "Normális Sajt",
        food_type2 = "Eper",
        food_type3 = "<font size='17'>Mérgezett sajt</font>",
        food_type4 = "Pajzs sajt",
        food_type5 = "Fagyasztott sajt",
        food_type6 = "<font size='16'>Arany Eper</font>",
        food_type7 = "Gyorsító sajt",

        details_food_type1 = "Egy sima sajtdarab, finom, de nem annyira hogy jóllakj",
        details_food_type2 = "Az egerek kedvenc étele, hatszorosa a sima sajtnak",
        details_food_type3 = "Figyelj! Ez a sajt olyan toxinokat tartalmaz, ami miatt azonnal lefogysz!\n<R><font size='10'>A halálodba is kerülhet, ha túl kicsi az egered.",
        details_food_type4 = "20 másodpercig ad egy pajzsot. Ez a legritkább sajt.",
        details_food_type5 = "Az egered nem bírja ezt a sajtot, amint megeszed, lefagysz 5 másodpercre.",
        details_food_type6 = "A legritkább élelmiszer valaha!\nAz egered gyorsabban nő tőle!",
        details_food_type7 = "Felgyorsít 25 másodpercig!",

        images   = "Képek",
        help     = "Segítség",
        credits  = "Kreditek",
        commands = "Parancsok",
        news     = "Hírek",

        help_help     = "<p align='center'><B>Üdv a <V>Hungry Mice</V> modulban!</B></p>\n<font color='#ffd991'><B>Hogy kell játszani?</B></font>\nA célod az, hogy minél nagyobb legyen a méreted. Ehhez edd meg a földön található ételeket, majd 30 másodperc után az egerek is megehetik egymást, ha egymáson állnak és megnyomják a  <font color='#ffd991'>SZÓKÖZ</font> gombot, de csak a kisebb egereket tudják megenni. Az az egér nyer, aki mindenkit megevett, vagy ha lejárt az idő, akkor a legnagyobb nyer.\n\n<font color='#ffd991'><B>Milyen ételek vannak?</B></font>\n Kattints a képernyő szélén található sajt ikonra, vagy kattints <a href='event:cheeseMenu'><font color='#ffd991'>ide</font></a> vagy írd be, hogy <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='12'>A modult készítette: <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Fordítás:</B></font>",
        help_commands = "\n<font color='#ffd991'><B>Elérhető parancsok:</B></font>\n • <v>!profile</v> or <v>!p</v> <g>[játékosNév]</g> : megmutatja játékosNév profilját.\n • <v>!lang</v> <g>[langID]</g> : megváltoztatja a modul nyelvét.\n • <v>!help</v> or <v>!h</v> : megnyitja a segítség menüt. \n\n<font color='#ffd991'><B>Billentyűzet Gyorsparancsok:</B></font>\n• <v>P</v> : megmutatja a profilod. \n• <v>H</v> : megnyitja a segítség menüt.",

        wins      = "Győzelmek: %s",
        rounds    = "Körök: %s",
        eatenMice = "Megevett egerek: %s",

        points      = "<rose> • A neved színének megváltoztatásához nyerned kell 2 kört.\n • A neved megváltoztatásához nyerned kell 4 kört.</rose>",
        colorNick   = "Név Szín",
        changenick  = "Név Megváltoztatása",
        chosencolor = "<fc>[•] A neved <font color='#%s'>#%s</font> színűvé fog változni a következő körtől.</fc>",
        chosenName  = "<fc>[•] A neved <r><b>%s</b></r> lesz a következő körtől.</fc>",
        waitAMoment = "<fc>[•] Várnod kell %s seconds to request again",
        youRadmin   = "<J>Most már admin vagy!<J>",
        isAdmin     = "<J>%s most már egy admin!<J>",
        youAre      = "<fc>Átváltoztál: <b>%s</b>!<fc>",
        returnMice  = "<fc>Ismét normális egérke vagy!</fc>",
    },
    ro = {
        welcomeText = "<J><B>Bine ai venit la <V>Hungry Mice</V>!</J></B>\nPentru mai multe informații poți apăsa tasta <J><rose>[H]</rose>\n sau să folosești <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>Acest modul a fost programat de: <FC>%s</FC></BL>",
        canEatMice = "<%s>Șoarecii pot mânca acum alți șoareci!</%s>",
        wonRound = "<V>%s</V> a câștigat runda!",
        eatPlayer = "<V>%s</V> a fost mâncat de <V>%s</V>.",
        eatsYou = "<V>%s</V> te-a mâncat!",
        poisonedApple = "<R>Ai mâncat Brânză otrăvită!</R>",
        diedPoisoned = "<V>%s</V> <R>a murit otrăvit.</R>",
        maxSize = "<V>%s</V> <J>a atins dimensiunea maximă!</J>",
        changedLang = "<J>Limba module-ului a fost schimbată cu succes.</J>",
        changeLang = "<rose>Îți poți alege limba vorbită prin folosirea comenzii !lang [ID] \nLimbi disponibile : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> and <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Tradus în română de: <CH>%s</CH>",
        haveShield = "<V>%s</V> <BV>are un scut pe care nu-l poți mânca.</BV>",
        byeShield = "<BV>Scutul va dispărea după <N>%s</N> secunde!</BV>",
        theMaxSizeForMice = "<N>Dimensiunea maximă a șoarecelui:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Ai mâncat brânză înghețată! Aceasta te va îngheța pentru 5 secunde.</R>",
        timeIsOver = "<J>Timpul s-a terminat! Cel mai mare șoarece va câștiga.</J>",
        specialEffect = "Efect special",
        waitPlayers = "Se așteaptă jucători ...",
        freezAll = "<r>Toți jucătorii au înghețat pentru o secundă deoarece %s a mâncat Brânza Curcubeu!!</r>",
        canRun = "<BV>Poți fugi mai repede pentru <N>%s</N> secunde!</BV>",
        cantRunAnymore = "<R>Nu mai poți fugi.</R>",
        and_word = "și",
        cantSaveData = "Datele nu vor fi salvate, aceasta este o versiune de testare a acestui modul. În viitorul apropiat datele vor putea fi salvate. ^^",

        food_type1 = "Brânza normală",
        food_type2 = "Căpșună",
        food_type3 = "Brânză otrăvită",
        food_type4 = "Brânză-scut",
        food_type5 = "Brânză înghețată",
        food_type6 = "<font size='18'>Căpșună aurie</font>",
        food_type7 = "Brânză-viteză",

        details_food_type1 = "O bucată normală de brânză este delicioasă, dar nu suficient de mult pentru a-ți satisface poftele.",
        details_food_type2 = "Mâncarea favorită a șoarecilor, echivalentul a 6 Brânze normale",
        details_food_type3 = "Atenție! Această brânză conține toxine ce îți vor micșoara șoarcele. \n<R><font size='10'>Poate duce la moartea șoarecelui tău dacă acesta devine prea mic.",
        details_food_type4 = "Îți oferă un scut pentru 20 secunde. Această brânză printre cele mai rare.",
        details_food_type5 = "Șoarecele tău nu poate digera acest tip de brânză. Odată mâncată, șoarece tău va îngheța timp de 5 secunde.",
        details_food_type6 = "Cel mai rar tip de mâncare!\nÎți va face șoarecele să crească mai repede.",
        details_food_type7 = "Îți crește viteza timp de 25 de secunde.",

        images   = "Imagini",
        help     = "Ajutor",
        credits  = "Credite",
        commands = "Comenzi",
        news     = "Noutăți",

        help_help     = "<p align='center'><B>Bine ai venit la <V>Hungry Mice</V> !</B></p>\n<font color='#ffd991'><B>Cum pot juca acest module?</B></font>\nScopul tău este să devii din ce în ce mai mare mâncând mâncarea care va apărea pe hartă. După 30 de secunde, șoarecii pot mânca alți șoareci prin folosirea tastei <font color='#ffd991'>SPACE</font>. Aceștia pot mânca doar șoarecii mai mici decât ei. Șoarecele care va mânca toți ceilalți șoareci va câștiga. Dacă timpul s-a terminat, cel mai mare șoarece va câștiga.\n\n<font color='#ffd991'><B>Cum pot recunoaște tipurile de mâncare?</B></font>\n Poți da click pe iconița cu brânză de la marginea ecranului, poți da click <a href='event:cheeseMenu'><font color='#ffd991'>aici</font></a> sau prin folosirea comenzii <font color='#ffd991'>!foods</font>.",
        help_credits  = "<font size='12'>Acest module a fost creat de <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Tradus de:</B></font>",
        help_commands = "\n<font color='#ffd991'><B>Comenzi disponibile:</B></font>\n • <v>!profile</v> sau <v>!p</v> <g>[numeJucător]</g> : afișează profilul unui jucător.\n • <v>!lang</v> <g>[IDlimbă]</g> : schimbă limba module-ului.\n • <v>!help</v> sau <v>!h</v> : deschide meniul de ajutor. \n\n<font color='#ffd991'><B>Comenzi rapide:</B></font>\n• <v>P</v> : îți afișează profilul. \n• <v>H</v> : deschide meniul de ajutor.",

        wins      = "Runde câștigate : %s",
        rounds    = "Runde jucate : %s",
        eatenMice = "Șoareci mâncați : %s",

        miceSizes            = "Mărimea șoarecilor",
        waitingPlayersLobby  = "Se așteaptă jucători",
        word_warning         = "Atenție",
        word_no              = "Nu",
        word_yes             = "Da",
        word_soon            = "Curând!",
        word_close           = "Închide",
        warning_stuckKilling = "Ești blocat în pământ? Nicio problemă, vei reînvia fără să-ți pierzi progresul.",
        cantuseStuckAnymore  = "<r>[•] Nu poți folosi de mai multe de o dată pe rundă.</r>",
        help_commands        = "\n<font color='#ffd991'><B>Comenzi disponibile:</B></font>\n • <v>!profile</v> or <v>!p</v> <g>[playerName]</g> : afișează profilul cuiva.\n • <v>!lang</v> <g>[langID]</g> : schimbă limba module-ului.\n • <v>!help</v> or <v>!h</v> : deschide meniul de ajutor. \n\n<font color='#ffd991'><B>Scurtături pe tastatură:</B></font>\n• <v>P</v> : Afișează profilul tău. \n• <v>H</v> : Deschide meniul de ajutor.\n• <v>M</v>: Rezolvă problema cu șoarecele care se blochează în/pe pământ.\n• <v>SHIFT</v>: Deschide meniul Mice sizes.",

        update1              = "<FC><B> • </B></FC><FC>Meniul mărimilor șoarecilor! :</FC> apasă [SHIFT] pentru a vedea mărimea celorlalți șoareci.\n<FC><B> • </B></FC>Dacă te blochezi în/pe pământ, poți apăsa tasta M pentru a reînvia (fără a-ți pierde progresul). Poți folosi doar o singură dată pe rundă.\n<FC><B> • </B></FC>Au fost schimbate mărimea și poziția banner-ului.\n<FC><B> • </B></FC>Diferite erori fixate.",
    },
    ru = {
        welcomeText = "<J><B>Добро Пожаловать в <V>Hungry Mice</V>!</J></B>\nЧтобы получить больше информации, ты можешь нажать <J><rose>[H]</rose>\n или напиши <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>Данный модуль разработал: <FC>%s</FC></BL>",
        canEatMice = "<%s>Теперь мыши могут есть друг друга!</%s>",
        wonRound = "<V>%s</V> выиграл(а) этот раунд!",
        eatPlayer = "<V>%s</V> был(а) съеден игроком <V>%s</V>.",
        eatsYou = "<V>%s</V> съел(а) тебя!",
        poisonedApple = "<R>Ты съел(а) отравленный сыр!</R>",
        diedPoisoned = "<V>%s</V> <R>был(а) отравлен(а).</R>",
        maxSize = "<V>%s</V> <J>достиг(ла) максимального размера!</J>",
        changedLang = "<J>Язык был успешно изменен.</J>",
        changeLang = "<rose>Ты можешь изменить язык, напечатав !lang [ID] \nДоступные языки : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g>, <J>fr</J><g>(Française)</g> и <J>ru</J><g>(Русский)</g> </rose>",
        translatedBy = "Перевод на русский язык от: <CH>%s</CH>",
        haveShield = "<V>%s</V> <BV>имеет щит, поэтому вы не сможете съесть игрока.</BV>",
        byeShield = "<BV>Щит исчезнет через <N>%s</N> секунд!</BV>",
        theMaxSizeForMice = "<N>Максимальный размер для мыши:</N> <V>%s</V>",
        eatFrozenCheese = "<R>Ты съел(а) замороженный сыр, в результате чего застынешь на пять секунд!</R>",
        timeIsOver = "<J>Время закончилось! Победит самая большая мышь.</J>",
        specialEffect = "Особый эффект",
        waitPlayers = "Ожидаем игроков ...",
        freezAll = "<r>Все игроки заморожены на секунду, потому что %s съел(а) Радужный Сыр!!</r>",
        canRun = "<BV>Ты можешь бежать быстрее в течение <N>%s</N> секунд!</BV>",
        cantRunAnymore = "<R>Ты больше не можешь бегать.</R>",
        cantSaveData = "Данные пока не будут сохранены, это тестовая версия модуля, поэтому, надеемся, данные будут сохранены в ближайшее время ^^",
        and_word = "и",

        food_type1 = "Обычный Сыр",
        food_type2 = "Клубника",
        food_type3 = "<font size='17'>Отравленный сыр</font>",
        food_type4 = "Сыр-щит",
        food_type5 = "Замороженный Сыр",
        food_type6 = "<font size='16'>Золотая Клубника</font>",
        food_type7 = "Ускоряющий Сыр",

        details_food_type1 = "Обычный кусочек сыра, это вкусно, но недостаточно, чтобы удовлетворить тебя.",
        details_food_type2 = "Это любимая еда мышей, которая в шесть раз сытнее обычного сыра.",
        details_food_type3 = "Осторожно! Этот сыр содержит токсин, который может заставить тебя потерять вес.\n<R><font size='10'>Это может привести к смерти, если твоя мышь слишком мала.",
        details_food_type4 = "Этот сыр дает тебе щит на двадцать секунд, который является одним из редких сыров.",
        details_food_type5 = "Твоя мышь не может терпеть этот сыр, поэтому, как только ты его съешь, он заморозит тебя на пять секунд.",
        details_food_type6 = "Самая редкая еда!\nЭто заставляет твою мышь расти быстрее!",
        details_food_type7 = "Делает твою мышь быстрее на двадцать пять секунд!",

        images   = "Изображения",
        help     = "Помощь",
        credits  = "О модуле",
        commands = "Команды",
        news     = "Новости",

        help_help     = "<p align='center'><B>Добро Пожаловать в <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>Как играть в этот модуль?</B></font>\nТвоя цель - это становиться большим, съедая еду на поверхности. После тридцати секунд, мыши могут съедать друг друга, нажимая <font color='#ffd991'>ПРОБЕЛ</font>, но они могут есть только тех мышей, которые меньше их. Побеждает та мышь, которая съела всех других мышей или же, если время закончилось - выигрывает самая большая из всех.\n\n<font color='#ffd991'><B>Как мне узнать все виды еды?</B></font>\n Ты можешь найти иконку с сыром на краю экрана или нажать <a href='event:cheeseMenu'><font color='#ffd991'>здесь</font></a>, или напечатать <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='12'>Этот модуль был создан: <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Перевод выполнили: </B></font>",
        help_commands = "\n<font color='#ffd991'><B>Доступные команды:</B></font>\n • <v>!profile</v> or <v>!p</v> <g>[НикИгрока]</g> : показывает профиль игрока.\n • <v>!lang</v> <g>[langID]</g> : меняет язык модуля.\n • <v>!help</v> или <v>!h</v> : открывает вспомогательное меню. \n\n<font color='#ffd991'><B>Сочетания клавиш:</B></font>\n• <v>P</v> : показывает твой профиль. \n• <v>H</v> : открывает вспомогательное меню.",

        wins      = "Победы : %s",
        rounds    = "Раунды : %s",
        eatenMice = "Съедено мышей : %s",

        points      = "<rose> • Чтобы поменять цвет твоего ника, ты должен(а) выиграть два раунда.\n • Чтобы поменять твой ник, ты должен(а) выиграть четыре раунда.</rose>",
        colorNick   = "Цвет ника",
        changenick  = "Поменять ник",
        chosencolor = "<fc>[•] Цвет твоего ника изменится на <font color='#%s'>#%s</font> в следующем раунде.</fc>",
        chosenName  = "<fc>[•] Твой ник поменяется на <r><b>%s</b></r> в следующем раунде.</fc>",
        waitAMoment = "<fc>[•] Ты должен подождать %s секунд, прежде чем вновь делать новый запрос.",
        youRadmin   = "<J>Тебя назначили администратором комнаты этого модуля!<J>",
        isAdmin     = "<J>%s назначили администратором комнаты этого модуля!<J>",
        youAre      = "<fc>Ты превратился(ась) в <b>%s</b>!<fc>",
        returnMice  = "<fc>Ты вновь обычная мышь!</fc>",
    },
}

local langueIcon = {
    ["ar"] = "1651b32290a.png",
    ["br"] = "1651b3019c0.png",
    ["en"] = "1723dc10ec2.png",
    ["es"] = "1651b309222.png",
    ["fr"] = "1651b30c284.png",
    ["tr"] = "1651b3240e8.png",
    ["ro"] = "1651b31f950.png",
    ["hu"] = "1651b310a3b.png",
    ["ru"] = "1651b321113.png",
    ["de"] = "1651b306152.png",
}

local foodsTypes = {
    [1] = {1, "177a6aee20c.png", 0.05, -20 , -8 , chance = {0, 60}  },
    [2] = {2, "177a6bb7960.png", 0.30, -14 , -14, chance = {60, 68} },
    [3] = {3, "177a6af0d77.png", -0.5, -20 , -8 , chance = {68, 85} },
    [4] = {4, "177a6b6f896.png", 0   , -20 , -8 , chance = {85, 90} },
    [5] = {5, "177ac004317.png", 0   , -20 , -8 , chance = {90, 95} },
    [6] = {6, "177c501cab2.png", 1   , -16 , -16, chance = {95, 97} },
    [7] = {7, "178b1dfa0ff.png", 0   , -22 , -14, chance = {97, 100}},
}

TFM.disableAutoScore(true)
TFM.disableAutoShaman(true)
TFM.disablePhysicalConsumables(true)
TFM.disablePhysicalConsumables(true)
TFM.disableAutoNewGame(true)
TFM.disableAutoTimeLeft(true)


function flagButton(name, pay, callback, x, y)
    local textareaId
    if callback == "closechangelangue" or callback == "openchangelangue" then textareaId = 0 else textareaId = #imgs[name].button + 1 end
    imgs[name].button[#imgs[name].button + 1] = TFM.addImage("1788d26ed0d.png", ":10", x, y, name, 0.23, 0.6)
    imgs[name].flag[#imgs[name].flag + 1] = TFM.addImage(langueIcon[pay], ":11", x + 7, y + 5, name)
    ui.addTextArea(70000 + textareaId , "<p align = 'center'><a href='event:" .. callback .. "'><font size = '20'>\n\n\n\n", name, x-3, y-2, 40, 20, 0x0111, 0x0111, 0, true)
end

function openChangelanguage(name)
    local id = 1
    for pay in next, langue do 
        if pay ~= p[name].langue then  
            id = id + 1
            flagButton(name, pay , "changeto"..tostring(pay), 765, 350 - (23 * id) )    
        end
    end
end

function closeChangeLangue(name)
    for i = 0, #imgs[name].button do
        if imgs[name].button[i] then TFM.removeImage(imgs[name].button[i]) imgs[name].button[i] = nil end
        if imgs[name].flag[i] then TFM.removeImage(imgs[name].flag[i]) imgs[name].flag[i] = nil end
        ui.removeTextArea(70000 + i, name)
    end
end

function miceMenu(nick, x, y)
    if inRoom < module.max_player then
        if not module.updateTopSizes or module.updateTopSizes + 2500 < os.time() then
            local t = sort_table(p)
            topSizeMenu = {}
            module.updateTopSizes = os.time()
            for i = 1, #t  do
                topSizeMenu[#topSizeMenu + 1] ="<J>" .. i .. "</J>.<v>" .. string.name(t[i].name, 7) .. "</v> : " .. t[i].size
            end
        end
        checkImage(nick , "sizesMenu", module.images.sizeMenu, ":2", x, y)
        if topSizeMenu then
            addTextArea(3000,"<p align='center'><font size='18' color='#ffd991'><B>"..translate("miceSizes", nick).."</B></font></p>\n"..table.concat(topSizeMenu, "\n"), nick, x + 40, y + 35, 150, 310, 0x0121, 0x0212, 0, true)
        end
    end
end

function sort_table(t)
    ---------------------------تحويل---------------------------
    t2 = {}
    for n, p in next, t do
        if not p.eaten then
            table.insert(t2, {name=n, size=p.size})
        end
    end
    --------------------------ترتيب---------------------------
    local n = #t2
    repeat
        local test = true
        for i=1, n-1 do
            if (t2[i + 1].size > t2[i].size) then
                local tmp = t2[i + 1]
                t2[i + 1] = t2[i]
                t2[i] = tmp
                test = false
            end
        end
        n = n - 1
    until(test or n==1)
    return t2
end

function removeMiceMenu(nick)
    if imgs[nick].sizesMenu then 
        TFM.removeImage(imgs[nick].sizesMenu)
    end
    ui.removeTextArea(3000, nick)
end


function stuckMenu(name, x, y)
    if not p[name].eaten and not module.lobby and not p[name].stuck then 
        if not p[name].useStuck then
            checkImage(name, "stuckMenu", "1798139d69a.png", ":2", x, y, 0.8, 0.8)
            addTextArea(130,"<font size='16' color='#EFCD8F'><p align='center'><b>" .. translate("word_warning", name) .. "</b></p></font>\n" .. translate("warning_stuckKilling", name), name, x+45 , y+33, 250, 80, 0x01, 0x01, 0, name)
            button(200, name, "yesStuck", x + 53  , y + 118 , translate("word_yes", name) , false, false, true)
            button(201, name, "noStuck" , x + 175  , y + 118 , translate("word_no", name) , false, false, true)
        else
            TFM.chatMessage(translate("cantuseStuckAnymore", name), name)
        end
    end
end

function removeStuckMenu(name, stuck)
    ui.removeTextArea(130, name)
    removeButton(200, name) removeButton(201, name)
    TFM.removeImage(imgs[name].stuckMenu)
end

function stuck(name)
    if not p[name].eaten and not p[name].frozen then 
        p[name].stuck = true
        p[name].useStuck = true
        updateXY(name)
        local x,y = p[name].x, p[name].y 
        TFM.killPlayer(name)
        TFM.respawnPlayer(name)
        TFM.movePlayer(name, x,y+20)
    end
end

function checkImage(name , imageName, imageId, target, xPosition, yPosition, scaleX, scaleY, rotation, alpha, anchorX, anchorY)
    if imgs[name] then
        if imgs[name][imageName] then 
            TFM.removeImage(imgs[name][imageName])
            imgs[name][imageName] = TFM.addImage(imageId, target, xPosition, yPosition, name, scaleX, scaleY, rotation, alpha, anchorX, anchorY)
        else
            imgs[name][imageName] = TFM.addImage(imageId, target, xPosition, yPosition, name, scaleX, scaleY, rotation, alpha, anchorX, anchorY)
        end
    end
end

function table.length(T)
    local number = 0
    for _ in pairs(T) do number = number + 1 end
    return number
end

function translate(id, name)
    if p[name] then
        if langue[p[name].langue] then
            if langue[p[name].langue][id] then
                return langue[p[name].langue][id]
            else
                return langue["en"][id]
            end
        elseif langue["en"] then
            return langue["en"][id]
        else
            return "error"
        end
    end
end

function chatMessage(msg, ...)
    for name in next, p do
        TFM.chatMessage(string.format(translate(msg, name), ...), name)
    end
end

function translateCommunity(id)
    local commu = GET.room.community
    if langue[commu] then
        if langue[commu][id] then
            return langue[commu][id]
        else
            return langue["en"][id]
        end
    else
        return langue["en"][id]  
    end
end

function removeTimaars(name)
    if p[name] then
        if p[name].shieldTimer then system.removeTimer(p[name].shieldTimer) end
        if p[name].speedTimer  then system.removeTimer(p[name].shieldTimer) end
        if p[name].endSpeedTimer then system.removeTimer(p[name].endSpeedTimer) p[name].speed = false imgs[name].symbols.speed = nil end
    end
end

function eventNewGame()
    TFM.setUIMapName("<v>"..module.name)
    if not module.lobby then
        removeAllFoods()
        module.alives = {}
        module.foods = {}
        module.started = false
        alives_numbers = 0
        foodPoints = {}
        setFoodMax()
        setPoints()
        ui.removeTextArea(954) ui.removeTextArea(955)
        TFM.setGameTime(module.timeMin * 60)
        for name in next, GET.room.playerList do
            removeTimaars(name)
            p[name] = {name = name, img = p[name].img, speed = false, imgPage = 1, character = p[name].character, cheeseMenuPage = p[name].cheeseMenuPage, shield = false, shieldTimer = nil, win = false, color = setColorName(name), langue = p[name].langue, click = nil , hight = 1, size = 0.1 ,x = 0, y=0 , eaten = false, facingLeft = true}
            playerRandomRespawn(name)
            updateSize(name, p[name].size)
            alives_numbers = alives_numbers + 1 
            updateXY(name)
            data[name].rounds = data[name].rounds + 1 
            checkImage(name, "sizeBanner", module.images.sizeBanner, ":1", 607.5, 22)
            button(1, name, "cheeseMenu", 760, 360, nil, "177b518549a.png")
            button(0, name, "help", 720, 360, nil, "1798139bf28.png")
            button(-1, name, "discord", 680, 360, nil, "1798139a7b9.png")        
            if p[name].color then
                TFM.setNameColor(name, p[name].color)
            end
        end
        updateImageForAll()
        beganTimer = system.newTimer(function() module.started = true chatMessage("canEatMice", "J", "/J") 
            for name in next, p do 
                addTextArea(955,"<font size='40' color='#39271f'><p align='center'><B>"..translate("canEatMice", name), name, 0,148, 802, 100, 0x0, 0x0, 0, true)
                addTextArea(954,"<font size='40' color='#ffd991'><p align='center'><B>"..translate("canEatMice", name), name, 0,150, 800, 100, 0x0, 0x0, 0, true)
                system.newTimer(function() ui.removeTextArea(954) ui.removeTextArea(955) end, 5000, false)
            end
        end , 30000, false)
        for i = 1,math.ceil(module.foodmax/4) do 
            food()
        end
    end
end

function foodRarity() 
    local a = math.random(foodsTypes[#foodsTypes].chance[2])
    if not module.started then 
        a = math.random(foodsTypes[2].chance[2])
    end
    for i = 1, #foodsTypes do
        if foodsTypes[i].chance[1] <= a and foodsTypes[i].chance[2] > a then
            return foodsTypes[i][1]
        end
    end
end

function playerSpeed(name, speed)
    if p[name] then
        if p[name].speed then 
            if speed == false then 
                if p[name].speedTimer then 
                    system.removeTimer(p[name].speedTimer) p[name].speedTimer = nil
                end
            else
                if not p[name].speedTimer then
                    p[name].speedTimer = system.newTimer(
                    function()
                        if p[name].speed then
                            if p[name].facingLeft and not p[name].frozen then
                                TFM.movePlayer(name, 0, 0, true, -25, 0, true)
                            elseif not p[name].facingLeft and not p[name].frozen then
                                TFM.movePlayer(name, 0, 0, true, 25, 0, true)
                            end
                        else
                            if p[name].speedTimer then
                                system.removeTimer(p[name].speedTimer) p[name].speedTimer = nil
                            end
                        end
                    end, 1000, true)
                end
            end
        else
            if p[name].speedTimer then 
                system.removeTimer(p[name].speedTimer)
                p[name].speedTimer = nil
            end
        end
    end
end


function shield(name, time)
    time = time * 1000
    local timie = 0 
    local size = p[name].size
    p[name].shield = true 
    if imgs[name].shield then TFM.removeImage(imgs[name].shield) end
    imgs[name].shield = TFM.addImage("178a24a75ea.png", "$"..name, (-155/4) * size, (-165/4) * size, nil, 0.25*size, 0.25*size)
    if p[name].shieldTimer then system.removeTimer(p[name].shieldTimer) end
    p[name].shieldTimer = system.newTimer(function ()
        timie = timie + 1 
        if timie == time/1000 then
            TFM.removeImage(imgs[name].shield)
            p[name].shield, imgs[name].shield = false, nil
            system.removeTimer(p[name].shieldTimer)
        elseif timie == time / 2 / 1000 then 
            TFM.chatMessage(string.format(translate("byeShield", name), time / 2 / 1000), name)
        end
    end, 1000, true)
end

function food()
    local foods = foodPoints[math.random(#foodPoints)]
    local x,y  = foods.x, foods.y
    local xSpace, ySpace = math.random(x - foods.space , x + foods.space), math.random(y - 2 , y + 2)
    local types = foodsTypes[foodRarity()]
    local xImg , yImg, randomFlip = 0, 0, {-1, 1}
    local flip = randomFlip[math.random(#randomFlip)]
    if types then
        if types[4] then xImg = types[4] end
        if types[5] then yImg = types[5] end
    end
    module.foodsNumb = module.foodsNumb + 1
    if types then
        module.foods[#module.foods + 1] = {
            id = module.foodsNumb,
            type = types[1], 
            x = xSpace, 
            y = ySpace,
            bonus1 = TFM.addBonus(0, xSpace, ySpace, 10000 + module.foodsNumb, 0, false) , 
            bonus2 = TFM.addBonus(0, xSpace, ySpace-28, 20000 + module.foodsNumb, 0, false) , 
            bonus3 = TFM.addBonus(0, xSpace, ySpace-57, 30000 + module.foodsNumb, 0, false) , 
            img = TFM.addImage(types[2], "!"..module.foodsNumb + 30000, xSpace + (xImg*flip), ySpace + yImg, nil, flip) ,
            calories = types[3] ,
            eaten = false ,
            timer = nil ,
        }
        module.foods[#module.foods].timer = setFoodTimer(module.foodsNumb)
    end
    for name in next, p do 
        if p[name].size < 3 then 
            TFM.removeBonus(30000 + module.foodsNumb, name)
        end
        if p[name].size < 1.5 then
            TFM.removeBonus(20000 + module.foodsNumb, name)
        end
    end
end

function removeFood(id)
    for i = 0, #module.foods do
        local food = module.foods[i]
        if food then
            if food.id == id  then 
                if food.timer then system.removeTimer(food.timer) end
                food.eaten = true
                TFM.removeImage(food.img)
                removeFoodBounus(food.id)
                table.remove(module.foods, i)
            end
        end
    end
end

function removeAllFoods()
    for numb,food in next , module.foods do 
        if food then
            if food.timer then 
                system.removeTimer(food.timer)
            end
        end
    end
end

function removeFoodBounus(id,name)
    if not name then name = nil end
    for i = 1 , 3 do 
        TFM.removeBonus(id + 10000*i)
    end
end

function addButton(id, text, x, y, xSize, ySize, callback, name, img, iX, iY)
    iX, iY = iX or 0 , iY or 0 
    ui.addTextArea(1000000 + id,"<p align = 'center'>" .. text, name, x, y, xSize, ySize, 0x011, 0x011, 0, true)
    ui.addTextArea(2000000 + id, "<p align = 'center'><a href='event:" .. callback .. "'><font size = '20'>\n\n\n\n", name, x, y, xSize, ySize, 0x0111, 0x0111, 0, true)
    if img then 
        checkImage(name, "button"..id , img, ":"..id, x+iX, y+iY)
    end
end

function button(id, name, event, x, y, text, img, color, shadow)
    if not color then color = "ffd991" end
    if img then
        checkImage(name, "button"..id , img, ":"..id, x, y)
    end
    if event then
        addTextArea(id + 1000000,"<font size='22'><a href='event:"..event.."'><p align='center'>\n\n\n\n", name, x, y, 40, 40, 0x01, 0x01, 0, true)
        if text then 
            if shadow then
                addTextArea(id + 3000000,"<font size='14' color='#000000'><p align='center'>"..text, name, x-3, y+2, 100, 40, 0x01, 0x01, 0, true)
            end
            addTextArea(id + 1000000,"<font size='14' color='#"..color.."'><p align='center'>"..text, name, x-5, y, 100, 35, 0x01, 0x01, 0, true)
            addTextArea(id + 2000000,"<font size='40'><a href='event:"..event.."'><p align='center'>\n\n\n\n", name, x-5, y, 100, 35, 0x01, 0x01, 0, true)
        end
    end
end

function removeButton(id, name)
    ui.removeTextArea(id + 1000000, name)
    ui.removeTextArea(id + 2000000, name)
    ui.removeTextArea(id + 3000000, name)
end

function showProfile(player, name)
    closehelpMenu(name)
    local imgX, imgY = 400, 220
    if data[player] then 
        if levelsXP[data[player].level] then
            local barSize = 85 * tonumber(data[player].xp) / tonumber(levelsXP[data[player].level])
            local avatar = module.images.profile.avatars[data[player].avatar]
            local pic = module.images.profile
            if imgs[name].profile[1] then for i = 1,#imgs[name].profile do TFM.removeImage(imgs[name].profile[i]) end end
            imgs[name].profile[1] = TFM.addImage(pic[1][1], pic[1][2], pic[1][3] + imgX , pic[1][4] + imgY, name)
            imgs[name].profile[2] = TFM.addImage(avatar[1], ":22", avatar[2] + imgX - 60 , avatar[2] + imgY - 35, name)
            imgs[name].profile[3] = TFM.addImage(pic[2][1], pic[2][2], pic[2][3] + imgX , pic[2][4] + imgY, name)
            imgs[name].profile[4] = TFM.addImage(pic[3][1], pic[3][2], pic[3][3] + imgX , pic[3][4] + imgY, name)
            addTextArea(-200,"<font size='20' color = '#ffd991' face = 'soopafresh'><p align='center'>"..string.name(player, 15), name, module.images.profile[1][3] + imgX + 50, module.images.profile[1][4] + imgY + 35, 180, 35, 0x01, 0x01, 0, true)
            addTextArea(-201,"", name, imgX - 11, imgY - 28 , barSize, 15, 0xFF8547, 0xFF8547, 1, true)
            addTextArea(-202,"<font size='10' color = '#ffd991'><p align='center'>" .. data[player].xp .. [[/]] .. levelsXP[data[player].level].."xp" , name, imgX - 5, imgY - 3 , 70, 15, 0x01, 0x10, 0, true)
            addTextArea(-203,"<font size='14' color = '#ffd991' face = 'soopafresh'><b><p align='center'>".. data[player].level , name, imgX - 13, imgY - 56 , 40, 23, 0x01, 0x10, 0, true)
            addTextArea(-204,"<font size='14' color = '#ffd991'><b><p align='center'>" .. string.format(translate("wins", name), data[player].wins) , name, imgX - 55, imgY + 25 , 100, 25, 0x01, 0x10, 0, true)
            addTextArea(-205,"<font size='14' color = '#ffd991'><b><p align='center'>" .. string.format(translate("rounds", name), data[player].rounds) , name, imgX - 55, imgY + 50 , 100, 25, 0x01, 0x10, 0, true)
            addTextArea(-206,"<font size='14' color = '#ffd991'><b><p align='center'>" .. string.format(translate("eatenMice", name), data[player].miceEats) , name, imgX - 85, imgY + 75 , 160, 25, 0x01, 0x10, 0, true)
            button(66666, name, "closeProfile", imgX + 70 , imgY - 130)
            if barSize < 5 then
                addTextArea(-201,"", name, imgX - 15, imgY - 28 , 1, 15, 0xFF8547, 0xFF8547, 1, true)
            end
        end
    end
end

function closeProfile(name)
    removeButton(66666, name)
    for i = -206,-200 do 
        ui.removeTextArea(i ,name)
    end
    for i = 1, 4 do if imgs[name].profile[i] then TFM.removeImage(imgs[name].profile[i]) imgs[name].profile[i] = nil end end
end

function cheeseMenu(page, name)
    local x,y 
    if not page then page = 1 end
    local timer 
    local color = ""
    local cheeseName = "food_type" .. page
    local cheeseDetails = "details_food_type" .. page
    local effect = foodsTypes[page][3]
    if effect == 0 then effect = translate("specialEffect", name) else effect = foodsTypes[page][3] end
    if foodsTypes[page][3] > 0 then color = "A6FF91" elseif foodsTypes[page][3] < 0 then color = "CF5353" else color = "9F53CF" end
    button(2, name, "closeCheeseMenu", 730+ 30, 100)
    button(3, name, "nextCheese", 685+ 30, 163)
    button(4, name, "previousCheese", 575+ 30, 163)
    if not imgs[name].cheesemenu then imgs[name].cheesemenu = TFM.addImage("177b62f0b8f.png", ":4", 270+ 30, 20, name) end
    if imgs[name].cheese then TFM.removeImage(imgs[name].cheese) imgs[name].cheese = nil end
    imgs[name].cheese = TFM.addImage(foodsTypes[page][2], ":4", 655+foodsTypes[page][4]+ 30, 177+foodsTypes[page][5], name)
    addTextArea(666,"<font size='20' color='#ffd991'><p align='center'><b>" .. translate(cheeseName, name), name, 560 + 30, 210, 190, 50, 0x01, 0x01, 0, name)
    addTextArea(667,"<font size='12' color='#"..color.."'><p align='center'>" .. effect, name, 565+ 30, 238, 180, 50, 0x01, 0x01, 0, name)
    addTextArea(668,"<font size='13' color='#EFCD8F'><p align='center'>" .. translate(cheeseDetails, name), name, 565+ 30, 255, 180, 90, 0x01, 0x01, 0, name)
end

function closeCheeseMenu(name)
    for i = 2,4 do
        removeButton(i, name)
        ui.removeTextArea(664 + i, name)
    end
    TFM.removeImage(imgs[name].cheesemenu, name) imgs[name].cheesemenu = nil
    TFM.removeImage(imgs[name].cheese, name) imgs[name].cheese = nil
end

function helpMenu(name, x, y, page)
    closeProfile(name)
    local img = module.images.helpMenu[1]
    closehelpMenu(name)
    imgs[name].helpMenu[1] = TFM.addImage(img[1], img[2], img[3] + x, img[4] + y, name)
    addTextArea(-300, "<font size='25' color='#ffd991'><p align='center'><b>" .. translate(page, name), name, img[3] + x +115, img[4] + y + 40, 190, 50, 0x01, 0x01, 0, name)
    button(14, name, "closeHelp", x + 140 , y - 155)
    for i = 1,3 do 
        local b 
        if i == 1 then b="help" elseif i == 2 then b="commands" else b="credits" end
        button(10 + i, name, b, x - 155 + ((i-1) * 105 )  , y + 90 , translate(b, name) , false, false, true)
        if b == page then 
            addTextArea(-302,"", name, x - 155 + ((i-1) * 105 ), y + 90, 90, 25, 0x01, 0x01, 0.3, true)
            addTextArea(-301, translate("help_"..b, name), name, img[3] + x + 60, img[4] + y + 80, 300, 160, 0x01, 0x01, 0, true)
        end
    end
    if page == "credits" then
        flagsIcons(name, x - 130, y - 35, 15)
    end
end

function flagsIcons(name, x, y, ySpace, event)
    local id, idM = 0, 0 
    for commu, translator in next, module.stuff.translators do 
        for number, n in next , translator do
            local img = langueIcon[commu]
            if img then 
                id = id + 1
                if id == 7 then x = x + 130 idM = 1 elseif id < 7 then idM = id elseif id > 7 then idM = idM + 1  end
                imgs[name].helpMenu[1 + id] = TFM.addImage(img, ":99",x, y + (ySpace * (idM - 1)), name)
                addTextArea(-303 - id, "<v>" .. string.name(n, 8), name, x + 20 , y + (ySpace * (idM - 1) - 4), 120, 25, 0x01, 0x01, 0, true)
            end
        end
    end
end

function closehelpMenu(name)
    for textarea = -303 - (#imgs[name].helpMenu-1) ,-300 do 
        ui.removeTextArea(textarea, name)
    end
    for i = 1, 4 do 
        removeButton(10 + i, name)
    end
    for i = 1, #imgs[name].helpMenu do 
        if imgs[name].helpMenu[i] then 
            TFM.removeImage(imgs[name].helpMenu[i])
        end
    end
end

function isNear(name,x,y,space)
	if p[name].x > x-space and p[name].x < x+space and p[name].y > y-space and p[name].y < y+space then
		return true
    end
end

function eatMouse(name)
    local zone = math.ceil(p[name].size) * 20
    if module.started then
        for n,mouse in pairs(p) do 
            if not mouse.eaten then
                updateXY(n)
                if isNear(name,mouse.x,mouse.y,zone) then
                    if p[name].size > mouse.size then
                        if not mouse.shield then
                            TFM.killPlayer(mouse.name)
                            mouse.eaten = true
                            p[name].size = p[name].size + mouse.size / 2
                            updateSize(name,p[name].size) 
                            TFM.chatMessage(string.format(translate("eatsYou", name), string.name(name)), mouse.name)
                            mouse = nil
                            data[name].miceEats = data[name].miceEats + 1 
                            addXP(name, 1)
                        else
                            TFM.chatMessage(string.format(translate("haveShield", name), string.name(mouse.name)), name)
                            TFM.displayParticle(10, mouse.x, mouse.y)
                            if room.playerList[name].isFacingRight then
                                TFM.movePlayer(name, 0, 0, true, -200, 0, false)
                            elseif not room.playerList[name].isFacingRight then
                                TFM.movePlayer(name, 0, 0, true, 200, 0, false)
                            end
                        end
                    end
                end
            end
        end
    end
end

function string.name(name, size)
    if not size then size = 10 end
	local hashtag,hashtagColor = "(#%d%d%d%d)","<font size='" .. size .. "'><g>%1</g></font>"
	module.names[name] = string.gsub(name, hashtag, hashtagColor)
	return module.names[name]
end


function lobby()
    module.lobby_animation = gifs[math.random(#gifs)]
    module.lobby = true
    TFM.disableAfkDeath(true)
    module.lobbymap = true
    TFM.newGame(module.lobby_map)
    TFM.setUIMapName(translateCommunity("waitingPlayersLobby"))
    animationTimer = Timer(lobbyAnimations, 14)
    if beganTimer then system.removeTimer(beganTimer) end
    if exitLobbyTimer then system.removeTimer(exitLobbyTimer) end
    for name in next, p do
        TFM.respawnPlayer(name)
        if imgs[name] then
            if imgs[name].sizeBanner then
                TFM.removeImage(imgs[name].sizeBanner)
                imgs[name].sizeBanner = nil
            end
        end
    end
    updatePlayersNumb()
    addTextArea(9999,"<font size='22'><a href='event:cheeseMenu'><p align='center'><B>\n\n", nil, 724, 40, 40, 40, 0x0, 0x0, 0, true)
end

function exitLobby()
    module.lobby = false
    removeTimers(animationTimer)
    TFM.disableAfkDeath(false)
    setMap()
    img_numb, module.lobbymap = 0, nil
    if beganTimer then system.removeTimer(beganTimer) end
    for img in next, imgs.lobby do 
        TFM.removeImage(img)
    end
end

function lobbyAnimations()
    if module.lobby then
        img_numb = img_numb + 1
        imgs.lobby[img_numb] = TFM.addImage(module.lobby_animation[img_numb],"_10000", 160, 75+25)
        TFM.removeImage(imgs.lobby[img_numb - 1])
        if img_numb >= #module.lobby_animation then
            imgs.lobby[1] = TFM.addImage(module.lobby_animation[1],"_10000", 160, 75+25)
            TFM.removeImage(imgs.lobby[img_numb])
            img_numb = 1
        end
    end
end

function checkLobby()
    if module.lobby then 
        if inRoom >= module.minium_player then
            if checklobbyT then system.removeTimer(checklobbyT) checklobbyT = nil end
            checklobbyT = system.newTimer(function() exitLobby() checklobbyT = nil end, 4000, false)
        else
            updatePlayersNumb()
            if inRoom < module.minium_player and not module.lobbymap then
                lobby()
            end
        end
    elseif not module.lobby then
        if inRoom < module.minium_player then
            if not room.isTribeHouse then 
                lobby()
            end
        end
    end
end

function updatePlayersNumb()
    for name in next, room.playerList do
        if name and inRoom and translate("waitPlayers",name) then
            addTextArea(900000,"<font size='22' color='#ffd991'><p align='center'><B>" .. translate("waitPlayers",name).."\n".. inRoom .. [[/]] .. module.minium_player, name, 0,30, 800, 65, 0x01, 0x01, 0, true)
        end
    end
end

function main()
    imgs.lobby = {}
    if room.isTribeHouse then module.minium_player = 1 end
    setXpToLevelUP()
    for name in pairs(tfm.get.room.playerList) do
		eventNewPlayer(name)
    end
    for _,c in pairs(module.commands) do
		system.disableChatCommandDisplay(c)
    end
    if room.isTribeHouse then 
        module.lobby = false
    end
    TFM.setRoomMaxPlayers(module.max_player)
end

function getValue(theValue,c)
    return tonumber(theValue:match(('%s="([^"]+)"'):format(c))) or theValue:match(('%s="([^"]+)"'):format(c)) or theValue:match(('%s=""'):format(c))
end

function playerRandomRespawn(name)
    if foodPoints then
        local respawnPoint = foodPoints[math.random(#foodPoints)]
        if respawnPoint then
            local x,y  = respawnPoint.x, respawnPoint.y
            local xSpace, ySpace = math.random(x - respawnPoint.space , x + respawnPoint.space), y+5
            TFM.movePlayer(name, xSpace, ySpace)
            updateXY(name)
        end
    end
end

function setAdmin(name)
    if not name then return end
    local admin = name:sub(1,1):upper()..name:sub(2):lower()
    if p[admin] then 
        p[name].color = "0xFF8547"
        table.insert(module.admins , admin)
        TFM.chatMessage(translate("youRadmin", admin), admin)
        adminsInterface(name)
        adminMessage(string.format(langue.en.isAdmin, string.name(name)))
    end
end

function setFoodMax()
    if  inRoom < 5 then 
        module.foodmax = 20
    elseif inRoom >= 5 and inRoom < 10 then 
        module.foodmax = 40
    elseif inRoom >= 10 and inRoom < 20 then 
        module.foodmax = 60
    elseif inRoom >= 20 and inRoom < 30 then 
        module.foodmax = 80
    elseif inRoom >= 30  then 
        module.foodmax = 100
    end
end

function setMap(map2)
    if not module.lobby then
        if beganTimer then system.removeTimer(beganTimer) end
        if not map2 then 
            local m = math.random(#maps[map.sizeType])
            if map.sizeType == 1 then map.maxSize = 5 else map.maxSize = 2.5 end
            map.corrent = m
            if maps[map.sizeType][m] then 
                TFM.newGame(maps[map.sizeType][m])
            end
        else
            TFM.newGame(map2)
        end
    end
end

function setColorName(name)
    local color
    if module.stuff.translators[name] then
        color = "0x98E2EB"
    end
    for k,n in next, module.admins do 
        if n == name then 
            color = "0xFF8547"
        end
    end
    return color
end

function setwinnerByTime()
    local winner
    for _,mouse in pairs(p) do 
        if not mouse.eaten then
            if not winner then winner = mouse.name end
            if mouse.size > p[winner].size then
                winner = mouse.name
            end
        end
    end
    return winner
end

function setPoints()
    local xml = room.xmlMapInfo.xml
    for point in xml:gmatch("<O [^/]+/>") do
        local x = getValue(point,"X")
        local y = getValue(point,"Y")
        local c = getValue(point,"C")
        local mp = getValue(point,"Mp")
        if c == 11  then
            if y and x and mp then
                foodPoints[#foodPoints+1] = {y = y , x = x , space = mp }
            else
                TFM.chatMessage("<r><b>[ERROR]</b> There's something wrong with the red nails.</r>")
            end
        end
    end
end

function setFoodTimer(id)
    for i = 1, #module.foods do
        local food = module.foods[i] 
        if food then
            if food.id == id  then 
                if food.type == 3 then
                    return system.newTimer(function()
                        removeFood(id)
                    end, 30000, false)
                end 
            end
        end
    end
end

function setXpToLevelUP()
    for i = 1, 99 do
        local XP = 40 + (10 * i)  --math.floor(math.floor(i + 100 * 2 ^(i/10) / 4))
        levelsXP[i] = XP
    end
end

function addXP(name, XPs)
    data[name].xp = data[name].xp + XPs
    updateLevel(name)
end

function updateLevel(name)
    local currentLVL = data[name].level
    if levelsXP[currentLVL] <= data[name].xp then 
        local remainXP = data[name].xp - levelsXP[currentLVL]
        data[name].level = data[name].level + 1 
        data[name].xp = remainXP
    end
end

function updateXY(name)
    p[name].x = room.playerList[name].x
    p[name].y = room.playerList[name].y
end

function updateSize(name,size)
    if p[name] then
        if size >= map.maxSize then
            p[name].size = map.maxSize 
            playerWon(name)
            chatMessage("maxSize", string.name(p[name].name))
        elseif size < map.maxSize and size > 0 then 
            p[name].size = size
        elseif size < 0 then
            p[name].size = 0
        end
        if size < 1.5 then
            updateFoods(name, 0)
        elseif size > 1.5 and p[name].hight == 1 then 
            updateFoods(name, 1)
        elseif size > 3 and p[name].hight == 2 then 
            updateFoods(name, 2)
        end
        changeSize(name,p[name].size)
        addTextArea(900000,"<font size='20' color='#ffd991'><p align='center'><B>"..p[name].size, name, 690, 30, 100, 40, 0x01, 0x01, 0, true)
        if module.started then
            if p[name].size < 0.1 then 
                TFM.killPlayer(name)
                chatMessage("diedPoisoned", name)
            end
        end
        updateImage(name)
    end
end


function updateFoods(name, t)
    for i = 1, #module.foods do 
        local foodie = module.foods[i]
        if foodie then
            if not foodie.eaten then
                if t == 0 and p[name].hight >= 2 then
                    TFM.removeBonus(20000 + foodie.id)
                    TFM.removeBonus(30000 + foodie.id)
                    p[name].hight = 1
                elseif t == 1 then
                    if p[name].hight == 1 then 
                        TFM.addBonus(0, foodie.x, foodie.y - 28, 20000 + foodie.id, 0, false, name)
                        if i == #module.foods then 
                            p[name].hight = 2
                        end
                    end
                elseif t == 2 then
                    if p[name].hight == 2 then 
                        if i == #module.foods then 
                            p[name].hight = 3
                        end
                        TFM.addBonus(0, foodie.x, foodie.y-57, 30000 + foodie.id, 0, false, name)
                    end
                end
            end
        end
    end
end

function eventNewPlayer(name)
    inRoom = inRoom + 1
    p[name] = {name = name, imgPage = 1, img=nil, character = nil, cheeseMenuPage = 1, shield = false,win = false, color = nil, langue = GET.room.playerList[name].community, click = nil , hight = 1, size = 1, x = 0, y=0 , eaten = true}
    imgs[name] = {shield = nil, cheesemenu = nil, cheese = nil, sizeBanner = nil, profile = {}, helpMenu = {}, funcorp = {}, imgMenu={}, imgMenuCustomize = {}, symbols = {}, button={}, flag = {}}
    if not data[name] then 
        data[name] = {xp = 0, level = 1, avatar = 1, rounds = 0, miceEats = 0, wins = 0, funcorp = {colornickCooldown = nil, changenickCooldown = nil}}
    end
    updateSize(name,p[name].size)
    TFM.setPlayerScore(name,0)
    if module.lobby then
        TFM.respawnPlayer(name)
    end
    for _, k in pairs(module.keyboard_keys) do
        TFM.bindKeyboard(name, k, true,true)
        TFM.bindKeyboard(name, k, false,true)
	end
    TFM.chatMessage(string.format(translate("welcomeText",name), string.name(module.stuff.developer)), name)
    TFM.chatMessage(translate("points", name), name)
    checkLobby()
    funcorpStuffs(name , data[name].wins)
    updateImageForAll()
    button(1, name, "cheeseMenu", 760, 360, nil, "177b518549a.png")
    button(0, name, "help", 720, 360, nil, "1798139bf28.png")
    button(-1, name, "discord", 680, 360, nil, "1798139a7b9.png")   
    flagButton(name, p[name].langue , "openchangelangue", 765, 333) 
    if isAdmin(name) then
        adminsInterface(name)
    end
end

function getTranslatorsName(commu, name)
    local names = ""
    if module.stuff.translators[commu] then
        if table.length(module.stuff.translators[commu]) ~= 1 then
            for n,t in next, module.stuff.translators[commu] do
                if n ~= 1 then
                    names = names .. "<bl> " .. translate("and_word", name) .."</bl> ".. string.name(t)
                else
                    names = module.stuff.translators[commu][1]
                end
            end
        else
            names = module.stuff.translators[commu][1]
        end
    end
    return names
end

function eventChatCommand(name, mes)
    local cmd, u = {}, 1
    for i in string.gmatch(mes, "%S+") do
        cmd[u] = i
        u = u + 1
    end
    if cmd[1] == "lang" then
        if cmd[2] then
            if langue[cmd[2]] then
                p[name].langue = cmd[2]
                TFM.chatMessage(translate("changedLang",name), name)
                if module.stuff.translators[cmd[2]] then
                    TFM.chatMessage(string.format(translate("translatedBy",name), getTranslatorsName(cmd[2], name)), name)
                end
            else
                TFM.chatMessage("<R>[•] The module doesn't support this language.</R>", name)
            end
        else
            TFM.chatMessage("<R>[•] You should only type the language id only\nEX: <V> !lang <J>en</J></R>", name)
        end
    elseif cmd[1] == "help" or cmd[1] == "h" then
        helpMenu(name, 400, 230, "help")
    elseif cmd[1] == "foods" then 
        cheeseMenu(1, name)
    elseif cmd[1] == "profile" or cmd[1] == "p" then
        if cmd[2] == name or not cmd[2] then 
            showProfile(name, name)
        else
            if checkPlayerData(cmd[2]) then
                showProfile(cmd[2], name)
            end
        end
    elseif cmd[1] == "msg" and isAdmin(name) then
        TFM.chatMessage("<fc> • ["..string.name(name).."]</fc><n> "..mes:sub(4))
    elseif cmd[1] == "map" and isAdmin(name) then
        setMap()
    elseif cmd[1] == "admin" and isAdmin(name) then
        setAdmin(cmd[2])
    end
end

function isAdmin(name)
    local theyAre
    for _,admin in next, module.admins do
        if admin == name then
            theyAre = true
        end
    end
    if theyAre then return true else return false end
end

function adminsInterface(name)
    addButton(92, "\n\n", 5, 50, 50, 50, "normalMouse", name, "1789e8ac789.png")
    addButton(90, "<font color = '#ffd991'><b>"..translate("images", name), 5, 26, 110, 22, "openMenu", name, "1788d26ed0d.png", -7.5,-9)
end

function checkPlayerData(name)
    for p in next, data do
        if name == p then
            return true
        end
    end
end

function eventTextAreaCallback(id, name, cb)
    if cb == "cheeseMenu" then
        cheeseMenu(1, name)
    elseif cb == "closeCheeseMenu" then
        closeCheeseMenu(name)
    elseif cb == "closeProfile" then
        closeProfile(name)
    elseif cb == "closeHelp" then 
        closehelpMenu(name)
    elseif cb == "openchangelangue" then 
        openChangelanguage(name)
        flagButton(name, p[name].langue , "closechangelangue", 765, 333)
    elseif cb == "closechangelangue" then 
        closeChangeLangue(name)
        flagButton(name, p[name].langue , "openchangelangue", 765, 333)
    elseif cb == "nextCheese" then
        if p[name].cheeseMenuPage == #foodsTypes then p[name].cheeseMenuPage = 1 else p[name].cheeseMenuPage = p[name].cheeseMenuPage + 1 end
        cheeseMenu(p[name].cheeseMenuPage, name)
    elseif cb == "previousCheese" then 
        if p[name].cheeseMenuPage == 1 then p[name].cheeseMenuPage = #foodsTypes else p[name].cheeseMenuPage = p[name].cheeseMenuPage - 1 end
        cheeseMenu(p[name].cheeseMenuPage, name)
    elseif cb == "colorNick" then
        ui.showColorPicker(1, name, 0xFFFFFF, translate("colorNick", name))
    elseif cb == "changenick" then
        ui.addPopup(1, 2, "<font color='#ffd991'><p align='center'>"..translate("changenick", name), name, 325, 200, 150, true)
    elseif cb == "closeMenu" then 
        closeMenu(name)
    elseif cb == "openMenu" then
        openMenu(name, p[name].imgPage)
    elseif cb == "changesize" then
        ui.addPopup(1, 2, "<p align='center'><font color='#ffd991'>Change Size</font>\n (number 0.1 -> 5)", name, 325, 200, 150, true)
    elseif cb == "nextPage" then
        if p[name].imgPage == math.ceil(#images/6) then p[name].imgPage = 1 else p[name].imgPage = p[name].imgPage + 1 end
        openMenu(name, p[name].imgPage)
    elseif cb == "previousPage" then 
        if p[name].imgPage == 1 then p[name].imgPage = math.ceil(#images/6) else p[name].imgPage = p[name].imgPage - 1 end
        openMenu(name, p[name].imgPage)
    elseif cb == "yesStuck" then 
        stuck(name)
        removeStuckMenu(name, true)
    elseif cb == "noStuck" then 
        removeStuckMenu(name)
    elseif cb == "discord" then
        TFM.chatMessage(translate("word_soon", name), name)
    elseif cb == "normalMouse" then
        for _,player in next, p do 
            if player.img then 
                player.character = nil
                TFM.removeImage(player.img)
                TFM.chatMessage(translate("returnMice", player.name), player.name)
            end
        end
        setMap()
    else
        for _ ,callback in pairs({"help", "commands", "credits"}) do 
            if cb == callback then 
                helpMenu(name, 400, 230, callback)
            end
        end
        for pay in next,langue do 
            if cb == "changeto"..tostring(pay) then
                p[name].langue = pay 
                closeChangeLangue(name)
                flagButton(name, p[name].langue , "openchangelangue", 765, 333)
                TFM.chatMessage(translate("changedLang", name), name)
                    if module.stuff.translators[pay] then
                        TFM.chatMessage(string.format(translate("translatedBy",name), getTranslatorsName(pay, name)), name)
                    end
                funcorpStuffs(name, data[name].wins)
                if isAdmin(name) then
                    adminsInterface(name)
                end            
            end
        end    
        for i = 1, #images do 
            if cb == images[i][1] and isAdmin(name) then
                for _,player in next, p do 
                    local imgName = images[i][1]
                    if type(images[i][2]) ~= "table" then 
                        player.character = images[i]
                    else
                        player.character = images[i][2][math.random(#images[i][2])]
                        imgName =  player.character[1] .. " " .. imgName
                    end
                    updateImage(player.name)
                    TFM.chatMessage(string.format(translate("youAre", player.name), imgName), player.name)
                end
            end
        end
    end
end

function eventKeyboard(name,k,d)
    if k == 80 then
        showProfile(name, name)
    elseif k == 72 then
        helpMenu(name, 400, 230, "help")
    elseif k == 77 and d then 
        stuckMenu(name, 200, 150)
    elseif k == 0 and not p[name].eaten then
        p[name].facingLeft = true
        if d then 
            updateImage(name)
            playerSpeed(name, true)
        else
            playerSpeed(name, false)
        end
    elseif k == 2 and not p[name].eaten then
        p[name].facingLeft = false
        if d then 
            updateImage(name)
            playerSpeed(name, true)
        else
            playerSpeed(name, false)
        end
    end
    if not module.lobby then
        updateXY(name)
        if not p[name].click or p[name].click + 500 < os.time() then
            if k == 32 then
                eatMouse(name)
                p[name].click = os.time()
            end
        end
        if k == 16 then
            if d then 
                miceMenu(name, 0, 20)
            else
                removeMiceMenu(name)
            end
        end
    end
end

function eventPlayerBonusGrabbed(name, id)
    for i=1 , #module.foods do 
        local food = module.foods[i]
        if food then
            if not food.eaten then
                if id == food.id + 10000 or id == food.id + 20000 or id == food.id + 30000 then
                    food.eaten = true
                    TFM.removeImage(food.img)
                    removeFoodBounus(food.id)
                    if (food.type ~= 3 or food.type ~= 5) or ( (food.type == 3 or food.type == 5) and not p[name].shield) then
                        if map.maxSize == 2.5 then 
                            updateSize(name, p[name].size + food.calories/2)
                        else
                            updateSize(name, p[name].size + food.calories)
                        end
                    end
                    if food.type == 3 and not p[name].shield then
                        TFM.chatMessage(translate("poisonedApple", name), name)
                    elseif food.type == 4 then 
                        shield(name, 20)
                    elseif food.type == 5 then 
                        TFM.freezePlayer(name, true)
                        TFM.chatMessage(translate("eatFrozenCheese", name), name)
                        p[name].frozen = true
                        system.newTimer(function()
                            TFM.freezePlayer(name, false)   p[name].frozen = false
                        end, 5000, false)
                    elseif food.type == 7 then 
                        p[name].speed = true
                        if not imgs[name].symbols.speed then imgs[name].symbols.speed = TFM.addImage("178b30699f2.png", "$" .. name, #imgs[name].symbols*10 - 20, -60) end
                        TFM.chatMessage(string.format(translate("canRun", name), 25), name)
                        if p[name].endSpeedTimer then system.removeTimer(p[name].endSpeedTimer) end
                        p[name].endSpeedTimer = system.newTimer(function() p[name].speed = false TFM.chatMessage(translate("cantRunAnymore", name), name) TFM.removeImage(imgs[name].symbols.speed) imgs[name].symbols.speed = nil if p[name].speedTimer then system.removeTimer(p[name].speedTimer) p[name].speedTimer = false end  end, 25000, false)
                    end
                    if food.timer then system.removeTimer(food.timer) end
                    table.remove(module.foods,i)
                end
            end
        end
    end
end

function eventPlayerDied(name)
    if p[name] then
        if not p[name].stuck then 
            p[name].eaten = true
            alives_numbers = alives_numbers - 1
        end
        print("<rose>"..alives_numbers)
        if alives_numbers == 1 then
            for _,i in pairs(p) do 
                if  not i.eaten then 
                    playerWon(i.name)
                end
            end
        end
        if not module.started and alives_numbers == 0 then
            setMap()
        end
        removeTimaars(name)
    end
end

function eventPlayerLeft(name)
    inRoom = inRoom - 1
    checkLobby()
    removeTimaars(name)
    if p[name] then
        p[name] = nil
    end
end

function eventPlayerRespawn(name)
    if p[name].stuck then 
        p[name].stuck = false
    end
end

function eventPlayerWon(name)
    system.newTimer(function() setMap() end , 1000, false)
end

function eventColorPicked(id, name, color)
    local cooldown = data[name].funcorp.colornickCooldown
    if id == 1 then 
        if color>0 then
            if not cooldown or cooldown <= os.time() then
                TFM.chatMessage(string.format(translate("chosencolor", name), decToHex(color), decToHex(color)), name)
                adminMessage("<v>/colornick </v><j>"..name.."</j><font color='#"..decToHex(color).."'> #"..decToHex(color).."</j>")
                data[name].funcorp.colornickCooldown = os.time() + 120000
            else
                local seconds = math.ceil((tonumber(cooldown) - os.time()) / 1000)
                TFM.chatMessage(string.format(translate("waitAMoment", name), seconds), name)
            end
        else
            TFM.chatMessage("<R><b>[HungryMice]</b> ERROR.</R>",name)
        end
    end
end

function eventPopupAnswer(id , name, answer)
    local cooldown = data[name].funcorp.changenickCooldown
    if id == 1 and answer ~= "" then
        if not cooldown or cooldown <= os.time() then
            TFM.chatMessage(string.format(translate("chosenName", name), answer), name)
            adminMessage("<v>/changenick </v>"..name.." <j>"..answer.."</j>")
            data[name].funcorp.changenickCooldown = os.time() + 240000
        else
            local seconds = math.ceil((tonumber(cooldown) - os.time()) / 1000)
            TFM.chatMessage(string.format(translate("waitAMoment", name), seconds), name)
        end
    end
end

function openMenu(name ,page)
    local y = 50
    if not page then page = 1 end
    if imgs[name].imgMenu[1] then TFM.removeImage(imgs[name].imgMenu[1]) end
    addButton(100, "", 20, 65 + y, 40, 40, "previousPage", name)
    addButton(101, "", 745, 65 + y, 40, 40, "nextPage", name)
    addButton(102, "", 720, 10 + y, 30, 30, "closeMenu", name)
    imgs[name].imgMenu[1] = TFM.addImage("178982ce017.png", ":1", 0, y, name)
    if imgs[name].imgMenuCustomize then 
        for i = 1, #imgs[name].imgMenuCustomize do 
            TFM.removeImage(imgs[name].imgMenuCustomize[i])
        end
    end
    for i = 2, 7 do
        if imgs[name].imgMenu[i] then TFM.removeImage(imgs[name].imgMenu[i]) end
        local id = (page-1)*6 + (i - 1)
        removeButton(i - 1, name)
        if images[id] then
            local x, imageScale, img, xImage, yImage = 90 + 110 * (i - 2) , 0.25, images[id][2], images[id][3], images[id][4]
            addButton(i - 1, "<font color = '#ffd991' size = '10'>"..images[id][1], x, 108 + y, 80, 20, images[id][1], name)
            if type(images[id][2]) == "table" then img, xImage, yImage = images[id][2][1][2], images[id][2][1][3], images[id][2][1][4] imgs[name].imgMenuCustomize[#imgs[name].imgMenuCustomize+1] = TFM.addImage("178bda8cef5.png", "&444", x-10, y+40, name, 0.75, 0.75) end
            imgs[name].imgMenu[i] = TFM.addImage(img, ":" .. i, (x+40) - (xImage/4), y + 80 - (yImage/4), name, imageScale, imageScale)
        end
    end
end

function closeMenu(name)
    table.removeImages(imgs[name].imgMenuCustomize)
    for i = 1,7 do 
        removeButton(i, name)
        removeButton(99+i, name)
        if imgs[name].imgMenu[i] then 
            TFM.removeImage(imgs[name].imgMenu[i])
        end
    end
end

function table.removeImages(table)
    if type(table) == "table" then
        for i = 1, #table do
            TFM.removeImage(table[i])
        end
    end
end

function updateImage(name)
    if p[name].character then
        if p[name].img then TFM.removeImage(p[name].img) end
        local img = p[name].character 
        local xScale, yScale = p[name].size * 0.2 , p[name].size * 0.2  
        local mouseImg, x, y = img[2], (img[3]/5) * p[name].size , (img[4]/5) * p[name].size  
        if p[name].facingLeft then 
            xScale  = xScale * -1
            x = x * -1
        end
        p[name].img = TFM.addImage(mouseImg, "%" .. name , -x, -y, nil, xScale, yScale)
    end
    if p[name].shield then 
        if imgs[name].shield then 
            local size = p[name].size
            TFM.removeImage(imgs[name].shield)
            imgs[name].shield = TFM.addImage("178a24a75ea.png", "$"..name, (-155/4) * size, (-165/4) * size, nil, 0.25*size, 0.25*size)
        end
    elseif p[name].speed then 
        if imgs[name].symbols.speed then TFM.removeImage(imgs[name].symbols.speed) end
        imgs[name].symbols.speed = TFM.addImage("178b30699f2.png", "$" .. name, #imgs[name].symbols*10 - 20, -60)
    end
end

function updateImageForAll()
    for n in next,p do
        updateImage(n)
    end
end

function decToHex(color)
    local b,k,out,i,d=16,"0123456789ABCDEF","",0
	while color>0 do
		i=i+1 color,d=math.floor(color/b),color%b+1 out=string.sub(k,d,d)..out
	end
    return out
end

function playerWon(name)
    if p[name] and not module.lobby then
        if not p[name].eaten and not p[name].win then
            p[name].win = true
            data[name].wins = data[name].wins + 1 
            TFM.giveCheese(name)
            TFM.playerVictory(name)
            addXP(name, 5)
            funcorpStuffs(name, data[name].wins)
            chatMessage("wonRound", string.name(name))
        end
    end
end

function funcorpStuffs(name, score)
    TFM.setPlayerScore(name, score)
    if score >= 2 then 
        if not imgs[name].funcorp[1] then imgs[name].funcorp[1] = TFM.addImage("1788d26ed0d.png", ":10", 10, 375, name) end
        addTextArea(12, "<font color='#ffd991'><p align='center'><a href='event:colorNick'><B>"..translate("colorNick", name), name, 20, 382, 110, 40, 0x0, 0x0, 0, true)
    end
    if score >= 4 then
        if not imgs[name].funcorp[2] then imgs[name].funcorp[2] = TFM.addImage("1788d26ed0d.png", ":10", 138, 375, name) end
        addTextArea(13, "<font color='#ffd991'><p align='center'><a href='event:changenick'><B>"..translate("changenick", name), name, 130, 382, 140, 40, 0x0, 0x0, 0, true)
    end
end

function adminMessage(msg)
    for _,admin in next,module.admins do 
        TFM.chatMessage(msg, admin)
    end
end

local foodtime = 0 
function eventLoop(et,rt)
    if not module.lobby then
        if #module.foods < module.foodmax then
            foodtime = foodtime + 1 
            if foodtime == math.ceil(8/alives_numbers) or foodtime > math.ceil(8/alives_numbers) then
                food()
                foodtime = 0
            end
        end
        if rt < 1000 then
            playerWon(setwinnerByTime())
        elseif rt < 4000 and rt > 3400 then
            chatMessage("timeIsOver")
        end
    end
end

function Timer(theFunction, time)
    local s = 1000/time
    local timers = {}
    for t = 0, 1000 - s, s do
    local timer_id = system.newTimer(function () 
        table.insert(timers, system.newTimer(function() theFunction() end, 1000, true))
    end, 1000 + t, false)
        table.insert(timers, timer_id)
    end
    return timers
end

function removeTimers(timers)
    if timers then
        for i, timer in next, timers do
            system.removeTimer(timer)
        end
    end
end

main()
