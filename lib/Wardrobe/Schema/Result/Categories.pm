package Wardrobe::Schema::Result::Categories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("categories");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "category_clothes",
  "Wardrobe::Schema::Result::CategoryClothes",
  { "foreign.category_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-03-02 10:58:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:smGSfqvqmRZFMDi3pxlvfA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
