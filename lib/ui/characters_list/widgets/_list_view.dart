part of '../characters_list_screen.dart';

class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
    required this.charactersList,
  }) : super(key: key);

  final List<Character> charactersList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      itemCount: charactersList.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: CharacterListTile(charactersList[index]),
          onTap: () {},
        );
      },
      separatorBuilder: (context, _) => const SizedBox(height: 26.0),
    );
  }
}
