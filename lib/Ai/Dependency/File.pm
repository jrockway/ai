use MooseX::Declare;

# | Represents a dependency on a file on the filesystem at
# blog-creation time
role Ai::Dependency::File with Ai::Dependency {
    use MooseX::FileAttributes;

    has_file 'path' => (
        required   => 1,
        must_exist => 1,
    );
}

1;
