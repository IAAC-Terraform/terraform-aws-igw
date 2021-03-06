resource "aws_internet_gateway" "igw" {
  count  = "${var.create_vpc && var.igw_route ? 1 : 0}"
  vpc_id = "${var.vpc_id}"

  tags {
      env = "${var.env}"
      Name = "${var.name}igw-0${count.index + 1}"
  }
}

resource "aws_route" "igwroute" {
  count                  = "${var.create_vpc && var.igw_route ? var.igw_route_count : 0}"
  route_table_id         = "${element(var.route_table_id, count.index)}"
  destination_cidr_block = "${var.destination_cidr_block}"
  gateway_id             = "${element(concat(aws_internet_gateway.igw.*.id, list("")), 0)}"
}
