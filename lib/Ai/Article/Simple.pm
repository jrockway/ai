use MooseX::Declare;

class Ai::Article::Simple
  with Ai::Article
  with Ai::Role::WithDependencies::Set
  with Ai::Article::Versioned
  with Ai::Article::Markdown {

}
