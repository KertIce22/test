import 'package:flutter/material.dart';
import 'package:test/editing_video.dart';
import 'package:test/empa2.dart'; // Update with correct path if needed
import 'package:test/empathetic_data.dart';
import 'package:test/i_like_i_wish_what_if.dart';
import 'package:test/identify_a_variable.dart';
import 'package:test/impose_constraints.dart';
import 'package:test/improvise_to_life.dart';
import 'package:test/proto2.dart';
import 'package:test/prototype_for_empathy.dart';
import 'package:test/prototype_to_decide.dart';
import 'package:test/review_your_portfolio.dart';
import 'package:test/scenes_props_roles.dart';
import 'package:test/secondpage.dart';
import 'package:test/shooting_video.dart';
import 'package:test/storytelling.dart';
import 'package:test/testing_with_users.dart';
import 'package:test/user_driven_prototyping.dart';
import 'package:test/wizard_of_oz_prototyping.dart'; // Update with correct path if needed
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Prototype());
}

class Prototype extends StatelessWidget {
  const Prototype({Key? key}) : super(key: key);

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
    'Prototype for Empathy',
    'Improvise to Life',
    'Scene/Props/Roles',
    'Testing with Users',
    'Prototype to Decide',
    'Identify a Variable',
    'User-Driven Prototyping',
    'Wizard of Oz Prototyping',
    'Shooting Video',
    'Editing Video',
    'Impose Constraints',
    'Storytelling',
    'I Like, I Wish, What if',
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
          backgroundImage: 'assets/images/proto1.jpg',
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
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Empathetic Data':
        targetPage = const Empathetic(
          lessonImageFront: 'assets/images/Empathetic Data.png',
          lessonTitleFront: 'Empathetic Data',
          lessonContentFront:
              'The difficulty with many new ideas is that they’re hard to empirically prove, leaving key decision makers no basis for comparison. The good news is, designers can create data through simple prototyping. \n'
              'f you’re struggling to get buy-in from key stakeholders due to lack of hard data, consider building an empathetic data set, derived from real user prototype testing. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to gather empathetic data: ',
          lessonContentBack:
              'Take your prototype (it doesn’t need to be perfect, just usable) and place it in a context where your users currently experience your product or service. Bonus points if you can find a setting that allows users to test the current offering and the new offering.   \n\n'
              'Extra bonus points if that setting is low pressure, so customers feel comfortable giving open and honest feedback. For example, d.school alum, Bill Pacheco, tested exercise machine prototypes in a real gym with actual users.  \n\n'
              'During your test, capture usage counts, quotes, and reactions via notes or video. Create a sizable data sample to support and refine your prototype.  \n\n'
              'Pro tip: bring your decision makers along to watch and interact with users. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      // case 'I Like, I Wish, What If':
      //   targetPage = const ILike(
      //     lessonImageFront: 'assets/images/I like I wish What If.png',
      //     lessonTitleFront: 'I Like, I Wish, What If',
      //     lessonContentFront:
      //         'As a designer, you must rely on personal communication and, particularly, feedback, during design work. Colleagues give feedback on design frameworks. Users give feedback on solution concepts. I like, I wish, What if (IL/IW/WI) is a simple tool to encourage open feedback. \n\n\n\n\n\n\n\n\n\n',
      //     lessonTitleBack: 'How to use I like, I wish, what if: ',
      //     lessonContentBack:
      //         'IL/IW/WI is almost too simple to write down, but it’s too useful not to mention. Meet as a group. Team members chime in by expressing “likes,” “wishes,” or “what ifs” as succinct headlines. \n\n'
      //         '“I like how we broke our team into pairs.” “I wish we had discussed our plan before testing.” “What if we tried one more prototype?”  \n\n'
      //         'Share dozens of headlines in a session (be sure to pick someone to capture). You don’t need to respond to every one. Let the team decide which topics to discuss as they arise.\n\n\n\n\n\n\n\n',
      //     lessonImageBack: 'assets/images/interviews.png',
      //     backgroundImage: 'assets/images/proto1.jpg',
      //   );
      //   break;
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
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Introduction':
        targetPage = const Proto2(
          lessonTitleFront: 'Introduction',
          lessonContentFront:
              'Prototyping gets ideas out of your head and into the world. A prototype can be anything that takes a physical form—a wall of post-its, a role-playing activity, an object. In early stages, keep prototypes inexpensive and low resolution to learn quickly and explore possibilities. \n\n'
              'Prototypes are most successful when people (the design team, users, and others) can experience and interact with them. They’re a great way to start a conversation. What you learn from interactions with prototypes drives deeper empathy and shapes successful solutions.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to Prototype:',
          lessonContentBack:
              'Prototyping is often thought of as a way to test functionality, but it serves many other purposes. \n\n'
              'Empathy gaining. \n'
              'Prototyping deepens your understanding of users and the design space. \n\n'
              'Exploration. \n'
              'Develop multiple concepts to test in parallel. \n\n'
              'Testing. \n'
              'Create prototypes to test and refine solutions. \n\n'
              'Inspiration. \n'
              'Inspire others by showcasing your vision. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Improvise to Life':
        targetPage = const Improvise(
          lessonImageFront: 'assets/images/Improvise to Life.png',
          lessonTitleFront: 'Improvise to Life',
          lessonContentFront:
              'Teams often get stuck in "analysis paralysis" whendeciding what to build for user testing. Improvisingyour idea to life is a tool to jump-start your team intoaction. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to improvise to life:',
          lessonContentBack:
              'Act it out, to figure it out. Quickly assign roles to theteam to bring your concept to life. Pick someone to bethe user. Someone else to play the “technology”, or thesolution you’ve envisioned. If you’re designing acheckout experience, other roles might includeshoppers in the store. Be sure to assign observers towatch and tag in when someone gets stuck. \n\n'
              'Really dive into it. Now and then, break the scene todiscuss what’s working, what’s not, and to swap inobservers (new “technology” role players shouldperform the function in a different way, to see how itaffects the user’s experience).\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/proto1.jpg',
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
              'Which prompt sparked more ideas? \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
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
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Scenes/Props/Roles':
        targetPage = const Scene(
          lessonImageFront: 'assets/images/Scenes Props Roles.png',
          lessonTitleFront: 'Scenes/Props/Roles',
          lessonContentFront:
              'A great way to prepare to test your prototype in thefield (with real users) is to use the Scenes/Props/Rolestool. This improv-inspired tool helps you understandwhere and how you will test your prototype, and theroles of each team member who join you in the field. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use the scenes/props/roles tool: ',
          lessonContentBack:
              'Gather a team to test with you in the field. Then, figureout: \n\n'
              'Where should a user ideally encounter your concept? \n'
              'This is the “scene” that you want to test in, or, at thevery least, recreate in your own space.\n\n'
              'What props do you need to build? \n'
              'These are the bare minimum physical artifactsnecessary to suspend disbelief for the user and imagine that they’re experiencing your concept. \n\n'
              'What roles do you need to play? \n'
              'Who’s going to source and host users? Who’s going tobe actively engaged in the prototype (either directlyinteracting with the user, or performing some functionin the background)? Who’s going to observe and takenotes? \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Testing with Users':
        targetPage = const TestingUser(
          lessonImageFront: 'assets/images/Testing with Users.png',
          lessonTitleFront: 'Testing with Users',
          lessonContentFront:
              'Testing with users is a fundamental part of humancentered design. You test with users to not only refineyour solution, but to better understand the peopleyou’re designing for. When you test prototypes,consider both what you can learn about your solutionand what you can learn about your user—you can always use more empathy.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to test with users: ',
          lessonContentBack: 'Let your user experience the prototype.\n'
              'Show don’t tell. Put your prototype in the user’s hands(or your user in the prototype) and give only the basic context they need to understand what to do. \n\n'
              'Have them talk through their experience. \n'
              'Use prompts. “Tell me what you’re thinking as you do this.”\n\n'
              'Actively observe. \n'
              'Don’t immediately “correct” your user. Watch howthey use (and misuse) your prototype.\n\n'
              'Follow up with questions. \n'
              'This is often the most valuable part. “Show me why thiswould (not) work for you.” “Can you tell me how thismade you feel?” “Why?” Answer questions withquestions. “Well, what do you think that button does?” \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Prototype to Decide':
        targetPage = const PrototypeDe(
          lessonImageFront: 'assets/images/Prototype to Decide.png',
          lessonTitleFront: 'Prototype to Decide',
          lessonContentFront:
              'During the design process, it can be unclear how toproceed forward, particularly when team membershave mixed opinions. The best way to resolve teamconflicts about design elements is to prototype andevaluate them with users. If a prototype is receivedwell, it’s a good sign it’s worth pursuing further.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to prototype to decide:\n',
          lessonContentBack:
              'If the team is stuck between multiple opinions, buildout multiple prototypes (for agility purposes, limit theteam to 3-5 prototypes). Develop models of potentialdesign candidates. \n\n'
              'Be sure to distill the design problem down to discrete elements, isolating the variable you’re testing. \n\n'
              'Build as quickly and low-resolution as possible. Thentest your prototypes on the team, outsider peers, or,better yet, test your prototypes on real users. Be sureto capture feedback. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Identify a Variable':
        targetPage = const IdentifyVar(
          lessonImageFront: 'assets/images/Identify a Variable.png',
          lessonTitleFront: 'Identify a Variable',
          lessonContentFront:
              'Rather than prototype a complete mockup of a solution, it’smore productive to single out and test a specific variable.Identifying a variable not only saves time and money (youdon’t need to create all facets of a complex solution), it givesyou the opportunity to test multiple prototypes, each varyingin the one property. This encourages the user to makenuanced comparisons between prototypes and choose one option over another.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to identify a variable:\n',
          lessonContentBack:
              'Prototype with a purpose. Based on user needs andinsights, identify one variable of your concept to fleshout and test. Then build a few iterations. Keepprototypes as low resolution as possible.  \n\n'
              'Remember, a prototype doesn’t have to be, or evenlook like the solution. You might want to know how heavy a device should be. Create prototypes of varied weight, without making them operable. You may wantto find out if users prefer delivery versus pick up. Build boxes for each service, without filling them. \n\n'
              'By selecting one variable to test, you can bring resolution to that aspect of your concept and slide one step closer to a design solution. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
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
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Wizard of Oz Prototyping':
        targetPage = const Wizard(
          lessonImageFront: 'assets/images/Wizard of Oz Prototyping.png',
          lessonTitleFront: 'Wizard of Oz Prototyping',
          lessonContentFront:
              'A wizard of Oz prototype fakes functionality that you want to test with users, saving you the time and money of actually creating it. Wizard of Oz prototypes often refer to prototypes of digital systems, in which the user thinks the response is computer-driven, when in fact it’s human-controlled.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to create a Wizard of Oz prototype: \n',
          lessonContentBack:
              'Determine what you want to test. Then figure out how to fake that functionality and still give users an authentic experience. \n\n'
              'You can combine existing tools (tablets, email systems, Powerpoint) with human intervention to create the illusion of functionality. \n\n'
              'The company Aardvark needed to test user reactions totheir online interface for connecting people withquestions to qualified people with answers. Instead ofcoding, they used an instant messaging system andteam members behind the scenes to physically routequestions and answers to the right people. \n\n'
              'Wizard of Oz prototypes can be extended beyond thedigital realm, to physical prototypes. You couldprototype a vending machine without building themechanics behind it—using a person hidden inside todeliver purchases. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Shooting Video':
        targetPage = const ShootingVideo(
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
          backgroundImage: 'assets/images/proto1.jpg',
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
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'Scene/Props/Roles':
        targetPage = const Scene(
          lessonImageFront: 'assets/images/Scene.png',
          lessonTitleFront: 'Scenes/Props/Roles',
          lessonContentFront:
              'A great way to prepare to test your prototype in the field (with real users) is to use the Scenes/Props/Roles tool. This improv-inspired tool helps you understand where and how you will test your prototype, and the roles of each team member who join you in the field.  \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use the scenes/props/roles tool: ',
          lessonContentBack:
              'Gather a team to test with you in the field. Then, figure out:\n\n'
              'Where should a user ideally encounter your concept? This is the “scene” that you want to test in, or, at the very least, recreate in your own space. \n\n'
              'What props do you need to build? These are the bare minimum physical artifacts necessary to suspend disbelief for the user and imagine that they’re experiencing your concept.\n\n'
              'What roles do you need to play? Who’s going to source and host users? Who’s going to be actively engaged in the prototype (either directly interacting with the user, or performing some function in the background)? Who’s going to observe and take notes? \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
        );
        break;
      case 'I Like, I Wish, What if':
        targetPage = const ILike(
          lessonImageFront: 'assets/images/I like I wish What If.png',
          lessonTitleFront: 'I like, I wish, What If',
          lessonContentFront:
              'As a designer, you must rely on personal communication and, particularly,feedback, during design work. Colleagues give feedback on design frameworks. Users give feedback on solution concepts. I like, I wish, What if (IL/IW/WI) is a simple tool to encourage open feedback. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use I like, I wish, what if: ',
          lessonContentBack:
              'IL/IW/WI is almost too simple to write down, but it’s too useful not to mention. Meet as a group. Team members chime in by expressing “likes, “wishes,” or “what ifs” as succinct headlines.\n\n'
              'What roles do you need to play? Who’s going to source and host users? Who’s going to be actively engaged in the prototype (either directly interacting with the user, or performing some function in the background)? Who’s going to observe and take notes?\n\n\n'
              '“I like how we broke our team into pairs.” “I wish we had discussed our plan before testing.” “What if we tried one more prototype?”'
              'Share dozens of headlines in a session (be sure to pick someone to capture). You don’t need to respond to every one. Let the team decide which topics to discuss as they arise. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',

          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/proto1.jpg',
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
          Positioned.fill(
            child: Image.asset(
              'assets/images/PrototypeBG.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          'PROTOTYPE',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(width: 48),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 50),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search lessons...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 243, 68, 68),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 200),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          leading: const Icon(
                            Icons.book,
                            color: Colors.red,
                          ),
                          title: Text(
                            lesson,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  _isBookmarked(lesson)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _toggleBookmark(lesson);
                                },
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
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