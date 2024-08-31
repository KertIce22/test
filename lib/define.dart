import 'package:flutter/material.dart';
import 'package:test/2x2_matrix.dart';
import 'package:test/assume_beginner_mindset.dart';
import 'package:test/describe_your_concept.dart';
import 'package:test/design_guidelines.dart';
import 'package:test/editing_video.dart';
import 'package:test/empa2.dart'; // Update with correct path if needed
import 'package:test/extreme_user.dart';
import 'package:test/how_might_we_questions.dart';
import 'package:test/i_like_i_wish_what_if.dart';
import 'package:test/interview_empathy.dart';
import 'package:test/interview_preparation.dart';
import 'package:test/journey_map.dart';
import 'package:test/point_of_view.dart';
import 'package:test/power_of_ten.dart';
import 'package:test/review_your_portfolio.dart';
import 'package:test/secondpage.dart';
import 'package:test/shooting_video.dart';
import 'package:test/story_share_and_capture.dart';
import 'package:test/storytelling.dart';
import 'package:test/surprise_to_insights_leap.dart';
import 'package:test/what_how_why.dart';
import 'package:test/why_how_laddering.dart'; // Update with correct path if needed
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Define());
}

class Define extends StatelessWidget {
  const Define({Key? key}) : super(key: key);

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
    'Powers of Ten',
    '2x2 Matrix',
    'Why-How Laddering',
    'Point of View (POV)',
    'Design Guidelines',
    '"How Might We" Questions',
    'Describe Your Concept',
    'Surprise-to-Insights Leap',
    'Shooting Video',
    'Editing Video',
    'Story Share-and-Capture',
    'Journey Map',
    'Storytelling',
    'I Like, I Wish, What If',
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
      case 'Powers of Ten':
        targetPage = const Powers(
          lessonTitleFront: 'Powers of Ten',
          lessonContentFront:
              'Powers of Ten is a reframing technique used as a synthesis or ideation method. It allows your design team to consider the challenge at hand through frames of various magnitudes. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use Powers of Ten:',
          lessonContentBack:
              'Consider increasing and decreasing magnitudes of context to reveal connections and insights. \n\n'
              'Powers of ten for insight development. \n '
              'Imagine you’re designing a checkout experience. You already observed that users read customer reviews before purchasing, and developed the insight that users value peer opinions when shopping. Now imagine the user is shopping for items over a wide magnitude of costs—from mints, to a bed, to a house. Does this alter user behavior? Probe for nuances in your insight. Note where it breaks down. \n\n '
              'Powers of ten for ideation. \n'
              'Add constraints that alter the magnitude of the solution space. “What if it had to cost more than a million dollars to implement?” “Or less than 25 cents?” “What if it was larger than this room?” “Or smaller than a wallet?” \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonImageFront:
              'assets/images/Powers of Ten.png', // Example image path
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Review Your Portfolio':
        targetPage = const ReviewPortfolio(
          lessonImageFront: 'assets/images/Review Your Portfolio.png',
          lessonTitleFront: 'Review Your Portfolio',
          lessonContentFront:
              'Sustaining/incremental innovations and disruptive innovations are what make up your innovation portfolio. Reviewing where various concepts fall in the portfolio helps you understand where to focus your energy.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to review your portfolio: \n',
          lessonContentBack:
              'Create a simple 2x2 matrix. Plot “depth of insight” on the x-axis, from shallow to deep. Shallow insights are things the team knew before the project started. Deep insights expose the problem in a brand new light.  \n\n'
              'Plot “disruptiveness of concept” on the y-axis, from incremental to breakthrough. Incremental concepts are simple builds on existing products or services (or things the organization has tried before). Breakthrough concepts have never been tried—they might even be new to the industry.  \n\n'
              'It’s easier to move a deep insight up to breakthrough territory than it is to move a shallow insight. When reviewing your portfolio, ask “which concepts address problems we’ve never considered?” These concepts are easier to “Yes, And!” into breakthrough territory. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'I Like, I Wish, What If':
        targetPage = const ILike(
          lessonImageFront: 'assets/images/I like I wish What If.png',
          lessonTitleFront: 'I Like, I Wish, What If',
          lessonContentFront:
              'As a designer, you must rely on personal communication and, particularly, feedback, during design work. Colleagues give feedback on design frameworks. Users give feedback on solution concepts. I like, I wish, What if (IL/IW/WI) is a simple tool to encourage open feedback.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use I like, I wish, what if: ',
          lessonContentBack:
              'IL/IW/WI is almost too simple to write down, but it’s too useful not to mention. Meet as a group. Team members chime in by expressing “likes,” “wishes,” or “what ifs” as succinct headlines. \n\n'
              '“I like how we broke our team into pairs.” “I wish we had discussed our plan before testing.” “What if we tried one more prototype?”  \n\n'
              'Share dozens of headlines in a session (be sure to pick someone to capture). You don’t need to respond to every one. Let the team decide which topics to discuss as they arise.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
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
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Introduction':
        targetPage = const Empa2(
          lessonTitleFront: 'Introduction',
          lessonContentFront:
              'The define mode is when you unpack your empathy findings into needs and insights and scope a meaningful challenge. Based on your understanding of users and their environments, come up with an actionable problem statement: your Point Of View. \n'
              'More than simply defining the problem, your Point of View is a unique design vision that is framed by your specific users. \n\n'
              'Understanding the meaningful challenge at hand, and the user insights you can leverage, is fundamental to creating a successful solution.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to Define:',
          lessonContentBack:
              'The define mode explicitly expresses the problem you strive to address. In order to be truly generative, you must reframe your challenge based on new insights gained through your empathy work. This reframed Point of View, or problem statement, can then be used as a solution-generating springboard. \n\n'
              'A spectacular Point of View... \n\n'
              'Preserves emotion and the individual ,you’re designing for. Includes strong language. Uses sensical wording. Includes a strong insight. Generates lots of possibilities.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case '2x2 Matrix':
        targetPage = const Matrix(
          lessonImageFront: 'assets/images/2x2 Matrix.png',
          lessonTitleFront: '2x2 Matrix',
          lessonContentFront:
              'A 2x2 matrix is a tool to scaffold information about users and your design space to reveal relationships. The hope is to uncover insights or areas to explore more deeply. A 2x2 matrix is also a great way to visually communicate a relationship you want to convey to others.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use a 2x2 matrix:',
          lessonContentBack:
              'Draw a 2x2 matrix (x-axis and y-axis), pick a spectrum for each axis (opposites on either end), and plot items on the map. You can explore any group of things— products, motivations, users. \n\n'
              'You might place products on a matrix of perceived quality (low to high) versus use of natural materials (all-natural to all-synthetic). Where do groups form? Notice full or empty quadrants. Where does the assumed correlation break down? \n\n'
              'You may have to try various combinations of spectra to find one that’s meaningful. Often the discussion spurred by filling in the matrix is more valuable than the map itself. You can also use a 2x2 matrix to create a competitive landscape. An empty quadrant may signal a market opportunity (or a very bad idea).\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Why-How Laddering':
        targetPage = const Laddering(
          lessonImageFront: 'assets/images/Why How Laddering.png',
          lessonTitleFront: 'Why-How Laddering',
          lessonContentFront:
              'Use why-how laddering to flesh out varying user needs and find a middle ground that’s both meaningful and actionable. \n'
              'As a general rule, asking “why” yields abstract statements and asking “how” yields specific statements. Often times abstract statements are more meaningful, but not as actionable. The opposite is true of more specific statements. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to why-how ladder:',
          lessonContentBack: 'Step 1 \n'
              'Identify a few meaningful user needs and write them at the bottom of a piece of paper. \n\n'
              'Step 2 \n'
              'Ladder up from that need, asking “why?” For example, why would a user “need to see a link between a product and the process that creates it?” because the user, “needs confidence that it won’t harm their health by understanding its origin.” \n\n'
              'Step 3  \n'
              'Ask why again, and continue to ladder from that same need. At a certain point, you’ll reach a very common, abstract need such as, “the need to be healthy.” This is the top of the ladder. \n\n'
              'Step 4  \n'
              'Climb back down the ladder asking “how?” This will give you ideas for how to address the needs. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Point of View (POV)':
        targetPage = const Point(
          lessonImageFront: 'assets/images/Point of View.png',
          lessonTitleFront: 'Point of View (POV)',
          lessonContentFront:
              'A Point of View framework helps outline your design challenge into an actionable problem statement so that you can begin brainstorming solutions. Most importantly, your POV anchors your design thinking project and helps you to articulate your challenge meaningfully. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to write a Point of View (POV) statement:  ',
          lessonContentBack:
              'After you’ve interpreted your user empathy interviews, try different ways of stating the problem.\n'
              ' POV framework.\n\n'
              'Start by describing your user in colorful language, including pertinent details. Then, choose your favorite surprise/insight that represents the most powerful shift in your own perspective. Last, articulate what would be game-changing for your user, assuming your insight is correct. \n\n'
              'POV musts. \n'
              '•	Make sure your POV flows sensically (so a stranger could comprehend it). \n'
              '•	Specifies an insight that’s focused on a specific user (rather than a demographic)\n'
              '•	Articulates a game-changing direction, without dictating a particular solution.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Design Guidelines':
        targetPage = const Design(
          lessonImageFront: 'assets/images/Design Guidelines.png',
          lessonTitleFront: 'Design Guidelines',
          lessonContentFront:
              'Design guidelines, also known as design directives, are written statements that articulate a strategy for how you will solve your design challenge, independent of a specific solution. They translate your findings—user needs and insights— into actionable design directives. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use design guidelines:\n',
          lessonContentBack:
              'You can translate your insights and observations into design guidelines by stating your findings in terms of solutions rather than observations about the user. For example, a user’s “need to feel instrumental in creating a gift” becomes “involve the user in creating a gift.” \n\n'
              'You can also work backwards from a potential solution to create design guidelines. Ask yourself what aspects of the solution resonates with users, and makes those aspects into guidelines/directives. \n\n'
              'Design guidelines should be independent of a solution—that is, they should be useful regardless of the design solution. You may know you’re designing a gift product, but unsure if it’s physical, digital, or experiential. The design guideline above (“involve the gift-giver in creating the final gift”) is still helpful even though you don’t yet know the ultimate design solution. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case '"How Might We" Questions':
        targetPage = const Questions(
          lessonImageFront: 'assets/images/How Might We Questions.png',
          lessonTitleFront: '"How Might We" Questions',
          lessonContentFront:
              '“How might we” (HMW) questions are short questions that launch ideation. They’re broad enough to include a wide range of solutions but narrow enough to impose helpful boundaries. \n\n'
              'Between the too narrow “HMW create an ice cream cone that doesn’t drip” and the too broad “HMW redesign dessert”, is the properly scoped “HMW redesign ice cream to be more portable.” \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to write “how might we”(HMW) questions:\n',
          lessonContentBack:
              'Start with your design challenge and Point of View statement (see card #11). Then break down the larger challenge into smaller actionable bits and ask questions that open up the solution space. \n\n'
              'Challenge \n'
              'Redesign the airport waiting space. \n\n'
              'Point of View  \n'
              'A frenzied mother of three rushes to her gate to find out her flight is delayed. She has to entertain her playful children to avoid irritating already-frustrated fellow passengers.  \n\n'
              'How Might We \n'
              'Alleviate tension: HMW separate the kids from fellow passengers? \n'
              'Explore the opposite: HMW make the wait the most exciting part of the trip? \n'
              'Question an assumption: HMW remove wait time altogether? Create an analogy from need to context: HMW make the airport like a spa? Like a playground?  \n'
              'Change a status quo: HMW make playful, loud kids less annoying? \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Describe Your Concept':
        targetPage = const Design(
          lessonImageFront: 'assets/images/Describe Your Concept.png',
          lessonTitleFront: 'Describe Your Concept',
          lessonContentFront:
              'Many brainstorms end with a team realizing they don’t fully understand the idea they selected to act on. The Describe Your Concept tool helps you distill down what resonated with the team from the original concept, and understand exactly what they need to create during prototyping. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to describe your concept: ',
          lessonContentBack:
              'Select an idea from your brainstorm and flesh out the concept while it’s fresh in your team’s mind. What would you name it? Who is it for? What does it accomplish for them? How does it accomplish this? Here, your team can really specify how your product or service does what it does. Make it your goal to articulate a single function that your concept performs in order to achieve the desired user impact.   \n\n'
              ' Pro tip: If your concept either 1) doesn’t relate to your user or 2) doesn’t bring you to a game-changing idea, don’t worry, you’ve made a common mistake. Revisit your brainstorm and pick another idea that’s more user-centric. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
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
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Surprise-to-Insights Leap':
        targetPage = const SurpriseToInsightsLeap(
          lessonImageFront: 'assets/images/Suurprise to Insights Leap.png',
          lessonTitleFront: 'Surprise-to-Insights Leap',
          lessonContentFront:
              'Design teams often have trouble articulating the “nuggets” they discover during empathy work. The Surprise-to-Insights leap helps teams get out of their heads and explore various interpretations of surprising user behavior.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to make the surprise-to insights leap: ',
          lessonContentBack:
              'Place a few surprising observations from your empathy work on the left-hand side of the board. Pick one to start and ask your team to interpret the behavior by finishing the sentence, “I wonder if this means that the user _____.” Everyone writes down their interpretation, then reads aloud (one by one), and places it on the right-hand side of the board, across from the surprise.   \n\n'
              'If an interpretation sparks new ideas from the team, feel free to craft more interpretations and add them to the board. Continue the same process with the rest of your surprising observations. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/bg8.jpg',
        );
        break;
      case 'Shooting Video':
        targetPage = const ShootingVideo(
          lessonImageFront: 'assets/images/Shooting Video.png',
          lessonTitleFront: 'Shooting Video',
          lessonContentFront:
              'Video is a powerful medium for communicating ideas, insights and stories. The frame is your medium—be aggressive. If it’s not in the frame, it doesn’t exist.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to shoot video: \n',
          lessonContentBack:
              '1. Know your intention. What’s the one thing you want your audience to leave with?  \n\n'
              '2. Get a tight frame of your subject at all times. \n\n'
              '3. Be conscious of light sources and shadows on your subject.  \n\n'
              '4. Overshoot! Get more than you think you need. Editing is where the storytelling begins. Remember to get longer takes. They allow you some wiggle room for transitions.  \n\n'
              '5. Keep mic close to the subject (boom mic preferred).  \n\n'
              '6. Point mic away from undesired noise. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
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
              'Before exporting your video, know where it will live. If to be played off your computer, use minimal compression to ensure quality. For social media or video hosting sites, consult their listed guidelines. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
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
              'The end goal is to understand what’s really going on with each user to discover who your users are and what they need in regard to your design space.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/bg8.jpg',
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
          backgroundImage: 'assets/images/empahize.jpg',
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
              'assets/images/mainBG1.png', // Replace with your image path
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
                    Expanded(
                      child: Center(
                        child: const Text(
                          'DEFINE',
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
                        50), // Adjust this value to move the search bar lower

                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search lessons...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 155, 70),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(
                    height: 200), // Adjust space after the search bar

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
                               color: Colors.green,
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
                                  color: Colors.green,
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
