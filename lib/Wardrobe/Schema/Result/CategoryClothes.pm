package Wardrobe::Schema::Result::CategoryClothes;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("category_clothes");
__PACKAGE__->add_columns(
  "category_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "clothing_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("category_id", "clothing_id");
__PACKAGE__->belongs_to(
  "category_id",
  "Wardrobe::Schema::Result::Categories",
  { id => "category_id" },
);
__PACKAGE__->belongs_to(
  "clothing_id",
  "Wardrobe::Schema::Result::Clothes",
  { id => "clothing_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-03-02 10:58:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+vcx+ULydSlCEB9cfxUMPQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
