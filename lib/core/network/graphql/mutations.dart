class Mutations {
  static String createMood = """
  mutation (\$input: CreateMoodInput!){
    createMood(input: \$input){
      id
    }
  }""";
}
