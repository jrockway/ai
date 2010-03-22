use MooseX::Declare;

# | Map pages / dependencies to a URL
role Ai::Mapper {
    requires 'url_for';
    requires 'storage_for';
}
