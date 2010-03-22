use MooseX::Declare;

# | Map pages / dependencies to a URL
role Ai::Mapper {
    requires 'path_for';
}
