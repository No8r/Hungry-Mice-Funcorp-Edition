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
    lobby = false ,
    lobby_animation = gifs[math.random(#gifs)],
    lobby_map = [[<C><P MEDATA="1,1;;;;-0;0:::1-"/><Z><S><S T="0" X="0" Y="0" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="5,5,177bc42833e.png"/><S T="14" X="401" Y="425" L="823" H="85" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="-42" Y="313" L="823" H="85" P="0,0,0,0,-90,0,0,0"/><S T="14" X="843" Y="302" L="823" H="85" P="0,0,0,0,-90,0,0,0"/><S T="14" X="417" Y="-43" L="889" H="85" P="0,0,0,0,-180,0,0,0"/></S><D><DS X="399" Y="368"/></D><O/><L/></Z></C>]],
    commands = {"lang","map", "profile", "p", "help", "h", "msg", "foods", "admin"},
    names = {},
    minium_player = 1 ,
    max_player = 30 , 
    started = false , 
    stuff = {
        developer = "Noooooooorr#0000",
        translators = {
            ["ar"] = "Noooooooorr#0000"
        }
    },
    keyboard_keys = {0,1,2,3,32,80,72},
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
        [1] = [[<C><P L="1600" H="800" F="-2" DS="m;353,740,801,742,1253,740,1191,464,803,468,421,462,569,196,1001,192" MEDATA=";;;;-0;0:::1-"/><Z><S><S T="2" X="779" Y="211" L="50" H="50" P="0,0,0,1.2,45,0,0,0"/><S T="2" X="1345" Y="488" L="120" H="54" P="0,0,0,2,0,0,0,0"/><S T="2" X="253" Y="490" L="120" H="59" P="0,0,0,2,0,0,0,0"/><S T="2" X="1531" Y="832" L="132" H="174" P="0,0,0,2,0,0,0,0"/><S T="2" X="999" Y="820" L="132" H="151" P="0,0,0,2,0,0,0,0"/><S T="2" X="605" Y="836" L="132" H="184" P="0,0,0,2,0,0,0,0"/><S T="2" X="66" Y="842" L="132" H="195" P="0,0,0,2,0,0,0,0"/><S T="6" X="800" Y="780" L="1600" H="44" P="0,0,0.3,0.2,0,0,0,0"/><S T="6" X="350" Y="500" L="320" H="48" P="0,0,0.3,0.2,0,0,0,0"/><S T="6" X="800" Y="230" L="800" H="48" P="0,0,0.3,0.2,0,0,0,0"/><S T="6" X="800" Y="500" L="200" H="48" P="0,0,0.3,0.2,0,0,0,0"/><S T="6" X="1250" Y="500" L="320" H="48" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="1005" Y="993" L="2030" H="382" P="0,0,0.3,0.2,0,0,0,0" o="6a7495" c="2" N=""/><S T="14" X="-140" Y="423" L="287" H="1073" P="0,0,0,0.2,0,0,0,0"/><S T="14" X="800" Y="-180" L="2107" H="160" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="1763" Y="405" L="333" H="1303" P="0,0,0,0.2,0,0,0,0"/></S><D><P X="247" Y="762" T="1" P="0,0"/><P X="787" Y="836" T="1" P="0,0"/><P X="734" Y="759" T="1" P="0,0"/><P X="291" Y="759" T="0" P="0,0"/><P X="1431" Y="758" T="5" P="0,0"/><P X="1519" Y="778" T="1" P="0,0"/><P X="1451" Y="850" T="1" P="0,0"/><P X="1274" Y="901" T="1" P="1,0"/><P X="484" Y="210" T="1" P="0,0"/><P X="1129" Y="251" T="1" P="0,1"/><P X="519" Y="208" T="12" P="0,0"/><P X="1369" Y="760" T="12" P="0,0"/><P X="645" Y="204" T="3" P="0,0"/><P X="866" Y="478" T="3" P="0,0"/><P X="1090" Y="208" T="3" P="0,0"/><P X="1277" Y="475" T="3" P="0,1"/><P X="211" Y="758" T="3" P="0,0"/><P X="724" Y="480" T="4" P="0,0"/><P X="426" Y="208" T="4" P="0,0"/><P X="436" Y="300" T="79" P="0,0"/><P X="486" Y="276" T="79" P="0,1"/><P X="429" Y="760" T="78" P="0,0"/><P X="370" Y="480" T="157" P="0,0"/><P X="487" Y="478" T="189" P="0,0"/><P X="876" Y="759" T="189" P="0,1"/><P X="1248" Y="481" T="1" P="0,0"/><P X="1132" Y="517" T="1" P="0,1"/><P X="1182" Y="567" T="79" P="0,0"/><P X="1155" Y="554" T="79" P="0,1"/><P X="793" Y="133" T="162" P="1,0"/><P X="930" Y="176" T="163" P="0,0"/></D><O><O X="800" Y="465" C="11" Mp="90" P="0"/><O X="414" Y="468" C="11" Mp="70" P="0"/><O X="1189" Y="464" C="11" Mp="70" P="0"/><O X="803" Y="745" C="11" Mp="90" P="0"/><O X="351" Y="745" C="11" Mp="110" P="0"/><O X="1253" Y="740" C="11" Mp="110" P="0"/><O X="572" Y="194" C="11" Mp="110" P="0"/><O X="1000" Y="196" C="11" Mp="110" P="0"/></O><L/></Z></C>]],
        [2] = [[<C><P L="1600" H="800" DS="m;314,732,579,732,1019,733,1295,732,1281,422,1026,420,670,161,926,161,583,423,329,423" MEDATA="1,1;;;;-0;0:::1-"/><Z><S><S T="2" X="1530" Y="845" L="140" H="208" P="0,0,0,2.5,0,0,0,0"/><S T="2" X="801" Y="796" L="140" H="131" P="0,0,0,2.5,0,0,0,0"/><S T="2" X="72" Y="773" L="140" H="73" P="0,0,0,2.5,0,0,0,0"/><S T="17" X="801" Y="777" L="1600" H="60" P="0,0,0.3,0.2,0,0,0,0"/><S T="2" X="450" Y="436" L="48" H="25" P="0,0,0,2.5,0,0,0,0"/><S T="14" X="-81" Y="375" L="163" H="908" P="0,0,0,0.2,0,0,0,0"/><S T="14" X="1682" Y="388" L="163" H="908" P="0,0,0,0.2,0,0,0,0"/><S T="2" X="1150" Y="436" L="48" H="25" P="0,0,0,2.5,0,0,0,0"/><S T="14" X="790" Y="-157" L="163" H="1783" P="0,0,0,0.2,90,0,0,0"/><S T="17" X="450" Y="461" L="520" H="50" P="0,0,0.3,0.2,0,0,0,0"/><S T="17" X="1150" Y="460" L="520" H="50" P="0,0,0.3,0.2,0,0,0,0"/><S T="17" X="800" Y="200" L="520" H="50" P="0,0,0.3,0.2,0,0,0,0"/></S><D><P X="261" Y="671" T="163" P="0,0"/><P X="1188" Y="708" T="162" P="1,1"/><P X="1463" Y="691" T="163" P="0,0"/><P X="220" Y="701" T="160" P="0,0"/><P X="333" Y="757" T="172" P="0,0"/><P X="409" Y="757" T="170" P="1,0"/><P X="367" Y="754" T="162" P="1,0"/><P X="687" Y="755" T="171" P="0,0"/><P X="608" Y="487" T="159" P="0,0"/><P X="607" Y="538" T="160" P="0,0"/><P X="538" Y="652" T="162" P="1,0"/><P X="1041" Y="745" T="169" P="0,0"/><P X="958" Y="746" T="168" P="0,0"/><P X="1336" Y="747" T="149" P="0,0"/><P X="913" Y="615" T="176" P="0,0"/><P X="1125" Y="341" T="175" P="0,0"/><P X="966" Y="89" T="177" P="0,0"/><P X="230" Y="183" T="175" P="0,1"/><P X="1496" Y="282" T="176" P="0,1"/><P X="589" Y="440" T="136" P="0,0"/><P X="541" Y="436" T="137" P="0,0"/><P X="271" Y="440" T="170" P="0,1"/><P X="1245" Y="436" T="171" P="0,0"/><P X="632" Y="176" T="165" C="B57435" P="0,0"/><P X="550" Y="125" T="162" P="0,0"/><P X="719" Y="82" T="163" P="0,0"/><P X="840" Y="139" T="162" P="0,0"/><P X="1043" Y="190" T="162" P="1,1"/><P X="1259" Y="483" T="171" P="0,1"/></D><O><O X="450" Y="734" C="11" Mp="28" P="0"/><O X="1153" Y="737" C="11" Mp="300" P="0"/><O X="581" Y="420" C="11" Mp="45" P="0"/><O X="327" Y="422" C="11" Mp="45" P="0"/><O X="1030" Y="421" C="11" Mp="45" P="0"/><O X="1280" Y="419" C="11" Mp="45" P="0"/><O X="930" Y="160" C="11" Mp="120" P="0"/><O X="670" Y="158" C="11" Mp="120" P="0"/></O><L/></Z></C>]],
        [3] = [[<C><P L="1600" H="800" DS="m;616,165,992,165,532,458,1059,463,1008,749,1267,749,533,749,312,749" MEDATA="5,1;;;;-0;0:::1-"/><Z><S><S T="1" X="800" Y="773" L="60" H="60" P="0,0,0,0.2,45,0,0,0"/><S T="1" X="800" Y="186" L="60" H="60" P="0,0,0,0.2,45,0,0,0"/><S T="2" X="81" Y="786" L="150" H="74" P="0,0,0,2,0,0,0,0"/><S T="2" X="864" Y="785" L="48" H="53" P="0,0,0,2,0,0,0,0"/><S T="2" X="734" Y="785" L="48" H="53" P="0,0,0,2,0,0,0,0"/><S T="2" X="1305" Y="492" L="150" H="49" P="0,0,0,2,0,0,0,0"/><S T="2" X="303" Y="493" L="150" H="49" P="0,0,0,2,0,0,0,0"/><S T="2" X="1524" Y="792" L="150" H="91" P="0,0,0,2,0,0,0,0"/><S T="11" X="800" Y="790" L="1600" H="50" P="0,0,0.05,0.1,0,0,0,0"/><S T="11" X="460" Y="500" L="480" H="50" P="0,0,0.05,0.1,0,0,0,0"/><S T="11" X="1143" Y="500" L="480" H="50" P="0,0,0.05,0.1,0,0,0,0"/><S T="11" X="800" Y="206" L="720" H="50" P="0,0,0.05,0.1,0,0,0,0"/><S T="14" X="-171" Y="370" L="345" H="980" P="0,0,0,0,0,0,0,0"/><S T="14" X="1774" Y="388" L="345" H="980" P="0,0,0,0,0,0,0,0"/><S T="14" X="1029" Y="-292" L="345" H="2345" P="0,0,0,0,-90,0,0,0"/><S T="11" X="800" Y="501" L="80" H="50" P="0,0,0,0.2,0,0,0,0"/></S><D><P X="353" Y="813" T="144" P="0,0"/><P X="274" Y="768" T="144" P="0,0"/><P X="272" Y="768" T="182" P="0,0"/><P X="359" Y="767" T="182" P="0,0"/><P X="196" Y="767" T="212" P="0,0"/><P X="428" Y="765" T="212" P="0,1"/><P X="506" Y="181" T="140" P="0,0"/><P X="682" Y="180" T="143" P="0,0"/><P X="612" Y="764" T="143" P="0,0"/><P X="1192" Y="474" T="190" P="0,0"/><P X="468" Y="765" T="186" P="0,0"/><P X="673" Y="767" T="198" P="0,0"/><P X="673" Y="735" T="202" P="0,0"/><P X="976" Y="501" T="144" P="0,0"/><P X="450" Y="518" T="144" P="0,0"/><P X="913" Y="183" T="208" P="0,0"/><P X="621" Y="478" T="142" P="0,0"/><P X="1052" Y="495" T="212" P="0,0"/><P X="1251" Y="769" T="181" P="0,0"/><P X="1162" Y="770" T="181" P="0,0"/><P X="1347" Y="781" T="144" P="0,0"/><P X="1118" Y="476" T="194" P="0,0"/><P X="975" Y="187" T="194" P="0,1"/><P X="1082" Y="763" T="212" P="0,0"/><P X="448" Y="339" T="207" P="0,0"/></D><O><O X="432" Y="750" C="11" Mp="270" P="0"/><O X="1144" Y="750" C="11" Mp="270" P="0"/><O X="532" Y="463" C="11" Mp="170" P="0"/><O X="1062" Y="464" C="11" Mp="170" P="0"/><O X="618" Y="169" C="11" Mp="140" P="0"/><O X="997" Y="169" C="11" Mp="140" P="0"/></O><L/></Z></C>]],
        [4] = [[<C><P L="1600" H="800" DS="m;553,237,1048,236,1073,485,516,485,448,732,1148,732,1444,732,162,732" MEDATA=";;;;-0;0:::1-"/><Z><S><S T="2" X="227" Y="509" L="140" H="41" P="0,0,0,2.5,0,0,0,0"/><S T="9" X="799" Y="378" L="94" H="754" P="0,0,0,0,0,0,0,0"/><S T="2" X="1528" Y="767" L="140" H="71" P="0,0,0,2.5,0,0,0,0"/><S T="2" X="72" Y="768" L="140" H="70" P="0,0,0,2.5,0,0,0,0"/><S T="18" X="800" Y="776" L="1600" H="60" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="2" X="1377" Y="507" L="136" H="45" P="0,0,0,2.5,0,0,0,0"/><S T="18" X="451" Y="518" L="600" H="39" P="0,0,0.3,0.2,0,0,0,0"/><S T="14" X="-81" Y="375" L="163" H="908" P="0,0,0,0.2,0,0,0,0"/><S T="14" X="1682" Y="388" L="163" H="908" P="0,0,0,0.2,0,0,0,0"/><S T="18" X="1150" Y="515" L="600" H="39" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="799" Y="391" L="95" H="782" P="0,0,0.3,0.2,0,0,0,0" o="B03C73" c="4"/><S T="14" X="787" Y="-80" L="163" H="1783" P="0,0,0,0.2,90,0,0,0"/><S T="18" X="552" Y="270" L="400" H="39" P="0,0,0.3,0.2,0,0,0,0"/><S T="18" X="1047" Y="270" L="400" H="39" P="0,0,0.3,0.2,0,0,0,0"/></S><D><P X="189" Y="747" T="148" P="0,0"/><P X="270" Y="796" T="148" P="0,1"/><P X="394" Y="731" T="162" P="1,0"/><P X="553" Y="686" T="163" P="0,0"/><P X="673" Y="748" T="148" P="0,1"/><P X="956" Y="785" T="148" P="0,1"/><P X="1022" Y="750" T="148" P="0,0"/><P X="1312" Y="794" T="148" P="0,0"/><P X="1353" Y="495" T="148" P="0,0"/><P X="1292" Y="532" T="148" P="0,0"/><P X="668" Y="500" T="148" P="0,0"/><P X="312" Y="528" T="148" P="0,1"/><P X="655" Y="526" T="148" P="0,1"/><P X="582" Y="513" T="162" P="1,0"/><P X="425" Y="459" T="162" P="1,1"/><P X="1066" Y="450" T="162" P="1,1"/><P X="1188" Y="708" T="162" P="1,1"/><P X="920" Y="485" T="163" P="0,0"/><P X="1463" Y="691" T="163" P="0,0"/><P X="147" Y="395" T="163" P="0,0"/><P X="443" Y="207" T="160" P="0,0"/><P X="220" Y="701" T="160" P="0,0"/><P X="1330" Y="704" T="160" P="0,0"/><P X="1177" Y="252" T="193" P="0,0"/><P X="927" Y="252" T="148" P="0,0"/><P X="962" Y="284" T="148" P="0,1"/><P X="899" Y="208" T="160" P="0,0"/><P X="617" Y="269" T="162" P="1,1"/><P X="534" Y="253" T="163" P="0,0"/><P X="702" Y="255" T="69" P="0,0"/></D><O><O X="551" Y="238" C="11" Mp="190" P="0"/><O X="1046" Y="237" C="11" Mp="190" P="0"/><O X="1078" Y="481" C="11" Mp="190" P="0"/><O X="517" Y="487" C="11" Mp="200" P="0"/><O X="447" Y="734" C="11" Mp="300" P="0"/><O X="1153" Y="737" C="11" Mp="300" P="0"/></O><L/></Z></C>]],
        [5] = [[<C><P L="1600" H="800" F="-2" DS="m;300,212,400,215,500,215,395,462,492,463,291,463,1083,212,1200,214,1316,214,1074,463,1197,462,1309,465,101,752,301,755,514,752,973,754,1246,752,1479,755" MEDATA=";;;;-0;0::0,1,2,3,4,5,6,7,8,0,0,0,0:1-"/><Z><S><S T="9" X="800" Y="758" L="180" H="120" P="0,0,0,0,0,0,0,0"/><S T="6" X="403" Y="500" L="400" H="50" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="5" X="1009" Y="645" L="77" H="266" P="0,0,0.3,0.2,-10,0,0,0" c="4"/><S T="5" X="591" Y="647" L="77" H="269" P="0,0,0.3,0.2,10,0,0,0" c="4"/><S T="19" X="800" Y="748" L="40" H="40" P="0,0,0.3,0,0,0,0,0" N=""/><S T="12" X="1590" Y="393" L="20" H="781" P="1,0,2,0.2,90,0,0,0" o="4F3A31"/><S T="12" X="10" Y="396" L="20" H="795" P="1,0,2,0.2,90,0,0,0" o="4F3A31"/><S T="6" X="800" Y="837" L="1600" H="140" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="12" X="10" Y="401" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="FFFFFF"/><S T="12" X="10" Y="405" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="4F3A31"/><S T="12" X="10" Y="600" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="FFFFFF"/><S T="12" X="10" Y="605" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="4F3A31"/><S T="12" X="10" Y="200" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="FFFFFF"/><S T="12" X="10" Y="205" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="4F3A31"/><S T="12" X="1590" Y="400" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="FFFFFF"/><S T="12" X="1590" Y="405" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="4F3A31"/><S T="12" X="1590" Y="600" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="FFFFFF"/><S T="12" X="1590" Y="605" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="4F3A31"/><S T="12" X="1590" Y="200" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="FFFFFF"/><S T="12" X="1590" Y="205" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="4F3A31"/><S T="14" X="798" Y="-71" L="1604" H="148" P="0,0,0.3,0.2,0,0,0,0"/><S T="6" X="1200" Y="500" L="400" H="50" P="0,0,0.3,0.2,0,0,0,0"/><S T="6" X="400" Y="250" L="400" H="50" P="0,0,0.3,0.2,0,0,0,0"/><S T="2" X="616" Y="508" L="70" H="31" P="0,0,0,2,0,0,0,0" N=""/><S T="6" X="1200" Y="250" L="400" H="50" P="0,0,0.3,0.2,0,0,0,0"/><S T="15" X="742" Y="519" L="80" H="10" P="0,0,0,0,0,0,0,0"/><S T="6" X="615" Y="512" L="80" H="25" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="6" X="800" Y="252" L="40" H="50" P="0,0,0.3,0.2,0,0,0,0"/><S T="2" X="985" Y="508" L="70" H="31" P="0,0,0,2,0,0,0,0" N=""/><S T="6" X="985" Y="512" L="80" H="25" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="6" X="400" Y="577" L="120" H="22" P="0,0,0.1,0.2,-10,0,0,0" N=""/><S T="5" X="417" Y="676" L="119" H="225" P="0,0,0.3,0.2,-10,0,0,0" c="4"/><S T="5" X="1140" Y="699" L="120" H="228" P="0,0,0.3,0.2,0,0,0,0" c="4"/><S T="6" X="231" Y="573" L="80" H="22" P="0,0,0.3,0.2,10,0,0,0" N=""/><S T="5" X="212" Y="684" L="80" H="206" P="0,0,0.3,0.2,10,0,0,0" c="4"/><S T="6" X="957" Y="556" L="80" H="22" P="0,0,0.3,0.2,10,0,0,0" N=""/><S T="5" X="937" Y="670" L="81" H="215" P="0,0,0.3,0.2,10,0,0,0" c="4"/><S T="6" X="1141" Y="578" L="120" H="22" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="6" X="1348" Y="578" L="160" H="22" P="0,0,0.3,0.2,-10,0,0,0" N=""/><S T="5" X="1367" Y="688" L="160" H="243" P="0,0,0.3,0.2,-10,0,0,0" c="4"/><S T="15" X="854" Y="519" L="80" H="10" P="0,0,0,0,0,0,0,0"/></S><D><P X="306" Y="478" T="181" P="0,0"/><P X="258" Y="480" T="1" P="0,0"/><P X="1357" Y="232" T="1" P="0,0"/><P X="561" Y="302" T="79" P="0,0"/><P X="552" Y="323" T="79" P="0,1"/><P X="1080" Y="320" T="79" P="0,1"/><P X="1031" Y="314" T="79" P="0,0"/><P X="1057" Y="229" T="78" P="0,0"/><P X="1117" Y="571" T="228" P="0,0"/><P X="211" Y="559" T="222" P="0,0"/><P X="263" Y="354" T="221" P="0,0"/><P X="159" Y="769" T="211" P="0,0"/><P X="265" Y="769" T="211" P="0,0"/><P X="359" Y="770" T="211" P="0,0"/><P X="310" Y="779" T="211" P="0,0"/><P X="258" Y="730" T="220" P="0,0"/><P X="633" Y="885" T="1" P="1,0"/><P X="507" Y="790" T="1" P="1,0"/><P X="1242" Y="861" T="1" P="1,0"/><P X="1146" Y="906" T="1" P="1,0"/><P X="288" Y="573" T="79" P="0,0"/><P X="251" Y="552" T="79" P="0,1"/><P X="395" Y="478" T="181" P="0,0"/><P X="1335" Y="476" T="185" P="0,0"/><P X="430" Y="478" T="228" P="0,0"/><P X="1241" Y="476" T="193" P="0,0"/><P X="266" Y="225" T="193" P="0,1"/><P X="349" Y="225" T="157" P="0,0"/><P X="411" Y="224" T="230" P="0,0"/><P X="486" Y="368" T="219" P="0,0"/><P X="829" Y="622" T="219" P="0,1"/><P X="320" Y="111" T="219" P="0,1"/><P X="1228" Y="163" T="219" P="0,1"/><P X="1307" Y="407" T="220" P="0,0"/><P X="800" Y="236" T="1" P="0,0"/><P X="486" Y="226" T="3" P="0,0"/><P X="1089" Y="474" T="3" P="0,0"/><P X="668" Y="366" T="154" P="0,0"/><P X="876" Y="415" T="155" P="0,0"/><P X="1028" Y="355" T="156" P="0,0"/></D><O><O X="400" Y="215" C="11" Mp="190" P="0"/><O X="1200" Y="215" C="11" Mp="190" P="0"/><O X="1200" Y="463" C="11" Mp="190" P="0"/><O X="399" Y="465" C="11" Mp="190" P="0"/><O X="400" Y="757" C="11" Mp="350" P="0"/><O X="1201" Y="756" C="11" Mp="350" P="0"/></O><L><JD c="000000,80,0.4,1" M1="1" M2="1" P1="611.36,534.79" P2="574.75,744.61"/><JD c="000000,80,0.4,1" M1="1" M2="1" P1="990.45,541.16" P2="1024.75,741.89"/><JD c="000000,120,0.4,1" M1="1" M2="1" P1="408.79,629" P2="443.3,833.26"/><JD c="000000,80,0.4,1" M1="1" M2="1" P1="226.72,602.06" P2="190.11,811.89"/><JD c="000000,80,0.4,1" M1="1" M2="1" P1="951.43,586.16" P2="914.11,794.56"/><JD c="000000,60,0.4,1" M1="1" M2="1" P1="1111.28,598.66" P2="1108.08,794.39"/><JD c="000000,60,0.4,1" M1="1" M2="1" P1="1171.22,601.16" P2="1168.02,796.89"/><JD c="000000,80,0.4,1" M1="1" M2="1" P1="1315.14,624.58" P2="1346.56,820.31"/><JD c="000000,80,0.4,1" M1="1" M2="1" P1="1392.84,602.7" P2="1424.25,798.43"/><JP M1="5" AXIS="-1,0" MV="Infinity,33.333333333333336"/><JP M1="5" AXIS="0,1"/><JP M1="6" AXIS="-1,0" MV="Infinity,33.333333333333336"/><JP M1="6" AXIS="0,1"/></L></Z></C>]],
        [6] = [[<C><P L="1600" H="800" F="-2" DS="m;499,185,681,185,917,182,1084,183,300,463,500,462,1100,463,1300,462,800,755,650,755,950,755,1100,755,1300,752,500,752,281,752" MEDATA=";;;5,1;-0;0::0,1,2,3,4,5,6,7,8,9,10,11,0,0,0,0:1-"/><Z><S><S T="5" X="922" Y="387" L="32" H="23" P="0,0,0.05,0.1,150,0,0,0"/><S T="2" X="922" Y="375" L="29" H="32" P="0,0,0,2,0,0,0,0"/><S T="5" X="827" Y="327" L="60" H="23" P="0,0,0.05,0.1,160,0,0,0"/><S T="12" X="1590" Y="393" L="20" H="781" P="1,0,2,0.2,90,0,0,0" o="A1DDFF"/><S T="12" X="10" Y="396" L="20" H="795" P="1,0,2,0.2,90,0,0,0" o="A1DDFF"/><S T="11" X="800" Y="837" L="1600" H="140" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="12" X="10" Y="401" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="FFFFFF"/><S T="12" X="10" Y="405" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="A1DDFF"/><S T="12" X="10" Y="600" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="FFFFFF"/><S T="12" X="10" Y="605" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="A1DDFF"/><S T="12" X="10" Y="200" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="FFFFFF"/><S T="12" X="10" Y="205" L="12" H="12" P="0,0,0.3,0.2,45,0,0,0" o="A1DDFF"/><S T="12" X="1590" Y="400" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="FFFFFF"/><S T="12" X="1590" Y="405" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="A1DDFF"/><S T="12" X="1590" Y="600" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="FFFFFF"/><S T="12" X="1590" Y="605" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="A1DDFF"/><S T="12" X="1590" Y="200" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="FFFFFF"/><S T="12" X="1590" Y="205" L="12" H="12" P="0,0,0.3,0.2,-45,0,0,0" o="A1DDFF"/><S T="14" X="798" Y="-153" L="1604" H="148" P="0,0,0.3,0.2,0,0,0,0"/><S T="1" X="800" Y="782" L="400" H="31" P="0,0,0,0.2,0,0,0,0" N=""/><S T="9" X="800" Y="173" L="164" H="100" P="0,0,0,0,0,0,0,0"/><S T="11" X="400" Y="500" L="400" H="46" P="0,0,0.05,0.1,0,0,0,0"/><S T="11" X="1200" Y="500" L="400" H="46" P="0,0,0.05,0.1,0,0,0,0"/><S T="19" X="800" Y="200" L="80" H="82" P="0,0,0.3,0,0,0,0,0" N=""/><S T="14" X="-119" Y="-211" L="277" H="427" P="0,0,0,0.2,0,0,0,0"/><S T="11" X="800" Y="222" L="720" H="46" P="0,0,0.05,0.1,0,0,0,0" N=""/><S T="14" X="1689" Y="-168" L="224" H="348" P="0,0,0,0.2,0,0,0,0"/><S T="10" X="553" Y="701" L="80" H="263" P="0,0,0.3,0,10,0,0,0" c="4"/><S T="10" X="263" Y="713" L="160" H="220" P="0,0,0.3,0,7,0,0,0" c="4"/><S T="10" X="1346" Y="678" L="160" H="241" P="0,0,0.3,0,-6,0,0,0" c="4"/><S T="10" X="415" Y="679" L="120" H="238" P="0,0,0.3,0,0,0,0,0" c="4"/><S T="10" X="274" Y="598" L="160" H="28" P="0,0,0.3,0,7,0,0,0" N=""/><S T="10" X="986" Y="567" L="120" H="20" P="0,0,0.3,0,4,0,0,0" N=""/><S T="5" X="778" Y="325" L="68" H="24" P="0,0,0.05,0.1,200,0,0,0"/><S T="10" X="979" Y="673" L="120" H="233" P="0,0,0.3,0,4,0,0,0" c="4"/><S T="10" X="1128" Y="601" L="120" H="20" P="0,0,0.3,0,0,0,0,0" N=""/><S T="10" X="1128" Y="690" L="120" H="198" P="0,0,0.3,0,0,0,0,0" c="4"/><S T="10" X="1334" Y="568" L="160" H="20" P="0,0,0.3,0,-6,0,0,0" N=""/><S T="11" X="800" Y="314" L="120" H="23" P="0,0,0.05,0.1,0,0,0,0"/><S T="2" X="614" Y="509" L="57" H="28" P="0,0,0,2,0,0,0,0"/><S T="11" X="615" Y="512" L="80" H="26" P="0,0,0.05,0.1,0,0,0,0"/><S T="11" X="923" Y="378" L="40" H="26" P="0,0,0.05,0.1,0,0,0,0"/><S T="10" X="415" Y="561" L="120" H="28" P="0,0,0.3,0,-3,0,0,0" N=""/><S T="10" X="574" Y="580" L="80" H="28" P="0,0,0.3,0,7,0,0,0" N=""/></S><D><P X="1506" Y="767" T="51" P="0,0"/><P X="1275" Y="488" T="144" P="0,0"/><P X="489" Y="768" T="212" P="0,0"/><P X="153" Y="767" T="212" P="0,0"/><P X="243" Y="479" T="208" P="0,0"/><P X="939" Y="201" T="194" P="0,0"/><P X="1011" Y="201" T="186" P="0,0"/><P X="1341" Y="479" T="190" P="0,0"/><P X="332" Y="900" T="51" P="1,0"/><P X="1235" Y="812" T="51" P="0,0"/><P X="1116" Y="886" T="51" P="1,0"/><P X="657" Y="768" T="140" P="0,0"/><P X="780" Y="766" T="143" P="0,0"/><P X="817" Y="766" T="143" P="0,0"/><P X="611" Y="637" T="156" P="0,0"/><P X="844" Y="562" T="154" P="0,0"/><P X="669" Y="416" T="155" P="0,0"/><P X="507" Y="203" T="144" P="0,0"/><P X="1036" Y="325" T="154" P="0,1"/><P X="717" Y="204" T="182" P="0,0"/><P X="627" Y="205" T="182" P="0,0"/><P X="537" Y="205" T="182" P="0,0"/><P X="281" Y="595" T="149" P="0,0"/><P X="1127" Y="593" T="149" P="0,0"/><P X="1134" Y="479" T="198" P="0,1"/><P X="1136" Y="447" T="202" P="0,1"/><P X="1256" Y="772" T="212" P="0,0"/><P X="1467" Y="769" T="212" P="0,1"/><P X="777" Y="381" T="79" P="0,0"/><P X="831" Y="379" T="79" P="0,1"/><P X="782" Y="316" T="212" P="0,0"/><P X="510" Y="481" T="144" P="0,0"/><P X="1300" Y="766" T="142" P="1,0"/><P X="738" Y="280" T="220" P="0,0"/></D><O><O X="400" Y="470" C="11" Mp="190" P="0"/><O X="1200" Y="470" C="11" Mp="190" P="0"/><O X="400" Y="755" C="11" Mp="390" P="0"/><O X="1200" Y="755" C="11" Mp="390" P="0"/><O X="1000" Y="190" C="11" Mp="140" P="0"/><O X="600" Y="190" C="11" Mp="140" P="0"/></O><L><JD c="000000,40,0.4,1" P1="552.66,589.37" P2="513.77,792.7"/><JD c="000000,40,0.4,1" P1="592.13,595.12" P2="553.24,798.45"/><JD c="000000,60,0.4,1" P1="386.6,581.47" P2="385.61,805.55"/><JD c="000000,60,0.4,1" P1="446.11,582.66" P2="445.48,805.69"/><JD c="000000,80,0.4,1" P1="312.88,633.85" P2="293.99,791.09"/><JD c="000000,80,0.4,1" P1="234.17,619.24" P2="215.29,776.48"/><JD c="000000,60,0.4,1" P1="955.51,586.13" P2="941.48,765.75"/><JD c="000000,60,0.4,1" P1="1014.85,591.47" P2="1000.82,771.08"/><JD c="000000,60,0.4,1" P1="1099.29,622.58" P2="1096.37,801.08"/><JD c="000000,60,0.4,1" P1="1159.29,621.47" P2="1156.37,799.97"/><JD c="000000,80,0.4,1" P1="1299.29,603.83" P2="1317.62,776.08"/><JD c="000000,80,0.4,1" P1="1378.04,595.08" P2="1396.37,767.33"/><JP M1="3" AXIS="-1,0" MV="Infinity,33.333333333333336"/><JP M1="3" AXIS="0,1"/><JP M1="4" AXIS="-1,0" MV="Infinity,33.333333333333336"/><JP M1="4" AXIS="0,1"/></L></Z></C>]],
    },
}

local images = {
    {"Skeleton", "1789e6b9058.png", 122.5, 170},
    {"Rabbit", "178a763048a.png", 105, 220},
    {"Kangaroo", "178a8fd60a4.png", 132.5, 190},
    {"Dora Mouse", "178ab77286f.png", 140, 190},
    {"Creepy Cupid", "178a8eedcd1.png", 161.5, 175},
    {"Chicken", "1789e74c570.png", 135, 170},
    {"Scarecrow", "1789e83df76.png", 135, 170},
    {"Fish", "17897d80b92.png", 50, 150},
    {"Crazy SpongePop", "178a7684993.png", 143, 170},
    {"Patrick", "178a8cc2fa2.png", 113.5, 190},
    {"Spiderman", "1789d2c38cf.png", 74, 170},
    {"Dora", "1789d45e0a4.png", 117, 170},
    {"Jerry", "17898047f7a.png", 92.5, 160},
    {"Triangle Jerry", "1789e5aece6.png", 150, 155},
    {"Standing Jerry", "1789e6216c4.png", 98, 170},
    {"Cardi b", "178a8c50903.png", 171.5, 175},
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



        food_type1 = "جبنة عادية",
        food_type2 = "فراولة",
        food_type3 = "جبنة مسممة",
        food_type4 = "جبنة الدرع",
        food_type5 = "جبنة التجميد",
        food_type6 = "فراولة ذهبية",
        food_type7 = "جبنة قوس قزح",

        details_food_type1 = "قطعة جبن عادية لذيذة لكنها غير كافية لإشباعك",
        details_food_type2 = "الطعام المفضل لدى الفئران فهي تعادل 6 أضعاف الجبنة العادية",
        details_food_type3 = "إحترس هذه الجبنة تحتوي على سم قادر على إنقاص وزنك\n<R><font size='10'>قد تؤدي إلى موتك في حال كان حجم فأرك أقل من اللازم</R>",
        details_food_type4 = "تعطيك درع لمدة 20 ثانية، تعتبر من أندر الجبنات الموجودة",
        details_food_type5 = "فأرك لا يمكنه تحمل هذه الجبنة\n فبمجرد أكلها ستجمدك لمدة 5 ثوان",
        details_food_type6 = "!أندر طعام موجود\n تجعل فأرك ينمو بسرعة",
        details_food_type7 = "!توقف الجميع لمدة ثانية\n!!و تجعلهم يرقصون",

        images   = "صور",
        help = "المساعدة",
        credits = "الائتمانات",
        commands = "الإيعازات",
        news = "الجديد",
        help_help = "<p align='center'><B><V>!الفئران الجائعة</V> مرحبًا بك في</B></p>\n<p align='right'><font color='#ffd991'><B>كيف يمكنني لعب هذا النمط؟</B></font>\nهدفك هو أن تصبح أكبر من خلال تناول الأطعمة على الأرض وبعد ثلاثين ثانية يمكن للفئران أن تأكل بعضها البعض عن طريق الضغط على زر المسافة ، لكن يمكنهم فقط أكل الفئران الأصغر منهم ، والفأر الذي أكل جميع الفئران سيفوز ، أو إذا انتهى الوقت ، يفوز أكبر واحد\n\n<font color='#ffd991'><B>كيف يمكنني معرفة أنواع الطعام؟</B></font>\n<a href='event:cheeseMenu'><font color='#ffd991'>هنا</font></a> يمكنك النقر على أيقونة الجبن في حافة الشاشة أو النقر",
        help_commands = "\n<font color='#ffd991'><B><p align='right'>:الإيعازات المتوفرة</p></B></font>\n • <v>!profile</v> <g>[اسم اللاعب]</g> : إظهار ملف اسم اللاعب\n • <v>!lang</v> <g>[رمز اللغة]</g> : تغيير لغة النمط\n • <v>!help</v> : فتح قائمة المساعدة \n\n<font color='#ffd991'><B><p align='right'>:اختصارات لوحة المفاتيح</p></B></font>\n• <v>P</v> : إظهار ملفك الشخصي \n• <v>H</v> : فتح قائمة المساعدة",
        help_credits = "<font size='12'><p align='right'><v>Noooooooorr</v><g><font size='9'>#0000</font></g>:تم صنع هذا النمط بواسطة",
        wins = "%s : مرات الفوز",
        rounds = "%s : الجولات",
        eatenMice = "%s : الفئران المأكولة",

        points      = "<rose> لتتمكن من تغيير لون اسمك يجب أن تفوز بجولتان • \n و لتغيير اسمك (مؤقتا) يجب أن تفوز 5 جولات • </rose>",
        colorNick   = "لون الاسم",
        changenick  = "تغيير الاسم",
        chosencolor = "<fc>في الجولة القادمة <font color='#%s'>#%s</font> سيتغير لون اسمك إلى [•]</fc>",
        chosenName  = "<fc>في الجولة القادمة <r>%s</r> سيتغير اسمك إلى</fc>",
        waitAMoment = "<fc>عليك الإنتظار لمدة %s ثانية لتتمكن من الطلب مرة أخرى [•]",
        youRadmin   = "<J>!أنت الآن مسؤول عن الغرفة<J>",
        youAre      = "<fc>!<b>%s</b> أنتم الآن</fc>",
        returnMice  = "<fc>لقد عدت إلى فأر طبيعي</fc>",

    },
    en = {
        welcomeText = "<J><B>Welcome to <V>Hungry Mice</V>!</J></B>\nFor move informations you can press <J><rose>[H]</rose>\n or type <rose>!help</rose>, <rose>!h</rose></J>\n\n<BL>This module was programmed by: <FC>%s</FC></BL>",
        canEatMice = "<%s>The mice can eat each other now!</%s>",
        wonRound = "<V>%s</V> won the round!",
        eatPlayer = "<V>%s</V> was eaten by <V>%s</V>.",
        eatsYou = "<V>%s</V> eats you!",
        poisonedApple = "<R>You ate a poisoned cheese!</R>",
        diedPoisoned = "<V>%s</V> <R>died poisoned.</R>",
        maxSize = "<V>%s</V> <J>reached the maximum size!</J>",
        changedLang = "<J>The language has changed successfully.</J>",
        changeLang = "<rose>You can change your lang by typing !lang [ID] \nAvailable languages : <J>ar</J><g>(العربية)</g>, <J>en</J><g>(English)</g> and <J>fr</J><g>(Française)</g> </rose>",
        translatedBy = "Translated into English by: <CH>%s</CH>",
        haveShield = "<V>%s</V> <BV>has a shield that you can't eat.</BV>",
        byeShield = "<BV>The shield will disappear after <N>%s</N> secounds!</BV>",
        theMaxSizeForMice = "<N>Maximum size for mice:</N> <V>%s</V>",
        eatFrozenCheese = "<R>You have eaten frozen cheese, it will freeze you for 5 seconds!</R>",
        timeIsOver = "<J>Time's over! the biggest mouse will win.</J>",
        specialEffect = "Special effect",
        waitPlayers = "Waiting players ...",
        freezAll = "<r>All the player got freezed for a second because %s ate a Rainbow Cheese!!</r>",

        food_type1 = "Normal Cheese",
        food_type2 = "Strawberry",
        food_type3 = "Poisoned cheese",
        food_type4 = "Shield cheese",
        food_type5 = "Freezing cheese",
        food_type6 = "<font size='18'>Golden Strawberry</font>",
        food_type7 = "Rainbow Cheese",

        details_food_type1 = "A normal piece of cheese, it's delicious, but not enough to satisfy you",
        details_food_type2 = "Mice's favorite food, equivalent to 6 times the normal cheese",
        details_food_type3 = "Watch out! this cheese contains toxin that is able to lose your extra weight\n<R><font size='10'>It may result in your death if your mouse is under-sized.",
        details_food_type4 = "It gives you a shield for 20 seconds, which is one of the rarest cheeses.",
        details_food_type5 = "Your mouse cannot stand this cheese, so once you eat it it'll freeze your mouse for 5 seconds.",
        details_food_type6 = "The rarest food ever!\nMakes your mouse grow faster!",
        details_food_type7 = "Stops everyone for a second!\n And makes them dance!!",

        images   = "Images",
        help     = "Help",
        credits  = "Credits",
        commands = "Commands",
        news     = "News",

        help_help     = "<p align='center'><B>Welcome to <V>Hungry Mice</V>!</B></p>\n<font color='#ffd991'><B>How can I play this module?</B></font>\nYour goal is to get bigger by eating the foods on the ground and after 30 secounds the mice can eat each others by press <font color='#ffd991'>SPACE</font>, but they can only eat the mice which is smaller than them , the mouse which eats all the mice will win, or if the time's end the biggest one win!.\n\n<font color='#ffd991'><B>How can I know the types of food?</B></font>\n You can click on the cheese icon in the edge of screen or click <a href='event:cheeseMenu'><font color='#ffd991'>here</font></a> or type <font color='#ffd991'>!foods.</font>",
        help_credits  = "<font size='12'>This module was made by <v>Noooooooorr</v></font><g><font size='9'>#0000</font><</g>\n\n<font size='12'><font color='#ffd991'><B>Translated by:</B></font>",
        help_commands = "\n<font color='#ffd991'><B>Available commands:</B></font>\n • <v>!profile</v> or <v>!p</v> <g>[playerName]</g> : shows playerName's profile.\n • <v>!lang</v> <g>[langID]</g> : changes the module language.\n • <v>!help</v> or <v>!h</v> : opens the help menu. \n\n<font color='#ffd991'><B>Keyboard Shortcuts:</B></font>\n• <v>P</v> : shows your profile. \n• <v>H</v> : opens the help menu.",

        wins      = "Wins : %s",
        rounds    = "Rounds : %s",
        eatenMice = "Eaten mice : %s",

        points      = "<rose> To change the your Nickname Color , you must win 2 rounds. \n • To change the your Nickname , you must win 5 rounds.</rose>",
        colorNick   = "Nickname Color",
        changenick  = "Change Nickname",
        chosencolor = "<fc>[•] Your nickname color will change to <font color='#%s'>#%s</font> in the next round.</fc>",
        chosenName  = "<fc>[•] Your nickname will change to <r><b>%s</b></r> in the next round.</fc>",
        waitAMoment = "<fc>[•] You must wait %s seconds to request again",
        youRadmin   = "<J>You are an admin now!<J>",
        isAdmin     = "<J>%s is an admin now!<J>",
        youAre      = "<fc>You transformed into <b>%s</b>!<fc>",
        returnMice  = "<fc>You returned to a normal mouse!</fc>",
    },
}

local langueIcon = {
    ["ar"] = "1651b32290a.png",
    ["en"] = "1723dc10ec2.png",
    ["fr"] = "1651b30c284.png",
}

local foodsTypes = {
    [1] = {1, "177a6aee20c.png", 0.05, -20 , -8, chance = {0, 60}},
    [2] = {2, "177a6bb7960.png", 0.30, -14 , -14, chance = {60, 68}},
    [3] = {3, "177a6af0d77.png", -0.5, -20, -8, chance = {68, 85}},
    [4] = {4, "177a6b6f896.png", 0, -20, -8, chance = {85, 90}},
    [5] = {5, "177ac004317.png", 0, -20, -8, chance = {90, 95}},
    [6] = {6, "177c501cab2.png", 1, -16 , -16, chance = {95, 97}},
}

TFM.disableAutoScore(true)
TFM.disableAutoShaman(true)
TFM.disablePhysicalConsumables(true)
TFM.disablePhysicalConsumables(true)
TFM.disableAutoNewGame(true)
TFM.disableAutoTimeLeft(true)

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
    for name in next, room.playerList do
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
            if p[name].shieldTimer then system.removeTimer(p[name].shieldTimer) end
            p[name] = {name = name, img = p[name].img, imgPage = 1, character = p[name].character, cheeseMenuPage = p[name].cheeseMenuPage, shield = false, shieldTimer = nil, win = false, color = setColorName(name), langue = p[name].langue, click = nil , hight = 1, size = 0.1 ,x = 0, y=0 , eaten = false, facingLeft = true}
            updateSize(name, p[name].size)
            alives_numbers = alives_numbers + 1 
            updateXY(name)
            data[name].rounds = data[name].rounds + 1 
            if p[name].color then
                TFM.setNameColor(name, p[name].color)
            end
        end
        updateImageForAll()
        beganTimer = system.newTimer(function() module.started = true chatMessage("canEatMice", "J", "/J") 
            for name in next,GET.room.playerList do 
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
        if foodsTypes[i].chance[1] < a and foodsTypes[i].chance[2] > a then
            return foodsTypes[i][1]
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
    local xImg , yImg = 0 ,0
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
            img = TFM.addImage(types[2], "!"..module.foodsNumb + 30000, xSpace + xImg, ySpace + yImg) ,
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

function addButton(id, text, x, y, xSize, ySize, callback, name)
    ui.addTextArea(1000000 + id,"<p align = 'center'>" .. text, name, x, y, xSize, ySize, 0x011, 0x011, 0, true)
    ui.addTextArea(2000000 + id, "<p align = 'center'><a href='event:" .. callback .. "'><font size = '20'>\n\n\n\n", name, x, y, xSize, ySize, 0x0111, 0x0111, 0, true)
end

function button(id, name, event, x, y, text, img, color, shadow)
    if not color then color = "ffd991" end
    if img then 
        TFM.addImage(img, ":"..id, x, y, name)
    end
    if event then
        addTextArea(id + 1000000,"<font size='22'><a href='event:"..event.."'><p align='center'>\n\n\n\n", name, x, y, 40, 40, 0x01, 0x01, 0, true)
        if text then 
            if shadow then
                addTextArea(id + 3000000,"<font size='14' color='#000000'><p align='center'>"..text, name, x+2, y+2, 90, 40, 0x01, 0x01, 0, true)
            end
            addTextArea(id + 1000000,"<font size='14' color='#"..color.."'><p align='center'>"..text, name, x, y, 90, 35, 0x01, 0x01, 0, true)
            addTextArea(id + 2000000,"<font size='40'><a href='event:"..event.."'><p align='center'>\n\n\n\n", name, x, y, 90, 35, 0x01, 0x01, 0, true)
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
            print(levelsXP[data[player].level])
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
    local id = 0
    for commu, img in next, langueIcon do 
        local translator = module.stuff.translators[commu]
        if translator then 
            id = id + 1
            imgs[name].helpMenu[1 + id] = TFM.addImage(img, ":99",x, y + (ySpace * (id - 1)), name)
            addTextArea(-303 - id, "<v>" .. string.name(translator, 8), name, x + 20 , y + (ySpace * (id - 1) - 4), 100, 25, 0x01, 0x01, 0, true)
        end
    end
end

function closehelpMenu(name)
    for textarea = -303 - table.length(langueIcon) ,-300 do 
        ui.removeTextArea(textarea, name)
    end
    for i = 1, 4 do 
        removeButton(10 + i, name)
        if imgs[name].helpMenu[5 - i] then 
            TFM.removeImage(imgs[name].helpMenu[5 - i])
        end
    end
end

--[[
function checkFoodX(x, point)
    local foodieX = tonumber(x)
    if module.foods then
        for _,food in next, module.foods do 
            if food.x <= foodieX + 10 and food.x >= foodieX - 10 then
                foodieX = x
            else
                foodieX = math.random(x - point.space , x + point.space)
            end
        end
    end
    return foodieX
end
]]

function isNear(name,x,y,space)
	if p[name].x > x-space and p[name].x < x+space and p[name].y > y-space and p[name].y < y+space then
		return true
    end
end

function checkImage(name,imgName,img,target,x,y)
    if imgName then 
        TFM.removeImage(imgName, name)
    end
    imgName = TFM.addImage(img, target, x, y, name)
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
    TFM.newGame(module.lobby_map)
    animationTimer = Timer(lobbyAnimations, 14)
    if beganTimer then system.removeTimer(beganTimer) end
    if exitLobbyTimer then system.removeTimer(exitLobbyTimer) end
    for name in next, room.playerList do
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
    img_numb = 0
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
            system.newTimer(function() exitLobby() end, 3000, false)
        elseif inRoom < module.minium_player then
            updatePlayersNumb()
        end
    elseif not module.lobby then
        if inRoom < module.minium_player then
            lobby()
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
    setXpToLevelUP()
    for name in pairs(tfm.get.room.playerList) do
		eventNewPlayer(name)
    end
    for _,c in pairs(module.commands) do
		system.disableChatCommandDisplay(c)
    end
    TFM.setRoomMaxPlayers(module.max_player)
end

function getValue(theValue,c)
    return tonumber(theValue:match(('%s="([^"]+)"'):format(c))) or theValue:match(('%s="([^"]+)"'):format(c)) or theValue:match(('%s=""'):format(c))
end

function setAdmin(name)
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

function setMap()
    if not module.lobby then
        if beganTimer then system.removeTimer(beganTimer) end
        --local o = math.random(100)
        --if o < 90 then map.sizeType = 1 else map.sizeType = 2 end
        local m = math.random(#maps[map.sizeType])
        if map.sizeType == 1 then map.maxSize = 5 else map.maxSize = 2.5 end
        map.corrent = m
        if maps[map.sizeType][m] then 
            TFM.newGame(maps[map.sizeType][m])
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
    local xml = maps[map.sizeType][map.corrent]
    for point in xml:gmatch("<O [^/]+/>") do
        local x = getValue(point,"X")
        local y = getValue(point,"Y")
        local c = getValue(point,"C")
        local mp = getValue(point,"Mp")
        if c == 11  then
            foodPoints[#foodPoints+1] = {y = y , x = x , space = mp }
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
                elseif food.type == 7 then
                    local img = 0
                    local images = {"177d0eab2dc.png", "177d0eaca4e.png", "177d0eae1be.png", "177d0eaf930.png", "177d0eb10a0.png", "177d0eb2811.png", "177d0eb3f86.png"}
                    return system.newTimer(function()
                        img = img + 1 
                        TFM.removeImage(food.img)
                        food.img = TFM.addImage(images[img], "?"..food.id + 30000, food.x + foodsTypes[food.type][4], food.y + foodsTypes[food.type][5])
                        if img == #images then 
                            img = 0
                        end
                    end, 1000, true) 
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
        if not imgs[name].sizeBanner then
            imgs[name].sizeBanner =  TFM.addImage("1777dfec382.png", ":1", 502, 22, name)
        end
        addTextArea(900000,"<font size='22' color='#ffd991'><p align='center'><B>"..p[name].size, name, 350+250,35, 100, 40, 0x0, 0x0, 0, true)
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
    imgs[name] = {shield = nil,cheesemenu = nil, cheese = nil, sizeBanner = nil, profile = {}, helpMenu = {}, funcorp = {}, imgMenu={}}
    if not data[name] then 
        data[name] = {xp = 0, level = 1, avatar = 1, rounds = 0, miceEats = 0, wins = 0, funcorp = {colornickCooldown = nil, changenickCooldown = nil}}
    end
    updateSize(name,p[name].size)
    TFM.setPlayerScore(name,0)
    if module.lobby then
        TFM.respawnPlayer(name)
    end
    for _,k in pairs(module.keyboard_keys) do
        TFM.bindKeyboard(name, k, true,true)
        TFM.bindKeyboard(name, k, false,true)
	end
    TFM.chatMessage(string.format(translate("welcomeText",name), string.name(module.stuff.developer)), name)
    TFM.chatMessage(translate("points", name), name)
    checkLobby()
    funcorpStuffs(name , data[name].wins)
    updateImageForAll()
    button(1, name, "cheeseMenu", 750, 360, nil,"177b518549a.png")
    if isAdmin(name) then
        adminsInterface(name)
    end
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
    TFM.addImage("1789e8ac789.png", ":9" , 5, 45, name)
    TFM.addImage("1788d26ed0d.png", ":10", 0, 10, name)
    addButton(92, "<font color = '#ffd991'><b>\n", 10, 52, 40, 25, "normalMouse", name)
    addButton(90, "<font color = '#ffd991'><b>"..translate("images", name), 10, 20, 110, 22, "openMenu", name)
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
        for i = 1, #images do 
            if cb == images[i][1] and isAdmin(name) then
                for _,player in next, p do 
                    player.character = i
                    updateImage(player.name)
                end
                chatMessage("youAre", images[i][1])
            end
        end
    end
end

function eventKeyboard(name,k,d)
    if k == 80 then
        showProfile(name, name)
    elseif k == 72 then
        helpMenu(name, 400, 230, "help")
    elseif k == 0 and not p[name].eaten then
        p[name].facingLeft = true
        updateImage(name)
    elseif k == 2 and not p[name].eaten then
        p[name].facingLeft = false
        updateImage(name)
    end
    if not module.lobby then
        updateXY(name)
        if not p[name].click or p[name].click + 500 < os.time() then
            if k == 32 then
                eatMouse(name)
                p[name].click = os.time()
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
                        system.newTimer(function()
                            TFM.freezePlayer(name, false)  
                        end, 5000, false)
                    elseif food.type == 7 then 
                        chatMessage("freezAll", string.name(name))
                        for _,n in pairs(p) do 
                            if n.name ~= name then
                                TFM.freezePlayer(n.name)
                                TFM.playEmote(n.name, 0)
                            end
                        end
                        system.newTimer(function() for _,n in pairs(p) do TFM.freezePlayer(n.name, false) end end, 1100, false)
                    end
                    if food.timer then system.removeTimer(food.timer) end
                    table.remove(module.foods,i)
                end
            end
        end
    end
end

function eventPlayerDied(name)
    p[name].eaten = true
    alives_numbers = alives_numbers - 1
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
end

function eventPlayerLeft(name)
    inRoom = inRoom - 1
    checkLobby()
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
                print(seconds)
                TFM.chatMessage(string.format(translate("waitAMoment", name), seconds), name)
            end
        else
            TFM.chatMessage("<R><b>[HungryMice]</b> ERROR.<ُ/R>")
        end
    end
end

function eventPopupAnswer(id , name, answer)
    local cooldown = data[name].funcorp.changenickCooldown
    if id == 1 and answer then
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
    for i = 2, 7 do
        if imgs[name].imgMenu[i] then TFM.removeImage(imgs[name].imgMenu[i]) end
        local id = (page-1)*6 + (i - 1)
        removeButton(i - 1, name)
        if images[id] then
            local x, imageScale = 90 + 110 * (i - 2) ,0.25
            addButton(i - 1, "<font color = '#ffd991' size = '10'>"..images[id][1], x, 108 + y, 80, 20, images[id][1], name)
            imgs[name].imgMenu[i] = TFM.addImage(images[id][2], ":" .. i, (x+40) - (images[id][3]/4), y + 80 - (images[id][4]/4), name, imageScale, imageScale)
        end
    end
end

function closeMenu(name)
    for i = 1,7 do 
        removeButton(i, name)
        removeButton(99+i, name)
        if imgs[name].imgMenu[i] then 
            TFM.removeImage(imgs[name].imgMenu[i])
        end
    end
end

function updateImage(name)
    if p[name].character then
        if p[name].img then TFM.removeImage(p[name].img) end
        local imgId = p[name].character 
        local img = images[imgId] 
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
    if score >= 5 then
        if not imgs[name].funcorp[2] then imgs[name].funcorp[2] = TFM.addImage("1788d26ed0d.png", ":10", 138, 375, name) end
        addTextArea(13, "<font color='#ffd991'><p align='center'><a href='event:changenick'><B>"..translate("changenick", name), name, 145, 382, 110, 40, 0x0, 0x0, 0, true)
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