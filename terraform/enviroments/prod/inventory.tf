data "template_file" "hosts" {
  template = file("../../../ansible/terraform_templates/hosts.tpl")
  vars = {
    app = join("\n", [
      format("%s ansible_ssh_host=%s", module.app.name, module.app.app_external_ip)])
    db = join("\n", [
      format("%s ansible_ssh_host=%s", module.db.name, module.db.db_external_ip)])
  }
}

resource "local_file" "hosts" {
  content = data.template_file.hosts.rendered
  filename = "../../../ansible/environments/prod/hosts"
}


data "template_file" "group_vars_app" {
  template = file("../../../ansible/terraform_templates/environments/prod/group_vars/app.tpl")
  vars = {
    db_host = module.db.db_inner_ip
  }
}

resource "local_file" "group_vars_app" {
  content = data.template_file.group_vars_app.rendered
  filename = "../../../ansible/environments/prod/group_vars/app"
}


data "template_file" "group_vars_db" {
  template = file("../../../ansible/terraform_templates/environments/prod/group_vars/db.tpl")
  vars = {
    mongo_bind_ip = module.app.app_inner_ip
  }
}

resource "local_file" "group_vars_app" {
  content = data.template_file.group_vars_app.rendered
  filename = "../../../ansible/environments/prod/group_vars/app"
}