import 'package:flutter/material.dart';
import 'package:test/assume_beginner_mindset.dart';
import 'package:test/brainstorming.dart';
import 'package:test/editing_video.dart';
import 'package:test/empa2.dart'; // Update with correct path if needed
import 'package:test/extreme_user.dart';
import 'package:test/facilitate_a_brainstorm.dart';
import 'package:test/how_might_we_questions.dart';
import 'package:test/i_like_i_wish_what_if.dart';
import 'package:test/idea2.dart';
import 'package:test/impose_constraints.dart';
import 'package:test/interview_empathy.dart';
import 'package:test/interview_preparation.dart';
import 'package:test/power_of_ten.dart';
import 'package:test/review_your_portfolio.dart';
import 'package:test/secondpage.dart';
import 'package:test/shooting_video.dart';
import 'package:test/stoke.dart';
import 'package:test/storytelling.dart';
import 'package:test/what_how_why.dart';
import 'package:test/yes_and_brainstorm.dart'; // Update with correct path if needed
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Ideate());
}

class Ideate extends StatelessWidget {
  const Ideate({Key? key}) : super(key: key);

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
    'Stoke',
    'Brainstorming',
    'Facilitate a Brainstorm',
    'Brainstorm Selection',
    'Impose Constraints',
    'Yes, And! Brainstorm',
    'Shooting Video',
    'Editing Video',
    'Powers of Ten',
    '"How Might We" Questions',
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
      case 'Stoke':
        targetPage = const Stoke(
          lessonTitleFront: 'Stoke',
          lessonContentFront:
              'Stoke activities loosen up and energize teams—bothmentally and physically. Use stoke activities to wake upin the morning, launch a meeting, or begin abrainstorm. They should be brief and highly active. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to stoke:',
          lessonContentBack: 'Category, category, out! ”\n'
              'Line folks up, name a category (breakfast cereals, vegetables, cars), and point at people in rapid succession, skipping around the group. The player pointed at must name something in the category. If they don’t, everyone yells “Out!” and they’re out for the rest of the round. \n\n '
              'Sound ball. \n '
              'Stand in a circle and throw an imaginary ball to each other. Make eye contact and make a noise as you throw it. The catcher must repeat the noise of the thrower and make a new noise as she throws to the next person. Try increasing the speed or adding a second ball. \n\n'
              'Yes, Let’s! \n'
              'Everyone walk around the room randomly. One person voices an instruction: “let’s act like we’re at a cocktail party” or “let’s act like there’s no gravity.” Everyone shouts back, “Yes, let’s!” and acts it out. At anytime someone can yell the next instruction. The answer is always, “Yes, let’s!” \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonImageFront: 'assets/images/Stoke.png', // Example image path
          backgroundImage: 'assets/images/ide.jpg',
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
          backgroundImage: 'assets/images/ide.jpg',
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
          backgroundImage: 'assets/images/ide.jpg',
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
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Introduction':
        targetPage = const Idea2(
          lessonTitleFront: 'Introduction',
          lessonContentFront:
              'Ideate is the mode in which you generate radical design alternatives. Ideation is a process of “going wide” in terms of concepts and outcomes—a mode of “flaring” instead of “focus”. The goal of ideation is to explore a wide solution space—both a large quantity and broad diversity of ideas. From this vast repository of ideas, you can build prototypes to test with users.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to Ideate:',
          lessonContentBack:
              'You ideate in order to transition from identifying problems to exploring solutions for your users.\n\n'
              'Ideation is leveraged to: \n\n'
              'Harness the collective perspectives and strengths of your team. \n'
              'Step beyond obvious solutions and drive innovation.\n'
              'Uncover unexpected areas of exploration. \n'
              'Create fluency (volume) and flexibility (variety) in your innovation options. \n\n'
              'When ideating, your team needs to fluctuate between times of focus and flare. Idea generation is a moment to “go wide” while evaluation/selection of ideas is a time for narrowing-in. \n\n'
              'Curtailing “bad” behaviors, such as evaluating during idea generation, is very important—innovative concepts can often come from the most outlandish ideas.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
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
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Brainstorming':
        targetPage = const Brainstorming(
          lessonImageFront: 'assets/images/Brainstorming.png',
          lessonTitleFront: 'Brainstorming',
          lessonContentFront:
              'Brainstorming conjures tons of ideas all at once. A brainstorm is a distinct segment of time when you amp up the generative part of your brain and turn down the evaluative part. The intention is to leverage the collective thinking of the group. Brainstorming can be used throughout the design process: to plan empathy work, to assess products and services, and to come up with design solutions.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to brainstorm:',
          lessonContentBack:
              'Your team’s sole goal is to generate as many ideas as possible, without judgment. Gather in front of a whiteboard and spend 15 to 30 minutes in high engagement “brainstorm mode.”  \n\n'
              'Be sure to capture every idea, regardless of your feelings about them. You can either assign a scribe to capture ideas as they’re called out or go all-in, each person shares their ideas out loud and puts them on the board themself. Either way, use post-its and stick them up quickly. \n\n'
              'You can use How Might We questions to launch a brainstorm (see card #13). “How might we give each shopper a personal checkout experience?”\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/ide.jpg',
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
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Facilitate a Brainstorm':
        targetPage = const Facilitate(
          lessonImageFront: 'assets/images/Facilitate a Brainstorm.png',
          lessonTitleFront: 'Facilitate a Brainstorm',
          lessonContentFront:
              'Good facilitation is key to a generative brainstorm. Brainstorming spawns many, wide-ranging (and sometimes left field) ideas. A good facilitator sets the stage for open, active, and constructive engagement. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to facilitate a brainstorm:',
          lessonContentBack: 'Energy. \n'
              'As facilitator, it’s your task to keep ideas flowing. Be sure to write a compelling question to kick off the brainstorm. If the team slows or gets stuck, add a variation to the prompt to shake things up (prepare options ahead of time). \n\n'
              'Constraints.  \n'
              'Add solution constraints to spark new ideas. “What if it had to be round?” “How would superman do it?” Or create process constraints, such as shooting for 50 ideas in 20 minutes. \n\n'
              'Space. \n'
              'Be mindful of where you brainstorm. Find a room with lots of vertical work space. Make sure all participants are standing and have supplies in hand—post-its and a sharpie. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Brainstorm Selection':
        targetPage = const Facilitate(
          lessonImageFront: 'assets/images/Brainstorm Selection.png',
          lessonTitleFront: 'Brainstorm Selection',
          lessonContentFront:
              'Your brainstorm should generate many, wide-ranging ideas. That’sthe easy part. The hard part is selecting which ideas to act on.Brainstorm selection may be straight forward for some brainstorms(simply pick a few standout ideas), but selecting design solutionsmay take more deliberation.  \n\n'
              'Don’t pick just one and don’t settle on safe choices. Select a rangeof ideas to carry forward into prototyping, aiming to preserve thebreadth of solutions generated by the group. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to selectbrainstorm ideas:',
          lessonContentBack:
              'Don’t narrow down ideas too fast. An implausible idea mayspark a useful or meaningful insight. Hang onto ideas thatexcite, amuse, or intrigue the team. Consider these threeselection techniques. \n\n'
              'Post-it voting. \n'
              'Each team member gets three votes. The post-its with themost marks get selected. \n\n'
              'Four categories.  \n'
              'Elect one or two ideas within each category: the rationalchoice, the most likely to delight, the darling, and the longshot. \n\n'
              'Bingo. \n'
              'Pick one or two ideas that inspire a physical prototype, adigital prototype, and an experience prototype.If an idea is so far out there that it seems pointless to test,ask what attracted you to it, then test that aspect orintegrate it into a new solution.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Impose Constraints':
        targetPage = const Constraints(
          lessonImageFront: 'assets/images/Impose Constraints.png',
          lessonTitleFront: 'Impose Constraints',
          lessonContentFront:
              'It’s a bit counterintuitive, yet imposing constraints (with intention) can actually increase creative potential. \n\n'
              'Try it: \n\n'
              'Think of as many silver things as you can in ten seconds. Now think of silver things in your kitchen. \n\n'
              'Which prompt sparked more ideas?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to impose constraints:',
          lessonContentBack:
              'It’s important to be conscious of when and whatconstraints you impose. Imposing a constraint duringidea generation is different than rejecting ideas due topreconceived notions about users. Consider these three constraint examples. \n\n'
              'Ideation.\n'
              'During a brainstorm, temporarily add a solutionconstraint. “What if it were made for babies?” “How would McDonald’s do it?” \n\n'
              'Prototyping. \n'
              'Constrain materials to build quicker, lower resolutionprototypes. Developing a checkout service? Prototypeit with cardboard, post-its, and a sharpie. Designingsoccer cleats? Your shoe, tape and thumb tacks. Or,impose solution constraints. How might you design itfor blind users? Without plastic?  \n\n'
              'Time. \n'
              'Constrain time to force output. Make two prototypes inan hour. Spend three hours with users by Friday.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Yes, And! Brainstorm':
        targetPage = const YesAndBrainstorm(
          lessonImageFront: 'assets/images/Yes And Brainstorm.png',
          lessonTitleFront: 'Yes, And! Brainstorm',
          lessonContentFront:
              'Brainstorming can often feel frenetic and irrational. It can also leave less extroverted folks feeling left out. The Yes, And! brainstorm provides a little structure for guiding brainstorms, and creating space for each team member to contribute and build on others’ ideas. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to conduct a Yes, And! brainstorm: ',
          lessonContentBack:
              'Write down a game-changing idea on a whiteboard. (“It would be game changing to ____.”) Give team members a couple minutes to write down (on a post-it) one novel approach to accomplishing the “game changer”. Have them briefly share their novel ideas and place them on the board.  \n\n'
              'Then lead the team through a series of “Yes, And!” brainstorms for each idea. Ask team members to build on the ideas by saying “yes, and” before they contribute. Make sure every team member builds on the idea before moving on to the next one. \n\n'
              'If some of the builds spark other ideas, feel free to capture those too. Repeat the process until everyone’s idea has been built upon by everyone else at least once. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/ide.jpg',
        );
        break;
      case 'Shooting Video':
        targetPage = const ShootingVideo(
          lessonImageFront: 'assets/images/Shooting Video.png',
          lessonTitleFront: 'Shooting Video',
          lessonContentFront:
              'Video is a powerful medium for communicating ideas, insights and stories. The frame is your medium—be aggressive. If it’s not in the frame, it doesn’t exist. \n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to shoot video: \n',
          lessonContentBack:
              '1. Know your intention. What’s the one thing you want your audience to leave with?  \n\n'
              '2. Get a tight frame of your subject at all times. \n\n'
              '3. Be conscious of light sources and shadows on your subject.  \n\n'
              '4. Overshoot! Get more than you think you need. Editing is where the storytelling begins. Remember to get longer takes. They allow you some wiggle room for transitions.  \n\n'
              '5. Keep mic close to the subject (boom mic preferred).  \n\n'
              '6. Point mic away from undesired noise. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/ide.jpg',
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
          backgroundImage: 'assets/images/ide.jpg',
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
              'assets/images/IdeateBG.png', // Replace with your image path
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
                          'IDEATE',
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
                const SizedBox(height: 5),

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
                        color: Color.fromARGB(255, 243, 188, 68),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 55), // Adjust space after the search bar

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
                            color: Color.fromARGB(255, 243, 188, 68),
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
                                  color: Color.fromARGB(255, 243, 188, 68),
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
