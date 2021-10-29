extends Node

onready var world = get_node("/root/World")
var currentverb
var currentobjective
var currentextra

var textualverb

signal follow_ncpaction

# VERB LIST
var attack = [30,0,"","with","attack","wrestle","demolish","strike","squash","damage","assault","crash","battle","fight","hurt","crush","hit","slam","beat","smash","wreck","ruin","destroy","break","knock","pound","harm"]
var rest = [50,0,".",".","rest","meditate","recover","focus","concentrate"]
var go = [5,0,"to",".","go","run","walk","head","march","trot","wander","travel","move"]
var softattack = [5,33,"",".","softattack","pinch","spank","princk","scratch","scrape","slap","tap"]
var tackle = [40,33,"",".","tackle","tumble","overthrow","topple","bump"]
var kick = [30,0,"",".","kick"]
var punch = [30,0,"",".","punch"]
var headbutt = [30,0,"",".","headbutt"]
var defend = [40,33,".",".","defend","guard","shield","cover","protect","shelter","block"]
var avoid = [30,66,".",".","avoid","dodge","elude"]
var push = [15,33,"","to","push","thrust"]
var taste = [0,0,"",".","taste","lick","sip"]
var hear = [0,0,"",".","hear","listen"]
var smell = [0,0,"",".","smell","sniff","scent","breathe"]
var get = [5,33,"",".","get","lift","store","pick","pick up","contain","gather","own","possess","grab","take","catch","have","hold","keep","add","carry","claim","collect","obtain","reach"] 
var steal = [5,33,"",".","steal","rob","snatch"]
var recieve = [5,33,"",".","recieve","borrow"]
var drop = [5,33,"",".","drop","release","discard","get rid of","throw away","put down","remove","scatter","spill","free","liberate","set free"]
var molest = [0,33,"",".","molest","irritate","tease","offend","meddle","embarass","deceive","trick","scold","fool","mislead","insult","yell","shout","annoy","boast","bore","harass","confuse","show off","trouble"]
var betray = [0,33,"",".","betray","lie","cheat"]
var check = [0,33,"",".","check","peep","poke","watch","see","admire","read","analyse","describe","examine","look","peek","identify","notice","observe","stare","inspect"]
var relax = [0,0,".",".","relax","lay down","lay","sit down","sit","sleep"]
var act = [10,33,"like",".","act","be","become"]
var copy = [10,33,"",".","copy","imitate"]
var detest = [0,33,"",".","detest","dislike","hate","loathe","disdain","fear","ignore"]
var introduce = [0,66,"","to","introduce","show","present","display","anounce","post","publish","describe"]
var apologize = [0,66,"to",".","apologize","surrender","beg","supplicate","spare"]
var thank = [0,66,"",".","thank"]
var infatuate = [0,66,"",".","infatuate","tempt","seduce","lure","hug","kiss","love","attract","confess","blush","enchant","charm","captivate","marry","stroke","cuddle"]
var cheer = [0,66,"",".","cheer","praise","apploud","appreciate","bless","bow","hail to","encourage","pet","calm","comfort"]
var challenge = [0,33,"",".","challenge","provoke","discuss","argue","compete","desagree","judge","object","race","protest"]
var decline = [0,33,"",".","decline","reject","disaprove","doubt","refuse","regret"]
var open = [5,0,"",".","open","unfold","unlock","unfasten"]
var close = [5,0,"",".","close","shut"]
var bring = [5,33,"",".","bring"]
var salute = [0,66,"",".","salute","greet","visit","know","meet","welcome"]
var smile = [0,66,"to",".","smile","grin","laugh"]
var sing = [10,66,"to",".","sing"]
var put = [5,33,"","into","put","attach","hang","paste","plug"]
var throw = [20,33,"","to","throw"]
var pull = [15,33,"","to","pull","drag","tug"]
var touch = [0,0,"",".","touch","feel","rub"]
var forgive = [0,66,"",".","forgive","excuse"]
var fix = [0,66,"",".","fix","correct","repair","improve","mend"]
var heal = [0,66,"",".","heal","cure","treat","restore"]
var combine = [0,33,"","with","combine","connect","unite","merge","assemble","blend","mix","glue","match","mate"]
var measure = [0,66,"",".","measure"]
var weight = [0,66,"",".","weight"]
var accept = [0,0,"",".","accept","approve"]
var change = [0,33,"","with","change","exchange","trade","switch"]
var entertain = [5,66,"",".","entertain","amuse","excite","impress","joke","juggle","prank","surprise"]
var tickle = [0,33,"",".","tickle"]
var escape = [0,0,".",".","escape","go away","run away","walk away","go out","leave","evacuate"]
var eat = [0,0,"",".","eat","chew","bite"]
var kill = [30,0,"","with","kill","choke","murder"]
var dance = [15,66,"",".","dance","perform"]
var scare = [0,33,"",".","scare","frighten","terrify","astonish","terrorize"]
var satisfy = [0,33,"",".","satisfy","obey","please","serve"]
var drink = [0,0,"",".","drink","suck"]
var talk = [0,66,"to","about","talk","speak"]
var command = [0,66,"",".","command","order","allow","demand","instruct","direct","force","permit","reign"]
var say = [0,66,"","is","say","tell","suggest","communicate","report"]
var call = [0,66,"",".","call","signal","alert","warn"]
var cry = [5,0,".",".","cry","complain","mourn","grumble","groan","scream","shrug","sigh","wail","lament","whine","yawn"]
var ask = [0,66,"","about","ask","question","request"]
var climb = [15,0,"",".","climb","stand","step","ride","climb up"]
var give = [0,33,"","to","give","lend","send","deliver","offer","pass","provide","share","supply"]
var bend = [15,33,"",".","bend","twist","fold","curve","tear","stretch"]
var torture = [0,0,"",".","torture","abuse","mistreat"]
var art = [0,66,"",".","art","draw","paint","write","sculpt","carve","scribble"]
var fall = [5,0,".",".","fall","trip","get down","climb down","land"]
var help = [0,66,"",".","help","care for","concern for","soothe","worry"]
var teach = [0,66,"","about","teach","coach","advise","educate","explain","guide","influence","inform","introduce","preach","lecture","suggest"]
var wear = [0,33,"",".","wear","dress","put on"]
var undress = [0,33,"",".","undress"]
var use = [0,0,"",".","use","spend","utilize","employ","test","waste"]
var press = [10,0,"",".","press","squeeze","compress"]
var build = [5,66,"",".","build","construct","create","make","invent","produce"]
var subdue = [0,66,"",".","subdue","trap","tame","strap","capture","arrest","jail","imprison","confine","lock","seal","lock up","tie","fasten","knot"]
var buy = [0,33,"",".","buy","afford","shop"]
var sell = [0,33,"",".","sell"]
var enter = [0,0,"",".","enter"]
var pay = [0,33,"",".","pay"]
var pray = [0,0,".",".","pray"]
var stumble = [0,33,".",".","stumble","slip","trip"]
var balance = [0,33,".",".","balance"]
var cook = [0,66,"",".","cook","bake","fry"]
var ban = [0,33,"",".","ban","prohibit"]
var spoil = [0,0,"",".","spoil","mess up","tarnish","dirty","soil","stain","blot","smear","screw"]
var clean = [10,33,"",".","clean","clear","dry","dust","peel","polish","blow","wash","wipe"]
var compare = [0,66,"","with","compare"]
var personalize = [0,66,"",".","personalize","decorate","pimp","mark","sign"]
var nickname = [0,66,"",".","nickname","name","label"]
var organize = [0,66,"",".","organize","arrange","categorize","classify","sort"]
var jump = [15,0,"into",".","jump","hop","leap"]
var pile = [5,33,"","with","pile","pile up","stack","heap","amass"]
var bodyrespect = [0,33,"to",".","bodyrespect","kneel","nod","incline","wave"]
var shake = [5,0,"",".","shake","tremble","waggle","agitate","shiver","stir","wobble"]
var crouch = [0,33,".",".","crouch","crawl","curl","squat","duck"]
var exercise = [20,33,".",".","exercise","practice","train","work out","flex","push up"]
var fill = [0,0,"","with","fill","pack","load","refill","replenish","charge","pour","stuff"]
var empty = [0,0,"",".","empty","void","unpack","unload","discharge"]
var hide = [5,33,"in",".","hide"]
var blink = [0,33,"at",".","blink","wink"]
var roll = [15,33,".",".","roll","somersault"]
var sound = [0,33,"to",".","sound","clap","buzz","snore","whisper","squeak","chirp","squeal","whistle"]
var cough = [0,0,"to",".","cough","sneeze"]
var play = [5,66,"with",".","play"]
var disarm = [0,0,"",".","disarm"]
var threaten = [0,0,"",".","threaten","hunt"]
var follow = [0,0,"",".","follow","chase","haunt"]
var canthere = [0,0,"",".","canthere","dig","swim","dive","bath","sink","drown","float","paddle","sail","ski"]
var sexualshit = [0,0,".",".","sexualshit","moan","jerk off","strip"]
var dirtyshit = [0,0,".",".","dirtyshit","piss","defecate","shit","burp","swear"]
var darkshit = [0,0,"",".","darkshit","violate","rape","bang","suicide","commit suicide","fuck"]
var nonsense = [0,0,"",".","nonsense","fly","flap","drive","bat","launch"]
var save = [0,0,"",".","save"]
var dependsonyou = [0,0,"",".","dependsonyou","pretend","work","wonder","wish","want","wait","trust","try","support","suppose","suspect","succeed","stay","end","start","sin","settle","search","retire","return","rescue","replace","reply","repeat","recognise","realise","raise","punish","promise","prevent","preserve","procede","prepare","prefer","plan","pause","owe","need","miss","memorise","live","lighten","learn","join","interrupt","interfere","imagine","hurry","handle","manage","guess","fetch","fear","fail","fade","face","enjoy","earn","discover","develop","breathe","count","consider","attend","do","attempt","understand","recall","continue","answer","arrive","calculate","dream","think","forget","wake","wake up","decide","choose","detect","find","win","lose","remember","remind"]
var howgenius = [0,0,"",".","howgenius","warm","vanish","stop","sparkle","shock","separate","scorch","reduce","peck","stun","melt","hope","heat","glow","multiply","devide","desappear","cast","teleport","transport","poison","bounce","burn","freeze","grow","boil","rise","blind","appear"]
var lacktool = [0,0,"",".","lacktool","slice","chop","cut","zoom","wrap","whip","stamp","drill","pierce","spray","soak","smoke","shave","reflect","record","radiate","pump","program","print","pop","plant","park","inflate","mine","knit","inject","hover","hook","flood","film","drain","blast","fire","bomb","shoot","impale","bury","brush","explode","implode","deploy"]
var AllVerbs = [attack,rest,go,softattack,tackle,kick,punch,headbutt,defend,avoid,push,taste,hear,smell,get,steal,recieve,drop,molest,betray,check,relax,act,copy,detest,introduce,apologize,thank,infatuate,cheer,challenge,decline,open,close,bring,salute,smile,sing,put,throw,pull,touch,forgive,fix,heal,combine,measure,weight,accept,change,entertain,tickle,escape,eat,kill,dance,scare,satisfy,drink,talk,command,say,call,cry,ask,climb,give,bend,torture,art,fall,help,teach,wear,undress,use,press,build,subdue,buy,sell,enter,pay,pray,stumble,balance,cook,ban,spoil,clean,compare,personalize,nickname,organize,jump,pile,bodyrespect,shake,crouch,exercise,fill,empty,hide,blink,roll,sound,cough,play,disarm,threaten,follow,canthere,sexualshit,dirtyshit,darkshit,nonsense,save,dependsonyou,howgenius,lacktool]

func getverb_array(verb):
	for i in range (0,AllVerbs.size(),1):
		var array = AllVerbs[i]
		for j in range (4,array.size(),1):
			if array[j]==verb:
				return array

func getverb(verb):
	for i in range (0,AllVerbs.size(),1):
		var array = AllVerbs[i]
		for j in range (4,array.size(),1):
			if array[j]==verb:
				currentverb=array[4]
				return currentverb
	currentverb = null
	return currentverb

func getobjective(character,objective):
	var movement = ["north","south","east","west","forward","forth","straight","backward","backwards","back","right","left"]
	var concepts = [["life"],["death"],["dreams","dream","goals","goal","objective","objectives"],["work"],["depression","sadness","solitute"],["happiness"],["cosmos","universe","world"]]
	var adjectives = [["good","awesome","incredible","fantastic","excellent"],["bad","horrible","disgusting"],["worthless","useless","stupid","asshole","shit"],["valuable","clever","usefull","smart","strong"]]
	
	var things=character.get_interactions()
	
	#OTHER OBJECTIVES
	for i in range (0,things.size(),1):
		for k in range (1,get_node(things[i]).RealName.size(),1):
			if get_node(things[i]).RealName[k]==objective:
				currentobjective = things[i]
				return currentobjective
	
	#MOVEMENT OBJECTIVE
	for j in range (0,movement.size(),1):
		if (objective==movement[j]):
			#North
			if (objective=="north")or(objective=="forward")or(objective=="forth")or(objective=="straight"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0],character.get_parent().Position[1]+1]:
							currentobjective = things[i]
							return currentobjective
			#South
			if (objective=="south")or(objective=="backward")or(objective=="backwards")or(objective=="back"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0],character.get_parent().Position[1]-1]:
							currentobjective = things[i]
							return currentobjective
			#East
			if (objective=="east")or(objective=="right"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0]+1,character.get_parent().Position[1]]:
							currentobjective = things[i]
							return currentobjective
			#West
			if (objective=="west")or(objective=="left"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0]-1,character.get_parent().Position[1]]:
							currentobjective = things[i]
							return currentobjective
	#CONCEPT OBJECTIVE
	for i in range (0,concepts.size(),1):
		if concepts[i].has(objective):
			get_node("Concept").Type = concepts[i][0]
			get_node("Concept").RealName[0] = concepts[i][0]
			get_node("Concept").RealName[1] = "subject"
			currentobjective = get_node("Concept").get_path()
			return currentobjective
	
	#ADJECTIVE OBJECTIVE
	for i in range (0,adjectives.size(),1):
		if adjectives[i].has(objective):
			get_node("Concept").Type = adjectives[i][0]
			get_node("Concept").RealName[0] = adjectives[i][0]
			get_node("Concept").RealName[1] = "adjective"
			currentobjective = get_node("Concept").get_path()
			return currentobjective
	
	#TRANSFORM UNEXISTENT OBJECTS INTO CONCEPTS
	if objective!="":
		get_node("Concept").Type = objective
		get_node("Concept").RealName[0] = objective
		get_node("Concept").RealName[1] = "generic"
		currentobjective = get_node("Concept").get_path()
		return currentobjective
	
	currentobjective = world.get_node("Server").get_path()
	return currentobjective

func getextra(character,extra):
	var movement = ["north","south","east","west","forward","forth","straight","backward","backwards","back","right","left"]
	var concepts = [["life"],["death"],["dreams","dream","goals","goal","objective","objectives"],["work"],["depression","sadness","solitute"],["happiness"],["cosmos","universe","world"]]
	var adjectives = [["good","awesome","incredible","fantastic","excellent"],["bad","horrible","disgusting"],["worthless","useless","stupid","asshole","shit"],["valuable","clever","usefull","smart","strong"]]
	
	var things=character.get_interactions()
	
	#OTHER EXTRAS
	for i in range (0,things.size(),1):
		for k in range (0,get_node(things[i]).RealName.size(),1):
			if get_node(things[i]).RealName[k]==extra:
				currentextra = get_node(things[i])
				return currentextra
	
	#MOVEMENT EXTRA
	for j in range (0,movement.size(),1):
		if (extra==movement[j]):
			#North
			if (extra=="north")or(extra=="forward")or(extra=="forth")or(extra=="straight"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0],character.get_parent().Position[1]+1]:
							currentextra = get_node(things[i])
							return currentextra
			#South
			if (extra=="south")or(extra=="backward")or(extra=="backwards")or(extra=="back"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0],character.get_parent().Position[1]-1]:
							currentextra = get_node(things[i])
							return currentextra
			#East
			if (extra=="east")or(extra=="right"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0]+1,character.get_parent().Position[1]]:
							currentextra = get_node(things[i])
							return currentextra
			#West
			if (extra=="west")or(extra=="left"):
				for i in range (0,things.size(),1):
					if get_node(things[i]).Name == "Space":
						if get_node(things[i]).Position==[character.get_parent().Position[0]-1,character.get_parent().Position[1]]:
							currentextra = get_node(things[i])
							return currentextra
	#CONCEPT EXTRA
	for i in range (0,concepts.size(),1):
		if concepts[i].has(extra):
			get_node("Concept2").Type = concepts[i][0]
			get_node("Concept2").RealName[0] = concepts[i][0]
			get_node("Concept2").RealName[1] = "subject"
			currentextra = get_node("Concept2")
			return currentextra
	
	#ADJECTIVE OBJECTIVE
	for i in range (0,adjectives.size(),1):
		if adjectives[i].has(extra):
			get_node("Concept2").Type = adjectives[i][0]
			get_node("Concept2").RealName[0] = adjectives[i][0]
			get_node("Concept2").RealName[1] = "adjective"
			currentextra = get_node("Concept2")
			return currentextra
	
	#TRANSFORM UNEXISTENT OBJECTS INTO CONCEPTS
	if extra!="":
		get_node("Concept2").Type = extra
		get_node("Concept2").RealName[0] = extra
		get_node("Concept2").RealName[1] = "generic"
		currentextra = get_node("Concept2")
		return currentextra
	
	currentextra = null
	return currentextra

func verbchallenge(verb):
	
	getverb(verb)
	get_parent().get_node("VerbChallenge/VCtextinput").text = ""
	textualverb = get_parent().get_node("TextInput_Verb").text.strip_edges(true, true)
	if (currentverb=="attack"):
		get_parent().get_node("VerbChallenge").get_node("VCdescription").text = "'gathered strength'          'you'          'and'          'in a split second'          'released it all'"
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you gathered strength in a split second and released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you gathered strength and released it all in a split second")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you gathered strength and in a split second released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you in a split second gathered strength and released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("in a split second you gathered strength and released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you gathered strength and released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("in a split second you released it all")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you in a split second you released it all")
	elif (currentverb=="rest"):
		get_parent().get_node("VerbChallenge").get_node("VCdescription").text = "'took'          'a deep breath'          'with'          'you'          'a nap'"
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you took a nap with a deep breath")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a nap you took a deep breath")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a deep breath you took a nap")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you took a deep breath with a nap")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you took a deep breath")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you took a nap")
	elif (currentverb=="go"):
		get_parent().get_node("VerbChallenge").get_node("VCdescription").text = "'rising'          'your right leg'          'your left leg'          'and then'          'you moved'"
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you moved rising your right leg and then your left leg")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you moved rising your left leg and then your right leg")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("rising your right leg and then your left leg you moved")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("rising your left leg and then your right leg you moved")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("rising your right leg you moved")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("rising your left leg you moved")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you moved rising your right leg")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you moved rising your left leg")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you moved")
	elif (currentverb=="softattack"):
		get_parent().get_node("VerbChallenge").get_node("VCdescription").text = "'with a "+textualverb+"'          'without'          'intending to do'          'a prank'          'harm'          'you did'"
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("without intending to do harm you did a prank with a "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("without intending to do a prank you did harm with a "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a "+textualverb+" you did a prank")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a "+textualverb+" you did a prank without intending to do harm")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("intending to do a prank you did harm with a "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a "+textualverb+" you did harm")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a "+textualverb+" you did harm without intending to do a prank")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("with a "+textualverb+" you did harm intending to do a prank")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you did harm intending to do a prank")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you did a prank")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you did a prank intending to do harm")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you did harm")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you did harm with a "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you did a prank with a "+textualverb)
	else:
		get_parent().get_node("VerbChallenge").get_node("VCdescription").text = "'"+textualverb+"'          'after'          'thinking'          'choosed to'          'a lot'          'you'"
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("after thinking a lot you choosed to "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you after thinking a lot choosed to "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you choosed to "+textualverb+" after thinking a lot")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you choosed to "+textualverb+" a lot after thinking")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("after thinking you choosed to "+textualverb+" a lot")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you choosed to "+textualverb+" a lot")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append("you choosed to "+textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append(textualverb)
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append(textualverb+" a lot")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append(textualverb+" a lot thinking")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append(textualverb+" a lot after thinking")
		get_parent().get_node("VerbChallenge").get_node("VCtextinput").challenge_answers.append(textualverb+" after thinking")

func execute_action(character,verb,objective,extra):
	if character==get_parent():
		world.get_node("Result").text = ""
		get_parent().get_node("DescriptionPlus").text = ""
		get_parent().get_node("TextInput_Verb").text = ""
		get_parent().get_node("TextInput_Objective").text = ""
		get_parent().get_node("TextInput_Extra").text = ""
		get_parent().getinput_stage1()
	getverb(verb)
	getobjective(character,objective)
	getextra(character,extra)
	var yourdescription = ""
	var lackcondition = false
	
	#Add know thing to NPC if relevant
	var NPC = []
	var added = []
	if NPC==[] and added==[]:
		#Scout for people
		var array = character.get_interactions()
		for i in range (0,array.size(),1):
			if get_node(array[i]).Name=="Object":
				if get_node(array[i]).NPCbody==true:
					NPC.append(get_node(array[i]).get_parent().get_parent())
		#Scout for things
		if (get_node(currentobjective)!=null):
			if (get_node(currentobjective).Name=="Object"):
				added.append(get_node(currentobjective))
			elif (get_node(currentobjective).Name=="Part"):
				if get_node(currentobjective).on_object==true:
					added.append(get_node(currentobjective).nodeowner)
				elif get_node(currentobjective).on_object==false:
					added.append(get_node(currentobjective))
			elif (get_node(currentobjective).Name=="Asset" or get_node(currentobjective).Name=="Concept"):
				added.append(get_node(currentobjective))
		if currentextra!=null:
			if (currentextra.Name=="Object"):
				added.append(currentextra)
			elif (currentextra.Name=="Part"):
				if currentextra.on_object==true:
					added.append(currentextra.nodeowner)
				elif currentextra.on_object==false:
					added.append(currentextra)
			elif (currentextra.Name=="Asset" or currentextra.Name=="Concept"):
				added.append(currentextra)
		#Scout for character
		added.append(character.get_node("Physicality").get_child(0))
		#Add things
		if NPC!=[] and added!=[]:
			for i in range (0,NPC.size(),1):
				for j in range (0,added.size(),1):
					var checkadded = false
					for k in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[k].Type==added[j].Type:
							checkadded = true
					if checkadded==false:
						NPC[i].new_knownthings(added[j])
	
	#ATTACK OUTCOMES (attack + "" + objective + "with" + extra)
	if (currentverb=="attack"):
		var attacker = null
		
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		
		var eff = check_accuracy(character)
		if eff=="success":
			eff = 1
		elif eff=="half success":
			eff = 0.75
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got a little distracted because of low focus and the strength suffered for it. "
		elif eff=="fail":
			eff = 0
		
		var validextra = false
		if currentextra!=null:
			if validextra==false:
				for i in range(0,character.get_node("Physicality").get_child_count(),1):
					if character.get_node("Physicality").get_child(i).RealName[0]==currentextra.RealName[0]:
						validextra = true
						currentextra = character.get_node("Physicality").get_child(i)
						if currentextra.Name=="Object":
							currentextra = character.get_node("Physicality").get_child(i).get_child(0)
			if validextra==false:
				for i in range(0,character.get_node("Physicality").get_child(0).get_child_count(),1):
					if character.get_node("Physicality").get_child(0).get_child(i).RealName[0]==currentextra.RealName[0]:
						validextra = true
						currentextra = character.get_node("Physicality").get_child(0).get_child(i)
		if (eff==0):
			yourdescription+="Low focus made "+character.get_node("Physicality").get_child(0).RealName[0]+" miss the attack. "
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Part")and(currentextra==null)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+character.get_node("Physicality").get_child(0).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Object")and(currentextra==null)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).get_child(0).RealName[0]+" with "+character.get_node("Physicality").get_child(0).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Part")and(validextra==true)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(currentextra,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+currentextra.RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Object")and(validextra==true)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(currentextra,get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).get_child(0).RealName[0]+" with "+currentextra.RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Asset")and(currentextra==null)and(character.Stamina>=attack[0])and(character.Focus>=attack[1])and(get_node(currentobjective).Reach<=(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+character.get_node("Physicality").get_child(0).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Asset")and(validextra==true)and(character.Stamina>=attack[0])and(character.Focus>=attack[1])and(get_node(currentobjective).Reach<=(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			var damage=world.clash(currentextra,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+currentextra.RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (currentverb=="attack")and(get_node(currentobjective).Name=="Asset")and(character.Stamina>=attack[0])and(character.Focus>=attack[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			attacker = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<attack[0])or(character.Focus<attack[1]):
			lackcondition = true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify something that makes sense. "
		
		if attacker!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==attacker.Type:
								NPC[i].knownthings[j].last_memory="Got hit by it. "
								NPC[i].knownthings[j].tolerance -= 2 #tolerance
								NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
								NPC[i].knownthings[j].memory -= 1 #memory
								if NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = attacker
								elif NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==attacker.Type:
							NPC[i].knownthings[j].last_memory="Saw you hitting something. "
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet violent. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance>=0 and NPC[i].knownthings[j].memory>0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems curious about your violent behaviour. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "

	#REST OUTCOMES (rest + ".")
	elif currentverb=="rest":
		if currentverb=="rest"and(character.Stamina!=100):
			if character.Stamina<100:
				character.Stamina += rest[0]
				if character.Stamina>100:
					character.Stamina = 100
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" rested (+50% Stamina)"
		elif currentverb=="rest"and(character.Stamina==100):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" don't need to rest"
	
	#GO OUTCOMES (go + "to" + objective + ".")
	elif currentverb=="go":
		if (currentverb=="go")and(get_node(currentobjective).Name=="Space")and(character.Stamina>=go[0])and character.Focus>=go[1]:
			yourdescription+=character.move_protagonist(currentobjective)
			character.Temperature += 10
			character.Stamina -= go[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" moved"
			character.get_node("DescriptionPlus").text = ""
		elif character.Stamina<go[0] or character.Focus<go[1]:
			lackcondition = true
		else:
			yourdescription+="That place doesn't exist. "
	
	#SOFTATTACK OUTCOMES (softattack + "" + objective + ".")
	elif currentverb=="softattack":
		var softattacked = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" mildly hurted "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" mildly hurted "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<softattack[0]) or (character.Focus<softattack[1]):
			lackcondition = true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify the objective of your action. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			softattacked = character.get_node("Physicality").get_child(0)
		
		if softattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if (get_node(currentobjective)!=null):
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==softattacked.Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].last_memory="Got soft hitted by it. "
									NPC[i].knownthings[j].tolerance -= 2
									NPC[i].knownthings[j].imageofyou -= 2
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==softattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you soft hitting something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#TACKLE OUTCOMES (tackle + "" + objective + ".")
	elif currentverb=="tackle":
		var somethingattacked = null
		#For non-npc objectives
		if (get_node(currentobjective).Name=="Part")and(character.Stamina>=tackle[0])and(character.Focus>=tackle[1]):
			if (get_node(currentobjective).on_object==false):
				var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),1)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" tackled "+get_node(currentobjective).RealName[0]+". "+str(damage[2])
				character.Temperature += 20
				character.Stamina-=tackle[0]
				somethingattacked = character.get_node("Physicality").get_child(0)
			elif (get_node(currentobjective).on_object==true)and(get_node(currentobjective).get_parent().NPCbody==false):
				var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),1)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" tackled "+get_node(currentobjective).RealName[0]+". "+str(damage[2])
				character.Temperature += 20
				character.Stamina-=tackle[0]
				somethingattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(character.Stamina>=tackle[0])and(character.Focus>=tackle[1]):
			if (get_node(currentobjective).NPCbody==false):
				var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective).get_child(0),1)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" tackled "+get_node(currentobjective).get_child(0).RealName[0]+". "+str(damage[2])
				character.Temperature += 20
				character.Stamina-=tackle[0]
				somethingattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=tackle[0])and(character.Focus>=tackle[1])and(get_node(currentobjective).Reach<=(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),1)
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" tackled "+get_node(currentobjective).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=tackle[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=tackle[0])and(character.Focus>=tackle[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<tackle[0])or(character.Focus<tackle[1]):
			lackcondition = true
			somethingattacked = character.get_node("Physicality").get_child(0)
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify what to tackle."
		
		#For npc objectives:
		if (get_node(currentobjective).Name=="Part")and(character.Stamina>=tackle[0])and(somethingattacked==null):
			if (get_node(currentobjective).on_object==true)and(get_node(currentobjective).nodeowner.NPCbody==true)and(get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<50):
				var array=character.get_interactions()
				var asset=null
				for i in range (0,array.size(),1):
					if get_node(array[i]).RealName[0]=="Floor":
						asset=get_node(array[i])
				var damage=world.clash(asset,get_node(currentobjective),1)
				yourdescription="You tackled "+get_node(currentobjective).RealName[0]+" making him fall into the floor. "+get_node(currentobjective).RealName[0]+" recieved "+str(damage[1])+" of damage. "
				character.Temperature += 20
				character.Stamina-=tackle[0]
				get_node(currentobjective).nodeowner.get_parent().get_parent().status = "toppled"
				somethingattacked = character.get_node("Physicality").get_child(0)
			else:
				character.Temperature += 20
				character.Stamina-=tackle[0]
				yourdescription="You tackled but he endured it. "
				somethingattacked = character.get_node("Physicality").get_child(0)
		if (get_node(currentobjective).Name=="Object")and(character.Stamina>=tackle[0])and(somethingattacked==null):
			if (get_node(currentobjective).NPCbody==true)and(get_node(currentobjective).get_parent().get_parent().Stamina<50):
				var array=character.get_interactions()
				var asset = null
				for i in range (0,array.size(),1):
					if get_node(array[i]).RealName[0]=="Floor":
						asset=get_node(array[i])
				var damage=world.clash(asset,get_node(currentobjective).get_child(0),1)
				yourdescription="You tackled "+get_node(currentobjective).RealName[0]+" making him fall into the floor. "+get_node(currentobjective).get_child(0).RealName[0]+" recieved "+str(damage[1])+" of damage. "
				character.Temperature += 20
				character.Stamina-=tackle[0]
				get_node(currentobjective).get_parent().get_parent().status = "toppled"
				somethingattacked = character.get_node("Physicality").get_child(0)
			else:
				character.Temperature += 20
				character.Stamina-=tackle[0]
				yourdescription="You tackled but he endured it. "
				somethingattacked = character.get_node("Physicality").get_child(0)
		
		if somethingattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==somethingattacked.Type:
								NPC[i].knownthings[j].last_memory="Got tackled by it. "
								NPC[i].knownthings[j].tolerance -= 2
								NPC[i].knownthings[j].imageofyou -= 2
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==somethingattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you tackling something. "
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet violent. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance>=0 and NPC[i].knownthings[j].memory>0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems curious about your violent behaviour. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "

	#KICK OUTCOMES (kick + "" + objective + ".")
	elif currentverb=="kick":
		var somethingattacked 
		
		var eff = check_accuracy(character)
		if eff=="success":
			eff = 1
		elif eff=="half success":
			eff = 0.75
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got a little distracted because of low focus and the strength suffered for it. "
		elif eff=="fail":
			eff = 0
		
		var leg = null
		var things = character.get_interactions()
		for i in range (0,things.size(),1):
			if get_node(things[i]).RealName[0]=="Your right leg" or  get_node(things[i]).RealName[0]=="Your left leg":
				leg = get_node(things[i])
		if eff==0:
			yourdescription+="Low focus made "+character.get_node("Physicality").get_child(0).RealName[0]+" miss the kick. "
			character.Temperature += 20
			character.Stamina-=kick[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (leg!=null)and(get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=kick[0])and(character.Focus>=kick[1]):
			var damage=world.clash(leg,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" kicked "+get_node(currentobjective).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=kick[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (leg!=null)and(get_node(currentobjective).Name=="Object")and(character.Stamina>=kick[0])and(character.Focus>=kick[1]):
			var damage=world.clash(leg,get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" kicked "+get_node(currentobjective).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=kick[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (leg!=null)and(character.Stamina<kick[0])or(character.Focus<kick[1]):
			lackcondition = true
		elif (leg==null):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" don't have any legs left. "
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify what to kick. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=kick[0])and(character.Focus>=kick[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			somethingattacked = character.get_node("Physicality").get_child(0)
		
		if somethingattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==somethingattacked.Type:
								NPC[i].knownthings[j].last_memory="Got kicked by it. "
								NPC[i].knownthings[j].tolerance -= 2 #tolerance
								NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
								NPC[i].knownthings[j].memory -= 1 #memory
								if NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==somethingattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you kicking something. "
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet violent. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance>=0 and NPC[i].knownthings[j].memory>0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems curious about your violent behaviour. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
		
	#PUNCH OUTCOMES (punch + "" + objective + ".")
	elif currentverb=="punch":
		var somethingattacked 
		
		var eff = check_accuracy(character)
		if eff=="success":
			eff = 1
		elif eff=="half success":
			eff = 0.75
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got a little distracted because of low focus and the strength suffered for it. "
		elif eff=="fail":
			eff = 0
		
		var fist = null
		var things = character.get_interactions()
		for i in range (0,things.size(),1):
			if get_node(things[i]).RealName[0]=="Your right arm" or  get_node(things[i]).RealName[0]=="Your left arm":
				fist = get_node(things[i])
		if eff==0:
			yourdescription+="Low focus made "+character.get_node("Physicality").get_child(0).RealName[0]+" miss the punch. "
			character.Temperature += 20
			character.Stamina-=punch[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (fist!=null)and(get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=punch[0])and(character.Focus>=punch[1]):
			var damage=world.clash(fist,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" punched "+get_node(currentobjective).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=punch[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (fist!=null)and(get_node(currentobjective).Name=="Object")and(character.Stamina>=punch[0])and(character.Focus>=punch[1]):
			var damage=world.clash(fist,get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" punched "+get_node(currentobjective).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=punch[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (fist!=null)and(character.Stamina<punch[0])or(character.Focus<punch[1]):
			lackcondition = true
		elif (fist==null):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" don't have any arms left. "
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify what to punch. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=punch[0])and(character.Focus>=punch[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			somethingattacked = character.get_node("Physicality").get_child(0)
		
		if somethingattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==somethingattacked.Type:
								NPC[i].knownthings[j].last_memory="Got kicked by it. "
								NPC[i].knownthings[j].tolerance -= 2 #tolerance
								NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
								NPC[i].knownthings[j].memory -= 1 #memory
								if NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==somethingattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you kicking something. "
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet violent. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance>=0 and NPC[i].knownthings[j].memory>0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems curious about your violent behaviour. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#HEADBUTT OUTCOMES (headbutt + "" + objective + ".")
	elif currentverb=="headbutt":
		var somethingattacked 
		
		var eff = check_accuracy(character)
		if eff=="success":
			eff = 1
		elif eff=="half success":
			eff = 0.75
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got a little distracted because of low focus and the strength suffered for it. "
		elif eff=="fail":
			eff = 0
		
		var head = null
		var things = character.get_interactions()
		for i in range (0,things.size(),1):
			if get_node(things[i]).RealName[0]=="Your head":
				head = get_node(things[i])
		if eff==0:
			yourdescription+="Low focus made "+character.get_node("Physicality").get_child(0).RealName[0]+" miss the headbutt. "
			character.Temperature += 20
			character.Stamina-=headbutt[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (head!=null)and(get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=headbutt[0])and(character.Focus>=headbutt[1]):
			var damage=world.clash(head,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" headbutted "+get_node(currentobjective).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=headbutt[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (head!=null)and(get_node(currentobjective).Name=="Object")and(character.Stamina>=headbutt[0])and(character.Focus>=headbutt[1]):
			var damage=world.clash(head,get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" headbutted "+get_node(currentobjective).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=headbutt[0]
			somethingattacked = character.get_node("Physicality").get_child(0)
		elif (head!=null)and(character.Stamina<headbutt[0])or(character.Focus<headbutt[1]):
			lackcondition = true
		elif (head==null):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" don't have a head. "
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify what to headbutt. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=headbutt[0])and(character.Focus>=headbutt[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			somethingattacked = character.get_node("Physicality").get_child(0)
		
		if somethingattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==somethingattacked.Type:
								NPC[i].knownthings[j].last_memory="Got kicked by it. "
								NPC[i].knownthings[j].tolerance -= 2 #tolerance
								NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
								NPC[i].knownthings[j].memory -= 1 #memory
								if NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==somethingattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you kicking something. "
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet violent. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance>=0 and NPC[i].knownthings[j].memory>0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems curious about your violent behaviour. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#DEFEND OUTCOMES (defend + ".")
	elif currentverb=="defend":
		if character.Focus>=defend[1]:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" rised guard. "
			var array=character.get_interactions()
			for i in range (0,array.size(),1):
				if get_node(array[i]).Name=="Object":
					if get_node(array[i]).NPCbody==true:
						if get_node(array[i]).get_parent().get_parent().state=="violent":
							if character.Stamina>=defend[0]:
								character.Temperature += 20
								character.Stamina-=defend[0]
								yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" endured the hit. "
								character.status = "guard"
								character.get_node("Physicality").get_child(0).Structure = character.get_node("Physicality").get_child(0).get_child_count()*2
								for i in range (0,character.get_node("Physicality").get_child(0).get_child_count(),1):
									character.get_node("Physicality").get_child(0).get_child(i).structure = character.get_node("Physicality").get_child(0).Structure
							else:
								character.Temperature += 20
								character.Stamina=0
								yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got hit anyway because the guard failed. "
		else:
			lackcondition = true
	
	#AVOID OUTCOMES (avoid + ".")
	elif currentverb=="avoid":
		var npc = null
		var array=character.get_interactions()
		for i in range (0,array.size(),1):
			if get_node(array[i]).Name=="Object":
				if get_node(array[i]).NPCbody==true:
					if get_node(array[i]).get_parent().get_parent().state=="violent":
						npc = get_node(array[i]).get_parent().get_parent()
		if npc!=null and character.Stamina>=avoid[0] and character.Focus>=avoid[1]:
			character.Temperature += 20
			character.Stamina-=avoid[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" avoided the attack. "
			npc.status = "vulnerable"
			npc.state = "immobilized"
			npc.Stamina -= 40
		elif npc!=null and (character.Stamina<avoid[0] or character.Focus<avoid[1]):
			lackcondition=true
		else:
			yourdescription+="There is nothing to avoid. "
	
	#PUSH OUTCOMES (push + "" + objective + "to" + extra)
	elif currentverb=="push":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		
		var thingpushed = null
		if get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Part")and(currentextra==null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			thingpushed = get_node(currentobjective).nodeowner
			character.Temperature += 10
			character.Stamina-=push[0]
			if get_node(currentobjective).on_object==true:
				if get_node(currentobjective).nodeowner.NPCbody==false:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+get_node(currentobjective).RealName[0]+" but nothing special happened. Better specify 'where' or against 'what' you want to push it next time. "
				elif get_node(currentobjective).nodeowner.NPCbody==true:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+get_node(currentobjective).RealName[0]+". "
					if get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<30:
						get_node(currentobjective).nodeowner.get_parent().get_parent().status = "toppled"
						yourdescription+="He falled down. "
					else:
						yourdescription+="He endured it. "
			elif get_node(currentobjective).on_object==false:
				thingpushed = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+get_node(currentobjective).RealName[0]+" but nothing special happened. Better specify 'where' or against 'what' you want to push it next time. "

		elif get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(currentextra==null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			thingpushed = get_node(currentobjective)
			character.Temperature += 10
			character.Stamina-=push[0]
			if get_node(currentobjective).NPCbody==false:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+get_node(currentobjective).RealName[0]+" but nothing special happened. Better specify 'where' or against 'what' you want to push it next time. "
			elif get_node(currentobjective).NPCbody==true:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+get_node(currentobjective).RealName[0]+". "
				if get_node(currentobjective).get_parent().get_parent().Stamina<30:
					get_node(currentobjective).get_parent().get_parent().status = "toppled"
					yourdescription+="He falled down. "
				else:
					yourdescription+="He endured it. "

		elif get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Part")and(currentextra!=null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			character.Temperature += 10
			character.Stamina-=push[0]
			thingpushed = get_node(currentobjective).nodeowner
			if currentextra.Name=="Space":
				if get_node(currentobjective).on_object==true:
					if get_node(currentobjective).nodeowner.NPCbody==false:
						get_node(currentobjective).nodeowner.get_parent().remove_child(thingpushed)
						currentextra.add_child(thingpushed)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" to an adjacent space. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<30:
						var npc = get_node(currentobjective).nodeowner.get_parent().get_parent()
						get_node(currentobjective).nodeowner.get_parent().get_parent().get_parent().remove_child(npc)
						currentextra.add_child(npc)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" to an adjacent space. "
						npc.status = "toppled"
						yourdescription+="He falled down. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina>=30:
						yourdescription+="He endured it. "
				elif get_node(currentobjective).on_object==false:
					thingpushed = get_node(currentobjective)
					get_node(currentobjective).get_parent().remove_child(thingpushed)
					currentextra.add_child(thingpushed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" to an adjacent space. "
			elif currentextra.Name!="Space":
				if get_node(currentobjective).on_object==true:
					if get_node(currentobjective).nodeowner.NPCbody==false:
						var secondobj
						if currentextra.Name=="Object":
							secondobj = currentextra.get_child(0)
						else:
							secondobj = currentextra
						var damage=world.clash(get_node(currentobjective),secondobj,1)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
						yourdescription+=get_node(currentobjective).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<30:
						var secondobj
						if currentextra.Name=="Object":
							secondobj = currentextra.get_child(0)
						else:
							secondobj = currentextra
						var damage=world.clash(get_node(currentobjective),secondobj,1)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
						yourdescription+=get_node(currentobjective).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
						get_node(currentobjective).nodeowner.get_parent().get_parent().status = "toppled"
						yourdescription+="He falled down. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).get_parent().get_parent().get_parent().Stamina>=30:
						yourdescription+="He endured it. "
				elif get_node(currentobjective).on_object==false:
					var secondobj
					thingpushed = get_node(currentobjective)
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(get_node(currentobjective),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=get_node(currentobjective).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "

		elif get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(currentextra!=null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			character.Temperature += 10
			character.Stamina-=push[0]
			thingpushed = get_node(currentobjective)
			if currentextra.Name=="Space":
				if get_node(currentobjective).NPCbody==false:
					get_node(currentobjective).get_parent().remove_child(thingpushed)
					currentextra.add_child(thingpushed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" to an adjacent space. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina<30:
					var npc = get_node(currentobjective).get_parent().get_parent()
					get_node(currentobjective).get_parent().get_parent().get_parent().remove_child(npc)
					currentextra.add_child(npc)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" to an adjacent space. "
					npc.status = "toppled"
					yourdescription+="He falled down. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina>=30:
					yourdescription+="He endured it. "
			elif currentextra.Name!="Space":
				if get_node(currentobjective).NPCbody==false:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(get_node(currentobjective).get_child(0),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=get_node(currentobjective).get_child(0).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina<30:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(get_node(currentobjective).get_child(0),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pushed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=get_node(currentobjective).get_child(0).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
					get_node(currentobjective).get_parent().get_parent().status = "toppled"
					yourdescription+="He falled down. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina>=30:
					yourdescription+="He endured it. "

		elif (get_node(currentobjective).Name=="Asset"):
			yourdescription+="It's useless to try to push that. "
		elif (character.Stamina<push[0])or(character.Focus<push[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify what to push. "
		
		var npcpushed =false
		if thingpushed!=null:
			if thingpushed.Name=="Object":
				if thingpushed.NPCbody==true:
					npcpushed = true
		if currentextra!=null:
			if currentextra.Name=="Object" or currentextra.Name=="Part":
				if currentextra.NPCbody==true or currentextra.partowner=="NPC":
					npcpushed = true
		
		for i in range (0,NPC.size(),1):
			if npcpushed == true:
				#Enemy reaction if attacked
				if (thingpushed!=null):
					if (thingpushed.get_parent().get_parent()==NPC[i] or thingpushed.get_parent().get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].selfcontrol == false) or (NPC[i].selfcontrol==true and NPC[i].knownthings[j].tolerance < 0):
									NPC[i].knownthings[j].last_memory="Got soft hitted by it. "
									NPC[i].knownthings[j].tolerance -= 2 #tolerance
									NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
									NPC[i].knownthings[j].memory -= 1 #memory
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].selfcontrol=false
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
			#Enemy reaction if sees attack
			if npcpushed == false:
				if (NPC[i].get_node("Physicality").get_child(0)!=thingpushed.get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=thingpushed):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you soft hitting something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#TASTE OUTCOMES (taste + "" + objective + ".")
	elif currentverb=="taste":
		var somethingtasted
		if (get_node(currentobjective).Name=="Object")and(character.Stamina>=taste[0])and(character.Focus>=taste[1]):
			somethingtasted = get_node(currentobjective).get_child(0)
			character.Stamina-=taste[0]
			yourdescription+=get_node(currentobjective).RealName[0]+" tastes "+get_node(currentobjective).get_child(0).taste+". "
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=taste[0])and(character.Focus>=taste[1]):
			somethingtasted = get_node(currentobjective)
			character.Stamina-=taste[0]
			yourdescription+=get_node(currentobjective).RealName[0]+" tastes "+get_node(currentobjective).taste+". "
		if somethingtasted!=null:
			var value = character.getvalue_taste(somethingtasted.taste)
			if value>0:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" liked that taste (recovered some focus). "
			elif value<0:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" hated that taste (lost some focus). "
			if "(lost some focus)" in yourdescription:
				character.Focus -= 5
			if "(recovered some focus)" in yourdescription:
				character.Focus += 5
		elif (character.Stamina<taste[0] or character.Focus<taste[1]):
			lackcondition=true
		else:
			yourdescription+="You can't taste something that doesn't exist. "
		
		if somethingtasted!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#HEAR OUTCOMES (hear + "" + objective + ".")
	elif currentverb=="hear":
		yourdescription="There is no special sound here. "
	
	#SMELL OUTCOMES (smell + "" + objective + ".")
	elif currentverb=="smell":
		var somethingsmelled = null
		if (get_node(currentobjective).Name=="Object")and(character.Stamina>=smell[0])and(character.Focus>=smell[1]):
			somethingsmelled = get_node(currentobjective).get_child(0)
			character.Stamina-=smell[0]
			yourdescription+=get_node(currentobjective).RealName[0]+" smells "+get_node(currentobjective).get_child(0).smell+". "
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=smell[0])and(character.Focus>=smell[1]):
			somethingsmelled = get_node(currentobjective)
			character.Stamina-=smell[0]
			yourdescription+=get_node(currentobjective).RealName[0]+" smells like "+get_node(currentobjective).smell+". "
		if somethingsmelled!=null:
			var value = character.getvalue_smell(somethingsmelled.smell)
			if value>0:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" liked that smell (recovered some focus). "
			elif value<0:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" hated that smell (lost some focus). "
			if "(lost some focus)" in yourdescription:
				character.Focus -= 5
			if "(recovered some focus)" in yourdescription:
				character.Focus += 5
		elif (character.Stamina<smell[0] or character.Focus<smell[1]):
			lackcondition=true
		else:
			yourdescription+="You can't smell something that doesn't exist. "
		
		if somethingsmelled!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#GET OUTCOMES (get + "" + objective + ".")
	elif currentverb=="get":
		var somethinggrabbed = null
		#Get a free object
		if get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).NPCbody==false:
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).NPCbody==true:
				somethinggrabbed = get_node(currentobjective).get_child(0)
				get_node(currentobjective).remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Part")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).partowner=="none":
				if get_node(currentobjective).on_object==false:
					somethinggrabbed = get_node(currentobjective)
					get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
				elif get_node(currentobjective).on_object==true:
					somethinggrabbed = get_node(currentobjective).get_parent()
					get_node(currentobjective).get_parent().get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).partowner=="NPC":
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab that. "
		elif get_node(currentobjective).Type=="you":
			yourdescription+="You already own your own body. "
		elif (character.Stamina<get[0] or character.Focus<get[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab something that doesn't exist. "
		if somethinggrabbed!=null:
			if somethinggrabbed.stack=="ontop":
				somethinggrabbed.stack="none"
			if somethinggrabbed.stack=="base":
				yourdescription+=" Things that were on top of it fall into the floor. "
				var movedthings = []
				for i in range (0,somethinggrabbed.get_child_count(),1):
					if somethinggrabbed.get_child(i).stack=="ontop":
						movedthings.append(somethinggrabbed.get_child(i))
				for i in range (0,movedthings.size(),1):
					movedthings[i].get_parent().remove_child(movedthings[i])
					character.get_parent().add_child(movedthings[i])
					movedthings[i].stack="none"
				somethinggrabbed.stack="none"
	
	#STEAL OUTCOMES (steal + "" + objective + ".") SAME AS GET
	elif currentverb=="steal":
		var somethinggrabbed = null
		#Get a free object
		if get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).NPCbody==false:
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).NPCbody==true:
				somethinggrabbed = get_node(currentobjective).get_child(0)
				get_node(currentobjective).remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Part")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).partowner=="none":
				if get_node(currentobjective).on_object==false:
					somethinggrabbed = get_node(currentobjective)
					get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
				elif get_node(currentobjective).on_object==true:
					somethinggrabbed = get_node(currentobjective).get_parent()
					get_node(currentobjective).get_parent().get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).partowner=="NPC":
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab that. "
		elif get_node(currentobjective).Type=="you":
			yourdescription+="You already own your own body. "
		elif (character.Stamina<get[0] or character.Focus<get[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab something that doesn't exist. "
		if somethinggrabbed!=null:
			if somethinggrabbed.stack=="ontop":
				somethinggrabbed.stack="none"
			if somethinggrabbed.stack=="base":
				yourdescription+=" Things that were on top of it fall into the floor. "
				var movedthings = []
				for i in range (0,somethinggrabbed.get_child_count(),1):
					if somethinggrabbed.get_child(i).stack=="ontop":
						movedthings.append(somethinggrabbed.get_child(i))
				for i in range (0,movedthings.size(),1):
					movedthings[i].get_parent().remove_child(movedthings[i])
					character.get_parent().add_child(movedthings[i])
					movedthings[i].stack="none"
				somethinggrabbed.stack="none"
	
	#RECIEVE OUTCOMES (recieve + "" + objective + ".") SAME AS GET
	elif currentverb=="recieve":
		var somethinggrabbed = null
		#Get a free object
		if get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).NPCbody==false:
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).NPCbody==true:
				somethinggrabbed = get_node(currentobjective).get_child(0)
				get_node(currentobjective).remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Part")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).partowner=="none":
				if get_node(currentobjective).on_object==false:
					somethinggrabbed = get_node(currentobjective)
					get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
				elif get_node(currentobjective).on_object==true:
					somethinggrabbed = get_node(currentobjective).get_parent()
					get_node(currentobjective).get_parent().get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).partowner=="NPC":
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab that. "
		elif get_node(currentobjective).Type=="you":
			yourdescription+="You already own your own body. "
		elif (character.Stamina<get[0] or character.Focus<get[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab something that doesn't exist. "
		if somethinggrabbed!=null:
			if somethinggrabbed.stack=="ontop":
				somethinggrabbed.stack="none"
			if somethinggrabbed.stack=="base":
				yourdescription+=" Things that were on top of it fall into the floor. "
				var movedthings = []
				for i in range (0,somethinggrabbed.get_child_count(),1):
					if somethinggrabbed.get_child(i).stack=="ontop":
						movedthings.append(somethinggrabbed.get_child(i))
				for i in range (0,movedthings.size(),1):
					movedthings[i].get_parent().remove_child(movedthings[i])
					character.get_parent().add_child(movedthings[i])
					movedthings[i].stack="none"
				somethinggrabbed.stack="none"
	
	#DROP OUTCOMES (drop + "" + objective + ".")
	elif currentverb=="drop":
		var droppeditem = null
		if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
			for i in range (1,character.get_node("Physicality").get_child_count(),1):
				if get_node(currentobjective).RealName[0]==character.get_node("Physicality").get_child(i).RealName[0]:
					droppeditem=character.get_node("Physicality").get_child(i)
		if (character.Stamina>=drop[0])and(character.Focus>=drop[1]) and (droppeditem!=null):
			if droppeditem.Name=="Part":
				if droppeditem.partowner!="NPC":
					character.get_node("Physicality").remove_child(droppeditem)
					character.get_parent().add_child(droppeditem)
					yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+droppeditem.RealName[0]+". "
				elif droppeditem.partowner=="NPC":
					character.get_node("Physicality").remove_child(droppeditem)
					droppeditem.nodeowner.add_child(droppeditem)
					droppeditem.nodeowner.move_child(droppeditem,0)
					yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+droppeditem.RealName[0]+". "
			elif droppeditem.Name=="Object":
				if droppeditem.NPCbody==false:
					character.get_node("Physicality").remove_child(droppeditem)
					character.get_parent().add_child(droppeditem)
					yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+droppeditem.RealName[0]+". "
				elif droppeditem.NPCbody==true:
					character.get_node("Physicality").remove_child(droppeditem)
					droppeditem.nodeowner.add_child(droppeditem)
					yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+droppeditem.RealName[0]+". "
		elif (character.Stamina<drop[0] or character.Focus<drop[1]):
			lackcondition=true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't drop that. "
	
	#MOLEST OUTCOMES (molest + "" + objective + ".")
	elif currentverb=="molest":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0] or character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#BETRAY OUTCOMES (betray + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="betray":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0] or character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#CHECK OUTCOMES (check + "" + objective + ".")
	elif currentverb=="check":
		var somethingchecked = null
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset" or get_node(currentobjective).Name=="Space")and(character.Stamina>=check[0])and(character.Focus>=check[1]):
			somethingchecked = get_node(currentobjective)
			character.Stamina-=check[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" checked "+get_node(currentobjective).RealName[0]+". It's "+get_node(currentobjective).GeneralDescription+". "
		elif (character.Stamina<check[0] or character.Focus<check[1]):
			lackcondition=true
		else:
			yourdescription+="That doesn't exist. "
	
	#RELAX OUTCOMES (relax + "" + objective + ".") SAME AS REST
	elif currentverb=="relax":
		if currentverb=="rest"and(character.Stamina!=100):
			if character.Stamina<100:
				character.Stamina += rest[0]
				if character.Stamina>100:
					character.Stamina = 100
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" rested (+50% Stamina)"
		elif currentverb=="rest"and(character.Stamina==100):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" don't need to rest"
	
	#ACT OUTCOMES (act + "like" + objective + ".")
	elif currentverb=="act":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=act[0])and(character.Focus>=act[1]):
			character.Temperature += 10
			character.Stamina-=act[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" performed like "+get_node(currentobjective).GeneralDescription+". "
		elif (character.Stamina<act[0] or character.Focus<act[1]):
			lackcondition=true
		else:
			yourdescription+="The performance was ridiculous. "
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if attacked
			if get_node(currentobjective)!=null:
				if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0):
								NPC[i].knownthings[j].tolerance -= 1
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								elif NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory <= 0:
									NPC[i].curiosity=false
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also tired about you. He seems to have made his mind about you. "
								elif NPC[i].knownthings[j].memory > 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
			#Enemy reaction if sees attack
			if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
				for j in range (0,NPC[i].knownthings.size(),1):
					if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
						if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
							NPC[i].knownthings[j].imageofyou -= 1
							NPC[i].knownthings[j].memory -= 1
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
						elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
							yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
							NPC[i].knownthings[j].memory -= 1
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#COPY OUTCOMES (copy + "" + objective + ".") SAME AS ACT
	elif currentverb=="copy":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=act[0])and(character.Focus>=act[1]):
			character.Temperature += 10
			character.Stamina-=act[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" performed like "+get_node(currentobjective).GeneralDescription+". "
		elif (character.Stamina<act[0] or character.Focus<act[1]):
			lackcondition=true
		else:
			yourdescription+="The performance was ridiculous. "
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if attacked
			if get_node(currentobjective)!=null:
				if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0):
								NPC[i].knownthings[j].tolerance -= 1
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								elif NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory <= 0:
									NPC[i].curiosity=false
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also tired about you. He seems to have made his mind about you. "
								elif NPC[i].knownthings[j].memory > 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
			#Enemy reaction if sees attack
			if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
				for j in range (0,NPC[i].knownthings.size(),1):
					if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
						if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
							NPC[i].knownthings[j].imageofyou -= 1
							NPC[i].knownthings[j].memory -= 1
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
						elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
							yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
							NPC[i].knownthings[j].memory -= 1
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#DETEST OUTCOMES (detest + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="detest":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0] or character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#INTRODUCE OUTCOMES (introduce + "" + objective + "to" + extra)
	elif currentverb=="introduce":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		
		var introductioncase = 0
		var somethingintroduced = null
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(currentextra==null)and(character.Stamina>=introduce[0])and(character.Focus>=introduce[1]):
			somethingintroduced = get_node(currentobjective)
			introductioncase = 1
			character.Stamina-=introduce[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" introduced "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).on_object==true:
					somethingintroduced = get_node(currentobjective).get_parent()
		elif (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(currentextra!=null)and(character.Stamina>=introduce[0])and(character.Focus>=introduce[1]):
			somethingintroduced = get_node(currentobjective)
			introductioncase = 2
			character.Stamina-=introduce[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" introduced "+get_node(currentobjective).RealName[0]+" to "+currentextra.RealName[0]+". "
			if get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).on_object==true:
					somethingintroduced = get_node(currentobjective).get_parent()
		elif (character.Stamina<introduce[0] or character.Focus<introduce[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't introduce something that doesn't exist. "
		
		if introductioncase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if introduced
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].curiosity == false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like to be presented like that. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].last_memory="Got introduced by it. "
									if NPC.size()>1:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" appreciated your effort. "
									if NPC.size()<=1:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for presenting him to no one. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								NPC[i].knownthings[j].last_memory="Got introduced to someone by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if recieves introduction
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if (introductioncase==1)or(introductioncase==2 and (NPC[i].get_node("Physicality").get_child(0)==currentextra.get_parent())or(NPC[i].get_node("Physicality").get_child(0)==currentextra)):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].courtesy+=1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
							if NPC[i].knownthings[j].Type==somethingintroduced.Type:
								if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks interested. "
									if somethingintroduced.Type!="you":
										yourdescription += "He says: "+NPC[i].knownthings[j].last_memory
									NPC[i].status="expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target=character.get_node("Physicality").get_child(0)
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with it. "
								if NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].courtesy+=1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
							NPC[i].knownthings[j].last_memory="Got introduced to it by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#APOLOGIZE OUTCOMES (apologize + "to" + objective + ".")
	elif currentverb=="apologize":
		var somethingapologized = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=apologize[0])and(character.Focus>=apologize[1]):
			somethingapologized = 1
			character.Stamina-=apologize[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" apologized to "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingapologized = 3
		elif (character.Stamina<apologize[0] or character.Focus<apologize[1]):
			lackcondition=true
		else:
			somethingapologized = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't apologize something that doesn't exist. "
		
		if somethingapologized!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if apologized
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="offended" and NPC[i].target==character.get_node("Physicality").get_child(0):
									if NPC[i].empathy == false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't accept your apology. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" accepted your apology. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									NPC[i].knownthings[j].last_memory="Got an apology of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								elif NPC[i].knownthings[j].imageofyou<0 and NPC[i].knownthings[j].tolerance >= 0:
									if NPC[i].empathy == false:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" accepted your apology. "
									else:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are too late for apologizing. "
								elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are apologizing but looks curious. "
									if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are apologizing and thinks you are weird. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees apologize
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingapologized == 3 and NPC[i].knownthings[j].memory>0:
								if NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your behavior was kind. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for apologizing to no one. "
							NPC[i].knownthings[j].last_memory="Saw an apology of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#THANK OUTCOMES (thank + "" + objective + ".")
	elif currentverb=="thank":
		var somethingthanked = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=thank[0])and(character.Focus>=thank[1]):
			somethingthanked = 1
			character.Stamina-=thank[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" thanked "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingthanked = 3
		elif (character.Stamina<thank[0] or character.Focus<thank[1]):
			lackcondition=true
		else:
			somethingthanked = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't thank something that doesn't exist. "
		
		if somethingthanked!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if thanked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="expectingthanks" and NPC[i].target==character.get_node("Physicality").get_child(0):
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" says you're welcome. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									NPC[i].knownthings[j].last_memory="Got an apology of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								else:
									if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are thanking but looks curious. "
									if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are thanking and thinks you are weird. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if recieves a thanks
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingthanked==3:
								if NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your behavior was kind. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for thanking no one. "
							NPC[i].knownthings[j].last_memory="Saw an apology of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#INFATUATE OUTCOMES (thank + "" + objective + ".")
	elif currentverb=="infatuate":
		var somethinginfatuated = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=infatuate[0])and(character.Focus>=infatuate[1]):
			somethinginfatuated = 1
			character.Stamina-=infatuate[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" infatuated "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethinginfatuated = 3
		elif (character.Stamina<infatuate[0] or character.Focus<infatuate[1]):
			lackcondition=true
		else:
			somethinginfatuated = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't infatuate something that doesn't exist. "
		
		if somethinginfatuated!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if infatuated
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].knownthings[j].imageofyou >= 3 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be falling for you. "
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are taking things too far. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got infatuated by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees infatuation
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethinginfatuated == 3:
								if NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are brave for trying that. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for infatuating no one. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" infatuating. "
	
	#CHEER OUTCOMES (cheer + "" + objective + ".")
	elif currentverb=="cheer":
		var somethingcheered = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=cheer[0])and(character.Focus>=cheer[1]):
			somethingcheered = 1
			character.Stamina-=cheer[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" cheered "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingcheered = 3
		elif (character.Stamina<cheer[0] or character.Focus<cheer[1]):
			lackcondition=true
		else:
			somethingcheered = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't cheer something that doesn't exist. "
		
		if somethingcheered!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if cheered
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="depressed":
									if NPC[i].pride==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status==null
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" really apreciated your encouragement and seems to be feeling better. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is too prideful to take your encouragement. "
									NPC[i].knownthings[j].last_memory="Got cheered by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								else:
									if NPC[i].pride==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are encouraging him but looks curious. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are encouraging him and thinks you are weird. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees a cheer
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingcheered==3:
								if NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your behavior was kind. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for cheering no one. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" cheering. "
	
	#CHALLENGE OUTCOMES (challenge + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="challenge":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0] or character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#DECLINE OUTCOMES (decline + ".")
	elif currentverb=="decline":
		var somethingdeclined = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=decline[0])and(character.Focus>=decline[1]):
			somethingdeclined = 1
			character.Stamina-=decline[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" declined "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingdeclined = 3
		elif (character.Stamina<decline[0] or character.Focus<decline[1]):
			lackcondition=true
		else:
			somethingdeclined = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't decline something that doesn't exist. "
		
		if somethingdeclined!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if cheered
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="expectingyesorno":
									if NPC[i].pride==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" accepted your response. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't took well your decline. "
								else:
									if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are declining to nothing but is curious about it. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are declining to nothing and thinks you are weird. "
								NPC[i].knownthings[j].last_memory="Got declined by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees a cheer
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingdeclined!=3 and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for declining to nothing. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" declining something. "
	
	#OPEN OUTCOMES (open + "" + objective + ".")
	elif currentverb=="open":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=open[0])and(character.Focus>=open[1]):
			character.Stamina-=open[0]
			if get_node(currentobjective).openable=="close":
				get_node(currentobjective).openable="open"
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" opened "+get_node(currentobjective).RealName[0]+". "
				for i in range (0,get_node(currentobjective).get_child_count(),1):
					if get_node(currentobjective).get_child(i).on_object==false:
						yourdescription+="Inside there is a "+get_node(currentobjective).get_child(i).RealName[0]
			elif get_node(currentobjective).openable=="open":
				yourdescription+=get_node(currentobjective).RealName[0]+" is already open. "
			elif get_node(currentobjective).openable=="locked":
				yourdescription+=get_node(currentobjective).RealName[0]+" is locked down. "
			else:
				yourdescription+=get_node(currentobjective).RealName[0]+" can't be opened. "
		elif (character.Stamina<open[0] or character.Focus<open[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't open something that doesn't exist. "
	
	#CLOSE OUTCOMES (close + "" + objective + ".")
	elif currentverb=="close":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=close[0])and(character.Focus>=close[1]):
			character.Stamina-=close[0]
			if get_node(currentobjective).openable=="close":
				yourdescription+=get_node(currentobjective).RealName[0]+" is already closed. "
			elif get_node(currentobjective).openable=="open":
				get_node(currentobjective).openable="close"
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" closed "+get_node(currentobjective).RealName[0]+". "
			elif get_node(currentobjective).openable=="locked":
				yourdescription+=get_node(currentobjective).RealName[0]+" is already closed and locked down. "
			else:
				yourdescription+=get_node(currentobjective).RealName[0]+" can't be closed. "
		elif (character.Stamina<close[0] or character.Focus<close[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't close something that doesn't exist. "
	
	#BRING OUTCOMES (bring + "" + objective + ".") SAME AS GET
	elif currentverb=="bring":
		var somethinggrabbed = null
		#Get a free object
		if get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).NPCbody==false:
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).NPCbody==true:
				somethinggrabbed = get_node(currentobjective).get_child(0)
				get_node(currentobjective).remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Part")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			character.Stamina-=get[0]
			if get_node(currentobjective).partowner=="none":
				if get_node(currentobjective).on_object==false:
					somethinggrabbed = get_node(currentobjective)
					get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
				elif get_node(currentobjective).on_object==true:
					somethinggrabbed = get_node(currentobjective).get_parent()
					get_node(currentobjective).get_parent().get_parent().remove_child(somethinggrabbed)
					character.get_node("Physicality").add_child(somethinggrabbed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
			elif get_node(currentobjective).partowner=="NPC":
				somethinggrabbed = get_node(currentobjective)
				get_node(currentobjective).get_parent().remove_child(somethinggrabbed)
				character.get_node("Physicality").add_child(somethinggrabbed)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" grabbed "+somethinggrabbed.RealName[0]+". "
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=get[0])and(character.Focus>=get[1]):
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab that. "
		elif get_node(currentobjective).Type=="you":
			yourdescription+="You already own your own body. "
		elif (character.Stamina<get[0] or character.Focus<get[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't grab something that doesn't exist. "
		if somethinggrabbed!=null:
			if somethinggrabbed.stack=="ontop":
				somethinggrabbed.stack="none"
			if somethinggrabbed.stack=="base":
				yourdescription+=" Things that were on top of it fall into the floor. "
				var movedthings = []
				for i in range (0,somethinggrabbed.get_child_count(),1):
					if somethinggrabbed.get_child(i).stack=="ontop":
						movedthings.append(somethinggrabbed.get_child(i))
				for i in range (0,movedthings.size(),1):
					movedthings[i].get_parent().remove_child(movedthings[i])
					character.get_parent().add_child(movedthings[i])
					movedthings[i].stack="none"
				somethinggrabbed.stack="none"
	
	#SALUTE OUTCOMES (salute + "" + objective + ".")
	elif currentverb=="salute":
		var somethingsaluted = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=salute[0])and(character.Focus>=salute[1]):
			somethingsaluted = 1
			character.Stamina-=salute[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" saluted "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingsaluted = 3
		elif (character.Stamina<salute[0] or character.Focus<salute[1]):
			lackcondition=true
		else:
			somethingsaluted = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't salute something that doesn't exist. "
		
		if somethingsaluted!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if saluted
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].knownthings[j].courtesy==0 and NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].courtesy+=1
									if NPC[i].sociability==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" saluted back. "
									else:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is too shy to salute back. "
								elif NPC[i].knownthings[j].courtesy==0 and NPC[i].knownthings[j].interactedwithit>1 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].courtesy+=1
									if NPC[i].sociability==true and NPC[i].pride==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" saluted back but laughed a bit because you were kinda late for that. "
									else:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ommited your salute because he felt you were kinda late for that. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for saluting more than once. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got saluted by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a salute
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingsaluted==3:
								if NPC[i].pride==true and NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your were kinda rude for skipping your salute to him. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for saluting no one. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" saluting. "
	
	#SMILE OUTCOMES (smile + "" + objective + ".")
	elif currentverb=="smile":
		var somethingsmiled = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=smile[0])and(character.Focus>=smile[1]):
			somethingsmiled = 1
			character.Stamina-=smile[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" smiled at "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingsmiled = 3
		elif (character.Stamina<smile[0] or character.Focus<smile[1]):
			lackcondition=true
		else:
			somethingsmiled = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" smiled. "
		
		if somethingsmiled!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if smiled
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].sociability==true or NPC[i].curiosity==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" smiled back at you. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your smile. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got smiled by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a smile
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingsmiled!=3:
								if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about why you smiled. "
								elif NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought you were weird for smiling alone. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" smiling. "
	
	#SING OUTCOMES (sing + "" + objective + ".")
	elif currentverb=="sing":
		var somethingsinged = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=sing[0])and(character.Focus>=sing[1]):
			somethingsinged = 1
			character.Stamina-=sing[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" singed to "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingsinged = 3
		elif (character.Stamina<sing[0] or character.Focus<sing[1]):
			lackcondition=true
		else:
			somethingsinged = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" singed. "
		
		if somethingsinged!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if smiled
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].sociability==true or NPC[i].curiosity==true or NPC[i].empathy==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" liked your singing and is looking forward to know you more. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your singing. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got smiled by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a smile
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingsinged!=3:
								if (NPC[i].curiosity==true or NPC[i].sociability==true or NPC[i].empathy==true) and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about you and your song. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" singing. "
	
	#PUT OUTCOMES (put + "" + objective + "into" + extra)
	elif currentverb=="put":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		var somethingmoved
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(currentextra!=null)and(character.Stamina>=put[0])and(character.Focus>=put[1]):
			character.Stamina-=put[0]
			if get_node(currentobjective).Name=="Part" and get_node(currentobjective).on_object==true:
				somethingmoved=get_node(currentobjective).nodeowner
			else:
				somethingmoved=get_node(currentobjective)
			
			if currentextra.Name=="Part" and currentextra.on_object==true:
				currentextra=currentextra.nodeowner
			
			if get_node(currentobjective)==currentextra:
				var things = character.get_interactions()
				for i in range (0,things.size(),1):
					if get_node(currentobjective).RealName[0]==get_node(things[i]).RealName[0] and get_node(currentobjective)!=get_node(things[i]):
						currentextra = get_node(things[i])
			
			if get_node(currentobjective)!=currentextra and get_node(currentobjective).get_children().has(currentextra)==false and (currentextra.get_parent().get_parent().Name!="Protagonist" or currentextra.RealName[0]=="You") and currentextra.Name!="Asset" and somethingmoved.NPCbody==false and somethingmoved!=get_parent().get_node("Physicality").get_child(0):
				if somethingmoved.partowner=="none":
					if currentextra.openable=="close" or currentextra.openable=="locked":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" tried to put "+get_node(currentobjective).RealName[0]+" into "+currentextra.RealName[0]+" but couldn't because its closed. "
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" above "+currentextra.RealName[0]+". "
						#acomodate base
						if currentextra.stack=="ontop":
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.get_parent().add_child(somethingmoved)
							currentextra.get_parent().stack="base"
						else:
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.add_child(somethingmoved)
							currentextra.stack="base"
						#acomodate ontop
						if somethingmoved.stack=="base":
							var movedthings = []
							for i in range (0,somethingmoved.get_child_count(),1):
								if somethingmoved.get_child(i).stack=="ontop":
									movedthings.append(somethingmoved.get_child(i))
							for i in range (0,movedthings.size(),1):
								movedthings[i].get_parent().remove_child(movedthings[i])
								somethingmoved.get_parent().add_child(movedthings[i])
								movedthings[i].stack="ontop"
							somethingmoved.stack="ontop"
						else:
							somethingmoved.stack="ontop"
					elif currentextra.openable=="open":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" into "+currentextra.RealName[0]
						somethingmoved.get_parent().remove_child(somethingmoved)
						currentextra.add_child(somethingmoved)
					else:
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" above "+currentextra.RealName[0]+". "
						#acomodate base
						if currentextra.stack=="ontop":
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.get_parent().add_child(somethingmoved)
							currentextra.get_parent().stack="base"
						else:
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.add_child(somethingmoved)
							currentextra.stack="base"
						#acomodate ontop
						if somethingmoved.stack=="base":
							var movedthings = []
							for i in range (0,somethingmoved.get_child_count(),1):
								if somethingmoved.get_child(i).stack=="ontop":
									movedthings.append(somethingmoved.get_child(i))
							for i in range (0,movedthings.size(),1):
								movedthings[i].get_parent().remove_child(movedthings[i])
								somethingmoved.get_parent().add_child(movedthings[i])
								movedthings[i].stack="ontop"
							somethingmoved.stack="ontop"
						else:
							somethingmoved.stack="ontop"
			elif somethingmoved.NPCbody==true or somethingmoved==get_parent().get_node("Physicality").get_child(0):
				yourdescription+="Can't manage limbs like that. "
			elif currentextra.Name=="Asset":
				yourdescription+=get_node(currentobjective).RealName[0]+" falled into the floor. "
				somethingmoved.get_parent().remove_child(somethingmoved)
				character.get_parent().add_child(somethingmoved)
			elif currentextra.get_parent().get_parent().Name=="Protagonist":
				yourdescription+="Can't stack those things while carrying them. "
			else:
				yourdescription+="Can't put something on top of itself"
		elif (character.Stamina<put[0] or character.Focus<put[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got to elaborate more on that action. "
		
		if somethingmoved!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if somethingmoved!=null:
					if (somethingmoved.get_parent().get_parent()==NPC[i] or somethingmoved.get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=somethingmoved.get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=somethingmoved):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#THROW OUTCOMES (throw + "" + objective + "to" + extra)
	elif currentverb=="throw":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		var thingpushed = null
		var drop = false
		for i in range (1,character.get_node("Physicality").get_child_count(),1):
			if character.get_node("Physicality").get_child(i).RealName[0]==get_node(currentobjective).RealName[0]:
				thingpushed = character.get_node("Physicality").get_child(i)
			
		if (thingpushed!=null)and(thingpushed.Name=="Part")and(currentextra==null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			drop = true
			if thingpushed.partowner!="NPC":
				character.get_node("Physicality").remove_child(thingpushed)
				character.get_parent().add_child(thingpushed)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+thingpushed.RealName[0]+". "
			elif thingpushed.partowner=="NPC":
				character.get_node("Physicality").remove_child(thingpushed)
				thingpushed.nodeowner.add_child(thingpushed)
				thingpushed.nodeowner.move_child(thingpushed,0)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+thingpushed.RealName[0]+". "
			
		elif (thingpushed!=null)and(thingpushed.Name=="Object")and(currentextra==null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			drop = true
			if thingpushed.NPCbody==false:
				character.get_node("Physicality").remove_child(thingpushed)
				character.get_parent().add_child(thingpushed)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+thingpushed.RealName[0]+". "
			elif thingpushed.NPCbody==true:
				character.get_node("Physicality").remove_child(thingpushed)
				thingpushed.nodeowner.add_child(thingpushed)
				yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" dropped "+thingpushed.RealName[0]+". "
			
		elif (thingpushed!=null)and(thingpushed.Name=="Part")and(currentextra!=null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			character.Temperature += 20
			character.Stamina-=push[0]
			if currentextra.Name=="Space":
				if thingpushed.on_object==true:
					if thingpushed.nodeowner.NPCbody==false:
						thingpushed.nodeowner.get_parent().remove_child(thingpushed)
						currentextra.add_child(thingpushed)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" to an adjacent space. "
					elif thingpushed.nodeowner.NPCbody==true and thingpushed.nodeowner.get_parent().get_parent().Stamina<30:
						var npc = thingpushed.nodeowner.get_parent().get_parent()
						thingpushed.nodeowner.get_parent().get_parent().get_parent().remove_child(npc)
						currentextra.add_child(npc)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" to an adjacent space. "
						npc.status = "toppled"
						yourdescription+="He falled down. "
					elif thingpushed.nodeowner.NPCbody==true and thingpushed.nodeowner.get_parent().get_parent().Stamina>=30:
						yourdescription+="He endured it. "
				elif thingpushed.on_object==false:
					thingpushed.get_parent().remove_child(thingpushed)
					currentextra.add_child(thingpushed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" to an adjacent space. "
			elif currentextra.Name!="Space":
				if thingpushed.on_object==true:
					if thingpushed.nodeowner.NPCbody==false:
						var secondobj
						if currentextra.Name=="Object":
							secondobj = currentextra.get_child(0)
						else:
							secondobj = currentextra
						var damage=world.clash(thingpushed,secondobj,1)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
						yourdescription+=thingpushed.RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
					elif thingpushed.nodeowner.NPCbody==true and thingpushed.nodeowner.get_parent().get_parent().Stamina<30:
						var secondobj
						if currentextra.Name=="Object":
							secondobj = currentextra.get_child(0)
						else:
							secondobj = currentextra
						var damage=world.clash(thingpushed,secondobj,1)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
						yourdescription+=thingpushed.RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
						thingpushed.nodeowner.get_parent().get_parent().status = "toppled"
						yourdescription+="He falled down. "
					elif thingpushed.nodeowner.NPCbody==true and thingpushed.nodeowner.get_parent().get_parent().Stamina>=30:
						yourdescription+="He endured it. "
				elif thingpushed.on_object==false:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(thingpushed,secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=thingpushed.RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "

		elif (thingpushed!=null)and(thingpushed.Name=="Object")and(currentextra!=null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			character.Temperature += 20
			character.Stamina-=push[0]
			if currentextra.Name=="Space":
				if thingpushed.NPCbody==false:
					thingpushed.get_parent().remove_child(thingpushed)
					currentextra.add_child(thingpushed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" to an adjacent space. "
				elif thingpushed.NPCbody==true and thingpushed.get_parent().get_parent().Stamina<30:
					var npc = thingpushed.get_parent().get_parent()
					thingpushed.get_parent().get_parent().get_parent().remove_child(npc)
					currentextra.add_child(npc)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" to an adjacent space. "
					npc.status = "toppled"
					yourdescription+="He falled down. "
				elif thingpushed.NPCbody==true and thingpushed.get_parent().get_parent().Stamina>=30:
					yourdescription+="He endured it. "
			elif currentextra.Name!="Space":
				if thingpushed.NPCbody==false:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(thingpushed.get_child(0),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=thingpushed.get_child(0).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
				elif thingpushed.NPCbody==true and thingpushed.get_parent().get_parent().Stamina<30:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(thingpushed.get_child(0),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" throwed "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=thingpushed.get_child(0).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
					thingpushed.get_parent().get_parent().status = "toppled"
					yourdescription+="He falled down. "
				elif thingpushed.NPCbody==true and thingpushed.get_parent().get_parent().Stamina>=30:
					yourdescription+="He endured it. "
		elif (thingpushed!=null)and(character.Stamina<push[0])or(character.Focus<push[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify something to throw that is already in inventory. "
		
		var npcpushed =false
		if thingpushed!=null:
			if thingpushed.Name=="Object":
				if thingpushed.NPCbody==true:
					npcpushed = true
			if thingpushed.Name=="Part":
				if thingpushed.partowner=="NPC":
					thingpushed = thingpushed.nodeowner
					npcpushed = true
		if currentextra!=null:
			if currentextra.Name=="Object":
				if currentextra.NPCbody==true:
					npcpushed = true
			if currentextra.Name=="Part":
				if currentextra.partowner=="NPC":
					currentextra = currentextra.nodeowner
					npcpushed = true
		
		for i in range (0,NPC.size(),1):
			if npcpushed == true:
				#Enemy reaction if attacked
				if (thingpushed!=null):
					if (thingpushed.get_parent().get_parent()==NPC[i] or thingpushed.get_parent().get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].selfcontrol == false) or (NPC[i].selfcontrol==true and NPC[i].knownthings[j].tolerance < 0):
									NPC[i].knownthings[j].last_memory="Got soft hitted by it. "
									NPC[i].knownthings[j].tolerance -= 2 #tolerance
									NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
									NPC[i].knownthings[j].memory -= 1 #memory
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].selfcontrol=false
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
			#Enemy reaction if sees attack
			if npcpushed == false and drop==false and thingpushed!=null:
				if (NPC[i].get_node("Physicality").get_child(0)!=thingpushed.get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=thingpushed):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you soft hitting something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#PULL OUTCOMES (pull + "" + objective) SAME AS PUSH
	elif currentverb=="pull":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		var thingpushed = null
		if get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Part")and(currentextra==null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			thingpushed = get_node(currentobjective).nodeowner
			character.Temperature += 10
			character.Stamina-=push[0]
			if get_node(currentobjective).on_object==true:
				if get_node(currentobjective).nodeowner.NPCbody==false:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+get_node(currentobjective).RealName[0]+" but nothing special happened. Better specify 'where' or against 'what' you want to pull it next time. "
				elif get_node(currentobjective).nodeowner.NPCbody==true:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+get_node(currentobjective).RealName[0]+". "
					if get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<30:
						get_node(currentobjective).nodeowner.get_parent().get_parent().status = "toppled"
						yourdescription+="He falled down. "
					else:
						yourdescription+="He endured it. "
			elif get_node(currentobjective).on_object==false:
				thingpushed = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+get_node(currentobjective).RealName[0]+" but nothing special happened. Better specify 'where' or against 'what' you want to pull it next time. "

		elif get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(currentextra==null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			thingpushed = get_node(currentobjective)
			character.Temperature += 10
			character.Stamina-=push[0]
			if get_node(currentobjective).NPCbody==false:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+get_node(currentobjective).RealName[0]+" but nothing special happened. Better specify 'where' or against 'what' you want to pull it next time. "
			elif get_node(currentobjective).NPCbody==true:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+get_node(currentobjective).RealName[0]+". "
				if get_node(currentobjective).get_parent().get_parent().Stamina<30:
					get_node(currentobjective).get_parent().get_parent().status = "toppled"
					yourdescription+="He falled down. "
				else:
					yourdescription+="He endured it. "

		elif get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Part")and(currentextra!=null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			character.Temperature += 10
			character.Stamina-=push[0]
			thingpushed = get_node(currentobjective).nodeowner
			if currentextra.Name=="Space":
				if get_node(currentobjective).on_object==true:
					if get_node(currentobjective).nodeowner.NPCbody==false:
						get_node(currentobjective).nodeowner.get_parent().remove_child(thingpushed)
						currentextra.add_child(thingpushed)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" to an adjacent space. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<30:
						var npc = get_node(currentobjective).nodeowner.get_parent().get_parent()
						get_node(currentobjective).nodeowner.get_parent().get_parent().get_parent().remove_child(npc)
						currentextra.add_child(npc)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" to an adjacent space. "
						npc.status = "toppled"
						yourdescription+="He falled down. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina>=30:
						yourdescription+="He endured it. "
				elif get_node(currentobjective).on_object==false:
					thingpushed = get_node(currentobjective)
					get_node(currentobjective).get_parent().remove_child(thingpushed)
					currentextra.add_child(thingpushed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" to an adjacent space. "
			elif currentextra.Name!="Space":
				if get_node(currentobjective).on_object==true:
					if get_node(currentobjective).nodeowner.NPCbody==false:
						var secondobj
						if currentextra.Name=="Object":
							secondobj = currentextra.get_child(0)
						else:
							secondobj = currentextra
						var damage=world.clash(get_node(currentobjective),secondobj,1)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
						yourdescription+=get_node(currentobjective).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).nodeowner.get_parent().get_parent().Stamina<30:
						var secondobj
						if currentextra.Name=="Object":
							secondobj = currentextra.get_child(0)
						else:
							secondobj = currentextra
						var damage=world.clash(get_node(currentobjective),secondobj,1)
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
						yourdescription+=get_node(currentobjective).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
						get_node(currentobjective).nodeowner.get_parent().get_parent().status = "toppled"
						yourdescription+="He falled down. "
					elif get_node(currentobjective).nodeowner.NPCbody==true and get_node(currentobjective).get_parent().get_parent().get_parent().Stamina>=30:
						yourdescription+="He endured it. "
				elif get_node(currentobjective).on_object==false:
					var secondobj
					thingpushed = get_node(currentobjective)
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(get_node(currentobjective),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=get_node(currentobjective).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "

		elif get_node(currentobjective).Type!="you" and (get_node(currentobjective).Name=="Object")and(currentextra!=null)and(character.Stamina>=push[0])and(character.Focus>=push[1]):
			character.Temperature += 10
			character.Stamina-=push[0]
			thingpushed = get_node(currentobjective)
			if currentextra.Name=="Space":
				if get_node(currentobjective).NPCbody==false:
					get_node(currentobjective).get_parent().remove_child(thingpushed)
					currentextra.add_child(thingpushed)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" to an adjacent space. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina<30:
					var npc = get_node(currentobjective).get_parent().get_parent()
					get_node(currentobjective).get_parent().get_parent().get_parent().remove_child(npc)
					currentextra.add_child(npc)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" to an adjacent space. "
					npc.status = "toppled"
					yourdescription+="He falled down. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina>=30:
					yourdescription+="He endured it. "
			elif currentextra.Name!="Space":
				if get_node(currentobjective).NPCbody==false:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(get_node(currentobjective).get_child(0),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=get_node(currentobjective).get_child(0).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina<30:
					var secondobj
					if currentextra.Name=="Object":
						secondobj = currentextra.get_child(0)
					else:
						secondobj = currentextra
					var damage=world.clash(get_node(currentobjective).get_child(0),secondobj,1)
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" pulled "+thingpushed.RealName[0]+" against "+currentextra.RealName[0]+". "
					yourdescription+=get_node(currentobjective).get_child(0).RealName[0]+" recieved "+str(damage[0])+" of damage. "+secondobj.RealName[0]+" recieved "+str(damage[1])+" of damage. "
					get_node(currentobjective).get_parent().get_parent().status = "toppled"
					yourdescription+="He falled down. "
				elif get_node(currentobjective).NPCbody==true and get_node(currentobjective).get_parent().get_parent().Stamina>=30:
					yourdescription+="He endured it. "

		elif (get_node(currentobjective).Name=="Asset"):
			yourdescription+="It's useless to try to pull that. "
		elif (character.Stamina<push[0])or(character.Focus<push[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify what to pull. "
		
		var npcpushed =false
		if thingpushed!=null:
			if thingpushed.Name=="Object":
				if thingpushed.NPCbody==true:
					npcpushed = true
		
		for i in range (0,NPC.size(),1):
			if npcpushed == true:
				#Enemy reaction if attacked
				if (get_node(currentobjective)!=null):
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].selfcontrol == false) or (NPC[i].selfcontrol==true and NPC[i].knownthings[j].tolerance < 0):
									NPC[i].knownthings[j].last_memory="Got soft hitted by it. "
									NPC[i].knownthings[j].tolerance -= 2 #tolerance
									NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
									NPC[i].knownthings[j].memory -= 1 #memory
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									NPC[i].selfcontrol=false
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
			#Enemy reaction if sees attack
			if npcpushed == false:
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you soft hitting something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#TOUCH OUTCOMES (touch + "" + objective + ".")
	elif currentverb=="touch":
		var somethingtouched
		if (get_node(currentobjective).Name=="Object")and(character.Stamina>=touch[0])and(character.Focus>=touch[1]):
			somethingtouched = get_node(currentobjective).get_child(0)
			character.Stamina-=touch[0]
			yourdescription+=get_node(currentobjective).RealName[0]+" feels "+get_node(currentobjective).get_child(0).texture+". "
		elif (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=touch[0])and(character.Focus>=touch[1]):
			somethingtouched = get_node(currentobjective)
			character.Stamina-=touch[0]
			yourdescription+=get_node(currentobjective).RealName[0]+" feels "+get_node(currentobjective).texture+". "
		if somethingtouched!=null:
			var value = character.getvalue_texture(somethingtouched.texture)
			if value>0:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" liked that feel (recovered some focus). "
			elif value<-1:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" hated that feel (lost some focus). "
			if "(lost some focus)" in yourdescription:
				character.Focus -= 5
			if "(recovered some focus)" in yourdescription:
				character.Focus += 5
		elif (character.Stamina<touch[0] or character.Focus<touch[1]):
			lackcondition=true
		else:
			yourdescription+="You can't touch something that doesn't exist. "
		
		if somethingtouched!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#FORGIVE OUTCOMES (forgive + "" + objective + ".")
	elif currentverb=="forgive":
		var somethingforgived = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=forgive[0])and(character.Focus>=forgive[1]):
			somethingforgived = 1
			character.Stamina-=forgive[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" forgived "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingforgived = 3
		elif (character.Stamina<forgive[0] or character.Focus<forgive[1]):
			lackcondition=true
		else:
			somethingforgived = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't forgive something that doesn't exist. "
		
		if somethingforgived!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if apologized
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="ashamed" and NPC[i].target==character.get_node("Physicality").get_child(0):
									if NPC[i].pride == true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't care for your forgiveness. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].pride == false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" apreciated your forgiveness. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									NPC[i].knownthings[j].last_memory="Got forgived by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								else:
									if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are forgiving him but looks curious. "
									if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are forgiving him and thinks you are weird. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees apologize
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingforgived == 3 and NPC[i].knownthings[j].memory>0:
								if NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your behavior was kind. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for forgiving no one. "
							NPC[i].knownthings[j].last_memory="Saw a forgiveness of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#FIX OUTCOMES (fix + "" + objective + ".")
	elif currentverb=="fix":
		var somethingfixed
		if (get_node(currentobjective).Name=="Object")and(character.Stamina>=fix[0])and(character.Focus>=fix[1]):
			for i in range (0,get_node(currentobjective).get_child_count(),1):
				if get_node(currentobjective).get_child(i).durability<get_node(currentobjective).get_child(i).Maxdurability:
					somethingfixed = get_node(currentobjective).get_child(i)
			if somethingfixed!=null:
				character.Stamina-=fix[0]
				somethingfixed.durability += 1
				if somethingfixed.durability>somethingfixed.Maxdurability:
					somethingfixed.durability=somethingfixed.Maxdurability
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" restored "+somethingfixed.RealName[0]+" a bit. "
			else:
				yourdescription+="That doesn't need further restoration. "
		elif (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=fix[0])and(character.Focus>=fix[1]):
			somethingfixed = get_node(currentobjective)
			if somethingfixed.durability<somethingfixed.Maxdurability:
				character.Stamina-=fix[0]
				character.Focus-=fix[1]
				somethingfixed.durability += 1
				if somethingfixed.durability>somethingfixed.Maxdurability:
					somethingfixed.durability=somethingfixed.Maxdurability
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" restored "+somethingfixed.RealName[0]+" a bit. "
			else:
				yourdescription+="That doesn't need further restoration. "
		elif (character.Stamina<fix[0])or(character.Focus<fix[1]):
			lackcondition=true
		else:
			yourdescription+="You can't restore something that doesn't exist. "
		
		#animations
		if somethingfixed!=null:
			if somethingfixed.Type=="you":
				world.get_node("Text_Animations").bodysprites_animation = true
				get_parent().get_node("Body_Sprites").update_bodydamage()
		
		var npcrestored =false
		if somethingfixed!=null:
			if somethingfixed.Name=="Object":
				if somethingfixed.NPCbody==true:
					npcrestored = true
			if somethingfixed.Name=="Part":
				if somethingfixed.partowner=="NPC":
					somethingfixed = somethingfixed.nodeowner
					npcrestored = true
		
		if somethingfixed!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].pride==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is too proud to be grateful for your help. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].pride==false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is grateful for your kind act. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if npcrestored==true and (NPC[i].empathy==true or NPC[i].sociability==true) and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that you were kind for helping. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif npcrestored==false and NPC[i].curiosity==true and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" look interested in your doings. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#HEAL OUTCOMES (heal + "" + objective + ".") SAME AS FIX
	elif currentverb=="heal":
		var somethingfixed
		if (get_node(currentobjective).Name=="Object")and(character.Stamina>=fix[0])and(character.Focus>=fix[1]):
			for i in range (0,get_node(currentobjective).get_child_count(),1):
				if get_node(currentobjective).get_child(i).durability<get_node(currentobjective).get_child(i).Maxdurability:
					somethingfixed = get_node(currentobjective).get_child(i)
			if somethingfixed!=null:
				character.Stamina-=fix[0]
				somethingfixed.durability += 1
				if somethingfixed.durability>somethingfixed.Maxdurability:
					somethingfixed.durability=somethingfixed.Maxdurability
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" restored "+somethingfixed.RealName[0]+" a bit. "
			else:
				yourdescription+="That doesn't need further restoration. "
		elif (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=fix[0])and(character.Focus>=fix[1]):
			somethingfixed = get_node(currentobjective)
			if somethingfixed.durability<somethingfixed.Maxdurability:
				character.Stamina-=fix[0]
				somethingfixed.durability += 1
				if somethingfixed.durability>somethingfixed.Maxdurability:
					somethingfixed.durability=somethingfixed.Maxdurability
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" restored "+somethingfixed.RealName[0]+" a bit. "
			else:
				yourdescription+="That doesn't need further restoration. "
		elif (character.Stamina<fix[0])or(character.Focus<fix[1]):
			lackcondition=true
		else:
			yourdescription+="You can't restore something that doesn't exist. "
		
		#animations
		if somethingfixed!=null:
			if somethingfixed.Type=="you":
				world.get_node("Text_Animations").bodysprites_animation = true
				get_parent().get_node("Body_Sprites").update_bodydamage()
		
		var npcrestored =false
		if somethingfixed!=null:
			if somethingfixed.Name=="Object":
				if somethingfixed.NPCbody==true:
					npcrestored = true
			if somethingfixed.Name=="Part":
				if somethingfixed.partowner=="NPC":
					somethingfixed = somethingfixed.nodeowner
					npcrestored = true
		
		if somethingfixed!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].pride==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is too proud to be grateful for your help. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].pride==false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is grateful for your kind act. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if npcrestored==true and (NPC[i].empathy==true or NPC[i].sociability==true) and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that you were kind for helping. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif npcrestored==false and NPC[i].curiosity==true and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" look interested in your doings. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#COMBINE OUTCOMES (combine + "" + objective + "with" + extra) SAME AS PUT
	elif currentverb=="combine":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		var somethingmoved
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(currentextra!=null)and(character.Stamina>=put[0])and(character.Focus>=put[1]):
			character.Stamina-=put[0]
			if get_node(currentobjective).Name=="Part" and get_node(currentobjective).on_object==true:
				somethingmoved=get_node(currentobjective).get_parent()
			else:
				somethingmoved=get_node(currentobjective)
			
			if currentextra.partowner=="NPC" or  currentextra.partowner=="you":
				currentextra = currentextra.get_parent()
			
			if get_node(currentobjective)==currentextra:
				var things = character.get_interactions()
				for i in range (0,things.size(),1):
					if get_node(currentobjective).RealName[0]==get_node(things[i]).RealName[0] and get_node(currentobjective)!=get_node(things[i]):
						currentextra = get_node(things[i])
			
			if get_node(currentobjective)!=currentextra and get_node(currentobjective).get_children().has(currentextra)==false and (currentextra.get_parent().get_parent().Name!="Protagonist" or currentextra.RealName[0]=="You") and currentextra.Name!="Asset" and somethingmoved.NPCbody==false and somethingmoved!=get_parent().get_node("Physicality").get_child(0):
				if somethingmoved.partowner=="none":
					if currentextra.openable=="close" or currentextra.openable=="locked":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" tried to put "+get_node(currentobjective).RealName[0]+" into "+currentextra.RealName[0]+" but couldn't because its closed. "
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" above "+currentextra.RealName[0]+". "
						#acomodate base
						if currentextra.stack=="ontop":
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.get_parent().add_child(somethingmoved)
							currentextra.get_parent().stack="base"
						else:
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.add_child(somethingmoved)
							currentextra.stack="base"
						#acomodate ontop
						if somethingmoved.stack=="base":
							var movedthings = []
							for i in range (0,somethingmoved.get_child_count(),1):
								if somethingmoved.get_child(i).stack=="ontop":
									movedthings.append(somethingmoved.get_child(i))
							for i in range (0,movedthings.size(),1):
								movedthings[i].get_parent().remove_child(movedthings[i])
								somethingmoved.get_parent().add_child(movedthings[i])
								movedthings[i].stack="ontop"
							somethingmoved.stack="ontop"
						else:
							somethingmoved.stack="ontop"
					elif currentextra.openable=="open":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" into "+currentextra.RealName[0]
						somethingmoved.get_parent().remove_child(somethingmoved)
						currentextra.add_child(somethingmoved)
					else:
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" above "+currentextra.RealName[0]+". "
						#acomodate base
						if currentextra.stack=="ontop":
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.get_parent().add_child(somethingmoved)
							currentextra.get_parent().stack="base"
						else:
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.add_child(somethingmoved)
							currentextra.stack="base"
						#acomodate ontop
						if somethingmoved.stack=="base":
							var movedthings = []
							for i in range (0,somethingmoved.get_child_count(),1):
								if somethingmoved.get_child(i).stack=="ontop":
									movedthings.append(somethingmoved.get_child(i))
							for i in range (0,movedthings.size(),1):
								movedthings[i].get_parent().remove_child(movedthings[i])
								somethingmoved.get_parent().add_child(movedthings[i])
								movedthings[i].stack="ontop"
							somethingmoved.stack="ontop"
						else:
							somethingmoved.stack="ontop"
			elif somethingmoved.NPCbody==true or somethingmoved==get_parent().get_node("Physicality").get_child(0):
				yourdescription+="Can't manage limbs like that. "
			elif currentextra.Name=="Asset":
				yourdescription+=get_node(currentobjective).RealName[0]+" falled into the floor. "
				somethingmoved.get_parent().remove_child(somethingmoved)
				character.get_parent().add_child(somethingmoved)
			elif currentextra.get_parent().get_parent().Name=="Protagonist":
				yourdescription+="Can't stack those things while carrying them. "
			else:
				yourdescription+="Can't put something on top of itself"
		elif (character.Stamina<put[0])or(character.Focus<put[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got to elaborate more on that action. "
		
		if somethingmoved!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if somethingmoved!=null:
					if (somethingmoved.get_parent().get_parent()==NPC[i] or somethingmoved.get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0):
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].memory <= 0:
										NPC[i].curiosity=false
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also tired about you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=somethingmoved.get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=somethingmoved):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#MEASURE OUTCOMES (measure + "" + objective + ".")
	elif currentverb=="measure":
		var somethingmeasured = null
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset" or get_node(currentobjective).Name=="Space")and(character.Stamina>=measure[0])and(character.Focus>=measure[1]):
			somethingmeasured = get_node(currentobjective)
			character.Stamina-=check[0]
			if somethingmeasured.Size>5:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" measured "+get_node(currentobjective).RealName[0]+". It has a big size. "
			elif somethingmeasured.Size>2 and somethingmeasured.Size<=5:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" measured "+get_node(currentobjective).RealName[0]+". It has a medium size. "
			elif somethingmeasured.Size<=2:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" measured "+get_node(currentobjective).RealName[0]+". It has a small size. "
		elif (character.Stamina<measure[0])or(character.Focus<measure[1]):
			lackcondition=true
		else:
			yourdescription+="You can't measure that. "
	
	#WEIGHT OUTCOMES (weight + "" + objective + ".")
	elif currentverb=="weight":
		var somethingmeasured = null
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=weight[0])and(character.Focus>=weight[1]):
			if get_node(currentobjective).Name=="Object":
				somethingmeasured = get_node(currentobjective).get_child(0)
			else:
				somethingmeasured = get_node(currentobjective)
			character.Stamina-=weight[0]
			if somethingmeasured.Weight>5:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" weighted "+get_node(currentobjective).RealName[0]+". It is heavy. "
			elif somethingmeasured.Weight>2 and somethingmeasured.Weight<=5:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" weighted "+get_node(currentobjective).RealName[0]+". It is kinda heavy. "
			elif somethingmeasured.Weight<=2:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" weighted "+get_node(currentobjective).RealName[0]+". It is light. "
		elif (character.Stamina<weight[0])or(character.Focus<weight[1]):
			lackcondition=true
		else:
			yourdescription+="You can't weight that. "
	
	#ACCEPT OUTCOMES (accept + "" + objective + ".")
	elif currentverb=="accept":
		var somethingaccepted = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=accept[0])and(character.Focus>=accept[1]):
			somethingaccepted = 1
			character.Stamina-=accept[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" accepted "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingaccepted = 3
		elif (character.Stamina<accept[0])or(character.Focus<accept[1]):
			lackcondition=true
		else:
			somethingaccepted = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't accept something that doesn't exist. "
		
		if somethingaccepted!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if cheered
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="expectingyesorno":
									if NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks glad for your response. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								else:
									if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are accepting to nothing but is curious about it. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are accepting to nothing and thinks you are weird. "
								NPC[i].knownthings[j].last_memory="Got accepted by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees a cheer
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingaccepted!=3 and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for accepting to nothing. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" accepting something. "
	
	#CHANGE OUTCOMES (change + "" + objective + "for" + extra)
	elif currentverb=="change":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		var somethingchanged1
		var somethingchanged2 
		if get_node(currentobjective)!=null and currentextra!=null:
			if get_node(currentobjective).Name=="Part" and get_node(currentobjective).partowner=="none":
				if get_node(currentobjective).on_object==true:
					somethingchanged1 = get_node(currentobjective).get_parent()
				else:
					somethingchanged1 = get_node(currentobjective)
			elif get_node(currentobjective).Name=="Object" and get_node(currentobjective).partowner=="none":
				somethingchanged1 = get_node(currentobjective)
			if currentextra.Name=="Part" and currentextra.partowner=="none":
				if currentextra.on_object==true:
					somethingchanged2 = currentextra.get_parent()
				else:
					somethingchanged2 = currentextra
			elif currentextra.Name=="Object" and currentextra.partowner=="none":
				somethingchanged2 = currentextra
		
		if (somethingchanged1!=null and somethingchanged2!=null)and(character.Stamina>=change[0])and(character.Focus>=change[1]):
			character.Stamina-=change[0]
			var newlocation1 = somethingchanged2.get_parent()
			var newlocation2 = somethingchanged1.get_parent()
			somethingchanged1.get_parent().remove_child(somethingchanged1)
			newlocation1.add_child(somethingchanged1)
			somethingchanged2.get_parent().remove_child(somethingchanged2)
			newlocation2.add_child(somethingchanged2)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" switched positions of "+somethingchanged1.RealName[0]+" with "+somethingchanged2.RealName[0]
		elif (character.Stamina<change[0])or(character.Focus<change[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't switch those things. "
		
		if somethingchanged1!=null:
			if somethingchanged1.get_parent().get_parent()==character:
				if somethingchanged1.stack=="ontop":
					somethingchanged1.stack="none"
				if somethingchanged1.stack=="base":
					yourdescription+=" Things that were on top of it fall into the floor. "
					var movedthings = []
					for i in range (0,somethingchanged1.get_child_count(),1):
						if somethingchanged1.get_child(i).stack=="ontop":
							movedthings.append(somethingchanged1.get_child(i))
					for i in range (0,movedthings.size(),1):
						movedthings[i].get_parent().remove_child(movedthings[i])
						character.get_parent().add_child(movedthings[i])
						movedthings[i].stack="none"
					somethingchanged1.stack="none"
		if somethingchanged2!=null:
			if somethingchanged2.get_parent().get_parent()==character:
				if somethingchanged2.stack=="ontop":
					somethingchanged2.stack="none"
				if somethingchanged2.stack=="base":
					yourdescription+=" Things that were on top of it fall into the floor. "
					var movedthings = []
					for i in range (0,somethingchanged2.get_child_count(),1):
						if somethingchanged2.get_child(i).stack=="ontop":
							movedthings.append(somethingchanged2.get_child(i))
					for i in range (0,movedthings.size(),1):
						movedthings[i].get_parent().remove_child(movedthings[i])
						character.get_parent().add_child(movedthings[i])
						movedthings[i].stack="none"
					somethingchanged2.stack="none"
	
	#ENTERTAIN OUTCOMES (entertain + "" + objective + ".")
	elif currentverb=="entertain":
		var somethingentertained = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=entertain[0])and(character.Focus>=entertain[1]):
			somethingentertained = 1
			character.Stamina-=entertain[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" entertained "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingentertained = 3
		elif (character.Stamina<entertain[0])or(character.Focus<entertain[1]):
			lackcondition=true
		else:
			somethingentertained = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't entertain something that doesn't exist. "
		
		if somethingentertained!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if cheered
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="depressed":
									if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" really apreciated your effort and seems to be feeling better. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get your sense of humour. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								else:
									if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" apreciated your effort. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get your sense of humour. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got entertained by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees a cheer
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingentertained==3:
								if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your were funny. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for entertaining no one. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" entertaining. "
	
	#TICKLE OUTCOMES (tickle + "" + objective + ".")
	elif currentverb=="tickle":
		var somethingentertained = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=entertain[0])and(character.Focus>=entertain[1]):
			somethingentertained = 1
			character.Stamina-=entertain[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" tickled "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingentertained = 3
		elif (character.Stamina<tickle[0])or(character.Focus<tickle[1]):
			lackcondition=true
		else:
			somethingentertained = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't tickle something that doesn't exist. "
		
		if somethingentertained!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if cheered
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="depressed":
									if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "having a laugh attack"
										NPC[i].status_timer=0
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" really apreciated your effort and seems to be feeling better. "
									elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance<0:
										NPC[i].status = "having a laugh attack"
										NPC[i].status_timer=0
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get your sense of humour. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								else:
									if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "having a laugh attack"
										NPC[i].status_timer=0
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" found you funny. "
									elif NPC[i].knownthings[j].tolerance<0:
										NPC[i].status = "having a laugh attack"
										NPC[i].status_timer=0
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get your sense of humour. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got tickled by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees a cheer
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingentertained==3:
								if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your were funny. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for tickling no one. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" tickling. "
	
	#ESCAPE OUTCOMES (escape + ".")
	elif currentverb=="escape":
		yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't escape by just desiring it. "
	
	#EAT OUTCOMES (eat + "" + objective + ".")
	elif currentverb=="eat":
		var somethingtasted
		var valid = 0
		if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset":
			if get_node(currentobjective).RealName.has("liquid"):
				valid = 1
			else:
				valid = 2
		if valid==2:
			if (get_node(currentobjective).Name=="Object")and(character.Stamina>=eat[0])and(character.Focus>=eat[1]):
				somethingtasted = get_node(currentobjective).get_child(0)
				character.Stamina-=taste[0]
				yourdescription+=get_node(currentobjective).RealName[0]+" tastes "+get_node(currentobjective).get_child(0).taste+". "
			if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=eat[0])and(character.Focus>=eat[1]):
				somethingtasted = get_node(currentobjective)
				character.Stamina-=taste[0]
				yourdescription+=get_node(currentobjective).RealName[0]+" tastes "+get_node(currentobjective).taste+". "
			if somethingtasted!=null:
				var value = character.getvalue_taste(somethingtasted.taste)
				if value>0:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" liked that taste (recovered some focus). "
				elif value<0:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" hated that taste (lost some focus). "
				if "(lost some focus)" in yourdescription:
					character.Focus -= 5
				if "(recovered some focus)" in yourdescription:
					character.Focus += 5
				if somethingtasted.RealName.has("food"):
					somethingtasted.queue_free()
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" ate it. "
				else:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" spit it out because it isn't food"
			elif (character.Stamina<eat[0])or(character.Focus<eat[1]):
				lackcondition=true
			else:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't eat something that doesn't exist. "
		elif valid==1:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't eat something that is liquid. "
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't eat something that doesn't exist. "
		
		if somethingtasted!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#KILL OUTCOMES (kill + "" + objective + "with" + extra) SAME AS ATTACK
	elif currentverb=="kill":
		var attacker = null
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		
		var eff = check_accuracy(character)
		if eff=="success":
			eff = 1
		elif eff=="half success":
			eff = 0.75
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got a little distracted because of low focus and the strength suffered for it. "
		elif eff=="fail":
			eff = 0
		
		var validextra = false
		if currentextra!=null:
			if validextra==false:
				for i in range(0,character.get_node("Physicality").get_child_count(),1):
					if character.get_node("Physicality").get_child(i).RealName[0]==currentextra.RealName[0]:
						validextra = true
						currentextra = character.get_node("Physicality").get_child(i)
						if currentextra.Name=="Object":
							currentextra = character.get_node("Physicality").get_child(i).get_child(0)
			if validextra==false:
				for i in range(0,character.get_node("Physicality").get_child(0).get_child_count(),1):
					if character.get_node("Physicality").get_child(0).get_child(i).RealName[0]==currentextra.RealName[0]:
						validextra = true
						currentextra = character.get_node("Physicality").get_child(0).get_child(i)
		if (eff==0):
			yourdescription+="Low focus made "+character.get_node("Physicality").get_child(0).RealName[0]+" miss the attack. "
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Part")and(currentextra==null)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+character.get_node("Physicality").get_child(0).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(currentextra==null)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).get_child(0).RealName[0]+" with "+character.get_node("Physicality").get_child(0).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Part")and(validextra==true)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(currentextra,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+currentextra.RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(validextra==true)and(character.Stamina>=attack[0])and(character.Focus>=attack[1]):
			var damage=world.clash(currentextra,get_node(currentobjective).get_child(0),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).get_child(0).RealName[0]+" with "+currentextra.RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Asset")and(currentextra==null)and(character.Stamina>=attack[0])and(character.Focus>=attack[1])and(get_node(currentobjective).Reach<=(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			var damage=world.clash(character.get_node("Physicality").get_child(0).get_child(0),get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+character.get_node("Physicality").get_child(0).get_child(0).RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Asset")and(validextra==true)and(character.Stamina>=attack[0])and(character.Focus>=attack[1])and(get_node(currentobjective).Reach<=(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			var damage=world.clash(currentextra,get_node(currentobjective),eff)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" attacked "+get_node(currentobjective).RealName[0]+" with "+currentextra.RealName[0]+". "+str(damage[2])
			character.Temperature += 20
			character.Stamina-=attack[0]
			attacker = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Asset")and(character.Stamina>=attack[0])and(character.Focus>=attack[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			attacker = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<attack[0])or(character.Focus<attack[1]):
			lackcondition = true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify something that makes sense. "
		
		if attacker!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==attacker.Type:
								NPC[i].knownthings[j].last_memory="Got hit by it. "
								NPC[i].knownthings[j].tolerance -= 2 #tolerance
								NPC[i].knownthings[j].imageofyou -= 2 #imageofyou
								NPC[i].knownthings[j].memory -= 1 #memory
								if NPC[i].knownthings[j].tolerance >= 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = attacker
								elif NPC[i].knownthings[j].tolerance < 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==attacker.Type:
							NPC[i].knownthings[j].last_memory="Saw you hitting something. "
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet violent. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance>=0 and NPC[i].knownthings[j].memory>0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems curious about your violent behaviour. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#DANCE OUTCOMES (dance + "to" + objective + ".") SAME AS SING*
	elif currentverb=="dance":
		var somethingsinged = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=dance[0])and(character.Focus>=dance[1]):
			somethingsinged = 1
			character.Temperature += 10
			character.Stamina-=dance[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" danced to "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingsinged = 3
		elif (character.Stamina<dance[0])or(character.Focus<dance[1]):
			lackcondition=true
		else:
			somethingsinged = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" danced. "
		
		if somethingsinged!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if smiled
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].sociability==true or NPC[i].curiosity==true or NPC[i].empathy==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" liked your singing and is looking forward to know you more. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your singing. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got smiled by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a smile
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingsinged!=3:
								if (NPC[i].curiosity==true or NPC[i].sociability==true or NPC[i].empathy==true) and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about you and your song. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" singing. "
	
	#SCARE OUTCOMES (scare + "" + objective + ".") SAME AS MOLEST*
	elif currentverb=="scare":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" scared him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to scare yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" scared him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to scare yourself you better be more creative. "
		elif (character.Stamina<molest[0])or(character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got scared by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you scaring something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#SATISFY OUTCOMES (satisfy + "" + objective + ".")
	elif currentverb=="satisfy":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=satisfy[0])and(character.Focus>=satisfy[1]):
			character.Stamina-=satisfy[0]
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					yourdescription+="If "+character.get_node("Physicality").get_child(0).RealName[0]+" really want to please "+get_node(currentobjective).RealName[0]+" you have to do it acting by yourself. "
				else:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't please a inanimate object. "
			elif get_node(currentobjective).Name=="Asset":
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't please a inanimate object. "
		elif (character.Stamina<satisfy[0])or(character.Focus<satisfy[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't please something that doesn't exist. "
	
	#DRINK OUTCOMES (drink + "" + objective + ".")
	elif currentverb=="drink":
		var somethingtasted
		var valid = 0
		if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset":
			if get_node(currentobjective).RealName.has("liquid"):
				valid = 2
			else:
				valid = 1
		if valid==2:
			if (get_node(currentobjective).Name=="Object")and(character.Stamina>=drink[0])and(character.Focus>=drink[1]):
				somethingtasted = get_node(currentobjective).get_child(0)
				character.Stamina-=drink[0]
				yourdescription+=get_node(currentobjective).RealName[0]+" tastes "+get_node(currentobjective).get_child(0).taste+". "
			if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=drink[0])and(character.Focus>=drink[1]):
				somethingtasted = get_node(currentobjective)
				character.Stamina-=drink[0]
				yourdescription+=get_node(currentobjective).RealName[0]+" tastes "+get_node(currentobjective).taste+". "
			if somethingtasted!=null:
				var value = character.getvalue_taste(somethingtasted.taste)
				if value>0:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" liked that taste (recovered some focus). "
				elif value<0:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" hated that taste (lost some focus). "
				if "(lost some focus)" in yourdescription:
					character.Focus -= 5
				if "(recovered some focus)" in yourdescription:
					character.Focus += 5
				if somethingtasted.RealName.has("liquid"):
					somethingtasted.queue_free()
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" drank it. "
				else:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" spit it out because it isn't meant to be drank. "
			elif (character.Stamina<drink[0])or(character.Focus<drink[1]):
				lackcondition=true
			else:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't drink something that doesn't exist. "
		elif valid==1:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't drink something that is solid. "
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't drink something that doesn't exist. "
		
		if somethingtasted!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#TALK OUTCOMES (talk + "to" + objective + "about + extra)
	elif currentverb=="talk":
		var talkcase = 0
		var somethingtalked = null
		
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(currentextra!=null)and(character.Stamina>=talk[0])and(character.Focus>=talk[1]):
			somethingtalked = get_node(currentobjective)
			character.Stamina-=talk[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" talked to "+get_node(currentobjective).RealName[0]+" about "+currentextra.RealName[0]+". "
			if get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).on_object==true:
					somethingtalked = get_node(currentobjective).get_parent()
			if somethingtalked.partowner=="NPC":
				talkcase = 1
			elif somethingtalked.partowner=="you":
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" seem to like to think loud. "
				talkcase = 2
			else:
				yourdescription+="It can't respond because it isn't alive"
				talkcase = 3
		elif (character.Stamina<talk[0])or(character.Focus<talk[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify a real topic for talking. "
		
		if talkcase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if listens a talk about him
				if (currentextra.get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity == false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like to be presented like that. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].last_memory="Got introduced by it. "
								if NPC.size()>1:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" appreciated your effort. "
								if NPC.size()<=1:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for presenting him to no one. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							NPC[i].knownthings[j].last_memory="Got introduced to someone by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if recieves a talk
				if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						if NPC[i].knownthings[j].Type==currentextra.Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks interested. "
								if somethingtalked.Type!="you":
									yourdescription += "He says: "+NPC[i].knownthings[j].knowledge_about
								NPC[i].status="expectingcontinuation"
								NPC[i].status_timer=0
								NPC[i].target=character.get_node("Physicality").get_child(0)
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with it. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						NPC[i].knownthings[j].last_memory="Got introduced to it by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#COMMAND OUTCOMES (command + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="command":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0])or(character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#SAY OUTCOMES (say + "" + objective + "is" + extra)
	elif currentverb=="say":
		var saycase = 0
		var somethingsayed = null
		
		if get_node(currentobjective).Name!="Server" and currentextra==null and character.Stamina>=say[0] and character.Focus>=say[1]:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" sayed: "+get_node(currentobjective).RealName[0]+". "
			somethingsayed = get_node(currentobjective)
			saycase = 1
		elif get_node(currentobjective).Name!="Server" and currentextra!=null and character.Stamina>=say[0] and character.Focus>=say[1]:
			somethingsayed = get_node(currentobjective)
			if currentextra.Name=="Concept" and currentextra.RealName[1]=="adjective":
				if (somethingsayed.Name=="Object" or somethingsayed.Name=="Part"):
					if somethingsayed.partowner=="NPC":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" sayed: "+get_node(currentobjective).RealName[0]+" is "+currentextra.RealName[0]+". "
						saycase = 3
					elif somethingsayed.partowner=="you":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" sayed: "+get_node(currentobjective).RealName[0]+" is "+currentextra.RealName[0]+". "
						saycase = 4
					else:
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" sayed: "+get_node(currentobjective).RealName[0]+" is "+currentextra.RealName[0]+". "
						saycase = 3
				else:
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" sayed: "+get_node(currentobjective).RealName[0]+" is "+currentextra.RealName[0]+". "
					saycase = 3
			else:
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" sayed: "+get_node(currentobjective).RealName[0]+" is "+currentextra.RealName[0]+". That doesn't seem to have much sense. "
				saycase = 2
		elif (character.Stamina<say[0])or(character.Focus<say[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" have to elaborate more on that thought. "
		
		if saycase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if listens description of him
				if saycase==3 and (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if currentextra.RealName[0]=="good" or currentextra.RealName[0]=="valuable":
								if NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are kind. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].courtesy+=1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
							elif currentextra.RealName[0]=="bad" or currentextra.RealName[0]=="worthless":
								if NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are rude. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].knownthings[j].imageofyou < 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are rude. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].courtesy+=1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
							NPC[i].status="expectingcontinuation"
							NPC[i].status_timer=0
							NPC[i].target=character.get_node("Physicality").get_child(0)
							NPC[i].knownthings[j].last_memory="Listened "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if listens description of speaker
				elif saycase==4:
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if currentextra.RealName[0]=="good" or currentextra.RealName[0]=="valuable":
								if NPC[i].empathy==false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are kinda egotistical. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" believes you and is willing to know you more. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].courtesy+=1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
							elif currentextra.RealName[0]=="bad" or currentextra.RealName[0]=="worthless":
								if NPC[i].empathy==false and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for insulting yourself. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks concerned for your self deprecation. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].courtesy==0:
									NPC[i].knownthings[j].courtesy+=1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
							NPC[i].status="expectingcontinuation"
							NPC[i].status_timer=0
							NPC[i].target=character.get_node("Physicality").get_child(0)
							NPC[i].knownthings[j].last_memory="Listened "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if listens common description
				elif saycase==3:
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						if NPC[i].knownthings[j].Type==somethingsayed.Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks interested. "
								if currentextra.RealName[0]=="good" or currentextra.RealName[0]=="valuable":
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription += "He seems to like more "+somethingsayed.RealName[0]
								elif currentextra.RealName[0]=="bad" or currentextra.RealName[0]=="worthless":
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription += "He seems to like less "+somethingsayed.RealName[0]
								NPC[i].status="expectingcontinuation"
								NPC[i].status_timer=0
								NPC[i].target=character.get_node("Physicality").get_child(0)
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with it. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						NPC[i].status="expectingcontinuation"
						NPC[i].status_timer=0
						NPC[i].target=character.get_node("Physicality").get_child(0)
						NPC[i].knownthings[j].last_memory="Listened "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if listens a nonsense thing
				elif saycase==1 or saycase==2:
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						if NPC[i].knownthings[j].Type==somethingsayed.Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks interested. "
								yourdescription += "He says: "+NPC[i].knownthings[j].knowledge_about+". What's your point?"
								NPC[i].status="expectingcontinuation"
								NPC[i].status_timer=0
								NPC[i].target=character.get_node("Physicality").get_child(0)
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with it. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						NPC[i].status="expectingcontinuation"
						NPC[i].status_timer=0
						NPC[i].target=character.get_node("Physicality").get_child(0)
						NPC[i].knownthings[j].last_memory="Listened "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#CALL OUTCOMES (call + "" + objective + ".")
	elif currentverb=="call":
		var somethingcalled = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=call[0])and(character.Focus>=call[1]):
			somethingcalled = 1
			character.Stamina-=salute[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" called "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingcalled = 3
		elif (character.Stamina<call[0])or(character.Focus<call[1]):
			lackcondition=true
		else:
			somethingcalled = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" it's useless to call that. "
		
		if somethingcalled!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if called
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].state!="expectingresponse" and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is alert to you. "
								elif NPC[i].state=="expectingresponse" and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for calling him while he is already focused on you. "
								else:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your calling. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got called by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a call
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingcalled!=3 and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for calling no one. "
								if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" calling. "
	
	#CRY OUTCOMES (cry + ".")
	elif currentverb=="cry":
		yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" cried. "
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" crying. "
					if NPC[i].knownthings[j].imageofyou>=0 and NPC[i].empathy==true:
						NPC[i].knownthings[j].imageofyou -= 1
						NPC[i].knownthings[j].memory -= 1
						NPC[i].status = "expectingthanks"
						NPC[i].status_timer=0
						NPC[i].target = character.get_node("Physicality").get_child(0)
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is trying to soothe you. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
					else:
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored you. "
	
	#ASK OUTCOMES (ask + "" + objective + "about" + extra) SAME AS TALK
	elif currentverb=="ask":
		var talkcase = 0
		var somethingtalked = null
		
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(currentextra!=null)and(character.Stamina>=talk[0])and(character.Focus>=talk[1]):
			somethingtalked = get_node(currentobjective)
			character.Stamina-=talk[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" asked "+get_node(currentobjective).RealName[0]+" about "+currentextra.RealName[0]+". "
			if get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).on_object==true:
					somethingtalked = get_node(currentobjective).get_parent()
			if somethingtalked.partowner=="NPC":
				talkcase = 1
			elif somethingtalked.partowner=="you":
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" seem to like to think loud. "
				talkcase = 2
			else:
				yourdescription+="It can't respond because it isn't alive"
				talkcase = 3
		elif (character.Stamina<talk[0])or(character.Focus<talk[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't ask to something that doesn't exist or about something that isn't real. "
		
		if talkcase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if listens a talk about him
				if (currentextra.get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity == false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like to be presented like that. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].last_memory="Got introduced by it. "
								if NPC.size()>1:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" appreciated your effort. "
								if NPC.size()<=1:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for presenting him to no one. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							NPC[i].knownthings[j].last_memory="Got introduced to someone by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if recieves a talk
				if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						if NPC[i].knownthings[j].Type==currentextra.Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks interested. "
								if somethingtalked.Type!="you":
									yourdescription += "He says: "+NPC[i].knownthings[j].knowledge_about
								NPC[i].status="expectingcontinuation"
								NPC[i].status_timer=0
								NPC[i].target=character.get_node("Physicality").get_child(0)
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with it. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						NPC[i].knownthings[j].last_memory="Got introduced to it by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#CLIMB OUTCOMES (climb + "" + objective + ".")
	elif currentverb=="climb":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(character.Stamina>=climb[0])and(character.Focus>=climb[1]):
			character.Temperature += 15
			character.Stamina-=climb[0]
			var newextrasize = 0
			var climbablething = get_node(currentobjective)
			while climbablething.get_parent().Name!="Space":
				climbablething = climbablething.get_parent()
			newextrasize += climbablething.Size
			for i in range (0,climbablething.get_child_count(),1):
				newextrasize += climbablething.get_child(i).Size
			character.get_node("Physicality").get_child(0).ExtraSize = newextrasize
			get_node(currentobjective).climbed = true
			if climbablething.stack=="none":
				yourdescription+="You climbed the "+climbablething.RealName[0]+". "
			else:
				yourdescription+="You climbed the stack were "+get_node(currentobjective).RealName[0]+" is on. "
		elif (character.Stamina<climb[0])or(character.Focus<climb[1]):
			lackcondition=true
		else:
			yourdescription+="It's useless to try to climb that. "
	
	#GIVE OUTCOMES (give + "" + objective + "to" + extra)
	elif currentverb=="give":
		var persongived
		if currentextra!=null:
			if currentextra.Name=="Object":
				if currentextra.partowner=="NPC":
					persongived=currentextra.get_parent()
			elif currentextra.Name=="Part":
				if currentextra.partowner!="NPC":
					persongived=currentextra.get_parent().get_parent()
		var thinggived
		for i in range (1,character.get_node("Physicality").get_child_count(),1):
			if character.get_node("Physicality").get_child(i).RealName[0]==get_node(currentobjective).RealName[0]:
				thinggived = character.get_node("Physicality").get_child(i)
		
		if persongived!=null and thinggived!=null and(character.Stamina>=give[0])and(character.Focus>=give[1]):
			for j in range (0,persongived.get_parent().knownthings.size(),1):
				if persongived.get_parent().knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					if persongived.get_parent().curiosity==true or persongived.get_parent().knownthings[j].imageofyou>0:
						thinggived.get_parent().remove_child(thinggived)
						persongived.add_child(thinggived)
						yourdescription+="He accepted "+thinggived.RealName[0]+" despite of not knowing why. "
					else:
						yourdescription+="He declined your offer because he doesn't feel confortable with it. "
		elif (character.Stamina<give[0])or(character.Focus<give[1]):
			lackcondition=true
		else:
			yourdescription+="You got to elaborate more on that action. "
	
	#BEND OUTCOMES (bend + "" + objective + ".") SAME AS SOFTATTACK
	elif currentverb=="bend":
		var softattacked = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" mildly hurted "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" mildly hurted "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<softattack[0]) or (character.Focus<softattack[1]):
			lackcondition = true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify the objective of your action. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			softattacked = character.get_node("Physicality").get_child(0)
		
		if softattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if (get_node(currentobjective)!=null):
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==softattacked.Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].last_memory="Got soft hitted by it. "
									NPC[i].knownthings[j].tolerance -= 2
									NPC[i].knownthings[j].imageofyou -= 2
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==softattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you soft hitting something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#TORTURE OUTCOMES (torture + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="torture":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0])or(character.Focus<molest[1]):
			lackcondition=true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#ART OUTCOMES (art + "" + objective + ".")
	elif currentverb=="art":
		var artmade = false
		if (get_node(currentobjective).Name!="Server")and(character.Stamina>=art[0])and(character.Focus>=art[1]):
			artmade = true
			character.Stamina-=art[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" elaborated a piece of art about "+get_node(currentobjective).RealName[0]+". "
		elif (character.Stamina<art[0])or(character.Focus<art[1]):
			lackcondition=true
		else:
			yourdescription+="You got elaborate more on that masterpiece. "
		
		if artmade==true:
			for i in range (0,NPC.size(),1):
				#NPC reaction if art about him
				if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if (NPC[i].curiosity==true or NPC[i].empathy==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								NPC[i].status = "expectingcontinuation"
								NPC[i].status_timer=0
								NPC[i].target = character.get_node("Physicality").get_child(0)
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" felt flattered and is looking forward to know you more. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							else:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your masterpiece. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" making art. "
				#Enemy reaction if sees art
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if (NPC[i].curiosity==true or NPC[i].empathy==true) and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" liked your masterpiece. "
							else:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your masterpiece. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" making art. "
	
	#FALL OUTCOMES (fall + ".")
	elif currentverb=="fall":
		if character.get_node("Physicality").get_child(0).ExtraSize>0:
			character.get_node("Physicality").get_child(0).ExtraSize=0
			yourdescription+="You dropped to the floor. "
			character.Temperature += 10
		else:
			yourdescription+="You are already at the lowest level. "
	
	#HELP OUTCOMES (help + "" + objective + ".")
	elif currentverb=="help":
		yourdescription="If you really want to help then you need to come up with a concrete action. "
	
	#TEACH OUTCOMES (teach + "" + objective + "about" + extra) SAME AS TALK
	elif currentverb=="teach":
		var talkcase = 0
		var somethingtalked = null
		
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(currentextra!=null)and(character.Stamina>=teach[0])and(character.Focus>=teach[1]):
			somethingtalked = get_node(currentobjective)
			character.Stamina-=teach[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" talked to "+get_node(currentobjective).RealName[0]+" about "+currentextra.RealName[0]+". "
			if get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).on_object==true:
					somethingtalked = get_node(currentobjective).get_parent()
			if somethingtalked.partowner=="NPC":
				talkcase = 1
			elif somethingtalked.partowner=="you":
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" seem to like to think loud. "
				talkcase = 2
			else:
				yourdescription+="It can't respond because it isn't alive"
				talkcase = 3
		elif (character.Stamina<teach[0])or(character.Focus<teach[1]):
			lackcondition=true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't talk to something that doesn't exist or about something that isn't real. "
		
		if talkcase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if listens a talk about him
				if (currentextra.get_parent().get_parent()==NPC[i] or currentextra.get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity == false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like to be presented like that. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].last_memory="Got introduced by it. "
								if NPC.size()>1:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" appreciated your effort. "
								if NPC.size()<=1:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for presenting him to no one. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							NPC[i].knownthings[j].last_memory="Got introduced to someone by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if recieves a talk
				if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						if NPC[i].knownthings[j].Type==currentextra.Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks interested. "
								if somethingtalked.Type!="you":
									yourdescription += "He says: "+NPC[i].knownthings[j].knowledge_about
								NPC[i].status="expectingcontinuation"
								NPC[i].status_timer=0
								NPC[i].target=character.get_node("Physicality").get_child(0)
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about it. "
							elif NPC[i].knownthings[j].tolerance<0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with it. "
							if NPC[i].knownthings[j].courtesy==0:
								NPC[i].knownthings[j].courtesy+=1
							if NPC[i].knownthings[j].interactedwithit==0:
								NPC[i].knownthings[j].interactedwithit+=1
						NPC[i].knownthings[j].last_memory="Got introduced to it by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#WEAR OUTCOMES (wear + "" + objective + ".")
	elif currentverb=="wear":
		yourdescription="You can't wear that. "
	
	#UNDRESS OUTCOMES (undress + "" + objective + ".")
	elif currentverb=="undress":
		yourdescription="You can't undress that. "
	
	#USE OUTCOMES (use + "" + objective + ".")
	elif currentverb=="use":
		if (get_node(currentobjective).Name!="Server"):
			yourdescription+="That doesn't seem to have an straight forward use. "
		else:
			yourdescription+="You need to specify something that you have. "
	
	#PRESS OUTCOMES (press + "" + objective + ".") SAME AS SOFTATTACK
	elif currentverb=="press":
		var softattacked = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" pressed "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" pressed "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<softattack[0]) or (character.Focus<softattack[1]):
			lackcondition = true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify the objective of your action. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			softattacked = character.get_node("Physicality").get_child(0)
		
		if softattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if (get_node(currentobjective)!=null):
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==softattacked.Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].last_memory="Got pressed by it. "
									NPC[i].knownthings[j].tolerance -= 2
									NPC[i].knownthings[j].imageofyou -= 2
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==softattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you pressed something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#BUILD OUTCOMES (build + "" + objective + ".")
	elif currentverb=="build":
		var somethingbuild = false
		if (get_node(currentobjective).Name!="Server")and(character.Stamina>=build[0])and(character.Focus>=build[1]):
			character.Stamina-=build[0]
			yourdescription+="You tried to build "+get_node(currentobjective).RealName[0]+" but failed. "
			somethingbuild = true
		elif (character.Stamina<build[0]) or (character.Focus<build[1]):
			lackcondition = true
		else:
			yourdescription+="You need to specify what you want to build. "
		
		if somethingbuild==true:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if sees you building
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if (NPC[i].curiosity==true or NPC[i].empathy==true) and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about you. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" building. "
	
	#SUBDUE OUTCOMES (subdue + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="subdue":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0]) or (character.Focus<molest[1]):
			lackcondition = true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#BUY OUTCOMES (buy + "" + objective + ".")
	elif currentverb=="buy":
		var somethingbought = 0
		if (get_node(currentobjective).Name!="Server"):
			somethingbought = 1
			if get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object":
				if get_node(currentobjective).partowner == "NPC":
					somethingbought = 2
				elif get_node(currentobjective).partowner == "you":
					somethingbought = 3
			if (get_node(currentobjective).get_parent().Name=="Physicality"):
				if (get_node(currentobjective).get_parent().get_parent().Name=="NPC"):
					somethingbought = 2
				elif (get_node(currentobjective).get_parent().get_parent().Name=="Protagonist"):
					somethingbought = 3
		if somethingbought == 3:
			yourdescription+="You already own that. "
		elif somethingbought == 2:
			yourdescription+="You tried to buy "+get_node(currentobjective).RealName[0]+". "
		elif somethingbought == 1:
			yourdescription+="Nobody owns "+get_node(currentobjective).RealName[0]+" if you want it just take it. "
		else:
			yourdescription+="You need to specify what you want to buy. "
		
		if somethingbought == 2:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
									NPC[i].knownthings[j].last_memory="Recived a sell offer by him. "
									NPC[i].knownthings[j].memory -= 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" says that isn't for sale. "
								else: 
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								if NPC[i].knownthings[j].memory==0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
	
	#SELL OUTCOMES (sell + "" + objective + ".")
	elif currentverb=="sell":
		var somethingsold = false
		if (get_node(currentobjective).Name!="Server"):
			if get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object":
				if get_node(currentobjective).partowner == "you":
					somethingsold = true
			if (get_node(currentobjective).get_parent().Name=="Physicality"):
				if (get_node(currentobjective).get_parent().get_parent().Name=="Protagonist"):
					somethingsold = true
		if somethingsold == true:
			yourdescription+="You tried to sell "+get_node(currentobjective).RealName[0]+". "
		else:
			yourdescription+="You cannot sell something that you don't own. "
		
		if somethingsold == true:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if sees someone being molested
				for j in range (0,NPC[i].knownthings.size(),1):
					if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
						NPC[i].knownthings[j].last_memory="Recived an offer by him. "
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't look interested in buying that. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#ENTER OUTCOMES (enter + "" + objective + ".")
	elif currentverb=="enter":
		yourdescription="You can't enter that. "
	
	#PAY OUTCOMES (pay + "" + objective + ".")
	elif currentverb=="pay":
		yourdescription="You don't have any money. "
	
	#PRAY OUTCOMES (pray + "" + objective + ".") 
	elif currentverb=="pray":
		yourdescription="You prayed with all your heart for something only you know. "
	
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					if (NPC[i].empathy==true or NPC[i].curiosity==true) and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
						NPC[i].knownthings[j].imageofyou += 1
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is moved by your faith. "
					if NPC[i].knownthings[j].memory == 0:
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
					NPC[i].knownthings[j].last_memory="Saw him praying. "
	
	#STUMBLE OUTCOMES (stumble + "" + objective + ".")
	elif currentverb=="stumble":
		yourdescription="You tripped and lost balance for a moment. "
	
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					if (NPC[i].empathy==true or NPC[i].curiosity==true) and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
						NPC[i].knownthings[j].imageofyou += 1
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks concerned for you. "
					if NPC[i].knownthings[j].memory == 0:
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
					NPC[i].knownthings[j].last_memory="Saw him stumble. "
	
	#BALANCE OUTCOMES (balance + "" + objective + ".")
	elif currentverb=="balance":
		yourdescription="You balanced yourself. "
	
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					if (NPC[i].curiosity==true) and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
						NPC[i].knownthings[j].imageofyou += 1
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about you. "
					if NPC[i].knownthings[j].memory == 0:
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
					NPC[i].knownthings[j].last_memory="Saw him balancing. "
	
	#COOK OUTCOMES (cook + "" + objective + ".")
	elif currentverb=="cook":
		yourdescription="You don't have a fire to cook. "
	
	#BAN OUTCOMES (ban + "" + objective + ".")
	elif currentverb=="ban":
		yourdescription="If you don't want that, don't use it. "
	
	#SPOIL OUTCOMES (spoil + "" + objective + ".")
	elif currentverb=="spoil":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=spoil[0] and character.Focus>=spoil[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=spoil[0] and character.Focus>=spoil[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		if someonemolested==null and (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Asset")and character.Stamina>=spoil[0] and character.Focus>=spoil[1]:
			someonemolested=get_node(currentobjective)
			if get_node(currentobjective).Name=="Object":
				someonemolested=get_node(currentobjective).get_child(0)
			someonemolested.smell="dirty"
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" spoiled "+get_node(currentobjective).RealName[0]+". It smells worse. "
		elif someonemolested==null and (get_node(currentobjective).Name=="Server" or get_node(currentobjective).Name=="Concept")and character.Stamina>=spoil[0] and character.Focus>=spoil[1]:
			yourdescription+="That doesn't exists. "
		elif (character.Stamina<spoil[0]) or (character.Focus<spoil[1]):
			lackcondition = true
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#CLEAN OUTCOMES (clean + "" + objective + ".")
	elif currentverb=="clean":
		var somethingcleaned = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Asset")and character.Stamina>=clean[0] and character.Focus>=clean[1]:
			character.Temperature += 10
			character.Stamina-=clean[0]
			somethingcleaned=get_node(currentobjective)
			if get_node(currentobjective).Name=="Object":
				somethingcleaned=get_node(currentobjective).get_child(0)
			somethingcleaned.smell="clean"
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" cleaned "+get_node(currentobjective).RealName[0]+". It smells better. "
		elif (character.Stamina<clean[0]) or (character.Focus<clean[1]):
			lackcondition = true
		else:
			yourdescription+="That doesn't exists. "
		
		if somethingcleaned!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity==false and NPC[i].pride==true) or NPC[i].knownthings[j].imageofyou<0 or NPC[i].knownthings[j].tolerance<0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is annoyed by you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										NPC[i].knownthings[j].tolerance -= 1
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif (NPC[i].curiosity==true or NPC[i].pride==false) and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
									NPC[i].knownthings[j].last_memory="Got cleaned by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious and thankful for your help. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you cleaning something. "
							if NPC[i].curiosity==true and NPC[i].knownthings[j].memory>=0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious about your action. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#COMPARE OUTCOMES (compare + "" + objective + "with" + extra + ".")
	elif currentverb=="compare":
		if currentextra!=null:
			if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Asset")and(currentextra.Name=="Part" or currentextra.Name=="Object" or currentextra.Name=="Asset")and character.Stamina>=compare[0] and character.Focus>=compare[1]:
				if get_node(currentobjective).Size>currentextra.Size:
					yourdescription+=get_node(currentobjective).RealName[0]+" seems to be bigger than "+currentextra.RealName[0]+". "
				elif currentextra.Size>get_node(currentobjective).Size:
					yourdescription+=currentextra.RealName[0]+" seems to be bigger than "+get_node(currentobjective).RealName[0]+". "
			elif (character.Stamina<compare[0]) or (character.Focus<compare[1]):
				lackcondition = true
			else:
				yourdescription+="You need to specify two things that are here. "
		else:
			yourdescription+="You need to specify two things that are here. "
	
	#PERSONALIZE OUTCOMES (personalize + "" + objective + ".")
	elif currentverb=="personalize":
		var somethingcleaned = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Asset")and character.Stamina>=personalize[0] and character.Focus>=personalize[1]:
			character.Stamina-=personalize[0]
			somethingcleaned=get_node(currentobjective)
			if get_node(currentobjective).Name=="Object":
				somethingcleaned=get_node(currentobjective).get_child(0)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" organized "+get_node(currentobjective).RealName[0]+". "
		elif (character.Stamina<personalize[0]) or (character.Focus<personalize[1]):
			lackcondition = true
		else:
			yourdescription+="That doesn't exists. "
		
		if somethingcleaned!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity==false and NPC[i].pride==true) or NPC[i].knownthings[j].imageofyou<0 or NPC[i].knownthings[j].tolerance<0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is annoyed by you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										NPC[i].knownthings[j].tolerance -= 1
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif (NPC[i].curiosity==true or NPC[i].pride==false) and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
									NPC[i].knownthings[j].last_memory="Got cleaned by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious and thankful for your help. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you cleaning something. "
							if NPC[i].curiosity==true and NPC[i].knownthings[j].memory>=0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious about your action. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#NICKNAME OUTCOMES (nickname + "" + objective + ".")
	elif currentverb=="nickname":
		yourdescription="That already has a name. "
	
	#ORGANIZE OUTCOMES (organize + "" + objective + ".")
	elif currentverb=="organize":
		var somethingcleaned = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Asset")and character.Stamina>=organize[0] and character.Focus>=organize[1]:
			character.Stamina-=organize[0]
			somethingcleaned=get_node(currentobjective)
			if get_node(currentobjective).Name=="Object":
				somethingcleaned=get_node(currentobjective).get_child(0)
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" organized "+get_node(currentobjective).RealName[0]+". "
		elif (character.Stamina<organize[0]) or (character.Focus<organize[1]):
			lackcondition = true
		else:
			yourdescription+="That doesn't existsy. "
		
		if somethingcleaned!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity==false and NPC[i].pride==true) or NPC[i].knownthings[j].imageofyou<0 or NPC[i].knownthings[j].tolerance<0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is annoyed by you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										NPC[i].knownthings[j].tolerance -= 1
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif (NPC[i].curiosity==true or NPC[i].pride==false) and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance>=0:
									NPC[i].knownthings[j].last_memory="Got cleaned by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou += 1
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious and thankful for your help. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you cleaning something. "
							if NPC[i].curiosity==true and NPC[i].knownthings[j].memory>=0:
								NPC[i].knownthings[j].imageofyou += 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious about your action. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#JUMP OUTCOMES (jump + "into" + objective + ".")
	elif currentverb=="jump":
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(character.Stamina>=jump[0])and(character.Focus>=jump[1]):
			character.Temperature += 15
			character.Stamina-=jump[0]
			var newextrasize = 0
			var climbablething = get_node(currentobjective)
			while climbablething.get_parent().Name!="Space":
				climbablething = climbablething.get_parent()
			newextrasize += climbablething.Size
			for i in range (0,climbablething.get_child_count(),1):
				newextrasize += climbablething.get_child(i).Size
			character.get_node("Physicality").get_child(0).ExtraSize = newextrasize
			if climbablething.stack=="none":
				yourdescription+="You jumped into the "+climbablething.RealName[0]+". "
			else:
				yourdescription+="You jumped into the stack were the "+get_node(currentobjective).RealName[0]+" is on. "
		elif get_node(currentobjective).Name=="Asset" and (character.Stamina>=jump[0])and(character.Focus>=jump[1]):
			character.Temperature += 15
			character.Stamina-=jump[0]
			yourdescription+="You jumped into the "+get_node(currentobjective).RealName[0]+". "
			if character.get_node("Physicality").get_child(0).ExtraSize>0:
				yourdescription+="You falled down. "
				character.get_node("Physicality").get_child(0).ExtraSize = 0
		elif (character.Stamina>=jump[0])and(character.Focus>=jump[1]):
			character.Temperature += 15
			character.Stamina-=jump[0]
			yourdescription+="You jumped. "
		elif (character.Stamina<jump[0]) or (character.Focus<jump[1]):
			lackcondition = true
	
	#PILE OUTCOMES (pile + "" + objective + "with" + extra + ".")
	elif currentverb=="pile":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
		var somethingmoved
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(currentextra!=null)and(character.Stamina>=pile[0])and(character.Focus>=pile[1]):
			character.Stamina-=pile[0]
			if get_node(currentobjective).Name=="Part" and get_node(currentobjective).on_object==true:
				somethingmoved=get_node(currentobjective).nodeowner
			else:
				somethingmoved=get_node(currentobjective)
			
			if currentextra.Name=="Part" and currentextra.on_object==true:
				currentextra=currentextra.nodeowner
			
			if get_node(currentobjective)==currentextra:
				var things = character.get_interactions()
				for i in range (0,things.size(),1):
					if get_node(currentobjective).RealName[0]==get_node(things[i]).RealName[0] and get_node(currentobjective)!=get_node(things[i]):
						currentextra = get_node(things[i])
			
			if get_node(currentobjective)!=currentextra and get_node(currentobjective).get_children().has(currentextra)==false and (currentextra.get_parent().get_parent().Name!="Protagonist" or currentextra.RealName[0]=="You") and currentextra.Name!="Asset" and somethingmoved.NPCbody==false and somethingmoved!=get_parent().get_node("Physicality").get_child(0):
				if somethingmoved.partowner=="none":
					if currentextra.openable=="close" or currentextra.openable=="locked":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" tried to put "+get_node(currentobjective).RealName[0]+" into "+currentextra.RealName[0]+" but couldn't because its closed. "
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" above "+currentextra.RealName[0]+". "
						#acomodate base
						if currentextra.stack=="ontop":
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.get_parent().add_child(somethingmoved)
							currentextra.get_parent().stack="base"
						else:
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.add_child(somethingmoved)
							currentextra.stack="base"
						#acomodate ontop
						if somethingmoved.stack=="base":
							var movedthings = []
							for i in range (0,somethingmoved.get_child_count(),1):
								if somethingmoved.get_child(i).stack=="ontop":
									movedthings.append(somethingmoved.get_child(i))
							for i in range (0,movedthings.size(),1):
								movedthings[i].get_parent().remove_child(movedthings[i])
								somethingmoved.get_parent().add_child(movedthings[i])
								movedthings[i].stack="ontop"
							somethingmoved.stack="ontop"
						else:
							somethingmoved.stack="ontop"
					elif currentextra.openable=="open":
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" into "+currentextra.RealName[0]
						somethingmoved.get_parent().remove_child(somethingmoved)
						currentextra.add_child(somethingmoved)
					else:
						yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" putted "+get_node(currentobjective).RealName[0]+" above "+currentextra.RealName[0]+". "
						#acomodate base
						if currentextra.stack=="ontop":
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.get_parent().add_child(somethingmoved)
							currentextra.get_parent().stack="base"
						else:
							somethingmoved.get_parent().remove_child(somethingmoved)
							currentextra.add_child(somethingmoved)
							currentextra.stack="base"
						#acomodate ontop
						if somethingmoved.stack=="base":
							var movedthings = []
							for i in range (0,somethingmoved.get_child_count(),1):
								if somethingmoved.get_child(i).stack=="ontop":
									movedthings.append(somethingmoved.get_child(i))
							for i in range (0,movedthings.size(),1):
								movedthings[i].get_parent().remove_child(movedthings[i])
								somethingmoved.get_parent().add_child(movedthings[i])
								movedthings[i].stack="ontop"
							somethingmoved.stack="ontop"
						else:
							somethingmoved.stack="ontop"
			elif somethingmoved.NPCbody==true or somethingmoved==get_parent().get_node("Physicality").get_child(0):
				yourdescription+="Can't manage limbs like that. "
			elif currentextra.Name=="Asset":
				yourdescription+=get_node(currentobjective).RealName[0]+" falled into the floor. "
				somethingmoved.get_parent().remove_child(somethingmoved)
				character.get_parent().add_child(somethingmoved)
			elif currentextra.get_parent().get_parent().Name=="Protagonist":
				yourdescription+="Can't stack those things while carrying them. "
			else:
				yourdescription+="Can't put something on top of itself"
		elif (character.Stamina<pile[0]) or (character.Focus<pile[1]):
			lackcondition = true
		else:
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" got to elaborate more on that action. "
		
		if somethingmoved!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if somethingmoved!=null:
					if (somethingmoved.get_parent().get_parent()==NPC[i] or somethingmoved.get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].curiosity == false) or (NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance < 0) or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].tolerance -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird and annoying but is open to forgive you. "
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].imageofyou <= 0:
										NPC[i].status="offended"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										NPC[i].knownthings[j].imageofyou -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued but also annoyed by you. "
									elif NPC[i].knownthings[j].imageofyou > 0:
										NPC[i].status="expectingcontinuation"
										NPC[i].status_timer = 0
										NPC[i].target=character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is intrigued by your action. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=somethingmoved.get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=somethingmoved):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if NPC[i].curiosity==false and NPC[i].knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet odd. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you intriguing. "
								NPC[i].knownthings[j].memory -= 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#BODYRESPECT OUTCOMES (bodyrespect + "to" + objective + ".")
	elif currentverb=="bodyrespect":
		var somethingrespected = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=bodyrespect[0])and(character.Focus>=bodyrespect[1]):
			somethingrespected = 1
			character.Stamina-=bodyrespect[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" showed respect to "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingrespected = 3
		elif (character.Stamina<bodyrespect[0] or character.Focus<bodyrespect[1]):
			lackcondition=true
		else:
			somethingrespected = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't show respect to something that doesn't exist. "
		
		if somethingrespected!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if apologized
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].status=="offended" or NPC[i].status=="expectingthanks") and NPC[i].target==character.get_node("Physicality").get_child(0):
									if NPC[i].empathy == false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks annoyed by your gesture. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is flattered by your gesture. "
										if NPC[i].knownthings[j].memory == 0:
											yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									NPC[i].knownthings[j].last_memory="Got a respect gesture of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								elif NPC[i].knownthings[j].imageofyou<0 and NPC[i].knownthings[j].tolerance >= 0:
									if NPC[i].empathy == false:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is flattered by your gesture. "
									else:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks annoyed by your gesture. "
								elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are acting like that but looks curious. "
									if NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get why you are acting like that and thinks you are weird. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees apologize
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingrespected == 3 and NPC[i].knownthings[j].memory>0:
								if NPC[i].empathy==true and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your behavior was kind. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							else:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thinks you are weird for showing respect to no one. "
							NPC[i].knownthings[j].last_memory="Got a respect gesture of "+character.get_node("Physicality").get_child(0).RealName[0]+". "
	
	#SHAKE OUTCOMES (shake + "" + objective + ".") SAME AS SOFTATTACK
	elif currentverb=="shake":
		var softattacked = null
		if (get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" pressed "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (get_node(currentobjective).Name=="Object")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1]):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" pressed "+get_node(currentobjective).RealName[0]+". "
			character.Temperature += 10
			character.Stamina-=softattack[0]
			softattacked = character.get_node("Physicality").get_child(0)
		elif (character.Stamina<softattack[0]) or (character.Focus<softattack[1]):
			lackcondition = true
		else:
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" need to specify the objective of your action. "
		if (get_node(currentobjective).Name=="Asset")and(character.Stamina>=softattack[0])and(character.Focus>=softattack[1])and(get_node(currentobjective).Reach>(character.get_node("Physicality").get_child(0).Size+character.get_node("Physicality").get_child(0).ExtraSize)):
			yourdescription=character.get_node("Physicality").get_child(0).RealName[0]+" can't reach "+get_node(currentobjective).RealName[0]+". "
			softattacked = character.get_node("Physicality").get_child(0)
		
		if softattacked!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if attacked
				if (get_node(currentobjective)!=null):
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==softattacked.Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<0:
									NPC[i].knownthings[j].last_memory="Got pressed by it. "
									NPC[i].knownthings[j].tolerance -= 2
									NPC[i].knownthings[j].imageofyou -= 2
									NPC[i].knownthings[j].memory -= 1
									if NPC[i].knownthings[j].tolerance < 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									elif NPC[i].knownthings[j].tolerance >= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" didn't like that but is open to forgive you. "
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								elif NPC[i].selfcontrol==true and NPC[i].knownthings[j].imageofyou>=0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].status = "offended"
									NPC[i].status_timer=0
									NPC[i].target = softattacked
									if NPC[i].knownthings[j].memory <= 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
									elif NPC[i].knownthings[j].memory > 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is shooked by your action but seems open to forgive you. "
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees attack
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==softattacked.Type:
							NPC[i].knownthings[j].last_memory="Saw you pressed something. "
							if NPC[i].senseofhumour==false and NPC.knownthings[j].memory>0:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							elif NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
								yourdescription += "You briefly got the attention of "+NPC[i].get_node("Physicality").get_child(0).RealName[0]+". He found you funny. "
								NPC[i].knownthings[j].memory -= 1
								NPC[i].knownthings[j].tolerance += 1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#CROUCH OUTCOMES (crouch + ".") SAME AS AVOID*
	elif currentverb=="crouch":
		yourdescription+="You crouched. "
		var npc = null
		var array=character.get_interactions()
		for i in range (0,array.size(),1):
			if get_node(array[i]).Name=="Object":
				if get_node(array[i]).NPCbody==true:
					if get_node(array[i]).get_parent().get_parent().state=="violent":
						npc = get_node(array[i]).get_parent().get_parent()
		if npc!=null and character.Stamina>=avoid[0] and character.Focus>=avoid[1]:
			character.Temperature += 15
			character.Stamina-=avoid[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" avoided the attack. "
			npc.status = "vulnerable"
			npc.state = "immobilized"
			npc.Stamina -= 40
		elif npc!=null and (character.Stamina<avoid[0] or character.Focus<avoid[1]):
			lackcondition=true
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					NPC[i].knownthings[j].last_memory="Saw you rolling. "
					if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].tolerance>=0:
						if NPC[i].curiosity==true or NPC[i].senseofhumour==true:
							NPC[i].knownthings[j].imageofyou -= 1
							NPC[i].knownthings[j].memory -= 1
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious about your behaviour. "
					if NPC[i].knownthings[j].memory == 0:
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#EXERCISE OUTCOMES (exercise + ".")
	elif currentverb=="exercise":
		var somethingexercised = false
		if (character.Stamina>=exercise[0])and(character.Focus>=exercise[1]):
			somethingexercised = true
			character.Temperature += 20
			character.Stamina-=exercise[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" exercised and warmed up. "
		elif (character.Stamina<exercise[0])or(character.Focus<exercise[1]):
			lackcondition=true
		
		if somethingexercised==true:
			for i in range (0,NPC.size(),1):
				#NPC reaction if sees a exercising
				for j in range (0,NPC[i].knownthings.size(),1):
					if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
						if (NPC[i].curiosity==true) and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
							NPC[i].knownthings[j].imageofyou += 1
							NPC[i].knownthings[j].memory -= 1
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about you. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
						NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" exercising. "
	
	#FILL OUTCOMES (fill + "" + objective + "with" + extra + ".")
	elif currentverb=="fill":
		if currentextra!=null:
			if currentextra.Name=="Concept":
				currentextra=null
			elif currentextra.partowner!="none":
				currentextra=null
		var somethingfilled
		var filler
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(currentextra!=null)and(character.Stamina>=fill[0])and(character.Focus>=fill[1]):
			character.Stamina-=fill[0]
			if get_node(currentobjective).Name=="Part" and get_node(currentobjective).on_object==true:
				somethingfilled=get_node(currentobjective).nodeowner
			else:
				somethingfilled=get_node(currentobjective)
			
			if get_node(currentobjective)==currentextra:
				var things = character.get_interactions()
				for i in range (0,things.size(),1):
					if get_node(currentobjective).RealName[0]==get_node(things[i]).RealName[0] and get_node(currentobjective)!=get_node(things[i]):
						currentextra = get_node(things[i])
			if currentextra.Name=="Part" and currentextra.on_object==true:
				filler=currentextra.nodeowner
			else:
				filler=currentextra
			
			if somethingfilled.openable=="close" or somethingfilled.openable=="locked":
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" tried to fill "+get_node(currentobjective).RealName[0]+" with "+currentextra.RealName[0]+" but couldn't because its closed. "
			elif somethingfilled.openable=="open":
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" filled "+get_node(currentobjective).RealName[0]+" with "+currentextra.RealName[0]+". "
				filler.get_parent().remove_child(filler)
				somethingfilled.add_child(filler)
		elif (character.Stamina<fill[0])or(character.Focus<fill[1]):
			lackcondition=true
		else:
			yourdescription+="You need to specify a container and a filler that makes sense. "
	
	#EMPTY OUTCOMES (empty + "" + objective + ".")
	elif currentverb=="empty":
		var somethingfilled
		var filler = []
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part")and(character.Stamina>=empty[0])and(character.Focus>=empty[1]):
			character.Stamina-=empty[0]
			if get_node(currentobjective).Name=="Part" and get_node(currentobjective).on_object==true:
				somethingfilled=get_node(currentobjective).nodeowner
			else:
				somethingfilled=get_node(currentobjective)
			
			for i in range (0,somethingfilled.get_child_count(),1):
				if somethingfilled.get_child(i).on_object==false:
					filler.append(somethingfilled.get_child(i))
			
			if filler.size()!=0:
				if somethingfilled.openable=="close" or somethingfilled.openable=="locked":
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" tried to empty "+get_node(currentobjective).RealName[0]+" but couldn't because its closed. "
				elif somethingfilled.openable=="open":
					yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" emptied "+get_node(currentobjective).RealName[0]+" and moved all the filler into the floor. "
					for i in range (0,filler.size(),1):
						filler[i].get_parent().remove_child(filler[i])
						somethingfilled.get_parent().add_child(filler[i])
			else:
				yourdescription+=get_node(currentobjective).RealName[0]+" is already empty. "
		elif (character.Stamina<fill[0])or(character.Focus<fill[1]):
			lackcondition=true
		else:
			yourdescription+="You need to specify a container that makes sense. "
	
	#HIDE OUTCOMES (hide + "in" + objective + ".")
	elif currentverb=="hide":
		var hide = false
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset"):
			hide = true
			yourdescription+="You hide in "+get_node(currentobjective).RealName[0]+". "
			var npc = null
			var array=character.get_interactions()
			for i in range (0,array.size(),1):
				if get_node(array[i]).Name=="Object":
					if get_node(array[i]).NPCbody==true:
						if get_node(array[i]).get_parent().get_parent().state=="violent":
							npc = get_node(array[i]).get_parent().get_parent()
			if npc!=null and character.Stamina>=avoid[0] and character.Focus>=avoid[1]:
				character.Temperature += 15
				character.Stamina-=avoid[0]
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" avoided the attack. "
				npc.status = "vulnerable"
				npc.state = "immobilized"
				npc.Stamina -= 40
			elif npc!=null and (character.Stamina<avoid[0] or character.Focus<avoid[1]):
				lackcondition=true
		else:
			yourdescription+="You need to specify were you want to hide. "
		
		if hide == true:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if sees someone being molested
				for j in range (0,NPC[i].knownthings.size(),1):
					if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
						NPC[i].knownthings[j].last_memory="Saw you hiding. "
						if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].tolerance>=0:
							if NPC[i].curiosity==true or NPC[i].senseofhumour==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious about your behaviour. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#BLINK OUTCOMES (blink + "at" + objective + ".")
	elif currentverb=="blink":
		var somethingsmiled = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=smile[0])and(character.Focus>=smile[1]):
			somethingsmiled = 1
			character.Stamina-=smile[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" winked at "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingsmiled = 3
		elif (character.Stamina<smile[0] or character.Focus<smile[1]):
			lackcondition=true
		else:
			somethingsmiled = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" winked. "
		
		if somethingsmiled!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if smiled
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].sociability==true or NPC[i].curiosity==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" winked back at you. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your wink. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got winked by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a smile
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingsmiled!=3:
								if NPC[i].curiosity==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about why you winked. "
								elif NPC[i].curiosity==false and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought you were weird for winking alone. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" winking. "
	
	#ROLL OUTCOMES (roll + ".")
	elif currentverb=="roll":
		yourdescription+="You rolled. "
		var npc = null
		var array=character.get_interactions()
		for i in range (0,array.size(),1):
			if get_node(array[i]).Name=="Object":
				if get_node(array[i]).NPCbody==true:
					if get_node(array[i]).get_parent().get_parent().state=="violent":
						npc = get_node(array[i]).get_parent().get_parent()
		if npc!=null and character.Stamina>=avoid[0] and character.Focus>=avoid[1]:
			character.Temperature += 15
			character.Stamina-=avoid[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" avoided the attack. "
			npc.status = "vulnerable"
			npc.state = "immobilized"
			npc.Stamina -= 40
		elif npc!=null and (character.Stamina<avoid[0] or character.Focus<avoid[1]):
			lackcondition=true
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					NPC[i].knownthings[j].last_memory="Saw you rolling. "
					if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].tolerance>=0:
						if NPC[i].curiosity==true or NPC[i].senseofhumour==true:
							NPC[i].knownthings[j].imageofyou -= 1
							NPC[i].knownthings[j].memory -= 1
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is curious about your behaviour. "
					if NPC[i].knownthings[j].memory == 0:
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#SOUND OUTCOMES (sound + "to" + objective + ".")
	elif currentverb=="sound":
		var soundcase = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=sound[0])and(character.Focus>=sound[1]):
			soundcase = 1
			character.Stamina-=sound[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" made a sound to "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					soundcase = 3
		elif (character.Stamina<sound[0] or character.Focus<sound[1]):
			lackcondition=true
		else:
			soundcase = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" made a sound. "
		
		if soundcase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if smiled
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].sociability==true or NPC[i].curiosity==true or NPC[i].empathy==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" liked your sound and is looking forward to know you more. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" ignored your sound. "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got a sound by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a smile
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if soundcase!=3:
								if (NPC[i].curiosity==true or NPC[i].sociability==true or NPC[i].empathy==true) and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" looks curious about you and your sound. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" making a sound. "
	
	#COUGH OUTCOMES (cough + ".")
	elif currentverb=="cough":
		var soundcase = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=cough[0])and(character.Focus>=cough[1]):
			soundcase = 1
			character.Stamina-=cough[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" coughed and sneezed to "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					soundcase = 3
		elif (character.Stamina<cough[0] or character.Focus<cough[1]):
			lackcondition=true
		else:
			soundcase = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" coughed and sneezed. "
		
		if soundcase!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if smiled
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if (NPC[i].selfcontrol==true) and NPC[i].knownthings[j].imageofyou >= 0 and NPC[i].knownthings[j].tolerance >= 0:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									NPC[i].status = "expectingcontinuation"
									NPC[i].status_timer=0
									NPC[i].target = character.get_node("Physicality").get_child(0)
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is cheering you to make you feel better. "
								elif NPC[i].knownthings[j].tolerance<0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
								else:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is annoyed by your cough. "
									if NPC[i].knownthings[j].imageofyou < 0:
										NPC[i].knownthings[j].tolerance -= 1
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got cough by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
				#NPC reaction if sees a smile
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if soundcase!=3:
								if (NPC[i].sociability==true or NPC[i].empathy==true) and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is cheering you to make you feel better. "
								else:
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is annoyed by your cough. "
							if NPC[i].knownthings[j].memory == 0:
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" coughing. "
	
	#PLAY OUTCOMES (play + "with" + objective + ".")
	elif currentverb=="play":
		var somethingentertained = 0
		if (get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part" or get_node(currentobjective).Name=="Asset")and(character.Stamina>=entertain[0])and(character.Focus>=entertain[1]):
			somethingentertained = 1
			character.Stamina-=entertain[0]
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" played with "+get_node(currentobjective).RealName[0]+". "
			if get_node(currentobjective).Name=="Object" or get_node(currentobjective).Name=="Part":
				if get_node(currentobjective).NPCbody==true or get_node(currentobjective).partowner=="NPC":
					somethingentertained = 3
		elif (character.Stamina<entertain[0])or(character.Focus<entertain[1]):
			lackcondition=true
		else:
			somethingentertained = 2
			yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" can't play with something that doesn't exist. "
		
		if somethingentertained!=0:
			for i in range (0,NPC.size(),1):
				#NPC reaction if cheered
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].status=="depressed":
									if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" really apreciated your effort and seems to be feeling better. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get your sense of humour. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								else:
									if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].knownthings[j].imageofyou += 1
										NPC[i].knownthings[j].memory -= 1
										NPC[i].status = "expectingcontinuation"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" apreciated your effort. "
									elif NPC[i].knownthings[j].tolerance<0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't want to be involved with you. "
									else:
										NPC[i].knownthings[j].imageofyou -= 1
										NPC[i].knownthings[j].memory -= 1
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" doesn't get your sense of humour. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
								NPC[i].knownthings[j].last_memory="Got entertained by "+character.get_node("Physicality").get_child(0).RealName[0]+". "
								if NPC[i].knownthings[j].interactedwithit==0:
									NPC[i].knownthings[j].interactedwithit+=1
				#NPC reaction if sees a cheer
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							if somethingentertained==3:
								if NPC[i].senseofhumour==true and NPC[i].knownthings[j].tolerance >= 0 and NPC[i].knownthings[j].memory>0:
									NPC[i].knownthings[j].imageofyou += 1
									NPC[i].knownthings[j].memory -= 1
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought your were funny. "
									if NPC[i].knownthings[j].memory == 0:
										yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
							NPC[i].knownthings[j].last_memory="Saw "+character.get_node("Physicality").get_child(0).RealName[0]+" playing. "
	
	#DISARM OUTCOMES (disarm + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="disarm":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0]) or (character.Focus<molest[1]):
			lackcondition = true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#THREATEN OUTCOMES (threaten + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="threaten":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0]) or (character.Focus<molest[1]):
			lackcondition = true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#FOLLOW OUTCOMES (follow + "" + objective + ".") SAME AS MOLEST
	elif currentverb=="follow":
		var someonemolested = null
		if (get_node(currentobjective).Name=="Object") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).NPCbody==true:
				someonemolested = get_node(currentobjective)
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			elif get_node(currentobjective).RealName[0]=="Your body":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (get_node(currentobjective).Name=="Part") and character.Stamina>=molest[0] and character.Focus>=molest[1]:
			if get_node(currentobjective).partowner == "NPC":
				someonemolested = get_node(currentobjective).get_parent()
				yourdescription+=character.get_node("Physicality").get_child(0).RealName[0]+" molested him and he did't like it. "
			if get_node(currentobjective).partowner == "You":
				yourdescription+="If you really want to annoy yourself you better be more creative. "
		elif (character.Stamina<molest[0]) or (character.Focus<molest[1]):
			lackcondition = true
		if someonemolested==null:
			yourdescription+="That's not alive. "
		
		if someonemolested!=null:
			for i in range (0,NPC.size(),1):
				#Enemy reaction if molested
				if get_node(currentobjective)!=null:
					if (get_node(currentobjective).get_parent().get_parent()==NPC[i] or get_node(currentobjective).get_parent().get_parent().get_parent()==NPC[i]):
						for j in range (0,NPC[i].knownthings.size(),1):
							if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
								if NPC[i].selfcontrol==false or NPC[i].knownthings[j].imageofyou<=0:
									NPC[i].knownthings[j].last_memory="Got molested by it. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									NPC[i].knownthings[j].tolerance -= 1
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory>=0 and NPC[i].knownthings[j].tolerance<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is really angry with you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								elif NPC[i].selfcontrol==true or NPC[i].knownthings[j].imageofyou>0:
									yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to be open to forgive you. "
									NPC[i].knownthings[j].memory -= 1
									NPC[i].knownthings[j].imageofyou -= 1
									if NPC[i].knownthings[j].memory>0 and NPC[i].knownthings[j].imageofyou<0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" is thinking bad of you. "
									if NPC[i].knownthings[j].memory==0:
										yourdescription+=NPC[i].get_node("Physicality").get_child(0).RealName[0]+" has made his mind about you. "
									if NPC[i].knownthings[j].tolerance >= 0:
										NPC[i].status = "offended"
										NPC[i].status_timer=0
										NPC[i].target = character.get_node("Physicality").get_child(0)
								if NPC[i].knownthings[j].interactedwithit<=1:
									NPC[i].knownthings[j].interactedwithit+=2
				#Enemy reaction if sees someone being molested
				if (NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective).get_parent())and(NPC[i].get_node("Physicality").get_child(0)!=get_node(currentobjective)):
					for j in range (0,NPC[i].knownthings.size(),1):
						if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
							NPC[i].knownthings[j].last_memory="Saw you molesting something. "
							if NPC[i].empathy==true:
								NPC[i].knownthings[j].imageofyou -= 1
								NPC[i].knownthings[j].memory -= 1
								yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet rude. "
								if NPC[i].knownthings[j].memory == 0:
									yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#CANTHERE OUTCOMES (canthere + ".")
	elif currentverb=="canthere":
		yourdescription="You can't do that here. "
	
	#SEXUALSHIT OUTCOMES (sexualshit + ".")
	elif currentverb=="sexualshit":
		yourdescription="That's so innapropiate. You should get help in real live. "
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					NPC[i].knownthings[j].last_memory="Saw you molesting something. "
					if NPC[i].knownthings[j].imageofyou>=0:
						NPC[i].knownthings[j].imageofyou -= 1
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#DIRTYSHIT OUTCOMES (dirtyshit + ".")
	elif currentverb=="dirtyshit":
		yourdescription="That's pretty dirty. You should get help in real live. "
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					NPC[i].knownthings[j].last_memory="Saw you molesting something. "
					if NPC[i].knownthings[j].imageofyou>=0:
						NPC[i].knownthings[j].imageofyou -= 1
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#DARKSHIT OUTCOMES (darkshit + ".")
	elif currentverb=="darkshit":
		yourdescription="That's pretty dark shit. You should get help in real live. "
		
		for i in range (0,NPC.size(),1):
			#Enemy reaction if sees someone being molested
			for j in range (0,NPC[i].knownthings.size(),1):
				if NPC[i].knownthings[j].Type==character.get_node("Physicality").get_child(0).Type:
					NPC[i].knownthings[j].last_memory="Saw you molesting something. "
					if NPC[i].knownthings[j].imageofyou>=0:
						NPC[i].knownthings[j].imageofyou -= 1
						NPC[i].knownthings[j].memory -= 1
						yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" thought that your behaviour is quiet strange. "
						if NPC[i].knownthings[j].memory == 0:
							yourdescription += NPC[i].get_node("Physicality").get_child(0).RealName[0]+" seems to have made his mind about you. "
	
	#NONESENSE OUTCOMES (nonesense + ".")
	elif currentverb=="nonsense":
		yourdescription="That doesn't make any real sense for you. "
	
	#SAVE OUTCOMES (save + ".")
	elif currentverb=="save":
		yourdescription="Saving options are for pussies. "
	
	#DEPENDSONYOU OUTCOMES (dependsonyou + ".")
	elif currentverb=="dependsonyou":
		yourdescription="If you really want to achieve that then you should find your own creative way. "
	
	#HOWGENIUS OUTCOMES (howgenius + ".")
	elif currentverb=="howgenius":
		yourdescription="How are you supposed to do that? You got to be more realistic. "
	
	#LACKTOOL OUTCOMES (lacktool + ".")
	elif currentverb=="lacktool":
		yourdescription="You lack the tool for that. "
	
	elif world.get_node("WorldDescription").initiate==false:
		yourdescription=""
		world.get_node("WorldDescription").initiate=true
	else:
		yourdescription="Your thoughts are too messy"
	if lackcondition == true:
		for i in range (0,AllVerbs.size(),1):
			if AllVerbs[i].has(currentverb):
				if character.Stamina<AllVerbs[i][0]:
					yourdescription="You tried but failed due to lack of 'Stamina' (you can recover 50% of Stamina by typing the verb 'rest' or similar ones). "
				elif character.Focus<AllVerbs[i][1]:
					yourdescription="You tried but failed due to lack of 'Focus' (look out for ways to recover your focus in the enviroment). "
	if character==get_parent():
		emit_signal("follow_ncpaction")
	return yourdescription

func check_accuracy(character):
	var efficiency
	var roll = rand_range(0,100)
	var accuracy = character.Focus
	if roll<=accuracy:
		efficiency = "success"
	else:
		var luckroll = rand_range(0,100)
		if luckroll<=accuracy:
			efficiency = "half success"
		else:
			efficiency = "fail"
	return efficiency
