data "template_file" "hosts" {
  template = file("../../../ansible/terraform_templates/hosts.tpl")
  vars = {
    app = join("\n", [format("%s ansible_ssh_host=%s", module.app.name, module.app.app_external_ip)])
    db = join("\n", [format("%s ansible_ssh_host=%s", module.db.name, module.db.db_external_ip)])
  }
}

resource "local_file" "hosts" {
  content = data.template_file.hosts.rendered
  filename = "../../../ansible/environments/stage/hosts"
}

data "template_file" "group_vars_app" {
  template = file("../../../ansible/terraform_templates/environments/stage/group_vars/app.tpl")
  vars = {
    db_host = module.db.db_inner_ip
  }
}

resource "local_file" "group_vars_app" {
  content = data.template_file.group_vars_app.rendered
  filename = "../../../ansible/environments/stage/group_vars/app"
}