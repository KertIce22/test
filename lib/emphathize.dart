import 'package:flutter/material.dart';
import 'package:test/analogous_empathy.dart';
import 'package:test/assume_beginner_mindset.dart';
import 'package:test/editing_video.dart';
import 'package:test/empa2.dart'; // Update with correct path if needed
import 'package:test/empathetic_data.dart';
import 'package:test/empathy_probe.dart';
import 'package:test/extreme_user.dart';
import 'package:test/i_like_i_wish_what_if.dart';
import 'package:test/interview_empathy.dart';
import 'package:test/interview_preparation.dart';
import 'package:test/journey_map.dart';
import 'package:test/prototype_for_empathy.dart';
import 'package:test/review_your_portfolio.dart';
import 'package:test/secondpage.dart';
import 'package:test/story_share_and_capture.dart';
import 'package:test/storytelling.dart';
import 'package:test/user_driven_prototyping.dart';
import 'package:test/what_how_why.dart'; // Update with correct path if needed
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Emphathize());
}

class Emphathize extends StatelessWidget {
  const Emphathize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _lessons = [
    'Introduction',
    'Assume a beginner’s mindset',
    'What? How? Why?',
    'Interview Preparation',
    'Interview for Empathy',
    'Extreme Users',
    'Story Share-and-Capture',
    'Journey Map',
    'Empathy Probe',
    'Analogous Empathy',
    'Shooting Video',
    'Editing Video',
    'Prototype for Empathy',
    'User-Driven Prototyping',
    'Storytelling',
    'I Like, I Wish, What If',
    'Empathetic Data',
    'Review Your Portfolio',
  ];

  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredLessons = [];
  Set<String> _bookmarkedLessons = {}; // To keep track of bookmarked lessons
  int? _selectedLessonIndex;

  @override
  void initState() {
    super.initState();
    _filteredLessons = _lessons;
    _searchController.addListener(_filterLessons);
    _loadBookmarks(); // Load bookmarks from SharedPreferences
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterLessons() {
    setState(() {
      _filteredLessons = _lessons
          .where((lesson) => lesson
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _openLesson(int index) {
    String lessonTitle = _filteredLessons[index];
    Widget targetPage;

    // Decide which page to navigate to based on the selected lesson
    switch (lessonTitle) {
      case 'Assume a beginner’s mindset':
        targetPage = const Assume(
          lessonTitleFront: 'Assume a beginner’s mindset',
          lessonContentFront:
              'You carry your own experiences, understanding, and expertise. Your unique perspective is an incredibly valuable asset to bring to any design challenge. At the same time, your viewpoint carries assumptions and personal beliefs. Your preconceived notions may, in fact, be misconceptions or stereotypes, and can limit the amount of real empathy you can build. Assume a beginner’s mindset in order to put aside biases and approach a design challenge with fresh eyes.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to Assume a Beginner’s Mindset:',
          lessonContentBack: 'Don’t judge. \n'
              'Observe and engage users without the influence of value judgments on their actions, circumstances, decisions, or “issues.” \n\n'
              'Question everything. \n'
              'Even (and especially) the things you think you already understand. Ask questions to learn about the world from the user’s perspective. \n\n'
              'Be truly curious. \n'
              'Strive to assume a posture of wonder and curiosity, both in circumstances that seem either familiar or uncomfortable. \n\n'
              'Find patterns. \n'
              'Look for interesting threads and themes that emerge across user interactions. \n\n'
              'Listen. Really. \n'
              'Ditch any agendas and let the scene soak into your psyche. Absorb what users say to you, and how they say it, without thinking about how you’re going to respond.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonImageFront:
              'assets/images/howtoemphize.png', // Example image path
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Review Your Portfolio':
        targetPage = const ReviewPortfolio(
          lessonImageFront: 'assets/images/Review Your Portfolio.png',
          lessonTitleFront: 'Review Your Portfolio',
          lessonContentFront:
              'Sustaining/incremental innovations and disruptive innovations are what make up your innovation portfolio. Reviewing where various concepts fall in the portfolio helps you understand where to focus your energy. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to review your portfolio: \n',
          lessonContentBack:
              'Create a simple 2x2 matrix. Plot “depth of insight” on the x-axis, from shallow to deep. Shallow insights are things the team knew before the project started. Deep insights expose the problem in a brand new light.  \n\n'
              'Plot “disruptiveness of concept” on the y-axis, from incremental to breakthrough. Incremental concepts are simple builds on existing products or services (or things the organization has tried before). Breakthrough concepts have never been tried—they might even be new to the industry.  \n\n'
              'It’s easier to move a deep insight up to breakthrough territory than it is to move a shallow insight. When reviewing your portfolio, ask “which concepts address problems we’ve never considered?” These concepts are easier to “Yes, And!” into breakthrough territory. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Empathetic Data':
        targetPage = const Empathetic(
          lessonImageFront: 'assets/images/Empathetic Data.png',
          lessonTitleFront: 'Empathetic Data',
          lessonContentFront:
              'The difficulty with many new ideas is that they’re hard to empirically prove, leaving key decision makers no basis for comparison. The good news is, designers can create data through simple prototyping. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
              'If you’re struggling to get buy-in from key stakeholders due to lack of hard data, consider building an empathetic data set, derived from real user prototype testing. \n\n\n\n\n\n\n',
          lessonTitleBack: 'How to gather empathetic data: ',
          lessonContentBack:
              'Take your prototype (it doesn’t need to be perfect, just usable) and place it in a context where your users currently experience your product or service. Bonus points if you can find a setting that allows users to test the current offering and the new offering.   \n\n'
              'Extra bonus points if that setting is low pressure, so customers feel comfortable giving open and honest feedback. For example, d.school alum, Bill Pacheco, tested exercise machine prototypes in a real gym with actual users.  \n\n'
              'During your test, capture usage counts, quotes, and reactions via notes or video. Create a sizable data sample to support and refine your prototype.  \n\n'
              'Pro tip: bring your decision makers along to watch and interact with users. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'I Like, I Wish, What If':
        targetPage = const ILike(
          lessonImageFront: 'assets/images/I like I wish What If.png',
          lessonTitleFront: 'I Like, I Wish, What If',
          lessonContentFront:
              'As a designer, you must rely on personal communication and, particularly, feedback, during design work. Colleagues give feedback on design frameworks. Users give feedback on solution concepts. I like, I wish, What if (IL/IW/WI) is a simple tool to encourage open feedback. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use I like, I wish, what if: ',
          lessonContentBack:
              'IL/IW/WI is almost too simple to write down, but it’s too useful not to mention. Meet as a group. Team members chime in by expressing “likes,” “wishes,” or “what ifs” as succinct headlines. \n\n'
              '“I like how we broke our team into pairs.” “I wish we had discussed our plan before testing.” “What if we tried one more prototype?”  \n\n'
              'Share dozens of headlines in a session (be sure to pick someone to capture). You don’t need to respond to every one. Let the team decide which topics to discuss as they arise.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Storytelling':
        targetPage = const Storytelling(
          lessonImageFront: 'assets/images/Storytelling.png',
          lessonTitleFront: 'Storytelling',
          lessonContentFront:
              'A well-told story—filled with rich detail, surprising meaning, and universal emotion affects both the brain and the heart. Stories are a great way to connect people with ideas, at a human level. If you want to make an impression on your audience (teammates, clients, investors), tell a great user-centered story. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to tell stories: ',
          lessonContentBack:
              'Follow the structure of a story spine to flesh out the narrative arc of your user-centered story:  \n\n'
              'Once upon a time...  \n'
              'And every day... \n'
              'Until one day... \n'
              'Because of that...  \n'
              'And because of that...  \n'
              'Until finally...  \n'
              'And ever since that day...  '
              'And the moral is...  \n\n'
              'Remember, your user is the hero of your story, not your concept. Your concept contributes to the transformation of your character, and to the relief of dramatic tension, but it’s not the main character.  \n'
              'Once you’ve finished your story, remove the stems from the story spine prompts. Don’t say “once upon a time,” for example, when you tell your story to an actual audience. Just like scaffolding for painters, the story spine prompts get removed once they serve their purpose. What remains should be a believable, compelling user story. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',

          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'User-Driven Prototyping':
        targetPage = const UserDriven(
          lessonImageFront: 'assets/images/User Driven Prototyping.png',
          lessonTitleFront: 'User-Driven Prototyping',
          lessonContentFront:
              'User-driven prototypes are created by users, rather than developed by you. When users create aspects of the design themselves, they reveal assumptions and desires that otherwise remain unmined. \n'
              'Your goal is not to integrate their ideas into your design, but to better understand their thinking and reveal undetected needs and insights.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to create a userdriven prototype: \n',
          lessonContentBack:
              'Strike a balance between how much you provide and how much you ask users to create. The ideal prototype should be scaffolded enough to spur generative thinking, but open enough to broaden user understanding. \n\n'
              'Some user-driven prototypes ask users to draw something (“draw going to the doctor”), make an object (“make a diaper bag with this paper and tape”), or compile artifacts (“tear out magazine pictures that depict your ideal mall shopping experience”).  \n\n'
              'If you were designing a website for users to create custom t-shirts, a traditional prototype might be a mockup of the website. A user-driven prototype might be a blank piece of paper for users to draw their own website. Scaffolding to get users going might include empty boxes on the page for them to fill in with content.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Introduction':
        targetPage = const Empa2(
          lessonTitleFront: 'Introduction',
          lessonContentFront:
              'Empathy is the foundation of human-centered design. The problems you’re trying to solve are rarely your own; they are those of particular users. Build empathy for your users by learning their values. To empathize, you should:\n\n\n'
              'Observe. View users and their behavior in the context of their lives.\n\n'
              'Engage. Interact with and interview users through both scheduled and short “intercept” encounters.\n\n'
              'Immerse. Wear your users’ shoes. Experience what they experience for a mile or two.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to Empathize:',
          lessonContentBack: 'Empathizing involves:\n\n'
              'Observation. See users in their natural environment to understand their behaviors and needs.\n\n'
              'Engagement. Conduct interviews and casual interactions to gain insights.\n\n'
              'Immersion. Directly experience the users’ challenges to build deeper understanding.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'What? How? Why?':
        targetPage = const What(
          lessonImageFront: 'assets/images/whos.png',
          lessonTitleFront: 'What? How? Why?',
          lessonContentFront:
              'What? How? Why? is a tool to help you reach deeper levels of observation. It’s a simple scaffolding to move you from concrete observations of a particular situation to the more abstract emotions and motives at play behind the scenes. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
              'This is particularly powerful when analyzing photos that your team took in the field, both for synthesis purposes, and to direct your team to future areas of need-finding.\n\n\n\n\n',
          lessonTitleBack: 'How to use What? How? Why?',
          lessonContentBack: 'Set-up.\n'
              'Divide a sheet into three sections: What?, How?, and Why? \n\n'
              'Start with concrete observations. \n'
              'What is the user doing in a situation or photograph? Notice and write down objective details. Don’t make assumptions just yet. \n\n'
              'Move to understanding. \n'
              'How is the user doing what they’re doing? Does it require effort? Do they appear rushed? Does the activity appear to be a negative or positive experience? Use phrases packed with adjectives.\n\n'
              'Step out on a limb of interpretation. \n'
              'Why is the user doing what they’re doing in the particular way they’re doing it? Make informed guesses regarding motivation and emotions. This step reveals assumptions you should test with users, and often uncovers unexpected insights.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Prototype for Empathy':
        targetPage = const PrototypeEM(
          lessonTitleFront: 'Prototype for Empathy',
          lessonContentFront:
              'When you’re creating a prototype, consider the people who will beinteracting with this object/experience. Develop the prototype ordesign the experience, specifically to gain empathy. You don’tnecessarily need to seek solutions when testing prototypes withusers. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to prototype for empathy:',
          lessonContentBack:
              'Prototype for empathy to dig deeper into user needs orprobe an insight you’re developing. You can createempathy prototypes to test with users or with yourdesign team. Consider these examples”\n\n'
              'Sketch.\n '
              'Ask users to draw something and talk about it afterward. “Draw how you get to work.” \n\n '
              'Play. \n'
              'Create a game to probe issues you want to explore. Usea simple card game to force users to make choicesrelated to your design challenge. \n\n'
              'Simulate. \n'
              'Simulate an aspect of the user experience to betterunderstand it yourself. If users garden while carrying ababy, put on a sling and carry ten pounds whilegardening. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonImageFront:
              'assets/images/Prototype for Empathy.png', // Example image path
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Interview Preparation':
        targetPage = const Interview(
          lessonImageFront: 'assets/images/interviews.png',
          lessonTitleFront: 'Interview Preparation',
          lessonContentFront:
              'Time with users is precious so you have to make the most of it. You should definitely allow room for spontaneous user-guided conversations, but you should never abandon your responsibility to prepare for interviews. Especially when following up with users (after testing), it’s essential to plan your discussions ahead of time. You may not get to every question you prepare, but you should come in with a plan for engagement.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to prepare for an interview: ',
          lessonContentBack: 'Brainstorm questions. \n'
              'Write down as many potential questions as your team can generate. Build on each other’s ideas to flesh out meaningful subject areas. \n\n'
              'Identify and order themes. \n'
              'Identify themes or subject areas into which most questions fall. Then, determine the order of questions that will allow the conversation to flow most fluidly. This will decrease the potential for a scattershot interaction with users. \n\n'
              'Refine questions. \n'
              'Once you’ve grouped your questions, you may find redundancies, or questions that seem strangely out of place. Cut them. Also, be sure to include plenty of “why?” questions, plenty of “tell me about the last time you _______?” questions, and plenty of questions directed at how the user FEELS. Remember, open ended questions allow for stories and stories lead to insights for design solutions.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nn',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Interview for Empathy':
        targetPage = const Interemp(
          lessonImageFront: 'assets/images/emp.jpg',
          lessonTitleFront: 'Interview for Empathy',
          lessonContentFront:
              'We interview to gain empathy. By interviewing users you will begin to better understand a person’s behaviors, choices, and needs. We suggest interviewing in-person and in pairs so that one person can converse while the other captures.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to interview for empathy: ',
          lessonContentBack: 'Ask why. \n'
              'Even when you think you know the answer. \n\n'
              'Never say “usually” when asking a question. \n'
              'Instead, ask about a specific occurrence. “Tell me about the last time you ____.” \n\n'
              'Encourage stories. \n'
              'Stories reveal how users think about the world. \n\n'
              'Look for inconsistencies. \n'
              'What users say and do can be different. These inconsistencies often hide interesting insights. \n\n'
              'Pay attention to nonverbal cues. \n'
              'Be aware of body language and emotions. \n\n'
              'Don’t be afraid of silence. \n'
              'When you allow for silence, you give users time to reflect on their answers— which may lead to deeper responses. \n\n'
              'Ask questions neutrally and don’t suggest answers.  \n'
              '“What do you think about buying gifts for your spouse?” is better than “Don’t you think shopping is great?”\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Extreme Users':
        targetPage = const Extreme(
          lessonImageFront: 'assets/images/extremes.png',
          lessonTitleFront: 'Extreme Users',
          lessonContentFront:
              'As a designer, you engage users (people!) to understand their needs and gain insights into their lives. You also draw inspiration from their work-arounds and frameworks. When you speak with and observe extreme users, their amplified needs and work-arounds come to light. This helps reveal meaningful needs that may not pop when engaging with the middle of the bell curve. And the needs of extreme users often coincide with the needs of a wider population. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to engage with extreme users:\n',
          lessonContentBack: 'Determine who’s extreme.\n'
              'First identify the aspects of your design challenge you want to explore to an extreme. Then think of extreme users within those facets. If you’re designing a grocery store, you might consider how groceries are gathered or how payment is made as aspects to explore. Honing in on gathering groceries, extreme users might include people who gather recyclables with shopping carts or product pullers for online buyers. \n\n'
              'Engage. \n'
              'Observe and interview extreme users just like other folks. Look for workarounds (or other extreme behaviors) to spark inspiration and uncover insights. \n\n'
              'Look at the extreme in all of us.  \n'
              'Look to extreme users to spur wild ideas. Then narrow in on what resonates with the primary users that you’re designing for.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Story Share-and-Capture':
        targetPage = const Story(
          lessonImageFront: 'assets/images/Story Share and Capture.png',
          lessonTitleFront: 'Story Share-and-Capture',
          lessonContentFront:
              'After interviewing people, bring your team together to share stories that you heard. A story share serves a few purposes. First, it allows team members to get up to speed on what others gathered in the field. Even if everyone was present for the fieldwork, comparing how each person experienced it is valuable. Second, in listening and probing for more information, team members tend to draw out nuance and meaning that wasn’t initially realized. This starts the synthesis process.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to storyshare-and-capture: \n',
          lessonContentBack:
              'Unpack observations and share stories that stick out from your team’s empathy fieldwork. While each team member shares notes and user stories, others should headline quotes, surprises, and interesting tidbits—one headline per post-it. \n\n'
              'The post-its can be physically grouped and re-grouped on the board to illuminate themes and patterns. \n\n'
              'The end goal is to understand what’s really going on with each user to discover who your users are and what they need in regard to your design space. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Journey Map':
        targetPage = const Journey(
          lessonImageFront: 'assets/images/Journey Map.png',
          lessonTitleFront: 'Journey Map',
          lessonContentFront:
              'A journey map is a tool to dissect a process into its moving parts to illuminate areas of potential insights. Don\'t forget the details when gaining empathy and understanding for a user and their experience. Creating a journey map is an excellent way to systematically think about those detailed steps or milestones. Journey maps can be used for your own empathy work, or to communicate your findings to others.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use a journey map: \n',
          lessonContentBack: 'Choose a process to examine. \n'
              'For example, your user’s morning breakfast routine. Then create a map of that process that captures every step. Organize the data in a way that makes sense: a timeline of events, a series of pictures, a stack of cards. You can create a journey map based on observation and interview, or a user can draw their own. \n\n'
              'Be comprehensive.  \n'
              'Don’t overlook the opening of window shades during the morning breakfast routine. What seems meaningless could be the nugget that develops into a stunning insight.\n\n'
              'Look for patterns and anomalies. \n'
              'Push yourself to connect individual events to a larger framework. It’s often the pairing of an observation with prior knowledge that yields a meaningful insight.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Empathy Probe':
        targetPage = const EmpathyProbe(
          lessonImageFront: 'assets/images/Empathy Probe.png',
          lessonTitleFront: 'Empathy Probe',
          lessonContentFront:
              'It can be tricky to elicit emotion rich conversations with users (sometimes total strangers!). It can also be tough to decide where to direct early empathy interviews. Empathy probes help reduce friction by giving users something to do and create space for them to speak their mind. It also gives you plenty of opportunity to observe users before choosing where to engage more deeply. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to conduct an empathy probe:  \n',
          lessonContentBack: 'Create a probe.  \n'
              'A probe is a prompt that users engage with while you interview them. We often create probes in the form of a set of cards: one question card and 7 answer cards, that the user sorts through. A probe sparks interaction and provokes storytelling on the part of the user.  \n\n'
              'Engage users. \n'
              'Ask them to share their thoughts aloud. If your probe asks users to consider a particular experience, find out the exact experience they’re considering before they begin the sorting activity. \n\n'
              'Follow up on interesting comments, movements, and pauses.  \n'
              'Always start with what you noticed. “You mentioned that you ____. Could you tell me a little more about that?” “I noticed when you read that card, you said ____. What were you thinking?” Pay special attention to rich emotional material.  \n\n'
              'Seek stories relevant to the emotions you uncover.  \n'
              'Spend the majority of your time here. Steer stories toward specificity. You need specifics to fuel your design work. “Is there a specific time you can remember feeling / doing that?” \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Analogous Empathy':
        targetPage = const AnalogousEmpathy(
          lessonImageFront: 'assets/images/Analogous Empathy.png',
          lessonTitleFront: 'Analogous Empathy',
          lessonContentFront:
              'When teams (particularly intact teams) struggle to innovate it’s often because they neglect to look outside their organization for inspiration. Unlike competitive research, analogies push teams to consider radically different industries and offerings to apply a fresh perspective on a familiar challenge. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use analogies:  \n',
          lessonContentBack:
              'Identify and explore specific aspects of your design challenge in new ways! \n\n'
              'Gather a team to talk about what aspects of your challenge you’d like to explore further. For example, if you’re designing for hospital technicians, and you’re interested in understanding extreme time pressures or high stakes decisions, brainstorm spaces that are tangential to the design challenge that share enough attributes where there may be insight cross-over.  \n\n'
              'For the hospital challenge you might explore extreme time pressures at an airport, or for high stakes decisions, a police training academy or fire station. Observe and interview people in these analogous locations. \n\n'
              'Make an analogous inspiration board. \n \n'
              'Saturate a space with photos and quotes from your analogous space; this can help the team share inspiration, or bring in the analogous insight later in the process.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Shooting Video':
        targetPage = const Extreme(
          lessonImageFront: 'assets/images/Shooting Video.png',
          lessonTitleFront: 'Shooting Video',
          lessonContentFront:
              'Video is a powerful medium for communicating ideas, insights and stories. The frame is your medium—be aggressive. If it’s not in the frame, it doesn’t exist. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to shoot video: \n',
          lessonContentBack:
              '1. Know your intention. What’s the one thing you want your audience to leave with?  \n\n'
              '2. Get a tight frame of your subject at all times. \n\n'
              '3. Be conscious of light sources and shadows on your subject.  \n\n'
              '4. Overshoot! Get more than you think you need. Editing is where the storytelling begins. Remember to get longer takes. They allow you some wiggle room for transitions.  \n\n'
              '5. Keep mic close to the subject (boom mic preferred).  \n\n'
              '6. Point mic away from undesired noise. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;
      case 'Editing Video':
        targetPage = const EditingVideo(
          lessonImageFront: 'assets/images/Editing Video.png',
          lessonTitleFront: 'Editing Video',
          lessonContentFront:
              'At its core, editing is storytelling. The medium where your narrative comes to life. Being meticulous in your editing is crucial to delivering the best, clearest narrative.  \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to edit video: ',
          lessonContentBack:
              'To edit quickly and create compelling videos, follow these guidelines:  \n\n'
              'During the process, ensure an audience will understand your visual narrative. Remember, it’s better to be clear than clever.  \n\n'
              'Make an initial rough cut of the whole film. Block out the beginning, middle and end.  \n\n'
              'Kill the darlings. Remain focused on what will tell your story best.  \n\n'
              'What you hear is equally important to what you see. Ensure any music compliments your visuals and doesn\'t distract.\n\n'
              'Before exporting your video, know where it will live. If to be played off your computer, use minimal compression to ensure quality. For social media or video hosting sites, consult their listed guidelines.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/empha.jpg',
        );
        break;

      // Add other cases for other lessons if needed
      default:
        targetPage = Empa2(
          lessonTitleFront: lessonTitle,
          lessonContentFront: 'Content for $lessonTitle',
          lessonTitleBack: lessonTitle,
          lessonContentBack: 'Additional content for $lessonTitle',
          lessonImageBack: 'assets/images/default.png', // Example default image
          backgroundImage: 'assets/images/empha.jpg',
        );
    }

    setState(() {
      _selectedLessonIndex = index;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    });
  }

  Future<void> _toggleBookmark(String lesson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_bookmarkedLessons.contains(lesson)) {
        _bookmarkedLessons.remove(lesson);
      } else {
        _bookmarkedLessons.add(lesson);
      }
    });
    // Save the updated bookmark list to SharedPreferences
    await prefs.setStringList('bookmarkedLessons', _bookmarkedLessons.toList());
  }

  bool _isBookmarked(String lesson) {
    return _bookmarkedLessons.contains(lesson);
  }

  Future<void> _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedBookmarks = prefs.getStringList('bookmarkedLessons');
    if (savedBookmarks != null) {
      setState(() {
        _bookmarkedLessons = savedBookmarks.toSet();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/EmpathizeBG.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),

          // Foreground Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Back Button and Title
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the row items
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Secondpage()),
                        );
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'EMPATHIZE',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    // Empty container to balance the row, but not required for centering
                    Container(width: 48),
                  ],
                ),
                const SizedBox(height: 20),

                // Adding extra space above the search bar
                const SizedBox(
                    height:
                        5), // Adjust this value to move the search bar lower

                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search lessons...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 45, 151, 221),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 40), // Adjust space after the search bar

                // Lessons List
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredLessons.length,
                    itemBuilder: (context, index) {
                      String lesson = _filteredLessons[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ListTile(
                          leading: const Icon(
                            Icons.book,
                            color: Color.fromARGB(255, 45, 151, 221),
                          ),
                          title: Text(
                            lesson,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  _isBookmarked(lesson)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: Color.fromARGB(255, 45, 151, 221),
                                ),
                                onPressed: () {
                                  _toggleBookmark(lesson);
                                },
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          onTap: () => _openLesson(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
