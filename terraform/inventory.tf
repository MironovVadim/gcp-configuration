data "template_file" "inventory" {
  template = file("./templates/ansible-hosts.tpl")
  vars = {
    app = join("\n", [format("%s ansible_ssh_host=%s", module.app.name, module.app.app_external_ip)])
    db = join("\n", [format("%s ansible_ssh_host=%s", module.db.name, module.db.db_external_ip)])
    db_inner_ip = module.db.db_inner_ip
  }
}

resource "local_file" "hosts" {
  content = data.template_file.inventory.rendered
  filename = "../ansible/hosts"
}